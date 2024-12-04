package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.defaults.User;
import model.defaults.Video;
import service.user.basic.IUserService;
import service.user.basic.UserService;

import java.io.IOException;

@WebServlet({"/admin/report/users/user"})
public class ReportUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService;
    public ReportUserController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        userService = new UserService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        User user = userService.selectById(request.getParameter("userId"));

        long viewCount = 0L, likeCount = 0L;
        for (Video video : user.getVideos()) {
            viewCount += video.getRecents().size();
            likeCount += video.getLikes().size();
        }

        request.setAttribute("user", user);
        request.setAttribute("viewCount", viewCount);
        request.setAttribute("likeCount", likeCount);

        request.getRequestDispatcher("/views/reportOfUser.jsp").forward(request, response);
    }
}

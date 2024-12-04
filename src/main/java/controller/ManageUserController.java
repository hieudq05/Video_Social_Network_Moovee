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
import org.json.JSONObject;
import service.user.basic.IUserService;
import service.user.basic.UserService;
import service.user.pagination.IUserPaginationService;
import service.video.basic.VideoService;
import util.JSONBodyMethod;

import java.io.IOException;

@WebServlet({"/admin/manage-user", "/admin/manage-user/delete-user"})
public class ManageUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService;
    private IUserPaginationService userPaginationService;

    public ManageUserController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        userService = new UserService(entityManagerFactory);

        request.setAttribute("users", userService.selectAll());

        request.getRequestDispatcher("/views/manageUser.jsp").forward(request, response);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        userService = new UserService(entityManagerFactory);
        User user = userService.selectById(req.getParameter("userId"));

        user.setActive(!user.getActive());

        userService.update(user);
    }
}

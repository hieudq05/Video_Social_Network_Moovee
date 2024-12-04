package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.defaults.User;
import model.defaults.Video;
import org.apache.commons.beanutils.BeanUtils;
import service.user.basic.IUserService;
import service.user.basic.UserService;
import service.video.basic.IVideoService;
import service.video.basic.VideoService;
import util.FileManager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@MultipartConfig()
@WebServlet({"/admin/manage-user/user"})
public class ManageDetailsUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService;
    private IVideoService videoService;

    public ManageDetailsUserController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        userService = new UserService(entityManagerFactory);
        videoService = new VideoService(entityManagerFactory);

        User user = userService.selectById(request.getParameter("userId"));
        List<Video> videosOfUser = videoService.selectByPosterId(user.getId());
        Long countLike = 0L, countComment = 0L, countView = 0L, countShare = 0L;
        for (Video video : videosOfUser) {
            countComment += video.getComments().size();
            countLike += video.getLikes().size();
            countShare += video.getShares().size();
            countView += video.getRecents().size();
        }
        System.out.println(countComment);
        request.setAttribute("user", user);
        request.setAttribute("countShare", countShare);
        request.setAttribute("countLike", countLike);
        request.setAttribute("countComment", countComment);
        request.setAttribute("countView", countView);

        request.getRequestDispatcher("/views/manageProfileUser.jsp").forward(request, response);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userService = new UserService((EntityManagerFactory) req.getServletContext().getAttribute("entityManagerFactory"));
        User user = userService.selectById(req.getParameter("id"));

        try {
            Part avartar = req.getPart("avartar");
            Part coverImage = req.getPart("coverImage");
            if(avartar != null) {
                user.setAvartar(new FileManager().addFilePhoto(req, "avartar"));
            }
            if(coverImage != null) {
                user.setCoverImage(new FileManager().addFilePhoto(req, "coverImage"));
            }
            BeanUtils.populate(user, req.getParameterMap());
            userService.update(user);
            resp.getWriter().write("{\"status\":\"success\"}");
        } catch (Exception e) {
            resp.getWriter().write("{\"status\":\"error\"}");
            e.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}

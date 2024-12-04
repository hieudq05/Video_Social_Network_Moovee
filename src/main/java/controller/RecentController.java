package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.defaults.Recent;
import org.json.JSONObject;
import service.recent.basic.IRecentService;
import service.recent.basic.RecentService;
import service.user.basic.IUserService;
import service.user.basic.UserService;
import service.video.basic.IVideoService;
import service.video.basic.VideoService;
import util.JSONBodyMethod;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/moovee/recent")
public class RecentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    IRecentService recentService;
    IVideoService videoService;
    IUserService userService;

    public RecentController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        recentService = new RecentService(entityManagerFactory);
        videoService = new VideoService(entityManagerFactory);
        userService = new UserService(entityManagerFactory);

        try {
            Recent recent = new Recent();
            JSONObject json = JSONBodyMethod.readJSONBody(request);
            recent.setUserRecent(userService.selectById(json.getString("userId")));
            recent.setVideoRecent(videoService.selectById(json.getString("videoId")));
            recent.setDate(LocalDate.now());
            recentService.add(recent);
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (Exception e) {
            response.getWriter().write("{\"status\":\"error\"}");
            e.printStackTrace();
        }
    }
}

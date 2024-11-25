package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.defaults.Like;
import model.defaults.User;
import model.defaults.Video;
import org.json.JSONObject;
import service.like.LikeService;
import service.like.ILikeService;
import service.user.basic.UserService;
import service.user.basic.IUserService;
import service.video.basic.VideoService;
import service.video.basic.IVideoService;
import util.JSONBodyMethod;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet({"/moovee/videos/*"})
public class VideoDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IVideoService basicVideoService;
    private IUserService basicUserService;

    public VideoDetailsController() {
        super();
    }

    public static void checkLike(HttpServletRequest request, HttpServletResponse response, String user, String video) throws IOException {

        ServletContext servletContext = request.getServletContext();
        ILikeService likeService = new LikeService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        try {

            Boolean isLiked = likeService.checkLikedStatusByUserIdAndPostId(user, video);
            response.setContentType("application/json");
            response.getWriter().write("{\"isLiked\":" + isLiked + "}");

        } catch (IOException e) {

            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");

        }
    }

    public static void like(HttpServletRequest request, HttpServletResponse response, Boolean isLiked, User user, Video video) throws IOException {

        ServletContext servletContext = request.getServletContext();
        ILikeService likeService = new LikeService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        System.out.println("IS LIKED: " + isLiked);
        if (isLiked) {
            try {
                likeService.deleteLikeByUserIdAndPostId(user.getId(), video.getId());
                response.setContentType("application/json");
                response.getWriter().write("{\"isLiked\": " + false + "}");
            } catch (IOException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
            }
        } else {
            try {
                Like like = new Like();
                like.setUserLike(user);
                like.setVideoLike(video);
                like.setDate(LocalDate.now());
                likeService.add(like);
                response.setContentType("application/json");
                response.getWriter().write("{\"isLiked\": " + true + "}");
            } catch (IOException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        basicVideoService = new VideoService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        if (!request.getRequestURI().contains("/checkLike")) {

            Video videoShow = basicVideoService.selectById(request.getPathInfo().substring(1));

            request.setAttribute("detailsVideo", videoShow);
            request.getRequestDispatcher("/views/videoDetails.jsp").forward(request, response);

        } else {
            checkLike(request, response, request.getParameter("userId"), request.getParameter("videoId"));
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = request.getServletContext();
        basicUserService = new UserService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        basicVideoService = new VideoService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        JSONObject jsonObject = new JSONBodyMethod().readJSONBody(request);
        User user = basicUserService.selectById(jsonObject.getString("userId"));
        Video video = basicVideoService.selectById(jsonObject.getString("videoId"));
        Boolean isLiked = Boolean.parseBoolean(jsonObject.getString("isLiked"));

        like(request, response, isLiked, user, video);
    }
}

package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.defaults.Follow;
import model.defaults.User;
import org.json.JSONObject;
import service.follow.basic.FollowService;
import service.follow.basic.IFollowService;
import service.user.basic.UserService;
import service.user.basic.IUserService;
import util.JSONBodyMethod;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet({"/moovee/follow", "/moovee/checkFollow"})
public class FollowController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService;

    public FollowController() {
        super();
    }

    public static void checkFollow(HttpServletRequest request, HttpServletResponse response, String user, String followedId) throws IOException {

        ServletContext servletContext = request.getServletContext();
        IFollowService followService = new FollowService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        try {

            Boolean isFollowed = followService.checkFollowedStatusByUserIdAndFollowId(user, followedId);
            response.setContentType("application/json");
            response.getWriter().print("{\"isFollowed\":" + isFollowed + "}");

        } catch (IOException e) {

            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");

        }
    }

    public static void follow(HttpServletRequest request, HttpServletResponse response, Boolean isFollowed, User user, User followUser) throws IOException {

        ServletContext servletContext = request.getServletContext();
        IFollowService followService = new FollowService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        if (isFollowed) {
            try {
                followService.deleteFollowByUserIdAndFollowId(followUser.getId(), user.getId());
                response.setContentType("application/json");
                response.getWriter().write("{\"isFollowed\": " + false + "}");
            } catch (IOException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
            }
        } else {
            try {
                Follow follow = new Follow();
                follow.setUserFollow(user);
                follow.setUserFollowed(followUser);
                follow.setDate(LocalDate.now());
                followService.add(follow);
                response.setContentType("application/json");
                response.getWriter().write("{\"isFollowed\": " + true + "}");
            } catch (IOException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        checkFollow(request, response, request.getParameter("userId"), request.getParameter("followId"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = getServletContext();
        userService = new UserService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        JSONObject jsonObject = JSONBodyMethod.readJSONBody(request);
        User user = userService.selectById(jsonObject.getString("userId"));
        User followUser = userService.selectById(jsonObject.getString("followId"));
        Boolean isFollowed = Boolean.parseBoolean(jsonObject.getString("isFollowed"));

        follow(request, response, isFollowed, user, followUser);
    }
}

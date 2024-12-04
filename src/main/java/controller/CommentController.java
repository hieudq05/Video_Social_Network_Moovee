package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.defaults.Comment;
import org.json.JSONObject;
import service.comment.basic.CommentService;
import service.comment.basic.ICommentService;
import service.user.basic.IUserService;
import service.user.basic.UserService;
import service.video.basic.IVideoService;
import service.video.basic.VideoService;
import util.JSONBodyMethod;

import java.io.IOException;
import java.time.LocalDate;

@MultipartConfig()
@WebServlet("/moovee/comment")
public class CommentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ICommentService commentService;
    private IUserService userService;
    private IVideoService videoService;
    public CommentController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        commentService = new CommentService(entityManagerFactory);
        userService = new UserService(entityManagerFactory);
        videoService = new VideoService(entityManagerFactory);

        try {

            Comment comment = new Comment();
            JSONObject jsonObject = JSONBodyMethod.readJSONBody(request);
            comment.setComment(jsonObject.getString("comment"));
            comment.setUserComment(userService.selectById(jsonObject.getString("userComment")));
            comment.setVideoComment(videoService.selectById(jsonObject.getString("videoComment")));
            comment.setCommentDate(LocalDate.now());
            commentService.add(comment);
            response.getWriter().write("{\"status\": \"success\"}");

        } catch (Exception e) {
            response.getWriter().write("{\"status\": \"" + e.getMessage() + "\"}");
            e.printStackTrace();
        }
    }
}

package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.defaults.User;
import model.defaults.Video;
import org.apache.commons.beanutils.BeanUtils;
import service.recent.pagination.VideoRecentlyPaginationService;
import service.user.basic.UserService;
import service.user.basic.IUserService;
import service.video.pagination.IVideoPaginationService;
import service.video.pagination.VideoLikedPaginationService;
import service.video.pagination.VideoPaginationService;
import service.video.pagination.VideoSharedPaginationService;
import util.FileManager;

import java.io.IOException;
import java.io.Serial;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

@MultipartConfig()
@WebServlet({"/moovee/profile/my-video", "/moovee/profile", "/moovee/profile/recently", "/moovee/profile/favorite"
, "/moovee/profile/shared"})
public class ProfileController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private IVideoPaginationService videoPaginationService;
    private VideoLikedPaginationService videoLikedPaginationService;
    private VideoSharedPaginationService videoSharedPaginationService;
    private VideoRecentlyPaginationService videoRecentlyPaginationService;
    private IUserService basicUserService;

    public ProfileController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = request.getServletContext();
        basicUserService = new UserService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        videoSharedPaginationService = new VideoSharedPaginationService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        videoLikedPaginationService = new VideoLikedPaginationService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        videoRecentlyPaginationService = new VideoRecentlyPaginationService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        videoPaginationService = new VideoPaginationService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        User user = (User) request.getSession().getAttribute("user");

        if (request.getRequestURI().contains("my-video")) {

            // Select my video
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());

            List<Video> myVideos = videoPaginationService.getVideoPageOfUserOrderByPostedDate(page, pageSize, user.getId());

            response.getWriter().write(mapper.writeValueAsString(myVideos));

        } else if (request.getRequestURI().contains("recently")) {

            // Select recently video
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());

            List<Video> myVideos = videoRecentlyPaginationService.getVideoRecentPageOfUserOrderByDate(page, pageSize, user.getId());

            response.getWriter().write(mapper.writeValueAsString(myVideos));

        } else if (request.getRequestURI().contains("favorite")) {

            // Select favorite video
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());

            List<Video> myVideos = videoLikedPaginationService.getVideoLikedPageOfUserOrderByDate(page, pageSize, user.getId());

            response.getWriter().write(mapper.writeValueAsString(myVideos));

        } else if (request.getRequestURI().contains("shared")) {

            // Select shared video
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());

            List<Video> myVideos = videoSharedPaginationService.getVideoSharedPageOfUserOrderByDate(page, pageSize, user.getId());

            response.getWriter().write(mapper.writeValueAsString(myVideos));

        } else {

            // Display first layout
            User userAuth = (User) request.getSession().getAttribute("user");
            User updateUserAuth = basicUserService.selectById(userAuth.getId());
            request.getSession().setAttribute("user", updateUserAuth);
            request.getRequestDispatcher("/views/profile.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Update profile
        FileManager fileManager = new FileManager();
        try {
            User userInSession = (User) request.getSession().getAttribute("user");
            boolean isChangeAvt = request.getParameter("isChangeAvt").equals("true");
            boolean isChangeCoverImage = request.getParameter("isChangeCoverImage").equals("true");

            BeanUtils.populate(userInSession, request.getParameterMap());
            if(isChangeAvt){
                userInSession.setAvartar(fileManager.addFilePhoto(request, "avartar"));
            }
            if(isChangeCoverImage){
                userInSession.setCoverImage(fileManager.addFilePhoto(request, "coverImage"));
            }
            request.getSession().setAttribute("user", userInSession);
            basicUserService.update(userInSession);
            response.sendRedirect(request.getContextPath() + "/moovee/profile");
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

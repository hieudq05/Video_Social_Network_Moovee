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
import org.apache.commons.beanutils.BeanUtils;
import service.video.basic.VideoService;
import service.video.basic.IVideoService;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet({"/moovee/upload"})
public class UploadVideoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IVideoService basicVideoService;

    public UploadVideoController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/upload.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        basicVideoService = new VideoService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        Video video = new Video();
        User user = (User) request.getSession().getAttribute("user");
        try {
            BeanUtils.populate(video, request.getParameterMap());
            video.setId(UUID.randomUUID().toString());
            video.setPoster(user);
            video.setPostedDate(LocalDate.now());
            video.setViewCount(0);
            video.setActive(true);
            basicVideoService.add(video);
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect( request.getContextPath() + "/moovee/upload");
    }
}

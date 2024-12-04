package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.video.basic.IVideoService;
import service.video.basic.VideoService;

import java.io.IOException;

@WebServlet({"/admin/manage-video/video"})
public class ManageDetailsVideoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IVideoService videoService;

    public ManageDetailsVideoController() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        videoService = new VideoService(entityManagerFactory);

        String videoId = request.getParameter("videoId");

        request.setAttribute("video", videoService.selectById(videoId));

        request.getRequestDispatcher("/views/manageVideoDetails.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

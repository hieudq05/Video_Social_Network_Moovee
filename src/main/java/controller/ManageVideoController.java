package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DTO.VideoInHomeDTO;
import model.defaults.Video;
import org.json.JSONObject;
import service.recent.basic.IRecentService;
import service.recent.basic.RecentService;
import service.video.basic.IVideoService;
import service.video.basic.VideoService;
import service.video.pagination.IVideoPaginationService;
import service.video.pagination.VideoPaginationService;
import util.JSONBodyMethod;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/manage-video", "/admin/manage-video/load-video", "/admin/manage-video/delete-video"})
public class ManageVideoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IVideoService videoService;
    private IVideoPaginationService videoPaginationService;
    private IRecentService recentService;

    public ManageVideoController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getRequestURI().contains("load-video")){
            ServletContext servletContext = request.getServletContext();
            EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
            videoPaginationService = new VideoPaginationService(entityManagerFactory);
            recentService = new RecentService(entityManagerFactory);
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.registerModule(new JavaTimeModule());

            List<VideoInHomeDTO> videoInHomeDTOS = videoPaginationService.getVideoPageOrderByPostedDate(page, pageSize);
            response.getWriter().write(objectMapper.writeValueAsString(videoInHomeDTOS));
        } else {

            request.getRequestDispatcher("/views/manageVideo.jsp").forward(request, response);

        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        videoService = new VideoService(entityManagerFactory);
        String videoId = request.getParameter("videoId");

        System.out.println("delete video id: " + videoId);
        try {
            videoService.delete(videoId);
            response.getWriter().write("\"status\":\"success\"");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        videoService = new VideoService(entityManagerFactory);
        JSONObject videoUpdate = JSONBodyMethod.readJSONBody(req);
        Video video = videoService.selectById(videoUpdate.getString("id"));

        video.setUrlVideo(videoUpdate.getString("urlVideo"));
        video.setTitle(videoUpdate.getString("title").trim());
        video.setDecription(videoUpdate.getString("description").trim());
        video.setActive(videoUpdate.getBoolean("active"));

        videoService.update(video);

    }
}

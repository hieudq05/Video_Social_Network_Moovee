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
import service.video.pagination.IVideoPaginationService;
import service.video.pagination.VideoPaginationService;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet({"/moovee", "/moovee/trending", "/moovee/new", "/moovee/all"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IVideoPaginationService videoPaginationService;
    public HomeController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = request.getServletContext();
        videoPaginationService = new VideoPaginationService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        if (request.getServletPath().equals("/moovee/all") && request.getParameter("page") != null) {

            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());

            List<VideoInHomeDTO> videos = videoPaginationService.getVideoPageOrderByTitle(page, pageSize);
            videos = videos.stream()
                    .filter(VideoInHomeDTO::getActive)
                    .collect(Collectors.toList());

            response.getWriter().write(mapper.writeValueAsString(videos));

        } else if (request.getServletPath().equals("/moovee/trending")) {

            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());

            List<VideoInHomeDTO> trendingVideos = videoPaginationService.getVideoPageOrderByLike(page, pageSize);
            trendingVideos = trendingVideos.stream()
                    .filter(VideoInHomeDTO::getActive)
                    .collect(Collectors.toList());

            response.getWriter().write(mapper.writeValueAsString(trendingVideos));

        } else if (request.getServletPath().equals("/moovee/new")) {

            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new JavaTimeModule());

            List<VideoInHomeDTO> newVideos = videoPaginationService.getVideoPageOrderByPostedDate(page, pageSize);
            newVideos = newVideos.stream()
                    .filter(VideoInHomeDTO::getActive)
                    .collect(Collectors.toList());

            response.getWriter().write(mapper.writeValueAsString(newVideos));

        } else {

            request.getRequestDispatcher("/views/home.jsp").forward(request, response);
        }

    }
}

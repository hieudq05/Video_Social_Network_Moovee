package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.comment.analytics.month.CountCommentInMonthService;
import service.comment.analytics.month.ICountCommentInMonthService;
import service.like.analytics.month.CountLikeInMonthService;
import service.like.analytics.month.ICountLikeInMonthService;
import service.recent.analytics.month.CountViewInMonthService;
import service.recent.analytics.month.ICountViewInMonthService;
import service.share.analytics.month.CountShareInMonthService;
import service.share.analytics.month.ICountShareInMonthService;
import service.video.basic.IVideoService;
import service.video.basic.VideoService;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/admin/report/videos/video"})
public class ReportDetailsVideoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IVideoService videoService;
    private ICountLikeInMonthService countLikeInMonthService;
    private ICountShareInMonthService countShareInMonthService;
    private ICountViewInMonthService countViewInMonthService;
    private ICountCommentInMonthService countCommentInMonthService;

    public ReportDetailsVideoController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory emf = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        String videoId = request.getParameter("videoId");
        videoService = new VideoService(emf);
        countLikeInMonthService = new CountLikeInMonthService(emf);
        countShareInMonthService = new CountShareInMonthService(emf);
        countViewInMonthService = new CountViewInMonthService(emf);
        countCommentInMonthService = new CountCommentInMonthService(emf);

        LocalDate currentDate = LocalDate.now();
        List<Long> countLike = new ArrayList<>();
        List<Long> countShare = new ArrayList<>();
        List<Long> countView = new ArrayList<>();
        List<Long> countComment = new ArrayList<>();

        for (int i = 0; i < 5; i++) {
            // Lùi lại i tháng từ tháng hiện tại
            LocalDate previousMonth = currentDate.minusMonths(i);

            countComment.add(countCommentInMonthService.countCommentOfVideoInMonth(previousMonth, videoId));
            countView.add(countViewInMonthService.countViewOfVideoInMonth(previousMonth, videoId));
            countShare.add(countShareInMonthService.countShareOfVideoInMonth(previousMonth, videoId));
            countLike.add(countLikeInMonthService.getCountLikeOfVideoInMonth(previousMonth, videoId));
        }

        request.setAttribute("countLike", countLike);
        request.setAttribute("countShare", countShare);
        request.setAttribute("countView", countView);
        request.setAttribute("countComment", countComment);
        request.setAttribute("video", videoService.selectById(videoId));

        request.getRequestDispatcher("/views/reportOfVideo.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

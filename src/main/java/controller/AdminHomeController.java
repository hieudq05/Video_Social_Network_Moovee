package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.like.analytics.month.CountLikeInMonthService;
import service.like.analytics.month.ICountLikeInMonthService;
import service.like.basic.ILikeService;
import service.like.basic.LikeService;
import service.recent.analytics.month.CountViewInMonthService;
import service.recent.analytics.month.ICountViewInMonthService;
import service.recent.basic.IRecentService;
import service.recent.basic.RecentService;
import service.user.basic.IUserService;
import service.user.basic.UserService;
import service.user.pagination.IUserPaginationService;
import service.user.pagination.UserPaginationService;
import service.video.analytics.day.CountVideoInDayService;
import service.video.analytics.day.ICountVideoInDayService;
import service.video.pagination.IVideoPaginationService;
import service.video.pagination.VideoPaginationService;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/admin")
public class AdminHomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ICountVideoInDayService countVideoInDayService;
    IVideoPaginationService videoPaginationService;
    IUserService userService;
    IUserPaginationService userPaginationService;
    IRecentService recentService;
    ICountViewInMonthService countViewInMonthService;
    ILikeService likeService;
    ICountLikeInMonthService countLikeInMonthService;

    public AdminHomeController() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        countVideoInDayService = new CountVideoInDayService(entityManagerFactory);
        videoPaginationService = new VideoPaginationService(entityManagerFactory);
        userService = new UserService(entityManagerFactory);
        userPaginationService = new UserPaginationService(entityManagerFactory);
        recentService = new RecentService(entityManagerFactory);
        countViewInMonthService = new CountViewInMonthService(entityManagerFactory);
        likeService = new LikeService(entityManagerFactory);
        countLikeInMonthService = new CountLikeInMonthService(entityManagerFactory);

        request.setAttribute("countVideoInDay", countVideoInDayService.countVideoInDay(LocalDate.now()));
        request.setAttribute("recentVideos", videoPaginationService.getVideoPageOrderByPostedDate(0, 5));
        request.setAttribute("countUser", userService.selectCountAllUsers());
        request.setAttribute("users", userPaginationService.getUserPageOrderByFollower(0, 5));
        request.setAttribute("countViewCurrMonth", countViewInMonthService.getCountViewInMonth(LocalDate.now()));
        request.setAttribute("countViewPrevMonth", countViewInMonthService.getCountViewInMonth(LocalDate.now().minusMonths(1)));
        request.setAttribute("countLikeCurrMonth", countLikeInMonthService.countLikeInMonth(LocalDate.now()));
        request.setAttribute("countLikePrevMonth", countLikeInMonthService.countLikeInMonth(LocalDate.now().minusMonths(1)));

        request.getRequestDispatcher("/views/adminHome.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

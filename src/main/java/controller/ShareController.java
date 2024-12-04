package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.defaults.Comment;
import model.defaults.Share;
import org.apache.commons.beanutils.BeanUtils;
import org.json.JSONObject;
import service.share.basic.IShareService;
import service.share.basic.ShareService;
import service.user.basic.IUserService;
import service.user.basic.UserService;
import service.video.basic.IVideoService;
import service.video.basic.VideoService;
import util.JSONBodyMethod;
import util.SendEmail;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/moovee/share")
public class ShareController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IShareService shareService;
    IUserService userService;
    IVideoService videoService;
    public ShareController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        EntityManagerFactory entityManagerFactory = (EntityManagerFactory) servletContext.getAttribute("entityManagerFactory");
        shareService = new ShareService(entityManagerFactory);
        userService = new UserService(entityManagerFactory);
        videoService = new VideoService(entityManagerFactory);

        try {
            Share share = new Share();
            JSONObject jsonObject = JSONBodyMethod.readJSONBody(request);
            share.setEmailReceive(jsonObject.getString("emailReceive"));
            share.setUserShare(userService.selectById(jsonObject.getString("userShare")));
            share.setVideoShare(videoService.selectById(jsonObject.getString("videoShare")));
            share.setDate(LocalDate.now());
            shareService.add(share);
            SendEmail.sendEmailVideo(share.getEmailReceive()
                    , share.getUserShare().getEmail()
                    , share.getUserShare().getFullname()
                    ,share.getVideoShare().getTitle()
                    , "http://localhost:8080/"+request.getContextPath()+"/moovee/videos/"+share.getVideoShare().getId());
            response.getWriter().write("{\"status\": \"success\"}");
        } catch (Exception e) {
            response.getWriter().write("{\"status\": \"" + e.getMessage() + "\"}");
            e.printStackTrace();
        }
    }
}

package controller;

import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.defaults.User;
import org.apache.commons.beanutils.BeanUtils;
import service.user.basic.UserService;
import service.user.basic.IUserService;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet({"/signup", "/signup/checkExistEmail"})
public class SignupController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService basicUserService;

    public SignupController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        basicUserService = new UserService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        if (request.getRequestURI().contains("checkExistEmail")) {

            User user = basicUserService.selectByEmail(request.getParameter("email"));
            response.setContentType("application/json");
            response.getWriter().write("{\"isExistEmail\": \"" + (user == null ? false : user.getEmail()) + "\"}");

        } else {
            request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = request.getServletContext();
        basicUserService = new UserService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));

        HttpSession session = request.getSession();
        User userSignup = new User();
        try {
            BeanUtils.populate(userSignup, request.getParameterMap());
            System.out.println(userSignup.getPassword());
            userSignup.setActive(true);
            userSignup.setId(UUID.randomUUID().toString());
            userSignup.setRegisterDate(LocalDate.now());
            userSignup.setCoverImage("https://www.detroitevictiondefense.net/wp-content/themes/miyazaki/assets/images/default-fallback-image.png");
            userSignup.setAvartar("https://scontent.fsgn2-10.fna.fbcdn.net/v/t1.30497-1/453178253_471506465671661_2781666950760530985_n.png?stp=dst-png_s480x480&_nc_cat=1&ccb=1-7&_nc_sid=136b72&_nc_ohc=8yv9TBiBjIsQ7kNvgF3dcip&_nc_zt=24&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=AdVjad2B7TwGtm9KS_MrMnI&oh=00_AYDuQ4J_D-vgTM-p2x5kvzkWBApzeG-G2TtOQ7r2-Td5Ow&oe=6766823A");
            userSignup.setRole(false);
            userSignup.setNumber("TEMP-"+ UUID.randomUUID());
            basicUserService.add(userSignup);
            session.setAttribute("user", userSignup);
            response.sendRedirect(request.getContextPath() + "/moovee");
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }

}

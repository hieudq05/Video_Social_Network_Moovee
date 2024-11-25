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
            userSignup.setRole(false);
            userSignup.setNumber("TEMP-"+UUID.randomUUID().toString());
            basicUserService.add(userSignup);
            session.setAttribute("user", userSignup);
            response.sendRedirect(request.getContextPath() + "/moovee");
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }

}

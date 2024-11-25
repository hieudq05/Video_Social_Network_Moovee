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
import java.util.Objects;

@WebServlet({"/login"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService basicUserService;

    public LoginController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = request.getServletContext();
        basicUserService = new UserService((EntityManagerFactory) servletContext.getAttribute("entityManagerFactory"));
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
            User userAuth = basicUserService.selectByEmail(user.getEmail());
            if(Objects.nonNull(userAuth)) {
                if(Objects.equals(userAuth.getEmail(), user.getEmail()) && Objects.equals(userAuth.getPassword(), user.getPassword())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", userAuth);
                    session.setMaxInactiveInterval(15*60);
                    if(userAuth.getRole()){
                        response.sendRedirect(request.getContextPath()+"/admin");
                    } else {
                        response.sendRedirect(
                                session.getAttribute("prevUri")==null
                                        ?request.getContextPath()+"/moovee":session.getAttribute("prevUri").toString()
                        );
                    }
                } else {
                    request.setAttribute("error", "Email hoặc mật khẩu không hợp lệ!");
                    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Email hoặc mật khẩu không hợp lệ!");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }
}

package filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.defaults.User;

import java.io.IOException;

@WebFilter({"/login", "/signup"})
public class AuthUserLoginSignupFilter implements HttpFilter {
    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            if(user.getRole().equals(true)) {
                response.sendRedirect(request.getContextPath() + "/choose-page");
            } else {
                response.sendRedirect(request.getContextPath() + "/moovee");
            }
        } else {
            filterChain.doFilter(request, response);
        }
    }
}

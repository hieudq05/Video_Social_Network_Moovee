package config;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.time.LocalDateTime;

@WebListener
public class AppLifcycleManager implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("video");
        application.setAttribute("entityManagerFactory", emf);
        System.out.println(LocalDateTime.now() + " EntityManagerFactory created " + emf.toString());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (sce.getServletContext().getAttribute("entityManagerFactory") != null) {
            EntityManagerFactory emf = (EntityManagerFactory) sce.getServletContext().getAttribute("entityManagerFactory");
            emf.close();
            System.out.println(LocalDateTime.now() + " EntityManagerFactory closed " + emf);
        }
    }
}

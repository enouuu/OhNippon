package Listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
public class exceptionsListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();
        String err = (String)sc.getAttribute("errorMessage");
        sc.setAttribute("message", err);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}

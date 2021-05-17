package Listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import Model.User;

public class userContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();
        User user = (User)sc.getAttribute("loginDetails");
        sc.setAttribute("message", user);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}

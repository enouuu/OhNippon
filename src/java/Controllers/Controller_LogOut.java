package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controller_LogOut extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("userEmail");
        session.removeAttribute("userRole");
        session.removeAttribute("userSubStatus");
        session.invalidate();
        response.sendRedirect("landing.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Logout servlet";
    }// </editor-fold>

}

package Controllers;

import Exceptions.AuthenticationException;
import Exceptions.NullValueException;
import Listeners.userContextListener;
import Model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;
import static Security.CipherMain.decrypt;

public class Controller_Login extends HttpServlet {

    Connection con;
    
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            //Register driver
            Class.forName(config.getInitParameter("jdbcClassName"));
            System.out.println("Loaded driver.");

            //Use String buffer for connection
            StringBuffer buff = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://").append(config.getInitParameter("dbHostName"))
                    .append(":").append(config.getInitParameter("dbPort"))
                    .append("/").append(config.getInitParameter("databaseName"));
            //jdbc:derby://localhost:1527/OhNipponDB

            //Establish connection
            con = DriverManager.getConnection(buff.toString(),
                    config.getInitParameter("dbUserName"), config.getInitParameter("dbPassword"));
            System.out.println("You are now connected.");

        } catch (SQLException sql) {
            System.out.println("SQL Exception occurred.");
            sql.printStackTrace();
        } catch (ClassNotFoundException cnfe) {
            System.out.println("Class not found Exception occurred.");
            cnfe.printStackTrace();
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        try {
            if (con != null) {
                HttpSession session = request.getSession();
                Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
                String answer = request.getParameter("inputCaptcha");
                if(captcha.isCorrect(answer)){
                
                    String email = request.getParameter("inputEmail").trim();
                    String pass = request.getParameter("inputPword").trim();
                    if(email.isEmpty() && pass.isEmpty()){
                        sc.setAttribute("errorMessage", "Gomen, both email and password is empty!");
                        throw new NullValueException();
                    }
                    else if (email.isEmpty()) {
                        sc.setAttribute("errorMessage", "Gomen, entered email is empty!");
                        throw new NullValueException();
                    } else if(pass.isEmpty()){
                        sc.setAttribute("errorMessage", "Gomen, entered password is empty!");
                        throw new NullValueException();
                    }
                    String query = "SELECT * FROM USER_INFO ORDER BY EMAIL";
                    PreparedStatement pStmt = con.prepareStatement(query);
                    ResultSet rs = pStmt.executeQuery();
                    while (rs.next()) {
                        if (email.equals(rs.getString("EMAIL")) && pass.equals(decrypt(rs.getString("PASSWORD")))) {
                            //HttpSession session = request.getSession();
                            session.setAttribute("sessionTest", true);
                            User human = new User(email, pass, rs.getString("ROLE"), rs.getBoolean("SUBSTATUS"), rs.getString("FIRSTNAME"),
                                                    rs.getString("LASTNAME"), rs.getString("SUBSTART"), rs.getString("SUBEND"));
                            sc.setAttribute("loginDetails", human);
                            userContextListener ucl = new userContextListener();
                            ucl.contextInitialized(new ServletContextEvent(sc));
                            response.sendRedirect("success.jsp");
                            return;
                        }else if (email.equals(rs.getString("EMAIL")) && !pass.equals(decrypt(rs.getString("PASSWORD")))) {
                            //error 2 - correct email, wrong pass
                            sc.setAttribute("errorMessage", "Gomen, you entered the wrong password!");
                            throw new AuthenticationException();
                        } else if(rs.next() == false){
                           sc.setAttribute("errorMessage", "Gomen, the email does not exist in our database!");
                           throw new AuthenticationException();
                        }
                    }
                    pStmt.close();
                    rs.close();
                } else {
                    sc.setAttribute("errorMessage", "Incorrect captcha entered!");
                    throw new AuthenticationException();
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException sqle) {
            sc.setAttribute("errorMessage", "SQL Exception occurred!");
            response.sendRedirect("errorPage.jsp");
        } catch (NullValueException nve){
            response.sendRedirect("errorPage.jsp");
        } catch (AuthenticationException aue){
            response.sendRedirect("errorPage.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

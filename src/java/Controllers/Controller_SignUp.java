package Controllers;

import Exceptions.AuthenticationException;
import Exceptions.NullValueException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;
import static security.CipherMain.encrypt;

public class Controller_SignUp extends HttpServlet {

    Connection con;
    DateFormat formatYear = new SimpleDateFormat("yyyy");
    DateFormat formatMonth = new SimpleDateFormat("MM");
    DateFormat formatDay = new SimpleDateFormat("dd");
    Calendar cal = Calendar.getInstance();
    int year = Integer.parseInt(formatYear.format(cal.getTime()));
    int month = Integer.parseInt(formatMonth.format(cal.getTime()));
    int day = Integer.parseInt(formatDay.format(cal.getTime()));
    int testAge;

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
        request.setCharacterEncoding("UTF-8");
        ServletContext sc = getServletContext();
        try {
            if (con != null) {
                HttpSession session = request.getSession(false);
                Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
                String answer = request.getParameter("inputCaptcha");
                if (captcha.isCorrect(answer)) { //check captcha input to captcha answer
                    String fn = request.getParameter("regFn").trim();
                    String ln = request.getParameter("regLn").trim();
                    String email = request.getParameter("regEmail").trim();
                    String pass = request.getParameter("regPword").trim();
                    String conpass = request.getParameter("confirmPword").trim();
                    String bday = request.getParameter("regBday").trim();
                    if (!pass.equals(conpass)) { //password checker
                        sc.setAttribute("errorMessage", "Gomen, your password does not match with your confirm password!");
                        throw new AuthenticationException();
                    }
                    if(!checkAge(Integer.parseInt(bday.substring(0, 4)), Integer.parseInt(bday.substring(5, 7))
                            , Integer.parseInt(bday.substring(8)))){
                        sc.setAttribute("errorMessage", "You are under 18 years old!");
                        throw new AuthenticationException();
                    }  
                    if (fn.isEmpty()){
                        sc.setAttribute("errorMessage", "Gomen, first name is empty!");
                        throw new NullValueException();
                    } else if (fn.isEmpty()){
                        sc.setAttribute("errorMessage", "Gomen, first name is empty!");
                        throw new NullValueException();
                    } else if (ln.isEmpty()){
                        sc.setAttribute("errorMessage", "Gomen, last name is empty!");
                        throw new NullValueException();
                    } else if (email.isEmpty()){
                        sc.setAttribute("errorMessage", "Gomen, email is empty!");
                        throw new NullValueException();
                    } else if (pass.isEmpty()){
                        sc.setAttribute("errorMessage", "Gomen, password is empty!");
                        throw new NullValueException();
                    } 
                    System.out.println(testAge);
                    String query = "SELECT EMAIL FROM USER_INFO";
                    PreparedStatement pStmt = con.prepareStatement(query);
                    ResultSet rs = pStmt.executeQuery();
                    while (rs.next()) {
                        if (email.equals(rs.getString("EMAIL"))) { //check if username exists
                            sc.setAttribute("errorMessage", "That email is already taken!");
                            throw new AuthenticationException();
                        }
                    }
                    pStmt.close();
                   
                    PreparedStatement st = con.prepareStatement("INSERT INTO USER_INFO (FIRSTNAME, LASTNAME, EMAIL, PASSWORD, BIRTHDAY, ROLE, SUBSTATUS) VALUES (?, ?, ?, ?, ?, ?, ?)");
                    st.setString(1, fn);
                    st.setString(2, ln);
                    st.setString(3, email);
                    st.setString(4, encrypt(pass));
                    st.setString(5, bday);
                    st.setString(6, "Guest");
                    st.setBoolean(7, false);
                    st.executeUpdate();
                    response.sendRedirect("landing.jsp");
                    st.close();
                    rs.close();
                    return;
                } else {
                    sc.setAttribute("errorMessage", "Incorrect Captcha entered!");
                    throw new AuthenticationException();
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException sqle) {
            sc.setAttribute("errorMessage", "SQL Exception occurred!");
            response.sendRedirect("errorPage.jsp");
        } catch (NumberFormatException nfe) {
            sc.setAttribute("errorMessage", "Invalid date");
            response.sendRedirect("errorPage.jsp");
        } catch (AuthenticationException aue) {
            response.sendRedirect("errorPage.jsp");
        } catch (NullValueException nve){
            response.sendRedirect("errorPage.jsp");
        }
    }

    public boolean checkAge(int numYear, int numMonth, int numDay) {
        int age = (int)year - numYear;
        if (month < numMonth) {
            age--;
        } else if (numMonth == month && numDay < day) {
            age--;
        }
        testAge = age;
        if(age >= 18){
            return true;
        }
        return false;
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

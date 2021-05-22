package Controllers;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.User;

public class Controller_PDF extends HttpServlet {

    Connection conn;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            Class.forName(config.getInitParameter("jdbcClassName"));
            String username = config.getInitParameter("dbUserName");
            String password = config.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://").append(config.getInitParameter("dbHostName"))
                    .append(":").append(config.getInitParameter("dbPort"))
                    .append("/").append(config.getInitParameter("databaseName"));
            conn = DriverManager.getConnection(url.toString(), username, password);
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - " + nfe.getMessage());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, DocumentException, DocumentException {
        //HttpSession session = request.getSession();
        SimpleDateFormat formatTemplate = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String name = formatTemplate.format(date);
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=" + name + ".pdf");
        
        //System.out.println("here");
        
        User details = (User) getServletContext().getAttribute("loginDetails");
        String user = details.getEmail();
        String role = details.getRole();
        
        //System.out.println("here");

        Document docs = new Document();
        System.out.println("1");
        PdfWriter writer = PdfWriter.getInstance(docs, response.getOutputStream());
        System.out.println("2");
        Rectangle rect = new Rectangle(PageSize.LETTER.rotate());
        System.out.println("3");
        writer.setBoxSize("art", rect);
        System.out.println("4");

        //System.out.println(request.getParameter("header") + " " + request.getParameter("footer"));
        try {
            double maxPage;
            if (role.equals("Guest")) {
                maxPage = 1;
            } else {
                Statement stmt2 = conn.createStatement();
                ResultSet rs2 = stmt2.executeQuery("SELECT * FROM USER_INFO ORDER BY EMAIL");
                double temp = 0;
                while (rs2.next()) {
                    System.out.println(temp);
                    temp++;
                }
                maxPage = temp / 25;
                System.out.println(maxPage);
                maxPage = Math.ceil(maxPage);
                rs2.close();
                stmt2.close();
            }
            
            System.out.println("5");
            
            HeaderFooterPageEvent event = new HeaderFooterPageEvent(user, role, dtf.format(now), maxPage);
            writer.setPageEvent(event);
            
            docs.setPageSize(rect);
            docs.open();
            docs.add(new Phrase("\n"));

            PdfPTable table = new PdfPTable(5);
            table.setTotalWidth(500F);
            table.setSpacingBefore(10f);
            table.addCell("No.");
            table.addCell("USERNAME");
            table.addCell("ROLE");
            table.addCell("SUB START");
            table.addCell("SUB END");
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT EMAIL,ROLE,SUBSTART,SUBEND FROM USER_INFO ORDER BY EMAIL");

            int num = 1;
            while (rs.next()) {
                if (user.equals(rs.getString("EMAIL"))) {
                    if (request.getParameter("status").equals("guest")) {
                        table.addCell("1");
                    } else {
                        table.addCell(String.valueOf(num));
                    }
                    table.addCell(rs.getString("EMAIL") + "*");
                    table.addCell(rs.getString("ROLE"));
                    table.addCell(rs.getString("SUBSTART"));
                    table.addCell(rs.getString("SUBEND"));
                } else if (role.equals("Admin")){
                    if (num % 26 == 0) {
                        docs.add(table);
                        docs.newPage();
                        docs.add(new Phrase("\n"));
                        table = new PdfPTable(5);
                        table.setTotalWidth(500F);
                        table.setSpacingBefore(10f);
                    }
                    table.addCell(String.valueOf(num));
                    table.addCell(rs.getString("EMAIL"));
                    table.addCell(rs.getString("ROLE"));
                    table.addCell(rs.getString("SUBSTART"));
                    table.addCell(rs.getString("SUBEND"));
                }
                num++;
            }
            rs.close();
            stmt.close();
            docs.add(table);
        } catch (Exception ex) {
        }
        docs.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(Controller_PDF.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
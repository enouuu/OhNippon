<%@page import="Exceptions.NullValueException"%>
<%@page import="Model.User"%>
<%@page import="nl.captcha.Captcha"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About OhNippon!</title>
    </head>
    <body>
        <h1>Welcome to the About page of OhNippon! also for testing if contextlistener works hehe</h1>
        <%
            request.setCharacterEncoding("UTF-8");
            ServletContext sc = getServletContext();
            User scMsg = (User) getServletContext().getAttribute("loginDetails");
            String myRole = scMsg.getRole();
            if (session.getAttribute("sessionTest") == null) {
                System.out.println(session.getAttribute("sessionTest"));
                sc.setAttribute("errorMessage", "Your session is expired!");
                throw new NullValueException();
            }
            session.invalidate();
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            String header = getServletContext().getInitParameter("header");
            String footer = getServletContext().getInitParameter("footer");
        %>
        <div class ="successCont ">
            <h1 class = "succesMsg">WELCOME <% out.print(scMsg.getEmail() + "!\nRole: " + myRole + "\nIs subscribed? " + scMsg.getSubscription()); %>!</h1>
            <h2><font color = "white" size = "3.3vw">
                <%out.print(scMsg);%>
                </font></h2>
        </div>
    </body>
</html>

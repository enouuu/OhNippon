<%-- 
    Document   : errorPage
    Created on : May 17, 2021, 6:43:57 PM
    Author     : Matt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oops!</title>
    </head>
    <body>
        <h1>something something error message here</h1>
        <%
            ServletContext sc = getServletContext();
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            String header = getServletContext().getInitParameter("header");
            String footer = getServletContext().getInitParameter("footer");
            String errMsg = (String) getServletContext().getAttribute("errorMessage");
            out.print(errMsg);
        %>
    </body>
</html>

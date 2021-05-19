<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            String header = getServletContext().getInitParameter("header");
            String footer = getServletContext().getInitParameter("footer");
        %>
        <p class ="welcome">Welcome, enter your credentials below</p>
        <form action="login.do" method="POST">
            <div class="loginPage">
                <!-- input field for username -->
                <label class = "unpwLabel">Email:</label><input type="text" class="user" name="inputEmail" >
                <br>
                <!-- input field for password -->
                <label class = "unpwLabel">Password:</label><input type="password" class="pass" name="inputPword">
                <br>
            </div>
            <br><br>
            <!-- captcha -->
                <img src="captcha.do" class="captchaImg">
                <br>
                <label class = "unpwLabel">Captcha:</label><input type="text" class="cap" name="inputCaptcha">
                <br>
            <!-- button to submit inputs -->
            <div>
                <button class = "white" name="login" value="login" type="submit"> <p><span class="bg"></span><span class="text">LOGIN NOW</span></p></button>
                <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <a href="signUp.jsp" onmouseover="mOver()" onmouseout="mOut()">Sign Up</a>
            </div>
        </form>
    </body>
</html>

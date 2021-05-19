<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            String header = getServletContext().getInitParameter("header");
            String footer = getServletContext().getInitParameter("footer");
        %>
        <p class ="welcome">Please enter your credentials below to sign up!</p>
        <form action="signup.do" method="POST">
            <div class="loginPage">
                <!-- input field for username -->
                <label class = "unpwLabel">Email:</label><input type="text" class="regUser" name="regEmail" >
                <br>
                <!-- input field for password -->
                <label class = "unpwLabel">Password:</label><input type="password" class="regPass" name="regPword">
                <br>
                <label class = "unpwLabel">Confirm Password:</label><input type="password" class="conPass" name="confirmPword">
                <br>
                <!-- input field for birthday -->
                <label class = "unpwLabel">Birthday:</label><input type="date" class="bday" name="regBday">
                <br>
            </div>
            <!-- captcha -->
            <br><br>
                <img src="captcha.do" class="captchaImg">
                <br>
                <label class = "unpwLabel">Captcha:</label><input type="text" class="cap" name="inputCaptcha">
                <br>
            <!-- button to submit inputs -->
            <div><button class = "white" name="confirmReg" value="confirm" type="submit"> <p><span class="bg"></span><span class="text">SIGN UP</span></p></button>
            <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <a href="signIn.jsp" onmouseover="mOver()" onmouseout="mOut()">ALREADY A USER?</a>
            </div>
        </form>
    </body>
</html>

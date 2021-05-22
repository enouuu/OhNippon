<%-- 
<<<<<<< HEAD
    Document   : errorPage
    Created on : May 17, 2021, 6:43:57 PM
    Author     : Matt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="icon" href="images\OhNipponLogo.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Oops!</title>
    </head>
    <body>
        <section class ="header">
            <div class ="wrapper">
                <div class ="mainHeader">
                    <div class="hamburger"></div>
                    <div class ="logoHeader"><img class="logo"  src="images\OhNipponLogo.png"><img class="logoText"  src="images\OhNipponText.png"></div>
                    <div class= "menuList">
                        <ul>
                            <li><a href ="landing.jsp" class = "active">HOME</a></li>
                            <li><a href ="store.jsp">STORE</a></li>
                            <li><a href ="about.jsp">ABOUT</a></li>
                            <!-- add if else statement here to reveal profile/logout button
                            if the user is signed in. otherwise reveal the sign in button and hide the profile/logout button. -->
                            <li><a href ="signIn.jsp"><img  src="images\signin.png" class = "signInButton">&nbsp&nbspSIGN IN</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class ="successSec">
                <div class="buttonContainer">
                    <div class="downloadBox">
                        <h1>Welcome, (user)!</h1>
                        <p>
                            You are a (role)<br>
                        </p>
                        <button class ="dlSubAdminBT" onclick="goBack()">Click here to download your subscription information.</button><br><br>
                        <button class ="dlSubAdminBT" onclick="goBack()">Click here to download the list of subscribers.</button>
                    </div>
                </div>
             <div class="rinaHelloSide">
                    <img class="rinaWaveBImg"data-aos="zoom-in-up" src="images\rinaWaveB.png">
                </div>
        </section>
        <section class="subscribe">
            <div class="emailInput" data-aos="fade-up"><label>Newsletter Sign Up</label>
                <form action=""><input class="emailText" type="text" placeholder ="Enter your email here..."><button class ="emailBT">Submit</button></form>
            </div>
            <div class="contactUs" data-aos="fade-up">
                <h2>Contact Us</h2><br><p>Have any questions or suggestions for Oh Nippon?</p>
                <form action=""><button class ="getInvolved">Get Involved</button>
                    <button class ="sendUs">Send us a message</button></form>
            </div>
            <div class="supportOn" data-aos="fade-up">
                <h2>Support Oh Nippon!</h2><br><p>Follow Oh Nippon! Find us on social media.</p>
                <a href = "https://www.facebook.com/ohnippon"><img class ="socMed" src="images\fb.png"></a>
                <a href = "https://www.instagram.com/oh_nippon"><img class ="socMed" src="images\ig.png"></a>
                <a href = "https://www.youtube.com/channel/UC2W5RmbEJ0ZVVzSAw5UNWAQ"><img class ="socMed" src="images\yt.png"></a>
            </div>
        </section>

        <section class ="footer">
            <img class="logoTextB"  src="images\OhNipponTextB.png"><img class="copyright"  src="images\copyright.png">
            <div class="langOptions">
                <img class = "langIcon" src ="images\language.png" >
                <select class = "langChoice" d="sel_id" name="sel_name"  onchange="this.form.submit();">
                    <option value="1">English</option>
                    <option value="2">Japanese</option>                
                </select>
            </div>
        </section>
        <script src="script.js"></script>
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
                    AOS.init();
        </script>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
=======
    Document   : pdf
    Created on : May 20, 2021, 1:04:23 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@ page import="Model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="pdf.do" method="POST" autocomplete="off">
            
            <button/>PDF</button>
        <input type="hidden" id="status" name="status" value="guest">
        </form>
>>>>>>> origin/main
    </body>
</html>

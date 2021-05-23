<%-- 
<<<<<<< HEAD
    Document   : errorPage
    Created on : May 17, 2021, 6:43:57 PM
    Author     : Matt
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="icon" href="images\OhNipponLogo.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images\OhNipponLogo.png">
        <title>Oh! Nippon</title>
    </head>
    <body>
        <%
            if(session.getAttribute("sessionTest") == null){
                response.sendRedirect("landing.jsp");
                return;
            }
            String header = getServletContext().getInitParameter("header");
            String footer = getServletContext().getInitParameter("footer");
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            User scMsg = (User) getServletContext().getAttribute("loginDetails");
            String firstName = scMsg.getFirstName();
            String role = scMsg.getRole();
            boolean status = scMsg.getSubscription();
            String subEnd = scMsg.getSubEnd();
        %>
        <section class ="header">
            <div class ="wrapper">
                <div class ="mainHeader">
                    <div class="hamburger"></div>
                    <div class ="logoHeader"><img class="logo"  src="images\OhNipponLogo.png"><img class="logoText"  src="images\OhNipponText.png"></div>
                    <div class= "menuList">
                        <ul>
                            <li><a href ="landing.jsp">HOME</a></li>
                            <li><a href ="store.jsp">STORE</a></li>
                            <li><a href ="about.jsp">ABOUT</a></li>
                                <%
                                    boolean test = (session.getAttribute("sessionTest") != null);
                                    if (!test) {
                                %>
                            <li><a href ="signIn.jsp"><img  src="images\signin.png" class = "signInButton">&nbsp&nbspSIGN IN</a></li>
                            <li>&nbsp&nbsp&nbspGUEST</li>
                                <%
                                } else {
                                %>
                            <li><a href ="success.jsp" class = "active">PROFILE</a></li>
                            <li><a href ="logout.do">&nbsp&nbsp&nbspLOGOUT</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class ="successSec">
            <div class="buttonContainer">
                <div class="downloadBox">
                    <h1>Welcome, <%out.print(firstName);%>!</h1>
                    <p>
                        You are <% if (role.equals("Guest")) {%>
                        a
                        <%} else { %>
                        an
                        <%}
                            out.print(role);%>!<br>
                        <%if (status) { %>
                    <p>&nbspYou are currently subscribed! Your subscription will end on: <% out.print(subEnd); %></p>
                    <%} else {%>
                    <p>&nbspYou are currently not a subscriber!</p>
                    <%}%>
                    </p>
                    <form id="toggle1" method="POST" action="pdf.do">
                        <button class ="dlSubAdminBT">Click here to download your subscription information.</button><br><br>
                        <input type="hidden" id="status" name="status" value="subscriber">
                        <input type="hidden" id="header" name="header" value="<%= header%>">
                        <input type="hidden" id="footer" name="footer" value="<%= footer%>">
                    </form>
                    <form id="toggle2" method="POST" action="pdf.do">
                        <button class ="dlSubAdminBT">Click here to download the list of subscribers.</button>
                        <input type="hidden" id="status" name="status" value="admin">
                        <input type="hidden" id="header" name="header" value="<%= header%>">
                        <input type="hidden" id="footer" name="footer" value="<%= footer%>">
                    </form>
                    <%
                        if (role.equals("Admin")) {
                            if (status) { %>
                    <script>
                        document.getElementById('toggle1').style.visibility = 'visible';
                        document.getElementById('toggle2').style.visibility = 'visible';
                    </script>
                    <%} else { %>
                    <script>
                        document.getElementById('toggle1').style.visibility = 'hidden';
                        document.getElementById('toggle2').style.visibility = 'visible';
                    </script>
                    <%}
                    } else if (role.equals("Guest")) {
                        if (status) { %>
                    <script>
                        document.getElementById('toggle1').style.visibility = 'visible';
                        document.getElementById('toggle2').style.visibility = 'hidden';
                    </script>
                    <%} else { %>
                    <script>
                        document.getElementById('toggle1').style.visibility = 'hidden';
                        document.getElementById('toggle2').style.visibility = 'hidden';
                    </script>
                    <%}
                        }%>
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
    </body>
</html>

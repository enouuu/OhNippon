<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="icon" href="images\OhNipponLogo.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images\OhNipponLogo.png">
        <title>Sign In</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        %>
        <section class ="header">
            <div class ="wrapper">
                <div class ="mainHeader">
                    <div class="hamburger"></div>
                    <div class ="logoHeader"><img class="logo"  src="images\OhNipponLogo.png"><img class="logoText"  src="images\OhNipponText.png"></div>
                   <div class= "menuList">
                        <ul>
                            <li><a href ="landing.jsp"><img  src="images\home.png" class = "signInButton">&nbsp&nbspHOME</a></li>
                            <li><a href ="store.jsp"><img  src="images\store.png" class = "signInButton">&nbsp&nbspSTORE</a></li>
                            <li><a href ="about.jsp"><img  src="images\abouta.png" class = "signInButton">&nbsp&nbspABOUT</a></li>
                                <%
                                    boolean test = (session.getAttribute("sessionTest") != null);
                                    if (!test) {
                                %>
                            <li><a href ="signIn.jsp" class = "active"><img  src="images\signin.png" class = "signInButton">&nbsp&nbspSIGN IN</a></li>
                             <li><img  src="images\guest.png" class = "signInButton">&nbsp&nbspGUEST</li>
                                    <%
                                    } else {
                                    %>
                            <li><a href ="success.jsp"><img  src="images\guest.png" class = "signInButton">&nbsp&nbspPROFILE</a></li>
                            <li><a href ="logout.do"><img  src="images\logout.png" class = "signInButton">&nbsp&nbspLOGOUT</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </div>
        </section>


        <div class="signMain">
            <div class ="rinaSignSide">
                <h1 class ="explore" data-aos="fade-down">Explore Japan at the comfort<br>of your home.</h1>
                <img class="rinaSignImg"data-aos="zoom-in-up" src="images\rinaSignInUp.png">
            </div>
            <div class ="signSide" data-aos="fade-left">
                <div class="loginBox">
                    <h2 class = "signInLabel">SIGN IN</h2>
                    <form action="login.do" method="POST">
                        <!-- input field for username -->
                        <label class = "unpwLabel">Email</label><br>
                        <input type="text" class="userpass" name="inputEmail" >
                        <br><br>
                        <!-- input field for password -->
                        <label class = "unpwLabel">Password</label><br>
                        <input type="password" class="userpass" name="inputPword">
                        <br><br>
                        <label class = "unpwLabel">Captcha</label><br>
                        <input type="text" class="userpass" name="inputCaptcha">
                        <br><br>
                        <!-- captcha -->
                        <img src="captcha.do" class="captchaImg">
                        <br>

                        <br>
                        <!-- button to submit inputs -->
                        <button class ="signInBT">Sign In</button>
                        <br><br>
                        <p class = "signupText">Don't have an account?&nbsp<a href="signUp.jsp" onmouseover="mOver()" onmouseout="mOut()">Sign Up</a></p>
                    </form>
                </div>
            </div>
        </div>

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

        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
                    AOS.init();
        </script>
    </body>
</html>

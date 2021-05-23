<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images\OhNipponLogo.png">
        <title>Oh! Nippon</title>
    </head>
    <body>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v10.0" nonce="oI7pGRSV"></script>

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
                                <%
                                    boolean test = (session.getAttribute("sessionTest") != null);
                                    if (!test) {
                                %>
                            <li><a href ="signIn.jsp"><img  src="images\signin.png" class = "signInButton">&nbsp&nbspSIGN IN</a></li>
                                    <%
                                    } else {
                                    %>
                            <li><a href ="success.jsp">&nbsp&nbsp&nbspPROFILE</a></li>
                            <li><a href ="logout.do">&nbsp&nbsp&nbspLOGOUT</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class="home">
            <div class="slider">
                <img  src="images\slide-1.png" class="slide active" data-aos="fade-left">
                <img  src="images\slide-2.jpg" class="slide" data-aos="fade-left">
                <img  src="images\slide-3.jpg" class="slide" data-aos="fade-left">
            </div>

            <div class="controls">
                <div class="prev" data-aos="fade-right"><</div>
                <div class="next" data-aos="fade-left">></div>
            </div>

            <div class="indicator">
            </div>
        </section>

        <section class =  "featured">
            <div class ="featuredCont">
                <div class ="featuredLabel" data-aos="fade-right">Featured Video</div>
                <iframe class ="ytVid" src="https://www.youtube.com/embed/55X1Eab65TA" data-aos="fade-right"></iframe>
            </div>
            <div class="featuredText"  data-aos="fade-left"><h1 class="featuredTitle ">ELF SPOTTED IN JAPAN!</h1>
                <p class ="featuredContent"><br>Nice to meet you, I'm Rina!<br>
                    I'm new here in Youtube and actually even here on Earth. <br><br>(￣▽￣*)ゞ<br><br>
                    Join us here in Oh Nippon! as we discover and explore Japan.</p>
            </div>
        </section>

        <section class ="feed">
            <div class="facebookCont">
                <div class ="facebookLabel" data-aos="fade-right">Oh Nippon! Feed</div>
                <div class="fb-page" data-aos="fade-right"data-href="https://www.facebook.com/ohnippon" data-tabs="timeline" data-width="800" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                    <blockquote cite="https://www.facebook.com/ohnippon" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/ohnippon">Oh! Nippon</a></blockquote></div>
            </div>
            <div class="rinaWave" data-aos="zoom-in-up"><img class ="rinaW" src="images\rinaWave.png"></div>
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
    </body>
</html>

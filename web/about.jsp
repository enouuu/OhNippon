<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images\OhNipponLogo.png">
        <title>About</title>
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
                            <li><a href ="landing.jsp"><img  src="images\home.png" class = "signInButton">&nbsp&nbspHOME</a></li>
                            <li><a href ="store.jsp"><img  src="images\store.png" class = "signInButton">&nbsp&nbspSTORE</a></li>
                            <li><a href ="about.jsp"  class = "active"><img  src="images\abouta.png" class = "signInButton">&nbsp&nbspABOUT</a></li>
                                <%
                                    boolean test = (session.getAttribute("sessionTest") != null);
                                    if (!test) {
                                %>
                            <li><a href ="signIn.jsp"><img  src="images\signin.png" class = "signInButton">&nbsp&nbspSIGN IN</a></li>
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

        <section class="aboutSec">
            <div class ="aboutImg" data-aos ="fade-down"><img class="ohNipponbg" src = "images\ohNipponbg.png"></div>
            <div class ="aboutCont"  data-aos ="zoom-in-up">
                <div class="aboutUs">
                    <h1><font color="black">About</font> Us</h1><br>
                    <p>Oh Nippon! is the first foreign startup business approved by the government of Hokkaido in November 2020. 
                        Oh Nippon! aims to create content related to Japan and publish it through different social media platforms to reach out to an international audience.
                    </p>
                </div>

                <div class="boxSep">&nbsp</div>

                <div class="contactUsb">
                    <h1><font color="black">Contact</font> Us</h1><br>
                    <p>http://ohnippon.com/<br>
                        Facebook: https://www.facebook.com/<br><br>
                        <strong>Got a business opportunity, feedback or inquiry? Send us an email at:</strong><br>
                        <font color="#ED3300">contact_us@ohnippon.com</font>
                    </p>
                </div>
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
    </body>
</html>
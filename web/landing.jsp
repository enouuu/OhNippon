<%-- 
    Document   : index
    Created on : May 17, 2021, 10:04:14 AM
    Author     : Paul Andre Feliciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="icon" href="images\OhNipponLogo.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                            <li><a href =# class = "active">HOME</a></li>
                            <li><a href =#>STORE</a></li>
                            <li><a href =#>ABOUT</a></li>
                            <li><a href =#><img  src="images\signin.png" class = "signInButton">&nbsp&nbspSIGN IN</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class="home">
            <div class="slider">
                <img  src="images\slide-1.png" class="slide active">
                <img  src="images\slide-2.jpg" class="slide">
                <img  src="images\slide-3.jpg" class="slide">
            </div>

            <div class="controls">
                <div class="prev"><</div>
                <div class="next">></div>
            </div>

            <div class="indicator">
            </div>
        </section>
        
        <section class =  "featured">
            <div class ="featuredCont">
                <div class ="featuredLabel">Featured Video</div>
                <iframe class ="ytVid" src="https://www.youtube.com/embed/uKxyLmbOc0Q"></iframe>
            </div>
            <div class="featuredText"><h1 class="featuredTitle ">TITLE</h1>
                <p class ="featuredContent">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
            </div>
        </section>
        
        <section class ="feed">
            <div class="facebookCont">
                <div class ="facebookLabel">Oh Nippon! Feed</div>
                <div class="fb-page" data-href="https://www.facebook.com/ohnippon" data-tabs="timeline" data-width="800" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                    <blockquote cite="https://www.facebook.com/ohnippon" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/ohnippon">Oh! Nippon</a></blockquote></div>
            </div>
            <div class="rinaWave"><img class ="rinaW" src="images\rinaWave.png"></div>
        </section>
        
        <section class="subscribe">
            <div class="emailInput"><label>Newsletter Sign Up</label>
                <form action=""><input class="emailText" type="text" placeholder ="Enter your email here..."><button class ="emailBT">Submit</button></form>
            </div>
            <div class="contactUs">
                <h2>Contact Us</h2><br><p>Have any questions or suggestions for Oh Nippon?</p>
                <form action=""><button class ="getInvolved">Get Involved</button>
                    <button class ="sendUs">Send us a message</button></form>
            </div>
            <div class="supportOn">
                <h2>Support Oh Nippon!</h2><br><p>Follow Oh Nippon! Find us on social media.</p>
                <a href = "https://www.facebook.com/ohnippon"><img class ="socMed" src="images\fb.png"></a>
                <a href = "https://www.instagram.com/oh_nippon"><img class ="socMed" src="images\ig.png"></a>
                <a href = "https://www.youtube.com"><img class ="socMed" src="images\yt.png"></a>
            </div>
        </section>
        
        <section class ="footer">
            <img class="logoTextB"  src="images\OhNipponTextB.png"><img class="copyright"  src="images\copyright.png">
            <div class="langOptions">
                <img class = "langIcon" src ="images\language.png" >
            <select id="sel_id" name="sel_name"  onchange="this.form.submit();">
                <option value="1">English</option>
                <option value="2">Japanese</option>                
            </select>
            </div>
        </section>
        <script src="script.js"></script>
</html>

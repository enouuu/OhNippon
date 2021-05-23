<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images\OhNipponLogo.png">
        <title>Shop Now</title>

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
                            <li><a href ="landing.jsp">HOME</a></li>
                            <li><a href ="store.jsp" class = "active">STORE</a></li>
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
                            <li><a href ="success.jsp">PROFILE</a></li>
                            <li><a href ="logout.do">&nbsp&nbsp&nbspLOGOUT</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class="products">
            <center>
                <div class ="storeLabel" data-aos="fade-down">Oh! Nippon Store</div>
                <h1 data-aos="fade-left">FRESH & NEW</h1>
                <h2 data-aos="fade-right">Oh Nippon! Merch</h2>

                <div data-aos="flip-up">
                    <div class="card card-1" >
                        <img src="images\store\ON_Bk001.jpg">
                        <p>Oh Nippon! T-shirt (Black)</p>
                    </div>
                    <div class="card card-1">
                        <img src="images\store\ON_Bk002.jpg">
                        <p>Oh Nippon! Sweater (Black)</p>
                    </div>
                    <div class="card card-1" >
                        <img src="images\store\ON_Bk003.jpg">
                        <p>Oh Nippon! Hoodie (Black)</p>
                    </div>
                    <br>
                    <div class="card card-1" >
                        <img src="images\store\ON_BkHAT.jpg">
                        <p>Oh Nippon! Cap</p>
                    </div>
                    <div class="card card-1" >
                        <img src="images\store\ON_WT001.jpg">
                        <p>Oh Nippon! T-shirt (White)</p>
                    </div>
                    <div class="card card-1" >
                        <img src="images\store\ON_WT002.jpg">
                        <p>Oh Nippon! Sweater (White)</p>
                    </div>
                    <br>
                    <div class="card card-1" >
                        <img src="images\store\ON_WT003.jpg">
                        <p>Oh Nippon! Hoodie (White)</p>
                    </div>
                </div>
            </center>
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

        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
                    AOS.init();
        </script>
    </body>
</html>

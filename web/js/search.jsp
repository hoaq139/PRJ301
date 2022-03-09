<%-- 
    Document   : serch
    Created on : Feb 26, 2022, 11:43:45 PM
    Author     : win
--%>

<%@page import="model.Services"%>
<%@page import="java.util.List"%>
<%@page import="model.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search - Sochi Hotel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css"
        integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
        integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css" type="text/css">
    <%
         List<Room> list = (List<Room>) request.getAttribute("listRoom");
         List<Services> list2 = (List<Services>) request.getAttribute("listService");
         
    
    %>
</head>

<body>
    <header class="header" id="navigation-menu">
        <div class="container">
            <nav>
                <a href="#" class="logo"> <img src="../images/logo.png" alt=""> </a>

                <ul class="nav-menu">
                    <li> <a href="#home" class="nav-link">Home</a> </li>
                    <li> <a href="#about" class="nav-link">About Us</a> </li>
                    <li> <a href="#room" class="nav-link">Rooms</a> </li>
                    <li> <a href="#restaurant" class="nav-link">Restaurant</a> </li>
                    <li> <a href="#gallary" class="nav-link">Gallery</a> </li>
                    <li> <a href="#contact" class="nav-link">Contact</a> </li>
                    <li> <a href="#login" class="nav-link">BOOK NOW</a> </li>
                </ul>
                <div class="hambuger">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </div>
            </nav>
        </div>
    </header>
    <script>
        const hambuger = document.querySelector('.hambuger');
        const navMenu = document.querySelector('.nav-menu');

        hambuger.addEventListener("click", mobileMenu);

        function mobileMenu() {
            hambuger.classList.toggle("active");
            navMenu.classList.toggle("active");
        }

        const navLink = document.querySelectorAll('.nav-link');
        navLink.forEach((n) => n.addEventListener("click", closeMenu));

        function closeMenu() {
            hambuger.classList.remove("active");
            navMenu.classList.remove("active");
        }
    </script>
    <section class="home" id="home">
        <div class="head_container">
            <div class="box">
                <div class="text">
                    <h1>SEARCH</h1>
                </div>
            </div>
            <div class="images">
                <img src="../images/hotel5.jpg" class="slide">
            </div>
        </div>
    </section>
    <section class="book">
        <div class="container flex">
            <div class="input grid">
                <div class="box">
                    <label>Check-in:</label>
                    <input type="date" placeholder="Check-in-Date" readonly="">
                </div>
                <div class="box">
                    <label>Check-out:</label>
                    <input type="date" placeholder="Check-out-Date" readonly="">
                </div>
                <div class="box">
                    <label>Adults:</label> <br>
                    <input type="number" placeholder="0" readonly="">
                </div>
                <div class="box">
                    <label>Children:</label> <br>
                    <input type="number" placeholder="0" readonly="">
                </div>
            </div>
        </div>
    </section>
    <section class="search">
        <div class="container">
            <div class="view">
                <div class="services">
                    <label>Services:</label><br>
                    <input type="checkbox" name="buffet">&nbsp &nbsp <%=list2.get(0).getName()%> : <span><%=list2.get(0).getPrice()%> $ ( /Guest/Time )</span><br>
                    <input type="checkbox" name="wine">&nbsp &nbsp <%=list2.get(1).getName()%> : <span><%=list2.get(1).getPrice()%> $ ( /Bottle )</span><br>
                    <input type="checkbox" name="launry">&nbsp &nbsp <%=list2.get(2).getName()%> : <span><%=list2.get(2).getPrice()%> $ ( /Room/Night )</span><br>
                    <input type="checkbox" name="car">&nbsp &nbsp <%=list2.get(3).getName()%> : <span><%=list2.get(3).getPrice()%> $ ( /Room/Night )</span><br>
                    <input type="checkbox" name="breakfast">&nbsp &nbsp <%=list2.get(4).getName()%> : <span><%=list2.get(4).getPrice()%> $ ( /Guest/Time )</span><br>
                    <input type="checkbox" name="seaview">&nbsp &nbsp  <%=list2.get(5).getName()%> : <span><%=list2.get(5).getPrice()%> $ ( /Room/Night )</span><br>
                    <input type="checkbox" name="tv">&nbsp &nbsp <%=list2.get(6).getName()%> : <span><%=list2.get(6).getPrice()%> $ ( Room / Trip )</span><br>
                    <input type="checkbox" name="wifi">&nbsp &nbsp <%=list2.get(7).getName()%>: <span><%=list2.get(7).getPrice()%> $ ( /Room/Night )</span><br>

                </div>
                <div class="img-room">
                    <div class="room-des">

                       
                        <img src="../<%=list.get(0).getImage()%>"alt="">
                        <div class="room-text">
                            <h3><%=list.get(0).getName()%></h3>
                            <div class="room-flex">
                                <img src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-user-grey.svg"
                                    alt="">
                                <p><%=list.get(0).getGuest()%> GUEST</p>
                                <img class="img-2"
                                    src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-plan-grey.svg"
                                    alt="">
                                <p><%=list.get(0).getSquare()%>m2</p>
                            </div>
                            <p><%=list.get(0).getDescription()%></p>
                            <input type="submit" name="booknow" value="Book now for <%=list.get(0).getPrice()%>$">
                            <span></span>
                        </div>
                    </div>
                    <div class="room-des">
                        <img src="../<%=list.get(1).getImage()%>" alt="">
                        <div class="room-text">
                            <h3><%=list.get(1).getName()%></h3>
                            <div class="room-flex">
                                <img src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-user-grey.svg"
                                    alt="">
                                <p><%=list.get(1).getGuest()%> GUEST</p>
                                <img class="img-2"
                                    src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-plan-grey.svg"
                                    alt="">
                                <p><%=list.get(1).getSquare()%>m2</p>
                            </div>
                            <p><%=list.get(1).getDescription()%></p>
                            <input type="submit" name="booknow" value="Book now for <%=list.get(1).getPrice()%>$">
                            <span></span>
                        </div>
                    </div>


                </div>
                <div class="view">
                    <div class="img-room">
                        <div class="room-des">
                            <img src="../<%=list.get(2).getImage()%>" alt="">
                            <div class="room-text">
                                <h3><%=list.get(2).getName()%></h3>
                                <div class="room-flex">
                                    <img src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-user-grey.svg"
                                        alt="">
                                    <p><%=list.get(2).getGuest()%> GUEST</p>
                                    <img class="img-2"
                                        src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-plan-grey.svg"
                                        alt="">
                                    <p><%=list.get(2).getSquare()%>m2</p>
                                </div>
                                <p><%=list.get(2).getDescription()%></p>
                                <input type="submit" name="booknow" value="Book now for <%=list.get(2).getPrice()%>$">
                                <span></span>
                            </div>
                        </div>
                        <div class="room-des">
                            <img src="../<%=list.get(3).getImage()%>" alt="">
                            <div class="room-text">
                                <h3><%=list.get(3).getName()%></h3>
                                <div class="room-flex">
                                    <img src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-user-grey.svg"
                                        alt="">
                                    <p><%=list.get(3).getGuest()%> GUEST</p>
                                    <img class="img-2"
                                        src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-plan-grey.svg"
                                        alt="">
                                    <p><%=list.get(3).getSquare()%>m2</p>
                                </div>
                                <p><%=list.get(3).getDescription()%></p>
                                <input type="submit" name="booknow" value="Book now for <%=list.get(3).getPrice()%>$">
                                <span></span>
                            </div>
                        </div>
                        <div class="room-des">
                            <img src="../<%=list.get(4).getImage()%>" alt="">
                            <div class="room-text">
                                <h3><%=list.get(4).getName()%></h3>
                                <div class="room-flex">
                                    <img src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-user-grey.svg"
                                        alt="">
                                    <p><%=list.get(4).getGuest()%> GUEST</p>
                                    <img class="img-2"
                                        src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-plan-grey.svg"
                                        alt="">
                                    <p><%=list.get(4).getSquare()%>m2</p>
                                </div>
                                <p><%=list.get(4).getDescription()%></p>
                              
                                <input type="submit" name="booknow" value="Book now for <%=list.get(4).getPrice()%>$">
                                <span></span>
                            </div>
                        </div>

                    </div>
                </div>
                
            </div>
        </div>
    </section>





    <section class="map top">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14131.036667732067!2d85.32395955!3d27.69383745!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2snp!4v1637755481449!5m2!1sen!2snp"
            width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </section>
    <footer>
        <div class="container grid top">
            <div class="box">
                <img
                    src="https://img.icons8.com/external-flatart-icons-flat-flatarticons/48/000000/external-hotel-hotel-services-and-city-elements-flatart-icons-flat-flatarticons-1.png" />
                <p> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
                    est laborum.</p>

                <p>Accepted payment methods</p>
                <div class="payment grid">
                    <img src="https://img.icons8.com/color/48/000000/visa.png" />
                    <img src="https://img.icons8.com/color/48/000000/mastercard.png" />
                    <img src="https://img.icons8.com/color-glass/48/000000/paypal.png" />
                    <img src="https://img.icons8.com/fluency/48/000000/amex.png" />
                </div>
            </div>

            <div class="box">
                <h3>Recent News</h3>

                <ul>
                    <li>Our Secret Island Boat Tour Is Just for You</li>
                    <li>Chill and Escape in Our Natural Shelters</li>
                    <li>September in Luviana Hotel</li>
                    <li>Live Music Concerts at Luviana</li>
                </ul>
            </div>

            <div class="box">
                <h3>For Customers</h3>
                <ul>
                    <li>About Luviana</li>
                    <li>Customer Care/Help</li>
                    <li>Corporate Accounts</li>
                    <li>Financial Information</li>
                    <li>Terms & Conditions</li>
                </ul>
            </div>

            <div class="box" id="contact">
                <h3>Contact Us</h3>

                <ul>
                    <li>3015 Grand Ave, Cocount Grove, Merrick Way FL 123456</li>
                    <li><i class="far fa-envelope"></i>demoexample@gmail.com </li>
                    <li><i class="far fa-phone-alt"></i>123 456 7898 </li>
                    <li><i class="far fa-phone-alt"></i>123 456 7898 </li>
                    <li><i class="far fa-comments"></i>24/ 7 Customer Services </li>
                </ul>
            </div>
        </div>
    </footer>
</body>

</html>

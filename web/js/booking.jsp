<%-- 
    Document   : booking
    Created on : Mar 5, 2022, 11:16:03 PM
    Author     : win
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking - Sochi Hotel</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/booking.css" type="text/css">
</head>

<body>
    <header class="header" id="navigation-menu">
        <div class="container3">
            <nav>
                <a href="#" class="logo" style="margin-left: 10rem;"> <img src="../images/logo.png" alt=""> </a>

                    <ul class="nav-menu" style="margin-right: 3rem;">
                        <li> <a href="#home" class="nav-link">Home</a> </li>
                        <li> <a href="#about" class="nav-link">About Us</a> </li>
                        <li> <a href="#room" class="nav-link">Rooms</a> </li>
                        <li> <a href="#restaurant" class="nav-link">Restaurant</a> </li>
                        <li> <a href="#gallary" class="nav-link">Gallery</a> </li>
                        <li> <a href="#contact" class="nav-link">Contact</a> </li>

                        <c:if test="${sessionScope.account==null}">
                            <li>
                                <a href="login.jsp" class="nav-link">MY ACCOUNT</a> 
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account!=null}">
                           
                            <li><a class="nav-link" style="  background-color: #fff;
                                   padding: 0.7rem;
                                   font-size:0.8rem;
                                   border-radius: 5px;
                                   color: blue;
                                   margin-right: 1rem;">${sessionScope.account.user}</a> </li>
                            <a href="logout" class="nav-link1" style="padding: 0.54rem; color: #C1B086; background-color: #fff;">Logout</a>
                     </c:if>
                            
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
                    <h1>BOOKING</h1>
                </div>
            </div>
            <div class="images">
                <img src="../images/hotel5.jpg" class="slide">
            </div>
        </div>
    </section>
    <section class="booking-infor">
    <div class="book">
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
                    <label>Adults:</label>
                    <input type="number" placeholder="0"  min="0">
                </div>
                <div class="box">
                    <label>Children:</label>
                    <input type="number" placeholder="0"  min="0">
                </div>
                <div class="box">
                    <label>Your room:</label>
                    <input type="text" readonly="">
                </div>
                <div class="box">
                    <label>Your servies:</label>
                    <input type="text" readonly="">
                </div>
                <div class="box">
                    <label>Total:</label>
                    <input type="number" placeholder="0" readonly="">
                </div>
            </div>
        </div>
    </div>
    <div class="infor">
        <div class="infor-add">
           <p>You are booking as guest, <a href="login.jsp"> LOGIN or REGISTER</a>  if you want to save your reservation on your account.</p>
        </div>
        <span class="bar1"></span>
        <div class="information">
            <p>Add Your Information:</p><br>
            <div class="left">
                Name *<br>
                <input type="text" name="name"><br>
                Email *<br>
                <input type="text" name="email"><br>
                Address<br>
                <input type="text" name="address"><br>
                Country<br>
                <input type="text" name="country">
            </div>
            <div class="right">
                Surname *<br>
                <input type="text" name="surname"><br>
                Telephone *<br>
                <input type="text" name="phone"><br>
                City<br>
                <input type="text" name="city"><br>
                Zip<br>
                <input type="text" name="zip">
            </div>
        </div>
        <div class="infor-bottom">
            Request<br>
            <textarea type="text" name="request" rows="6"></textarea><br>
        </div>
        <input class="checkout" type="submit" value="CHECKOUT" name="checkout">
            
        
    </div>
</section>


    <section class="map top">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14131.036667732067!2d85.32395955!3d27.69383745!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2snp!4v1637755481449!5m2!1sen!2snp"
            width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </section>
    <footer>
        <div class="container grid1 top">
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
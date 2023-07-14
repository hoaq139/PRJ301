<%@page import="DAL.UserDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : serch
    Created on : Feb 26, 2022, 11:43:45 PM
    Author     : win
--%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>News</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
              integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css"
              integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
              integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="author" content="colorlib.com">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <link href="css/search.css" rel="stylesheet" type="text/css"/>
        <script src="../pagger.js"></script>
    </head>
    <body>
        <header class="header" id="navigation-menu" style="background-color: #b78a62;">
            <div class="container3">
                <nav>
                    <a href="#" class="logo" style="margin-left: 10rem;"> <img src="../images/logo.png" alt=""> </a>

                    <ul class="nav-menu" style="margin-right: 3rem;">
                        <li> <a href="newslist" class="nav-link">Home</a> </li>
                        <li> <a href="#about" class="nav-link">About Us</a> </li>
                        <li> <a href="#news" class="nav-link">News</a> </li>

                        </li>
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
                                   margin-right: 1rem;" href="profile">${sessionScope.account.fullname}</a> </li>
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
        <div class="s002" style="height: 10rem;">
            <form action="newslist" method="POST">
                <div class="inner-form">
                    <div class="input-field first-wrap">
                        <div class="icon-wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"></path>
                            </svg>
                        </div>
                        <input value="${search}" id="search" type="text" placeholder="What are you looking for?" name="search" />
                    </div>
                    <div class="input-field second-wrap">
                        <div class="icon-wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                            </svg>
                        </div>
                        <input class="datepicker" id="depart" type="date" placeholder="${from}" name="from" />
                    </div>
                    <div class="input-field third-wrap">
                        <div class="icon-wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                            </svg>
                        </div>
                        <input class="datepicker" id="return" type="date" placeholder="${to}" name="to" />
                    </div>
                    <div class="input-field fouth-wrap">
                        <select class="datepicker" data-trigger="" name="choices-single-default">
                            <option value="all">All</option>
                            <c:forEach var="a" items="${requestScope.listC}">
                                <option value="${a.id}">${a.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="input-field fifth-wrap">
                        <button class="btn-search" type="submit">SEARCH</button>
                    </div>
                </div>
            </form>
        </div>
        <script src="js/extention/choices.js"></script>
        <script src="js/extention/flatpickr.js"></script>
        <script>
            flatpickr(".datepicker",
                    {});

        </script>
        <script>
            const choices = new Choices('[data-trigger]',
                    {
                        searchEnabled: false,
                        itemSelectText: '',
                    });

        </script>
        <section class="search" id="news">
            <div class="container">
                <div class="box">
                    <div class="text">
                        <h1 style="text-align: center;">All News</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="room-des row" id="categoryData">
                        <c:forEach var="a" items="${requestScope.data}">
                            <div class="col-md-4">
                                <form action="detail?id=${a.id}" method="POST">
                                    <img src="${a.image}"alt=""/>
                                    <div class="room-text">
                                        <h3>${a.title}</h3>
                                        <div class="room-flex">
                                            <img src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-user-grey.svg"
                                                 alt="">
                                            <p style="color: black;">Author: ${a.user.fullname}</p>
                                            <img class="img-2"
                                                 src="http://www.nicdarkthemes.com/themes/hotel/wp/demo/hotel/wp-content/plugins/nd-booking/assets/img/icons/icon-plan-grey.svg"
                                                 alt="">
                                            <p style="color: black;">${a.timePost}</p>
                                        </div>
                                        <p>${a.shortDes}</p>
                                        <input type="submit" name="booknow" value="Click To Read More">
                                        <span></span>
                                    </div>
                                </form> 
                            </div>

                        </c:forEach>

                    </div>
                </div>
            </div>

        </div>
        <div id="pagerbot"></div>
        <script>
            // renderPagger('pagerbot',${requestScope.pageindex},${requestScope.totalpage}, 2);

        </script>
    </section>





    <section class="map top">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14131.036667732067!2d85.32395955!3d27.69383745!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2snp!4v1637755481449!5m2!1sen!2snp"
            width="600" height="450" style="border:0; margin-top: 5rem;" allowfullscreen="" loading="lazy"></iframe>
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

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
        <title>News Detail</title>
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
        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Design fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> 

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- FontAwesome Icons core CSS -->
        <link href="css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="style.css" rel="stylesheet">

        <!-- Responsive styles for this template -->
        <link href="css/responsive.css" rel="stylesheet">

        <!-- Colors for this template -->
        <link href="css/colors.css" rel="stylesheet">

        <!-- Version Tech CSS for this template -->
        <link href="css/version/tech.css" rel="stylesheet">
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
                                <a href="login" class="nav-link">MY ACCOUNT</a> 
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
    </section>

    <section style="margin-top: 20px;">
        <div class="page-wrapper" >
            <div class="blog-title-area text-center">

                <span class="color-orange"><a style="font-size: 20px; padding: 5px; " title="">${news.category.name}</a></span>

                <h3 style="margin-top: 20px; margin-bottom: 20px;">${news.title}</h3>

                <div class="blog-meta big-meta" style="font-size: 20px; margin-bottom: 20px;">
                    <small><a href="tech-single.html" title="">${news.timePost}</a></small>
                    <small><a href="tech-author.html" title="">by ${news.user.fullname}</a></small>
                </div><!-- end meta -->
            </div>
            <div class="single-post-media">
                <img src="${news.image}" alt="" class="img-fluid">
            </div><!-- end media -->

            <div class="blog-content">  
                <div class="pp">
                    <p style="font-size: 20px;width: 90%; text-align: center; margin-left: 5rem; margin-bottom: 25px; margin-top: 25px;">${news.description}</p>
                </div>
            </div>
            <hr class="invis1">
            <div class="custombox clearfix">
                <h4 class="small-title">${count} Comments</h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="comments-list">
                            <c:forEach var="a" items="${list}">
                                <div class="media">
                                    <div class="media-body">
                                        <h4 class="media-heading user_name">${a.user.fullname} <small>${a.time}</small></h4>
                                        <p style="font-size: 15px;width: 90%; margin-left: 5rem;">${a.comment}</p>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end custom-box -->    
            <hr class="invis1">
            <div class="custombox clearfix" style="width: 50%; margin-left: 5rem;">
                <h4 class="small-title">Leave a Comment</h4>
                <c:if test="${sessionScope.account!=null}">
                    <div class="infor-add container" style="display: none;">
                        <p style="font-size: 15px; color: red;">You are reading as guest, <a href="login.jsp"> LOGIN or REGISTER</a>  if you want to leave a comment.</p>
                    </div>
                    <span class="bar1 container" style="display: none;"></span>          
                </c:if>
                <c:if test="${sessionScope.account==null}">
                    <div class="infor-add container">
                        <p style="font-size: 15px; color: red;">You are reading as guest, <a href="login.jsp"> LOGIN or REGISTER</a>  if you want to leave a comment.</p>
                    </div>
                    <span class="bar1 container"></span>          
                </c:if>
                <c:if test="${sessionScope.account==null}">
                    <div class="row" style="display: none;" >
                        <div class="col-lg-12">
                            <form class="form-wrapper" action="comment" method="POST">
                                <input name="comment" class="form-control" placeholder="Your comment">
                                <button style="margin-top: 1rem;" type="submit" class="btn btn-primary">Submit Comment</button>
                            </form>
                        </div>
                    </div>
                </c:if>
                    <c:if test="${sessionScope.account!=null}">
                    <div class="row" >
                        <div class="col-lg-12">
                            <form class="form-wrapper" action="comment" method="POST">
                                <textarea name="comment" class="form-control" placeholder="Your comment"></textarea>
                                <button style="margin-top: 1rem;" type="submit" class="btn btn-primary">Submit Comment</button>
                            </form>
                        </div>
                    </div>
                </c:if>

            </div>  
        </div>

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

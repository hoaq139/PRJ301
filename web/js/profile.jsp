<%-- 
    Document   : profile
    Created on : Mar 13, 2022, 9:53:53 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile-Sochi hotel</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
              integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css"
              integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
              integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css" type="text/css">
    </head>
    <body>
        <h3>YOUR PROFILE</h3>
        <div class="section" style="margin-top: 50px ">
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <!-- Billing Details -->
                        <div class="billing-details">
                            <form action="profile"  method="post">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" class="form-control" name="id" value="${sessionScope.account.user}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="text" class="form-control" name="name" value="${sessionScope.account.pass}">
                                </div>

                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" value="${sessionScope.account.email}">
                                </div>
                                <input type="submit" class="btn" value="Save" onclick = "Mess('${sessionScope.account.user}')"/>
                                
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h3>YOUR BOOKING</h3>
        <section class="book" >
            <form action="search" method="POST"  >
                <div class="container flex" style="height: 20vh;">
                    <div class="input grid">
                <div class="box">
                    <label>Check-in:</label>
                    <input type="date" name="checkin" placeholder="Check-in-Date" value="${checkin}" readonly="">
                </div>
                <div class="box">
                    <label>Check-out:</label>
                    <input type="date" name="checkout" placeholder="Check-out-Date" value="${checkout}" readonly="">
                </div>
                <div class="box">
                    <label>Adults:</label>
                    <input type="number" name="adult" placeholder="0"  min="0" value="${adult}" readonly="">
                </div>
                <div class="box">
                    <label>Children:</label>
                    <input type="number" name="child" placeholder="0"  min="0" value="${child}" readonly="">
                </div>
            </div>
                    <div class="search" style="height: 20vh; margin-top:0;">
                        <input  type="submit" value="SEARCH AGAIN">
                    </div>
                </div>
            </form>
 
        </section>
         <section class="book">
<!--            <form action="search" method="POST">-->
                <div class="container flex" style="height: 20vh;">
                    <div class="input grid1">
                        <div class="box">
                            <label>Room:</label>
                            <input type="text"  name="roomname" readonly="" value="${sessionScope.room.name}">
                        </div>
                        <div class="box">
                            <label>Total: </label> <br>
                            <input type="text" name="total" readonly="" value="">
                        </div>
                    </div>
                    <div class="search" style="height: 20vh; margin-top:0;">
                        <input  type="submit" value="BOOK AGAIN">
                    </div>
                </div>
<!--            </form>-->
        </section>
    </body>
</html>

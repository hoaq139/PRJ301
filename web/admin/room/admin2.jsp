<%-- 
    Document   : admin2
    Created on : Mar 19, 2022, 10:15:11 PM
    Author     : win
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin-Sochi Hotel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css"
        integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
        integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
    <header class="header" id="navigation-menu">
        <div class="container">
          <nav>
            <a href="#" class="logo"> <img src="../../images/logo.png" alt=""> </a>
    
            <ul class="nav-menu">
              <li> <a href="#home" class="nav-link">Home</a> </li>
              <li> <a href="#room" class="nav-link">Rooms</a> </li>
              <li> <a href="#services" class="nav-link">Services</a> </li>
              <li> <a href="#bookingdetails" class="nav-link">Booking Details</a> </li>
             <c:if test="${sessionScope.account==null}">
                            <li>
                                <a href="login.jsp" class="nav-link">MY ACCOUNT</a> 
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account!=null}">
                           
                            <li><a href="#" class="nav-link" style="  background-color: #fff;
                                   padding: 0.7rem;
                                   font-size:0.8rem;
                                   border-radius: 5px;
                                   color: blue;
                                   margin-right: 1rem;">${sessionScope.account.user}</a> </li>
                            <a href="#" class="nav-link1" style="padding: 0.54rem; color: #C1B086; background-color: #fff;">Logout</a>
                     </c:if>
            </ul>
          </nav>
        </div>
      </header>
      <section class="home" id="home">
        <div class="head_container">
          <div class="box">
            <div class="text">
              <h1>Hello.Salut.Hola</h1>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
              <button>MORE INFO</button>
            </div>
          </div>
          <div class="images">
            <img src="../../images/home4.jpg" class="slide">
          </div>
          <div class="image_item">
            <img src="../../images/home1.jpg" alt="" class="slide active" onclick="img('../../images/home1.jpg')">
            <img src="../../images/home2.jpg" alt="" class="slide" onclick="img('../../images/home2.jpg')">
            <img src="../../images/home3.jpg" alt="" class="slide" onclick="img('../../images/home3.jpg')">
            <img src="../../images/home4.jpg" alt="" class="slide" onclick="img('../../images/home4.jpg')">
          </div>
        </div>
      </section>
      <script>
        function img(anything) {
          document.querySelector('.slide').src = anything;
        }
    
        function change(change) {
          const line = document.querySelector('.images');
          line.style.background = change;
        }
      </script>
     
      <div class="table-wrapper" id="room">
        <h2>Rooms Control</h2>
          <table class="fl-table">
              <thead>
              <tr>
                  <th>Id</th>
                  <th>Name</th>
                  <th>Image</th>
                  <th>Price</th>
                  <th>Guest</th>
                  <th>Square</th>
                  <th>Description</th>
                  <th style="background-color: orangered;"><a href="../room/create">Add new</a></th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="o" items="${requestScope.listRoom}">
              <tr>
                 <td>${o.id}</td> 
                    <td>${o.name}</td>
                    <td>${o.image}</td>
                    <td>${o.price}</td>
                    <td>${o.guest}</td>
                    <td>${o.square}</td>
                    <td>${o.description}</td>
                    <td><a href="../room/update?id=${o.id}">Update</a>
                        <a href="#" onclick = "showMess(${o.id})">Delete</a></td>
              </tr>
             </c:forEach>
              <tbody>
          </table>
         <script>
       function showMess(id){
           var option = confirm('Are you sure to delete?');
           if(option === true){
               window.location.href = '../room/delete?id=' +id;
           }
       }
   </script>
      </div>
      <div class="table-wrapper" id="services">
        <h2>Services Control</h2>
          <table class="fl-table">
              <thead>
              <tr>
                  <th>Id</th>
                  <th>Name</th>
                  <th>Price</th>
                  <th>Time</th>
                  <th style="background-color: orangered;"><a href="../services/create">Add new</a></th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="a" items="${requestScope.listServices}">
                <tr>
                    <td>${a.id}</td> 
                    <td>${a.name}</td>
                    <td>${a.price}</td>
                    <td>${a.time}</td>
                    <td><a href="../services/update?idd=${a.id}">Update</a>
                        <a href="#" onclick = "showMess2(${a.id})">Delete</a></td>
                </tr>
               
            </c:forEach>
             
              <tbody>
          </table>
      </div>
       <script>
       function showMess2(id){
           var option = confirm('Are you sure to delete?');
           if(option === true){
               window.location.href = '../services/delete?idd=' +id;
           }
       }
   </script>
      <div class="table-wrapper" id="services">
        <h2>Booking Details</h2>
          <table class="fl-table">
              <thead>
              <tr>
                  <th>ID</th>
                  <th>CustID</th>
                  <th>RoomID</th>
                  <th>Checkin</th>
                  <th>Checkout</th>
                  <th>Guest</th>
                  <th>CustomerName</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Address</th>
                  <th>City</th>
                  <th>Country</th>
                  <th>Zip</th>
                  <th>Request</th>
                  <th>Total</th>
                  <th>ServicesID</th>
                  <th  style="background-color: orangered;"><a href="../bookingdetail/create">Add new</a></th>
              </tr>
              </thead>
              <tbody>
             <c:forEach var="o" items="${requestScope.list}">
                <tr>
                    <td>${o.id}</td>
                    <td>${o.account}</td>
                    <td>${o.room}</td>
                    <td>${o.checkin}</td>
                    <td>${o.checkout}</td>
                    <td>${o.guest}</td>
                    <td>${o.custName}</td>
                    <td>${o.email}</td>
                    <td>${o.phone}</td>
                    <td>${o.address}</td>
                    <td>${o.city}</td>
                    <td>${o.country}</td>
                    <td>${o.zip}</td>
                    <td>${o.requested}</td>
                    <td>${o.total}</td>
                    <td>${o.services}</td>
                    <td><a href="../bookingdetail/update?iddd=${o.id}">Update</a>
                        <a href="#" onclick = "showMess3(${o.id})">Delete</a></td>
                </tr>
                 </c:forEach>
             
              <tbody>
          </table>
      </div>
  <script>
       function showMess3(id){
           var option = confirm('Are you sure to delete?');
           if(option === true){
               window.location.href = '../bookingdetail/delete?id=' +id;
           }
       }
   </script>
</body>
</html>

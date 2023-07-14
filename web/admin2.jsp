<%-- 
    Document   : admin2
    Created on : Mar 19, 2022, 10:15:11 PM
    Author     : tienh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
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
                        <li> <a href="" class="nav-link">Home</a> </li>
                        <li> <a href="#news" class="nav-link">News</a> </li>
                        <li> <a href="#category" class="nav-link">Category</a> </li>
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
                                   margin-right: 1rem;">${sessionScope.account.fullname}</a> </li>
                            <a href="logout" class="nav-link1" style="padding: 0.54rem; color: #C1B086; background-color: #fff;">Logout</a>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="table-wrapper" id="news">
            <h2>News Control</h2>
            <table class="fl-table" style="width: 5rem; overflow: auto;">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Author</th>
                        <th>Time</th>
                        <th>Short Description</th>
                        <th>
                            Category
                        </th>
                        <th style="background-color: orangered;"><a href="addNew">Add new</a></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="news" items="${newslist}">
                        <tr style="max-width: 100%;">
                            <td style="overflow-wrap:  break-all;  width: 5rem;">${news.id}</td> 
                            <td style="overflow-wrap: break-all; width: 5rem;">${news.title}</td>
                            <td style="overflow-wrap: break-all; width: 5rem;">${news.description}</td>
                            <td><img style="width: 5rem; height: 5rem;" src=" ${news.image}"></td>
                            <td>${news.user.fullname}</td>
                            <td>${news.timePost}</td>
                            <td style="overflow-wrap: break-all; width: 5rem;">${news.shortDes}</td>
                            <td>${news.category.name}</td>
                            <td><a href="updateNews?id=${news.id}">Update</a>
                                <a href="#" onclick = "showMess(${news.id})">Delete</a></td>
                        </tr>
                    </c:forEach>
                <tbody>
            </table>
            <script>
                function showMess(id) {
                    var option = confirm('Are you sure to delete?');
                    if (option === true) {
                        window.location.href = 'deleteNews?id=' + id;
                    }
                }
            </script>
        </div>
        <div class="table-wrapper" id="category">
            <h2>Category Control</h2>
            <table class="fl-table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th style="background-color: orangered;"><a href="createCategory">Add new</a></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${requestScope.listC}">
                        <tr>
                            <td>${a.id}</td> 
                            <td>${a.name}</td>
                            <td><a href="updateCategory?idd=${a.id}">Update</a>
                                <a href="#" onclick = "showMess2(${a.id})">Delete</a></td>
                        </tr>

                    </c:forEach>

                <tbody>
            </table>
        </div>
        <script>
            function showMess2(id) {
                var option = confirm('Are you sure to delete?');
                if (option === true) {
                    window.location.href = 'deleteCategory?idd=' + id;
                }
            }
        </script>
        
    </body>
</html>

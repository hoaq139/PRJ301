<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : add
    Created on : Mar 11, 2022, 12:03:47 AM
    Author     : win
--%>

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/add.css">
    </head>
    <body>
        <form action="addwriter" method="POST">
            <div class="table-wrapper">
                <h2>Create News</h2>
                <table class="fl-table">
                    <thead>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Title</td>
                            <td><input type="text" name="title" required=""/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Image</td>
                            <td><input type="text" name="image" required=""/></td>
                        </tr>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Short Description </td>
                            <td><input type="text" name="shortdes" required=""/></td>
                        </tr>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Description</td>
                            <td><input type="text" name="description" required=""/></td>
                        </tr>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Category</td>
                            <td>
                                <select name="category">
                                   <c:forEach var="a" items="${listC}">
                                <option value="${a.id}">${a.name}</option>
                            </c:forEach>
                                </select>
                            </td>
                            <td>
                                <select name="publish">
                                    
                                        <option value="1">
                                            wait
                                        </option>
                                   
                                </select>
                            </td>
                        </tr>

                    <tbody>
                </table>
                <button style="padding: 0.7rem 1.5rem; background-color: rgb(54, 109, 167); color: white; margin-top: 1rem;" type="submit" value="Save">Save</button>
            </div>
        </form>
    </body>
</html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : admin
    Created on : Mar 10, 2022, 8:33:11 AM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 style="margin-left: 25rem;">Welcome Admin</h3>
        <h3 style="margin-left: 25rem;">Control Room</h3>
        <table border="1">
            <tbody>
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Image</td>
                    <td>Price</td>
                    <td>Guest</td>
                    <td>Square</td>
                    <td>Description</td>
                    <td></td>
                </tr>
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
                
            </tbody>
        </table>
        <a href="create">Create</a>


    </body>
    <script>
       function showMess(id){
           var option = confirm('Are you sure to delete?');
           if(option === true){
               window.location.href = 'delete?id=' +id;
           }
       }
   </script>
</html>

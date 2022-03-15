<%-- 
    Document   : services
    Created on : Mar 13, 2022, 9:00:53 PM
    Author     : win
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 style="margin-left: 25rem;">Control Services</h3>
        <table border="1">
            <tbody>
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Time</td>
                    <td></td>
                </tr>
                <c:forEach var="o" items="${requestScope.listServices}">
                <tr>
                    <td>${o.id}</td> 
                    <td>${o.name}</td>
                    <td>${o.price}</td>
                    <td>${o.time}</td>
                    <td><a href="update?id=${o.id}">Update</a>
                        <a href="#" onclick = "showMess(${o.id})">Delete</a></td>
                </tr>
               
            </c:forEach>
                
            </tbody>
        </table>
        <a href="../services/create">Create</a>
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

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : detail.jsp
    Created on : Mar 15, 2022, 10:12:06 PM
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
        <table border="1">
            <tbody>
                <tr>
                    <td>ID</td>
                    <td>CustID</td>
                    <td>RoomID</td>
                    <td>Checkin</td>
                    <td>Checkout</td>
                    <td>Guest</td>
                    <td>CustomerName</td>
                    <td>Email</td>
                    <td>Phone</td>
                    <td>Address</td>
                    <td>City</td>
                    <td>Country</td>
                    <td>Zip</td>
                    <td>Total</td>
                    <td>Request</td>
                    <td></td>
                </tr>
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
                    <td>${o.id}</td>
                    <td><a href="#" onclick = "showMess(${o.id})">Delete</a></td></td>
                </tr>
                 </c:forEach>
            </tbody>
        </table>
   <script>
       function showMess(id){
           var option = confirm('Are you sure to delete?');
           if(option === true){
               window.location.href = 'delete?id=' +id;
           }
       }
   </script>
    </body>
</html>

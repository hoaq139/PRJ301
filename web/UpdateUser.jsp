<%-- 
    Document   : update
    Created on : Jul 19, 2023, 9:03:59 AM
    Author     : hoangdinh
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
        
        
        <h1>Update person</h1>
        <form action="update" method="post">
            <input type="text" name="id" value="${person.id}">
            FullName:<input type="text" name="fullname" value="${person.fullname}">
            Username: <input type="text" name="username" value="${person.username}" required />
            <br/>
            Password: <input type="text" name="password" value="${person.password}" required />
            <br/>
            
            Address:<select name="address">
                <c:forEach var="address" items="${addressList}">
                    <<option value="${address.id}">${address.name}</option>
                </c:forEach>
                
            </select>
            <br/>
            <input type="submit" value="Update" />
        </form>
    
    </body>
</html>

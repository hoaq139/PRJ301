<%-- 
    Document   : profile
    Created on : Jul 12, 2023, 9:42:31 PM
    Author     : hoangdinh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        Username:${sessionScope.account.username}<br>
        Name: ${sessionScope.account.fullname}<br>
        <c:choose>
            <c:when test="${sessionScope.account.roles == 2}">Roles: User</c:when> 
            <c:when test="${sessionScope.account.roles == 1}">Roles: Admin</c:when> 
            <c:otherwise>Roles: Author</c:otherwise>
        </c:choose>
            <br>
            <<a href="change.jsp">Change password</a>>
    </body>
</html>

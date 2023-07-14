<%-- 
    Document   : change
    Created on : Jul 12, 2023, 10:07:12 PM
    Author     : hoangdinh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <h1>Change password</h1>
        <h3>${requestScope.ms}</h3>
        <form action="change">
            
            Old password:<input type="password" name="oldpassword">
            <input type="hidden" name="user" value="${sessionScope.account.username}">
            New Password:<input type="password" name="password">
            Confirm password <input type="password" name="rpass">
            <input type="submit" value="Change">
            
        </form>
    </body>
</html>

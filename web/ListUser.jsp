<%-- 
    Document   : ListUser
    Created on : Jul 17, 2023, 8:39:49 AM
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
        <h1>List</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>FullName</th>
                    <th>UserName</th>
                    <th>Password</th>
                    <th>Roles</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
             
                <c:forEach var="list" items="${list}">
                <tr>
                    <td>${list.id}</td>
                    <td>${list.fullname}</td>
                    <td>${list.username}</td>
                    <td>${list.password}</td>
                    <td>
                        <c:choose>
                            <c:when test="${list.roles == 1}">
                                admin
                            </c:when>
                            <c:when test="${list.roles == 3}">
                                writer
                            </c:when>
                            
                            <c:when test="${list.roles == 2}">
                                user
                            </c:when>
                            
                            <c:otherwise>
                                
                                unknown role
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="text-align: center">
                        
                        <form action="update" method="get">
                            <input type="hidden" name="id" value="${list.id}">
                            <input type="submit" value="✎" />
                        </form>
                    </td>
                    <td style="text-align: center">
                        <form action="delete" method="post">
                            <input type="hidden" name="id" value="${list.id}">
                            <input type="submit" value="✖" />
                        </form>
                        
                    </td>
                    
                </tr>
                </c:forEach>
    </body>
</html>

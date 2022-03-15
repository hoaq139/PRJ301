<%-- 
    Document   : update
    Created on : Mar 12, 2022, 11:00:03 PM
    Author     : win
--%>

<%@page import="model.Services"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Services s = (Services) request.getAttribute("s");
        %>
    </head>
    <body>
        <form action="update" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Id:</td>
                        <td><input type="text" name="id" value="<%=s.getId()%>"/></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" value="<%=s.getName()%>"/></td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td><input type="number" name="price" value="<%=s.getPrice()%>"/></td>
                    </tr>
                    <tr>
                        <td>Guest:</td>
                        <td><input type="text" name="time" value="<%=s.getTime()%>"/></td>
                    </tr>

                </tbody>

            </table>
            <button type="submit">Update</button>
        </form>
    </body>
</html>

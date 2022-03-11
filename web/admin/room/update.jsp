<%-- 
    Document   : update
    Created on : Mar 11, 2022, 11:00:23 PM
    Author     : win
--%>

<%@page import="model.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Room s = (Room) request.getAttribute("s");
        %>
    </head>
    <body>
        <form action="update" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Id:</td>
                        <td><input type="text" name="id" value="<%=s.getId()%>" readonly=""/></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" value="<%=s.getName()%>"/></td>
                    </tr>
                    <tr>
                        <td>Image:</td>
                        <td><input type="text" name="image" value="<%=s.getImage()%>"/></td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td><input type="number" name="price" value="<%=s.getPrice()%>"/></td>
                    </tr>
                    <tr>
                        <td>Guest:</td>
                        <td><input type="number" name="guest" value="<%=s.getGuest()%>"/></td>
                    </tr>
                    <tr>
                        <td>Square:</td>
                        <td><input type="number" name="square" value="<%=s.getSquare()%>"/></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><input type="text" name="description" value="<%=s.getDescription()%>"/></td>
                    </tr>

                </tbody>

            </table>
            <button type="submit">Update</button>
        </form>
    </body>
</html>

<%-- 
    Document   : add
    Created on : Mar 11, 2022, 12:03:47 AM
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
        <form action="create" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" required=""/></td>
                    </tr>
                    <tr>
                        <td>Image:</td>
                        <td><input type="text" name="image" required=""/></td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td><input type="number" name="price" required=""/></td>
                    </tr>
                    <tr>
                        <td>Guest:</td>
                        <td><input type="number" name="guest" required=""/></td>
                    </tr>
                    <tr>
                        <td>Square:</td>
                        <td><input type="number" name="square" required=""/></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><input type="text" name="description" required=""/></td>
                    </tr>

                </tbody>

            </table>
            <button type="submit">Create</button>
        </form>
    </body>
</html>

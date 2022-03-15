<%-- 
    Document   : add
    Created on : Mar 12, 2022, 10:59:52 PM
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
                        <td>Price:</td>
                        <td><input type="number" name="price" required=""/></td>
                    </tr>
                    <tr>
                        <td>Time: </td>
                        <td><input type="number" name="time" required=""/></td>
                    </tr>
                </tbody>

            </table>
            <button type="submit">Create</button>
        </form>
    </body>
</html>

<%-- 
    Document   : thankyou
    Created on : Mar 15, 2022, 5:25:01 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thank you</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="jumbotron text-center">
            <h1 class="display-3">Thank You!</h1>
            <p class="lead"><strong>Please check your email.</strong> We will contact to you as soon as.</p>
            <hr>
            Your Bill:<br> 
            Your Room: <input value="${price}$" readonly=""><br>
            Your Services: <input value="${total}$" readonly=""><br>
            Total: <input value="${sum}$" readonly=""><br>
            <p class="lead">
                <a class="btn btn-primary btn-sm" href="home.jsp" role="button">Continue to homepage</a>
            </p>
        </div>
    </body>
</html>

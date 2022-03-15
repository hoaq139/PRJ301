<%-- 
    Document   : profile
    Created on : Mar 13, 2022, 9:53:53 PM
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
        <h3>Your Profile</h3>
        <section class="book">
            <form action="search" method="POST">
                <div class="container flex" style="height: 20vh;">
                    <p style="color: black;">${mess1}</p>
                    <div class="input grid">

                        <div class="box">
                            <label>Check-in:</label>
                            <input type="date" id="currentDate"  name="checkin" required="" value="${checkin}">
                        </div>
<!--                        <script>
                            var date = new Date();
                            var currentDate = date.toISOString().slice(0, 10);
                            document.getElementById('currentDate').value = currentDate;

                        </script>-->
                        <div class="box">
                            <label>Check-out:</label>
                            <input type="date"  name="checkout" required="" value="${checkout}">
                        </div>
                        <div class="box">
                            <label>Adults:</label> <br>
                            <input type="number" placeholder="0" name="adult" required="" min="0" value="${adult}">
                        </div>
                        <div class="box">
                            <label>Children:</label> <br>
                            <input type="number" placeholder="0" name="child" required="" min="0" value="${child}">
                        </div>
                    </div>
                    <div class="search" style="height: 20vh; margin-top:0;">
                        <input  type="submit" value="SEARCH">
                    </div>
                </div>
            </form>
        </section>
         
    </body>
</html>

<%-- 
    Document   : add2
    Created on : Mar 22, 2022, 5:00:29 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin-Sochi Hotel</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
              integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css"
              integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
              integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/add.css">
    </head>
    <body>
        <form action="create" method="POST">
            <div class="table-wrapper">
                <h2>Create Booking_Details</h2>
                <table class="fl-table">
                    <thead>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">CustID</td>
                            <td><input type="text" name="custid" required=""/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">RoomID</td>
                            <td><input type="text" name="roomid" required=""/></td>
                        </tr>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">ServicesID</td>
                            <td><input type="text" name="servicesid" required=""/></td>
                        </tr>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Checkin</td>
                            <td><input type="date" name="checkin" required=""/></td>
                        </tr>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Checkout</td>
                            <td><input type="date" name="checkout" required=""/></td>
                        </tr>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Guest</td>
                            <td><input type="text" name="guest" required=""/></td>
                        </tr>
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">CustomerName</td>
                            <td><input type="text" name="custname" required=""/></td>
                        </tr> 
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Email</td>
                            <td><input type="text" name="email" required=""/></td>
                        </tr> 
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Phone</td>
                            <td><input type="text" name="phone" required=""/></td>
                        </tr> 
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Address</td>
                            <td><input type="text" name="address" required=""/></td>
                        </tr> 
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">City</td>
                            <td><input type="text" name="city" required=""/></td>
                        </tr> 
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Country</td>
                            <td><input type="text" name="country" required=""/></td>
                        </tr> 
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Zip</td>
                            <td><input type="text" name="zip" required=""/></td>
                        </tr> 
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Request</td>
                            <td><input type="text" name="requested" required=""/></td>
                        </tr> 
                        <tr>
                            <td style="color: #ffffff; background: #324960; width: 10rem;">Total</td>
                            <td><input type="text" name="total" required=""/></td>
                        </tr> 
                    <tbody>
                </table>
                <button style="padding: 0.7rem 1.5rem; background-color: rgb(54, 109, 167); color: white; margin-top: 1rem;" type="submit" value="Save">Save</button>
            </div>
        </form>
    </body>
</html>

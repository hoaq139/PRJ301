<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Sochi Hotel</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
    
    </head>
    <body>
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
                <input id="tab-2" type="radio" name="tab" ${a==1?"checked":""} class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                
                <div class="login-form">
                    <form action="login" method="POST">
                        <div class="sign-in-htm">
                            <div class="alert-danger" role="alert">
                                <p>${mess}</p>
                            </div>
                            <div class="group">
                                <label for="user" class="label">Username</label>
                                <input id="user" type="text" class="input" required="" name="user" value="${user}">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <input id="pass" type="password" class="input" data-type="password" 
                                    required="" name="pass" value="${pass}" pattern="^{8,20}$">
                            </div>
                            <div class="group">
                                <input id="check" type="checkbox" class="check" name="remember">
                                <label for="check"><span class="icon"></span> Keep me Signed in</label>
                            </div>
                            <div class="group">
                         
                                <button type="submit" class="button">Sign In</button>
                            </div>
                            <div class="hr"></div>
                            <div class="foot-lnk">
                                <a href="#forgot">Forgot Password?</a>
                            </div>
                        </div>
                    </form>
                    <form action="signup" method="POST">
                        <div class="sign-up-htm">
                            <div class="alert-danger" role="alert">
                                <p>${mess2}</p>
                            </div>
                            <div class="group">
                                <label for="user" class="label">Username</label>
                                <input id="user" type="text" class="input" name="user" required="" value="${user2}">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <input id="pass" type="password" class="input" data-type="password" name="pass" 
                                    required="" value="${pass2}" pattern="^{8,20}$">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Repeat Password</label>
                                <input id="pass" type="password" class="input" data-type="password" name="repass" required="" value="${repass}">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Email Address</label>
                                <input id="pass" type="email" class="input" name="email" required="" value="${email}">
                            </div>
                            <div class="group">
                                <button type="submit" class="button"><a href="signupControl?do=signup"></a>Sign Up</button>
                            </div>
                            <div class="hr"></div>
                            <div class="foot-lnk">
                                <label for="tab-1">Already Member?</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/10/2019
  Time: 12:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TESTING</title>
</head>
<style>
    /* BASIC */
    html {

    }
    body {
        font-family: "Poppins", sans-serif;
        background-color:black;
    }
    a {
        color: #92badd;
        display:inline-block;
        text-decoration: none;
        font-weight: 400;
    }
    h2 {
        text-align: center;
        font-size: 16px;
        font-weight: 600;
        text-transform: uppercase;
        display:inline-block;
        margin: 40px 8px 10px 8px;
        color: #cccccc;
    }
    /* STRUCTURE */
    .wrapper {
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: center;
        width: 100%;
        min-height: 100%;

    }
    #formContent {
        -webkit-border-radius: 10px 10px 10px 10px;
        border-radius: 10px 10px 10px 10px;
        background: whitesmoke;
        width: 90%;
        max-width: 450px;
        position: relative;
        text-align: center;
    }
    #formFooter {
        background-color: #f6f6f6;
        border-top: 1px solid #dce8f1;
        padding: 25px;
        text-align: center;
        -webkit-border-radius: 0 0 10px 10px;
        border-radius: 0 0 10px 10px;
    }
    /* TABS */
    h2.inactive {
        color: #cccccc;
    }
    h2.active {
        color: #0d0d0d;
        border-bottom: 2px solid #5fbae9;
    }
    /* FORM TYPOGRAPHY*/
    input[type=button], input[type=submit], input[type=reset]  {
        background-color: #00462e;
        border: none;
        color: white;
        padding: 15px 60px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        text-transform: uppercase;
        font-size: 10px;
        -webkit-box-shadow: 0 10px 30px 0 rgba(0,0,0,0.4);
        box-shadow: 0 10px 30px 0 rgba(0,0,0,0.4);
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
        margin: 5px 20px 40px 20px;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -ms-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }
    input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
        background-color: #000000;
    }
    input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
        -moz-transform: scale(0.95);
        -webkit-transform: scale(0.95);
        -o-transform: scale(0.95);
        -ms-transform: scale(0.95);
        transform: scale(0.95);
    }
    input[type=text] {
        background-color: #f6f6f6;
        border: none;
        color: #0d0d0d;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        width: 85%;
        border: 2px solid #f6f6f6;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
    }
    input[type=text]:focus {
        background-color: #fff;
        border-bottom: 2px solid #000000;
    }
    input[type=text]:placeholder {
        color: #cccccc;
    }
    input[type=text] {
        background-color: #fff;
        border: none;
        color: #0d0d0d;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        width: 85%;
        border: 2px solid #f6f6f6;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
    }
    input[type=text]:focus {
        background-color: #fff;
        border-bottom: 2px solid #00462e;
    }
    input[type=text]:placeholder {
        color: #cccccc;
    }
    input[type=password] {
        background-color: #fff;
        border: none;
        color: #0d0d0d;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        width: 85%;
        border: 2px solid #f6f6f6;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
    }
    input[type=password]:focus {
        background-color: #fff;
        border-bottom: 2px solid #000000;
    }
    input[type=password]:placeholder {
        color: #cccccc;
    }
    /* ANIMATIONS */
    /* Simple CSS3 Fade-in-down Animation */

    /* Simple CSS3 Fade-in Animation */
    .underlineHover:after {
        display: block;
        left: 0;
        bottom: -10px;
        width: 0;
        height: 2px;
        background-color: #000000;
        content: "";
        transition: width 0.2s;
    }
    .underlineHover:hover {
        color: #0d0d0d;
    }
    .underlineHover:hover:after{
        width: 100%;
    }
    /* OTHERS */
    *:focus {
        outline: none;
    }
    #icon {
        width:60%;
    }
</style>
<link type="text/css" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" crossorigin="anonymous">

<link type="text/css" href="/assets/fonts/Manbow_solid/stylesheet.css">
<body oncontextmenu="return false;" style="background-color: whitesmoke">
<link href="/assets/css/bootstrap.min.css" type="text/css" id="bootstrap-css">
<script type="text/javascript" src="/assets/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/modules/jquery.min.js"></script>
<link type="text/css" href="/assets/css/jquery-confirm.min.css" >


<div id="login_card" class="wrapper" style="text-align: center;background-color: whitesmoke">
    <div id="formContent" style="text-align: center">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div style="height: 50px">

        </div>
        <div class="fadeIn first">
            <img src="/assets/img/tracking.png" width="150px">
        </div>
        <div style="height: 50px">

        </div>
        <!-- Login Form -->
        <form id="login" action="${pageContext.request.contextPath}/login" method="post">
            <input type="text" id="username" name="username"  placeholder="username" onfocus="this.placeholder = ''"
                   onblur="this.placeholder = 'email'"><br>
            <input type="password" id="password" name="password"  placeholder="password" onfocus="this.placeholder = ''"
                   onblur="this.placeholder = 'password'" onkeydown="if (event.keyCode == 13) {  this.form.submit(); return false; }">


            <div style="height: 50px">

            </div>

            <input type="submit" id="submit_btn"  class="fadeIn fourth" value="Log In">





        </form>

        <!-- Remind Passowrd -->
        <%--<div id="formFooter">--%>
        <%--<a class="underlineHover" href="#" id="forget_link" style="font-size: small;color: #000000" onclick="OTPView()">Forgot Password?</a>--%>
        <%--<a class="underlineHover" href="#" id="goback_link" style="font-size: small;color: #000000;display: none" onclick="goBack()">Go back to Login</a>--%>
        <%--</div>--%>

    </div>
</div>

</body>
<script type="text/javascript" src="/assets/js/jquery-confirm.min.js"></script>
<script type="text/javascript" src="/assets/js/encrypt.js"></script>
<script type="text/javascript" src="/assets/modules/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">

</script>
</html>

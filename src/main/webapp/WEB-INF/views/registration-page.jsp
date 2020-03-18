<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap core CSS -->
    <link href="../../static/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="../../static/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="../../static/css/style.css" rel="stylesheet">
    <link href="../../static/css/style-responsive.css" rel="stylesheet">
  </head>
<body>
<div class="container">
            <form method="post" class="form-login" action="/register">
                <h2 class="form-login-heading">Registration</h2>
                <div class="login-wrap">
                    <label for="username">Username</label>
                    <input type="text" required name="username" id="username" class="form-control" placeholder="Your username"/>

                    <label for="firstName">First Name</label>
                    <input type="text" required name="firstName" id="firstName" class="form-control" placeholder="Your first name"/>

                    <label for="lastName">Last name</label>
                    <input type="text" required name="lastName" id="lastName" class="form-control" placeholder="Your last name"/>


                    <label for="password">Password</label>
                    <input type="password" required name="password" id="password" class="form-control" placeholder="Password"/>
                    <hr>
                <button class="btn btn-theme btn-block" type="submit">Sign in</button>
                <button class="btn btn-theme02 btn-block" type="reset">Reset</button>
                </div>
                <sec:csrfInput/>
            </form>
</div>
<!-- js placed at the end of the document so the pages load faster -->
<script src="../../static/lib/jquery/jquery.min.js"></script>
<script src="../../static/lib/bootstrap/js/bootstrap.min.js"></script>
<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="../../static/lib/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("../../static/img/background.jpg", {
        speed: 500
    });
</script>
</body>
</html>
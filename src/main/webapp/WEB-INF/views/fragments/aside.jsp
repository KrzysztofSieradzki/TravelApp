<%--
  Created by IntelliJ IDEA.
  User: Sony
  Date: 19.03.2020
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link href="../../static/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="../../static/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="../../static/css/style.css" rel="stylesheet">
    <link href="../../static/css/style-responsive.css" rel="stylesheet">
</head>
<body>

    <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu"  id="nav-accordion">
            <p class="centered"><a href="/"></a></p>
            <h5 class="centered">${pageContext.request.userPrincipal.principal.username}</h5>
            <li class="mt">
                <a href="/">
                    <span>Map</span>
                </a>
            </li>
            <li class="sub-menu">
                <a href="/">
                    <span>Components</span>
                </a>
            </li>
            <li class="sub-menu">
                <a href="/">
                    <span>Forms</span>
                </a>
            </li>
            <li class="sub-menu">
                <a href="/">
                    <span>Data Tables</span>
                </a>
            </li>
        </ul>
        <!-- sidebar menu end-->
    </div>

<!--sidebar end-->

</body>
</html>

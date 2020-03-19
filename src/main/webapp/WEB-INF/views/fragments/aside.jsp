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
<aside>
    <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
            <p class="centered"><a href="profile.html"><img src="img/ui-sam.jpg" class="img-circle" width="80"></a></p>
            <h5 class="centered">${pageContext.request.userPrincipal.principal.username}</h5>
            <li class="mt">
                <a href="index.html">
                    <i class="fa fa-dashboard"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-cogs"></i>
                    <span>Components</span>
                </a>
                <ul class="sub">
                    <li><a href="grids.html">Grids</a></li>
                    <li><a href="calendar.html">Calendar</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a class="active" href="javascript:;">
                    <i class="fa fa-book"></i>
                    <span>Extra Pages</span>
                </a>
                <ul class="sub">
                    <li class="active"><a href="blank.html">Blank Page</a></li>
                    <li><a href="login.html">Login</a></li>
                    <li><a href="lock_screen.html">Lock Screen</a></li>
                    <li><a href="profile.html">Profile</a></li>
                    <li><a href="invoice.html">Invoice</a></li>
                    <li><a href="pricing_table.html">Pricing Table</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li><a href="404.html">404 Error</a></li>
                    <li><a href="500.html">500 Error</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-tasks"></i>
                    <span>Forms</span>
                </a>
                <ul class="sub">
                    <li><a href="form_component.html">Form Components</a></li>
                    <li><a href="advanced_form_components.html">Advanced Components</a></li>
                    <li><a href="form_validation.html">Form Validation</a></li>
                    <li><a href="contactform.html">Contact Form</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-th"></i>
                    <span>Data Tables</span>
                </a>
                <ul class="sub">
                    <li><a href="basic_table.html">Basic Table</a></li>
                    <li><a href="responsive_table.html">Responsive Table</a></li>
                    <li><a href="advanced_table.html">Advanced Table</a></li>
                </ul>
            </li>
        </ul>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
</body>
</html>

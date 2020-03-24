<%--
  Created by IntelliJ IDEA.
  User: Sony
  Date: 24.03.2020
  Time: 12:02
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
<section id="container">
    <header><jsp:include page="fragments/header.jsp"/></header>
    <aside><jsp:include page="fragments/aside.jsp"/></aside>
    <section id="main-content" style="min-height: 635px;">
        <section class="wrapper">
            <div class="row">

            </div>
        </section>
    </section>

    <footer class="site-footer" style="object-position: bottom">
        <jsp:include page="fragments/footer.jsp"/>
    </footer>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="../../static/lib/jquery/jquery.min.js"></script>
    <script src="../../static/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../static/lib/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="../../static/lib/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="../../static/lib/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../../static/lib/jquery.scrollTo.min.js"></script>
    <script src="../../static/lib/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../static/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../../static/lib/bootstrap-daterangepicker/date.js"></script>
    <!--common script for all pages-->
    <script src="../../static/lib/common-scripts.js"></script>
    <!--script for this page-->
</section>
</body>
</html>

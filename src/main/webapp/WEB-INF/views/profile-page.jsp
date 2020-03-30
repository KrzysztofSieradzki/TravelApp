<%--
  Created by IntelliJ IDEA.
  User: Sony
  Date: 28.03.2020
  Time: 17:58
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
    <script src="../../static/lib/chart-master/Chart.js" type="text/javascript"></script>
</head>
<body>
<section id="container">
    <header><jsp:include page="fragments/header.jsp"/></header>
    <aside><jsp:include page="fragments/aside.jsp"/></aside>
    <section id="main-content" style="min-height: 635px;">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                <div class="row content-panel">
<%--                    ================Stats==========--%>
                    <div class="col-md-6 detailed">
                        <h4>Voyager Stats</h4>
                        <div class="row centered mt mb">
                            <div class="col-sm-4">
                                <h1><i class="fa fa-trophy"></i></h1>
                                <h3>${visited.size()}</h3>
                                <h6>Completed travel</h6>
                            </div>
                            <div class="col-sm-4">
                                <h1><i class="fa fa-bullseye"></i></h1>
                                <h3>${toVisit.size()}</h3>
                                <h6>Travels on my list</h6>
                            </div>
                            <div class="col-sm-4">
                                <h1><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-full"></i></h1>
                                <h3>${level}</h3>
                                <h6>Level</h6>
                            </div>
                        </div>
                    </div>


<%--                    ===================--%>
                      <div class="col-md-6 centered">
                        <div class="profile-pic">
                           <p> <img src="../../static/img/domestic-avatar.jpg" class="img-circle" width="200" height="200"> </p>
                            <h3>${pageContext.request.userPrincipal.principal.username}</h3>
                            <br>
                            <button class="btn btn-theme"><i class="fa fa-camera-retro"></i> Change picture</button>
                        </div>
                      </div>
                 </div>
                </div>
<%--                    =======================Second panel===================--%>
                <div class="col-lg-12">
                    <div class="row content-panel">
                        <div class="col-md-4 mb">
                            <div class="gold-panel pn">
                                <div class="gold-header">
                                    <h5>YOUR PROGRESS</h5>
                                    <canvas id="serverstatus03" height="120" width="120"></canvas>
                                    <script>
                                        var doughnutData = [{
                                            value: 60,
                                            color: "#2b2b2b"
                                        },
                                            {
                                                value: 40,
                                                color: "#fffffd"
                                            }
                                        ];
                                        var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                                    </script>
                                    <h3>60% USED</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


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
        <!--common script for all pages-->
        <script src="../../static/lib/common-scripts.js"></script>
        <!--script for this page-->
    </section>
</body>
</html>

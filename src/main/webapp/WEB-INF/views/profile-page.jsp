<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="col-md-4 detailed">
                        <h4>Voyager Stats</h4>
                        <div class="row centered mt mb">
                            <div class="col-sm-4">
                                <h1><i class="fa fa-trophy"></i></h1>
                                <h3>${visited}</h3>
                                <h6>Completed travel</h6>
                            </div>
                            <div class="col-sm-4">
                                <h1><i class="fa fa-bullseye"></i></h1>
                                <h3>${toVisit}</h3>
                                <h6>Travels on my list</h6>
                            </div>
                            <div class="col-sm-4">
                                <h1><i class="fa fa-star"></i><i class="fa fa-star-half-full"></i></h1>
                                <h3>${level}</h3>
                                <h6>Level</h6>
                            </div>
                        </div>
                    </div>
<%--                        ===============================--%>
    <div class="col-md-4 detailed">
        <h4>Take the challenge to conquer 100 countries!</h4>
        <p>If traveling is your passion, you want to learn about new cultures,
            discover the wonderful corners of our planet and experience an unforgettable adventure,
            or if you travel only for rest, take the challenge of conquering 100 countries!
            Each new journey is a valuable experience that cannot be replaced by knowledge from a book.
            Therefore, make your dreams come true and hit the road!</p>
    </div>
<%--                    ===================--%>
                      <div class="col-md-4 centered">
                        <div class="profile-pic">
                           <p> <img src="../../static/img/domestic-avatar.jpg" class="img-circle" width="180" height="180"> </p>
                            <h3>${pageContext.request.userPrincipal.principal.username}</h3>
                            <h5>To level up</h5>
                            <div class="progress">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${percentOfProgress}%">
                                    <span class="sr-only">90% Complete (success)</span>
                                </div>
                        </div>
<%--                            <button class="btn btn-theme"><i class="fa fa-camera-retro"></i> Change picture</button>--%>
                      </div>
                 </div>
                </div>
                </div>
<%--                    =======================Second panel===================--%>
                <div class="col-lg-12 mt">
                    <div class="row content-panel">
                        <div class="col-md-4 mb">
                            <div class="gold-panel pn">
                                <div class="gold-header">
                                    <h5>YOUR PROGRESS</h5>
                                </div>
                                    <canvas id="serverstatus03" height="120" width="120"></canvas>
                                    <script>
                                        var doughnutData = [{
                                            value: ${visited},
                                            color: "#2b2b2b"
                                        },
                                            {
                                                value: 100-${visited},
                                                color: "#fffffd"
                                            }
                                        ];
                                        var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                                    </script>
                                    <h3>${visited}% Visited</h3>

                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="content-panel">
                                <h4><i class="fa fa-bar-chart-o"></i> History</h4>
                                <div class="panel-body text-center">
                                    <canvas id="bar" height="200" width="550"></canvas>
                                    <script>
                                        var barChartData = {
                                            labels: [
                                                <c:forEach items="${years}" var="years">
                                                "${years}",
                                                </c:forEach>
                                                ],
                                            datasets: [
                                                {
                                                    fillColor: "rgba(48,47,45,0.5)",
                                                    strokeColor: "rgba(48,47,45,1)",
                                                    data: [
                                                        <c:forEach items="${history}" var ="his">
                                                        ${his.value},
                                                        </c:forEach>
                                                    ]
                                                },
                                                {
                                                    fillColor: "rgba(207,161,37,0.5)",
                                                    strokeColor: "rgba(207,161,37,1)",
                                                    data: [
                                                        <c:forEach items="${predicted}" var ="pred">
                                                        ${pred.value},
                                                        </c:forEach>
                                                    ]
                                                }
                                            ]};
                                        new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
                                    </script>
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

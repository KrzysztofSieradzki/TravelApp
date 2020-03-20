<%--
  Created by IntelliJ IDEA.
  User: Sony
  Date: 20.03.2020
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <div style="float: left; width: 40%">
            <sec:authorize access="isAuthenticated()">
            <div class="row" style="margin-top: 40px; margin-bottom: 10px">
                <div class="col-6"><h2>Dodaj miejce</h2></div>
            </div>
                    <form method="post" action="trip/add-trip">
                        <div class="form-group">
                            <label for="target">Nazwa kraju:</label>
                            <input type="text" required name="target" id="target" class="form-control"
                                   placeholder="Podaj państwo które chcesz zobaczyć"/>
                        </div>
                        <div class="form-group">
                            <label for="year">Przewidywany rok</label>
                            <input type= "number" name="year" id="year"
                                      class="form-control"
                                      placeholder="Mój cel na rok :"/>
                        </div>
                        <button class="btn btn-primary" type="submit">Dodaj</button>
                        <button class="btn btn-secondary" type="reset">Wyczyść dane</button>
                        <sec:csrfInput/>
                    </form>
                    </sec:authorize>
                    </div>
<%--        =================================--%>
            <div style="float: left; width: 40%">
            <div class="row" style="margin-top: 40px; margin-bottom: 10px">
                <div class="col-6"><h2>Moje cele : </h2></div>
            </div>
                    <table>
                        <thead>
                        <th>Lp.</th>
                        <th>Target</th>
                        <th>Year</th>
                        <th>Voyager</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${trips}" var="trip" varStatus="stat">
                            <tr>
                                <td>${stat.count}</td>
                                <td>${trip.target}</td>
                                <td>${trip.year}</td>
                                <td>${trip.user.username}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
        </div>
            </section>
     </section>
    <div style="clear: both;"></div>
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

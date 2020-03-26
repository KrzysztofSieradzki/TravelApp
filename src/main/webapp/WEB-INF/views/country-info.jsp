<%--
  Created by IntelliJ IDEA.
  User: Sony
  Date: 24.03.2020
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="col-lg-12">
                <div class="row content-panel" style="max-height: 45%; margin:10px;">
                    <div class="col-md-4 profile-text mt mb centered right-divider">
                        <%--                ===========Country to choose==========--%>
                        <div class="form-group">
                            <form action="/country" method="get">
                            <label class="control-label col-md-3" for="id_country" style="text-align: center; width: 100%;"><strong>Country</strong></label>
                            <select class="form-control" name="id_country" id="id_country">
                                <option value="domestic" selected>--Choose the country--</option>
                                <c:forEach items="${countries}" var="country">
                                    <option  value="${country}">${country.country}</option>
                                </c:forEach>
                            </select>
                                <br/>
                                <p>
                                    <button type="submit" class="btn btn-theme"><i class="fa fa-info"></i> Info</button>
                                </p>
                            </form>
                        </div>
                            <hr>

                            <div class="profile-text">
                                <h1>${infoAboutCountry.name}</h1>
                                <h4>${infoAboutCountry.continent}</h4>
                            </div>

                        <%--                ===================================--%>
                    </div>
                    <!-- /col-md-4 -->
                    <div class="col-md-4 profile-text">
                        <div class="right-divider hidden-sm hidden-xs">
                            <h4>Eur</h4>
                            <h6>Currency</h6>
                            <h4>Ateizm</h4>
                            <h6>Dominant religion</h6>
                            <h4>Polski</h4>
                            <h6>Official language</h6>
                        </div>
                    </div>
                    <!-- /col-md-4 -->
                    <div class="col-md-4 centered">
                        <div >

                            <p><img src="../../static/img/Flags/${infoAboutCountry.country_code.toLowerCase()}.jpg" class="img-thumbnail"></p>

                            <p>
                                <button class="btn btn-theme"><i class="fa fa-check"></i> To visit</button>
                            </p>
                        </div>
                    </div>
                    <!-- /col-md-4 -->
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

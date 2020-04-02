<%--
  Created by IntelliJ IDEA.
  User: Sony
  Date: 02.04.2020
  Time: 19:55
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
<header><jsp:include page="fragments/header.jsp"/></header>
<aside><jsp:include page="fragments/aside.jsp"/></aside>
<section id="main-content" style="min-height: 635px;">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="row content-panel">
<%--                    ============== NAVIGATION ==============--%>
                    <div class="panel-heading">
                        <ul class="nav nav-tabs nav-justified">
                            <li class="active">
                                <a data-toggle="tab" href="#transport">Transports</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#devices" >Electronic devices</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#documents">Documents</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#cloths">Special cloths</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#summary">Check</a>
                            </li>
                        </ul>
                    </div>
<%--                    ================================ BODY ===============--%>
            <div class="panel-body">
                <div class="tab-content">
<%--                   ===============TRANSPORT===============--%>
                    <div id="transport" class="tab-pane active">
                        transport
                    </div>
<%--                  ==================DEVICES================--%>
                    <div id="devices" class="tab-pane">
                        devices
                    </div>
    <%--               ==================DOCUMENTS================--%>
                    <div id="documents" class="tab-pane">
                        documents
                    </div>
    <%--              ==================CLOTHS================--%>
                        <div id="cloths" class="tab-pane">
                            cloths
                        </div>
<%--                  ==================SUMMARY================---%>
                        <div id="summary" class="tab-pane">
                            summary
                        </div>
                </div>
            </div>

            </div>
        </div>
        </div>
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

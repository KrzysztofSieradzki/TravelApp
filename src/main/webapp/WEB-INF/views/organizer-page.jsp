<%--
  Created by IntelliJ IDEA.
  User: Sony
  Date: 02.04.2020
  Time: 19:55
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
    <script src="../../static/lib/chart-master/Chart.js" type="text/javascript"></script>
</head>
<body>
<header><jsp:include page="fragments/header.jsp"/></header>
<aside><jsp:include page="fragments/aside.jsp"/></aside>
<section id="main-content" style="min-height: 635px;">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <form action="/organizer" method="get">
                        <label class="control-label col-md-3" for="tripIdNumber" style="text-align: center; width: 100%;"><h4>Trip</h4></label>
                        <select class="form-control" name="tripIdNumber" id="tripIdNumber">
                            <option value="domestic" selected>--Choose the trip--</option>
                            <c:forEach items="${trips}" var="trip">
                                <option value="${trip.id}">${trip.id_country.country}</option>
                            </c:forEach>
                        </select>
                        <br/>
                            <button type="submit" class="btn btn-theme"><i class="fa fa-pencil-square-o"></i> Organize</button>
                            <div class="centered"><h1>${myTrip.id_country.country}</h1></div>
                    </form>
                </div>
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
                                <a data-toggle="tab" href="#clothes">Special clothes</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#other">Other</a>
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
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2 detailed">
                                <h4 class="mb">All transports</h4>
                                <div>
                                        <div class="message-header centered">
                                            <h5>Choose transport from which you will have to use</h5>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <form action="/organizer/addTransport" method="post">
                                                    <label class="control-label col-md-3" for="transports" style="text-align: center; width: 100%;"><h4>Vehicle</h4></label>
                                                    <select class="form-control" name="transports" id="transports">
                                                        <option value="domestic" selected>--Choose the transport--</option>
                                                        <c:forEach items="${transports}" var="transport">
                                                            <option  value="${transport}">${transport.name()}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <input type="hidden" id="tripId" name="tripId" value="${myTrip.id}">
                                                    <br/>
                                                    <p>
                                                        <button type="submit" class="btn btn-theme"><i class="fa fa-fighter-jet"></i> Add</button>
                                                    </p>
                                                </form>
                                            </div>
                                            <div class="col-md-6">
                                                <h4>Summary</h4>
                                                <div class="row centered mt mb">
                                                    <ul class="pricing">
                                                        <c:forEach items="${addedTransports}" var="addedTr">
                                                            <li style="width: 100%;">
                                                                <div style="display: inline-block;">
                                                                    <h3>${addedTr.transports}</h3>
                                                                        <c:choose>
                                                                            <c:when test="${addedTr.cost==null}">
                                                                                <h5>no amount declared</h5>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                ${addedTr.cost}
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                </div>
                                                                <div style="float: right"> <form action="/organizer/cost" method="post">
                                                                    <label for ="cost"> Cost </label>
                                                                    <input type="number" name="cost" id="cost" class="form-control" placeholder="Cost of transpot"/>
                                                                    <input type="hidden" value="${addedTr.id}" name="idTransport"/>
                                                                    <input type="hidden"  name="tripId" value="${myTrip.id}">
                                                                    <button style="margin-top: 3px;" class="btn btn-round btn-success btn-xs" type="submit">Set up</button>
                                                                </form></div>
                                                                <div style="clear: both"></div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>

                                        </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
<%--                  ==================DEVICES================--%>
                    <div id="devices" class="tab-pane">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2 detailed">
                                <h4 class="mb">Electronic devices</h4>

                            </div>
                        </div>
                    </div>
    <%--               ==================DOCUMENTS================--%>
                    <div id="documents" class="tab-pane">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2 detailed">
                                <h4 class="mb">Documents</h4>

                            </div>
                        </div>
                    </div>
    <%--              ==================CLOTHES================--%>
                        <div id="clothes" class="tab-pane">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2 detailed">
                                    <h4 class="mb">Special clothes</h4>

                                </div>
                            </div>
                        </div>
    <%--              ==================OTHER================--%>
                        <div id="other" class="tab-pane">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2 detailed">
                                    <h4 class="mb">Other</h4>

                                </div>
                            </div>
                        </div>
<%--                  ==================SUMMARY================---%>
                        <div id="summary" class="tab-pane">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2 detailed">
                                    <h4 class="mb">Summary</h4>

                                </div>
                            </div>
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
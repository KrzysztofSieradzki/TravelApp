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
            <div class="row">
                 <div class="col-lg-12">
                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                         <div class="custom-box">
                             <div class="servicetitle">
                                 <h4>ADD TRIP</h4>
                                 <hr>
                             </div>
                             <div class="icn-main-container">
                                 <span class="icn-container">+</span>
                             </div>

                              <form method="post" action="trip/add-trip">

        <%--                       ====================STATUS=========================--%>
    <div class="form-group">
        <label for="status">Status:</label>
        <select name="status" id="status">
            <option value="-" selected>--What is the status?--</option>
            <c:forEach items="${status}" var="stat">
                <option value="${stat}">${stat.status}</option>
            </c:forEach>
        </select>
    </div>
        <%--                       ====================YEAR=========================--%>
                        <div class="form-group">
                            <label for="year">Year</label>
                            <input type= "number" name="year" id="year"
                                      class="form-control"
                                      placeholder="Choose a year :"/>
                        </div>

            <%--                       ====================COUNTRY TO CHOOSE=========================--%>
            <div class="form-group">
                <label for="id_country">Country:</label>
                <select name="id_country" id="id_country">
                    <option value="-" selected>--Choose the country--</option>
                    <c:forEach items="${countries}" var="country">
                        <option value="${country}">${country.country}</option>
                    </c:forEach>
                </select>
            </div>
                        <button class="btn btn-theme" type="submit">Add</button>
                        <button class="btn btn-theme02" type="reset">Reset</button>
                        <sec:csrfInput/>
                    </form>
                         </div>
                    </div>
            <%--        =================================--%>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                 <div class="custom-box">
                     <div class="servicetitle">
                         <h4>VISITED</h4>
                         <hr>
                     </div>
                     <div class="icn-main-container">
                         <span class="icn-container">${visited.size()}</span>
                     </div>
                     <ul class="pricing">
                        <c:forEach items="${visited}" var="visit" varStatus="stat">
                            <li>
                                   <div style="display: inline-block">${visit.id_country.country} #${visit.year}</div>
                                      <div style="float: right"><form style="display: inline-block; padding-top: 6px;" method="get" action="/trip/delete">
                                        <button class="btn btn-round btn-danger btn-xs" type="submit"><i class="fa fa-times"></i> </button>
                                    <input type="hidden" name="tripId" value="${visit.id}"/>
                                </form> </div>
                                <div style="clear: both"></div>
                            </li>
                        </c:forEach>
                     </ul>
                 </div>
             </div>
            <%--        =================================--%>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="custom-box">
                    <div class="servicetitle">
                        <h4>TO VISIT</h4>
                        <hr>
                    </div>
                    <div class="icn-main-container">
                        <span class="icn-container">${toVisit.size()}</span>
                    </div>
                    <ul class="pricing">
                        <c:forEach items="${toVisit}" var="toVisit" varStatus="stat">
                            <li>
                                <div style="display: inline-block">${toVisit.id_country.country} #${toVisit.year}</div>
                                <div style="float: right"><form style="display: inline-block; padding-top: 6px;" method="get" action="/trip/delete">
                                    <button class="btn btn-round btn-danger btn-xs" type="submit"><i class="fa fa-times"></i> </button>
                                    <input type="hidden" name="tripId" value="${toVisit.id}"/>
                                </form> </div>
                                <div style="float: right"><form style="display: inline-block; padding-top: 6px;" method="get" action="/trip/uncheck">
                                    <button class="btn btn-round btn-success btn-xs" type="submit"><i class="fa fa-check"></i> </button>
                                    <input type="hidden" name="tripId" value="${toVisit.id}"/>
                                </form> </div>
                                <div style="clear: both"></div>

                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            </div>
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

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
                            <option value="-1" selected>--Choose the trip--</option>
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
                                <div>
                                    <div class="message-header centered">
                                        <h5>Choose devices which you would like to have during your trip</h5>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <form action="/organizer/addEquipment" method="post">
                                                <label class="control-label col-md-3" for="device" style="text-align: center; width: 100%;"><h4>Gadgets</h4></label>
                                                <select class="form-control" name="name" id="device">
                                                    <option value="domestic" selected>--Choose the device--</option>
                                                    <c:forEach items="${devices}" var="device">
                                                        <option  value="${device.devices}">${device.devices}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden"  name="tripId" value="${myTrip.id}">
                                                <input type="hidden"  name="category" value="${category_device}">
                                                <br/>
                                                <p>
                                                    <button type="submit" class="btn btn-theme"><i class="fa fa-laptop"></i> Add</button>
                                                </p>
                                            </form>
                                        </div>

                                        <div class="col-md-9">
                                            <h4>Summary</h4>
                                            <div class="row centered mt mb">
                                                <ul class="pricing">
                                                    <c:forEach items="${addedDevices}" var="addedDev">
                                                        <li style="width: 100%;">
                                                            <div style="display: inline-block;">
                                                                <h3>${addedDev.name}</h3>
                                                                <c:choose>
                                                                <c:when test="${addedDev.quantity==null}">
                                                                    <h5>no quantity declared</h5>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <h5>Number of device: ${addedDev.quantity}</h5>
                                                                </c:otherwise>
                                                            </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${addedDev.description==null}">
                                                                        <h5>no description declared</h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                <h5>Description: ${addedDev.description}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${addedDev.active==null}">
                                                                        <h5>no state declared</h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                <h5>Does it works ? -> ${addedDev.active}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div style="float: right"> <form action="/organizer/addDetails" method="post">
                                                                <label for ="quantity"> Quantity </label>
                                                                <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Quantity of equipment"/>
                                                                <label for ="description"> Description </label>
                                                                <input type="text" name="description" id="description" class="form-control" placeholder="Description of equipment"/>
                                                                <label for ="active"> Does it works? </label>
                                                                <input type="checkbox" name="active" id="active" checked class="form-control"/>

                                                                    <%--                                                               ====================--%>
                                                                <input type="hidden" value="${addedDev.id}" name="idEquipment"/>
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
    <%--               ==================DOCUMENTS================--%>
                    <div id="documents" class="tab-pane">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2 detailed">
                                <h4 class="mb">Documents</h4>
                                <div class="row">
                                    <div class="col-md-3">
                                        <form action="/organizer/addEquipment" method="post">
                                            <label class="control-label col-md-3" for="document" style="text-align: center; width: 100%;"><h4>What do you need?</h4></label>
                                            <select class="form-control" name="name" id="document">
                                                <option value="domestic" selected>--Choose the document--</option>
                                                <c:forEach items="${documents}" var="doc">
                                                    <option  value="${doc.documents}">${doc.documents}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="hidden"  name="tripId" value="${myTrip.id}">
                                            <input type="hidden"  name="category" value="${category_document}">
                                            <br/>
                                            <p>
                                                <button type="submit" class="btn btn-theme"><i class="fa fa-id-badge"></i> Add</button>
                                            </p>
                                        </form>
                                    </div>

                                    <div class="col-md-9">
                                        <h4>Summary</h4>
                                        <div class="row centered mt mb">
                                            <ul class="pricing">
                                                <c:forEach items="${addedDocuments}" var="addedDoc">
                                                    <li style="width: 100%;">
                                                        <div style="display: inline-block;">
                                                            <h3>${addedDoc.name}</h3>
                                                            <c:choose>
                                                                <c:when test="${addedDoc.quantity==null}">
                                                                    <h5>no quantity declared</h5>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <h5>Number of documents: ${addedDoc.quantity}</h5>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${addedDoc.description==null}">
                                                                    <h5>no description declared</h5>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <h5>Description: ${addedDoc.description}</h5>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${addedDoc.active==null}">
                                                                    <h5>no state declared</h5>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <h5>Is it valid ? -> ${addedDoc.active}</h5>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div style="float: right"> <form action="/organizer/addDetails" method="post">
                                                            <label for ="quantity"> Quantity </label>
                                                            <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Quantity of equipment"/>
                                                            <label for ="description"> Description </label>
                                                            <input type="text" name="description" id="description" class="form-control" placeholder="Description of equipment"/>
                                                            <label for ="active"> Is it valid? </label>
                                                            <input type="checkbox" name="active" id="active" checked class="form-control"/>

                                                                <%--                                                               ====================--%>
                                                            <input type="hidden" value="${addedDoc.id}" name="idEquipment"/>
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
    <%--              ==================CLOTHES================--%>
                        <div id="clothes" class="tab-pane">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2 detailed">
                                    <h4 class="mb">Special clothes</h4>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <form action="/organizer/addEquipment" method="post">
                                                <label class="control-label col-md-3" for="cloth" style="text-align: center; width: 100%;"><h4>What do you need?</h4></label>
                                                <select class="form-control" name="name" id="cloth">
                                                    <option value="domestic" selected>--Choose the special cloth--</option>
                                                    <c:forEach items="${clothes}" var="cloth">
                                                        <option  value="${cloth.clothes}">${cloth.clothes}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden"  name="tripId" value="${myTrip.id}">
                                                <input type="hidden"  name="category" value="${category_cloth}">
                                                <br/>
                                                <p>
                                                    <button type="submit" class="btn btn-theme"><i class="fa fa-suitcase"></i> Add</button>
                                                </p>
                                            </form>
                                        </div>

                                        <div class="col-md-9">
                                            <h4>Summary</h4>
                                            <div class="row centered mt mb">
                                                <ul class="pricing">
                                                    <c:forEach items="${addedClothes}" var="addedClo">
                                                        <li style="width: 100%;">
                                                            <div style="display: inline-block;">
                                                                <h3>${addedClo.name}</h3>
                                                                <c:choose>
                                                                    <c:when test="${addedClo.quantity==null}">
                                                                        <h5>no quantity declared</h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <h5>Number of clothes: ${addedClo.quantity}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${addedClo.description==null}">
                                                                        <h5>no description declared</h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <h5>Description: ${addedClo.description}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${addedClo.active==null}">
                                                                        <h5>no state declared</h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <h5>Is it clean ? -> ${addedClo.active}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div style="float: right"> <form action="/organizer/addDetails" method="post">
                                                                <label for ="quantity"> Quantity </label>
                                                                <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Quantity of equipment"/>
                                                                <label for ="description"> Description </label>
                                                                <input type="text" name="description" id="description" class="form-control" placeholder="Description of equipment"/>
                                                                <label for ="active"> Does it works? </label>
                                                                <input type="checkbox" name="active" id="active" checked class="form-control"/>

                                                                    <%--                                                               ====================--%>
                                                                <input type="hidden" value="${addedClo.id}" name="idEquipment"/>
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
    <%--              ==================OTHER================--%>
                        <div id="other" class="tab-pane">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2 detailed">
                                    <h4 class="mb">Other</h4>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <form action="/organizer/addEquipment" method="post">
                                                <label class="control-label col-md-3" for="others" style="text-align: center; width: 100%;"><h4>What do you need?</h4></label>
                                                <select class="form-control" name="name" id="others">
                                                    <option value="domestic" selected>--Choose other stuffs--</option>
                                                    <c:forEach items="${other}" var="other">
                                                        <option  value="${other.other}">${other.other}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden"  name="tripId" value="${myTrip.id}">
                                                <input type="hidden"  name="category" value="${category_other}">
                                                <br/>
                                                <p>
                                                    <button type="submit" class="btn btn-theme"><i class="fa fa-umbrella"></i> Add</button>
                                                </p>
                                            </form>
                                        </div>

                                        <div class="col-md-9">
                                            <h4>Summary</h4>
                                            <div class="row centered mt mb">
                                                <ul class="pricing">
                                                    <c:forEach items="${addedOther}" var="addedOth">
                                                        <li style="width: 100%;">
                                                            <div style="display: inline-block;">
                                                                <h3>${addedOth.name}</h3>
                                                                <c:choose>
                                                                    <c:when test="${addedOth.quantity==null}">
                                                                        <h5>no quantity declared</h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <h5>Number of stuff: ${addedOth.quantity}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${addedOth.description==null}">
                                                                        <h5>no description declared</h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <h5>Description: ${addedOth.description}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${addedOth.active==null}">
                                                                        <h5>no state declared</h5>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <h5>Does it works ? -> ${addedOth.active}</h5>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div style="float: right"> <form action="/organizer/addDetails" method="post">
                                                                <label for ="quantity"> Quantity </label>
                                                                <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Quantity of equipment"/>
                                                                <label for ="description"> Description </label>
                                                                <input type="text" name="description" id="description" class="form-control" placeholder="Description of equipment"/>
                                                                <label for ="active"> Does it works? </label>
                                                                <input type="checkbox" name="active" id="active" checked class="form-control"/>

                                                                    <%--                                                               ====================--%>
                                                                <input type="hidden" value="${addedOth.id}" name="idEquipment"/>
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
<%--                  ==================SUMMARY================---%>
                        <div id="summary" class="tab-pane">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2 detailed">
                                    <h4 class="mb">Summary</h4>
                                    <div class="row mt">
                                    <div class="col-md-12">
                                        <div class="content-panel">
                                            <table class="table table-striped table-advance table-hover">
                                                <h4><i class="fa fa-fighter-jet"></i> Transports</h4>
                                                <hr>
                                                <thead>
                                                <tr>
                                                    <th><i class="fa fa-tag"></i> Transport type</th>
                                                    <th><i class="fa fa-money"></i> Cost</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${addedTransports}" var="tran">
                                                    <tr>
                                                        <td>${tran.transports.transport}</td>
                                                        <td>${tran.cost}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
<%--                                 ===================   --%>
                                    <div class="row mt">
                                        <div class="col-md-12">
                                            <div class="content-panel">
                                                <table class="table table-striped table-advance table-hover">
                                                    <h4><i class="fa fa-laptop"></i> Devices</h4>
                                                    <hr>
                                                    <thead>
                                                    <tr>
                                                        <th><i class="fa fa-tag"></i> Device type</th>
                                                        <th><i class="fa fa-file"></i> Description</th>
                                                        <th><i class="fa fa-sort-numeric-asc"></i> Quantity</th>
                                                        <th><i class="fa fa-info-circle"></i> Status</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${addedDevices}" var="dev">
                                                        <tr>
                                                            <td>${dev.name}</td>
                                                            <td>${dev.description}</td>
                                                            <td>${dev.quantity}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${dev.active==true}">
                                                                        Ready to pack
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Not ready
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- /content-panel -->
                                        </div>
                                        <!-- /col-md-12 -->
                                    </div>
<%--                                    =============--%>
                                    <div class="row mt">
                                        <div class="col-md-12">
                                            <div class="content-panel">
                                                <table class="table table-striped table-advance table-hover">
                                                    <h4><i class="fa fa-paperclip"></i> Documents</h4>
                                                    <hr>
                                                    <thead>
                                                    <tr>
                                                        <th><i class="fa fa-tag"></i> Document type</th>
                                                        <th><i class="fa fa-file"></i> Description</th>
                                                        <th><i class="fa fa-sort-numeric-asc"></i> Quantity</th>
                                                        <th><i class="fa fa-info-circle"></i> Status</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${addedDocuments}" var="doc">
                                                        <tr>
                                                            <td>${doc.name}</td>
                                                            <td>${doc.description}</td>
                                                            <td>${doc.quantity}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${doc.active==true}">
                                                                        Ready to pack
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Not ready
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- /content-panel -->
                                        </div>
                                        <!-- /col-md-12 -->
                                    </div>
<%--                                    ===================--%>
                                    <div class="row mt">
                                        <div class="col-md-12">
                                            <div class="content-panel">
                                                <table class="table table-striped table-advance table-hover">
                                                    <h4><i class="fa fa-suitcase"></i> Special clothes</h4>
                                                    <hr>
                                                    <thead>
                                                    <tr>
                                                        <th><i class="fa fa-tag"></i> Cloth type</th>
                                                        <th><i class="fa fa-file"></i> Description</th>
                                                        <th><i class="fa fa-sort-numeric-asc"></i> Quantity</th>
                                                        <th><i class="fa fa-info-circle"></i> Status</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${addedClothes}" var="clo">
                                                        <tr>
                                                            <td>${clo.name}</td>
                                                            <td>${clo.description}</td>
                                                            <td>${clo.quantity}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${clo.active==true}">
                                                                        Ready to pack
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Not ready
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- /content-panel -->
                                        </div>
                                        <!-- /col-md-12 -->
                                    </div>
<%--                                    =============================--%>
                                    <div class="row mt">
                                        <div class="col-md-12">
                                            <div class="content-panel">
                                                <table class="table table-striped table-advance table-hover">
                                                    <h4><i class="fa fa-umbrella"></i> Other</h4>
                                                    <hr>
                                                    <thead>
                                                    <tr>
                                                        <th><i class="fa fa-tag"></i> Other type</th>
                                                        <th><i class="fa fa-file"></i> Description</th>
                                                        <th><i class="fa fa-sort-numeric-asc"></i> Quantity</th>
                                                        <th><i class="fa fa-info-circle"></i> Status</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${addedOther}" var="oth">
                                                        <tr>
                                                            <td>${oth.name}</td>
                                                            <td>${oth.description}</td>
                                                            <td>${oth.quantity}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${oth.active==true}">
                                                                        Ready to pack
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Not ready
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- /content-panel -->
                                        </div>
                                        <!-- /col-md-12 -->
                                    </div>
<%--                                    ================================--%>
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

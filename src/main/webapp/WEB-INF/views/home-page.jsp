<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="../../static/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="../../static/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="../../static/css/style.css" rel="stylesheet">
    <link href="../../static/css/style-responsive.css" rel="stylesheet">
    <script src="https://www.amcharts.com/lib/4/core.js"></script>
    <script src="https://www.amcharts.com/lib/4/maps.js"></script>
    <script src="https://www.amcharts.com/lib/4/geodata/worldLow.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/moonrisekingdom.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
    <script>
        am4core.ready(function() {

// Themes begin
            am4core.useTheme(am4themes_moonrisekingdom);
            am4core.useTheme(am4themes_animated);
// Themes end

// Create map instance
            var chart = am4core.create("chartdiv", am4maps.MapChart);

// Set map definition
            chart.geodata = am4geodata_worldLow;

// Set projection
            chart.projection = new am4maps.projections.NaturalEarth1();

// Create map polygon series
            var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());
            polygonSeries.mapPolygons.template.strokeWidth = 0.5;

// Exclude Antartica
            polygonSeries.exclude = ["AQ"];

// Make map load polygon (like country names) data from GeoJSON
            polygonSeries.useGeodata = true;

            // Already clicked countries
            polygonSeries.data = [{
                "id": "US",
                "name": "United States",
                // "value": 100,
                "fill": am4core.color("#F05C5C")
            }, {
                "id": "FR",
                "name": "France",
                // "value": 50,
                "fill": am4core.color("#5C5CFF")
            }];

// Configure series
            var polygonTemplate = polygonSeries.mapPolygons.template;
            polygonTemplate.tooltipText = "{name}";
            polygonTemplate.fill = chart.colors.getIndex(0);
            polygonTemplate.propertyFields.fill = "fill";

// Create hover state and set alternative fill color
            var hs = polygonTemplate.states.create("hover");
            hs.properties.fill = chart.colors.getIndex(2);

// Create active state
            var activeState = polygonTemplate.states.create("active");
            activeState.properties.fill = chart.colors.getIndex(4);


// Create an event to toggle "active" state
            polygonTemplate.events.on("hit", function(ev) {
                ev.target.isActive = !ev.target.isActive;
            })




            var graticuleSeries = chart.series.push(new am4maps.GraticuleSeries());

        }); // end am4core.ready()
    </script>
</head>
<body>
<section id="container">
<header><jsp:include page="fragments/header.jsp"/></header>
<aside><jsp:include page="fragments/aside.jsp"/></aside>
<section class="main-content" style="width: 100%; min-width: 100%; margin-right: 0px;
margin-left: 0px; max-width: 100%;">
<%--    ==========================================================================--%>
    <div id="chartdiv" style="float: right; width: 80%; height: 100%; padding: 8px; padding-right: 15px;"></div>
<%--    ==========================================================================--%>

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

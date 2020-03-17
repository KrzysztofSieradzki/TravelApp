<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <style>
        #chartdiv {
            width: 60%;
            height: 500px;
            padding: 10px;
        }

    </style>
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
                "value": 100,
                "fill": am4core.color("#F05C5C")
            }, {
                "id": "FR",
                "name": "France",
                "value": 50,
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
<jsp:include page="fragments/main-menu.jsp"/>
<div class="container" style="width: 100%">
    <div style="float: left; width: 20%">
    <sec:authorize access="isAuthenticated()">
    <div class="row" style="margin-top: 40px; margin-bottom: 10px">
        <div class="col-1"></div>
        <div class="col-6"><h2>Dodaj miejce</h2></div>
        <div class="col-5"></div>
    </div>

    <div class="row">

        <div class="col-8">

            <form method="post" action="/add-trip">
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



        </div>
        <div class="col-2"></div>
    </div>
    </sec:authorize>
    </div>
<%--    ==========================================================================--%>
    <div id="chartdiv" style="float: left"></div>
    <div id="idCountry"></div>
<%--    ==========================================================================--%>
    <div style="float: left; width: 20%">
    <div class="row" style="margin-top: 40px; margin-bottom: 10px">
        <div class="col-1"></div>
        <div class="col-6"><h2>Moje cele : </h2></div>
        <div class="col-5"></div>
    </div>

    <div class="row">
        <div class="col-12" style="padding-bottom: 20px">

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
    </div>
    </div>
    <div style="clear: both"></div>
</div>
</body>
</html>

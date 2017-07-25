<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>Customer Information Center</title>
    <script src="plotly/js/plotly-latest.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function plotChart(elementId, data, layout) {
            Plotly.newPlot(document.getElementById(elementId), data, layout, {displayModeBar: false});
        }
    </script>
</head>

<body>

<div style="background:#ffffee; text-align:center; padding-bottom:2px">
<h1>Customer Information Center</h1>

Draw customer information graph.
<p/>

<form action="customers" method="get">

    Results size:
    <select name="size">
      <option value="5">5</option>
      <option value="10">10</option>
    </select>
    <p/>
    <button style="padding:5px">Draw Chart</button>
</form>
</div>

<c:if test="${not empty customersList}">

<div style="height:4px; width:100%; background: #eeeeee"></div>

<h2 style="text-align:center">Age and Sales Count Chart</h2>

<div id="customersChart" ></div>

<script>

    var customerAges = {
          name: 'Age',
          type: 'lines+markers',
          line: { width: 6},
          marker: { size: 8}
        };
    var customerSalesCount = {
          name: 'Sales Count',
          type: 'lines+markers',
          line: { width: 3},
          marker: { size: 4}
        };
    var age_X = new Array();
    var age_Y = new Array();
    var sales_count_X = new Array();
    var sales_count_Y = new Array();

    <c:forEach items="${customersList}" var="customer" varStatus="i">
        age_X[${i.index}] = "${customer.id}";
        age_Y[${i.index}] = "${customer.age}";

        sales_count_X[${i.index}] = "${customer.id}";
        sales_count_Y[${i.index}] = "${customer.salesCount}";
    </c:forEach>

    customerAges.x = age_X;
    customerAges.y = age_Y;

    customerSalesCount.x = sales_count_X;
    customerSalesCount.y = sales_count_Y;

    var data = [customerAges, customerSalesCount];
    var layout = {
        xaxis: {
            title: 'ID',
            showgrid: true,
            zeroline: true,
        },
        yaxis: {
            showgrid: true,
            showline: true,
            zeroline: true,
        }
    };

plotChart("customersChart", data, layout);
</script>
</c:if>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/food.css">

<body>
<header>

<!-- top -->
<div id="hotel_top">
  <%@include file="hotel_top.jsp" %>
</div>

</header>

<div id="hotel_body">
  <%@include file="hotel_body.jsp" %>
</div>
<!-- script -->
<script src="js/hotel_filter.js"></script>
<script src="js/food_map.js"></script>

<script>
filter.init(${param.local});
</script>

</body>
</html>
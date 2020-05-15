<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- css -->
<link rel="stylesheet" type="text/css" href="css/food.css">

<body>
<header>

<!-- top -->
<div id="food_top">
  <%@include file="food_top.jsp" %>
</div>

</header>

<div id="food_body">
  <%@include file="food_body.jsp" %>
</div>
<!-- script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e79b8a10a4c854ccaa036e8d57eaa913"></script>
<script src="js/food_filter.js"></script>
<script src="js/food_map.js"></script>
<script src="js/food.js"></script>

<script>food_filter.func()</script>
</body>
</html>
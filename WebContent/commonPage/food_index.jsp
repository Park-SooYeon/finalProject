<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- css -->
<link rel="stylesheet" type="text/css" href="css/search.css">

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
<script src="js/filter.js"></script>
<script src="js/food_map.js"></script>

<script>
filter.init(${param.menu}, ${param.local});
</script>
</body>
</html>
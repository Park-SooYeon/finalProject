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
<script src="js/filter.js"></script>
<script src="js/food_map.js"></script>

<script>
filter.local.push(${param.local}+"");


switch(${param.menu}) {
case 12:
	$('#check_happy').click();
	break;
case 14:
	$('#check_culture').click();
	break;
case 39:
	$('#check_food').click();
	break;
case 15:
	$('#check_festival').click();
	break;
}

</script>
</body>
</html>
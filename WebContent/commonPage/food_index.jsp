<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" type="text/css" href="../template/css/linearicons.css">
<link rel="stylesheet" type="text/css" href="../template/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../template/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../template/css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="../template/css/jquery-ui.css">				
<link rel="stylesheet" type="text/css" href="../template/css/nice-select.css">							
<link rel="stylesheet" type="text/css" href="../template/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="../template/css/owl.carousel.css">				
<link rel="stylesheet" type="text/css" href="../template/css/main.css">
<link rel="stylesheet" type="text/css" href="../css/food.css">

<title>Insert title here</title>

</head>
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

<footer>
<!-- footer -->

</footer>

<!-- script -->
<script src="../template/js/vendor/jquery-2.2.4.min.js"></script>
<script src="../template/js/popper.min.js"></script>
<script src="../template/js/vendor/bootstrap.min.js"></script>
<script src="../template/js/jquery-ui.js"></script>					
<script src="../template/js/easing.min.js"></script>
<script src="../template/js/hoverIntent.js"></script>
<script src="../template/js/superfish.min.js"></script>	
<script src="../template/js/jquery.ajaxchimp.min.js"></script>
<script src="../template/js/jquery.magnific-popup.min.js"></script>						
<script src="../template/js/jquery.nice-select.min.js"></script>					
<script src="../template/js/owl.carousel.min.js"></script>							
<script src="../template/js/mail-script.js"></script>	
<script src="../template/js/main.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e79b8a10a4c854ccaa036e8d57eaa913"></script>
<script src="../js/food_filter.js"></script>
<script src="../js/food_map.js"></script>

<script>food_filter.func()</script>
</body>
</html>
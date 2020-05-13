<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="colorlib">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Travel</title>

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="swiper-5.3.8/package/css/swiper.min.css">
	<!-- CSS ============================================= -->
	<link rel="stylesheet" href="template/css/linearicons.css">
	<link rel="stylesheet" href="template/css/font-awesome.min.css">
	<link rel="stylesheet" href="template/css/bootstrap.css">
	<link rel="stylesheet" href="template/css/magnific-popup.css">
	<link rel="stylesheet" href="template/css/jquery-ui.css">				
	<link rel="stylesheet" href="template/css/nice-select.css">							
	<link rel="stylesheet" href="template/css/animate.min.css">
	<link rel="stylesheet" href="template/css/owl.carousel.css">				
	<link rel="stylesheet" href="template/css/main.css">
	
	<!--datepicker css-->
	<link rel="stylesheet" href="plugin/air-datepicker/css/datepicker.min.css">
	
</head>
<body>

<%
	String inc = "main.jsp";
	if(request.getParameter("inc")!=null){
		inc = request.getParameter("inc");
	}	
%>
	<!-- top.jsp -->
	<%@ include file="top.jsp" %>
	
	<!-- content -->
  	<jsp:include page='<%=inc %>'/>
	
	<!-- bottom.jsp -->
	<%@ include file="bottom.jsp" %>
	
	<script src="template/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="template/js/popper.min.js"></script>
	<script src="template/js/vendor/bootstrap.min.js"></script>			
	<script src="template/js/jquery-ui.js"></script>					
	<script src="template/js/easing.min.js"></script>			
	<script src="template/js/hoverIntent.js"></script>
	<script src="template/js/superfish.min.js"></script>	
	<script src="template/js/jquery.ajaxchimp.min.js"></script>
	<script src="template/js/jquery.magnific-popup.min.js"></script>						
	<script src="template/js/jquery.nice-select.min.js"></script>					
	<script src="template/js/owl.carousel.min.js"></script>							
	<script src="template/js/mail-script.js"></script>	
	<script src="template/js/main.js"></script>	
	<script src="swiper-5.3.8/package/js/swiper.min.js"></script>
	
	<!-- datepicker -->
	<script src="plugin/air-datepicker/js/datepicker.js"></script>
	<script src="plugin/air-datepicker/js/i18n/datepicker.en.js"></script>
	<script src="plugin/air-datepicker/js/i18n/datepicker.kr.js"></script>
	
	<!-- mypage js -->
	<script src="js/my_social.js"></script>
	<script src="js/trip_list.js"></script>
	<script src="js/my_page.js"></script>
</body>
</html>
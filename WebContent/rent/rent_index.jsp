<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
 <head>
 	
 	
 	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>마이리얼트립 > 렌터카</title>

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="../template/css/bootstrap/KDGbootstrap.css">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="../lib/jquery-3.4.1.js"></script>
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../plugin/sweetAlert/css/sweetalert2.css" />
    
    
    <script src="../template/js/vendor/KDGbootstrap.min.js"></script>
    
    
    
    <!-- 별점용 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> 
    <link rel="stylesheet" href="../plugin/jquery-bar-rating-master/dist/themes/fontawesome-stars.css"> 
    <script type="text/javascript" src="../plugin/jquery-bar-rating-master/dist/jquery.barrating.min.js"></script>

	<!-- Airdatepicker -->
	<link href="../plugin/air-datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css">
	<script src="../plugin/air-datepicker/js/datepicker.min.js"></script>
	 <script src="../plugin/air-datepicker/js/i18n/datepicker.en.js"></script>
	
	<!-- checkbox -->
	<link href="../plugin/checkbox/skins/square/blue.css" rel="stylesheet">
	<script src="../plugin/checkbox/icheck.js"></script>
	
	<!-- kakao 지도-->
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52d0cd9eb539c564cdc52bb34a626875"
    ></script>	
    <!-- 내전용  -->
    <link rel="stylesheet" href="../css/rent.css"/>
    <script src="../js/rent.js"></script>
 </head>
  
  
 <body>
 

  	<div id='top'>
		<%@include file="rent_top.jsp" %>
	</div>
	<div id='mid'>
		<c:set var="contentPage" value="${mainPage }"/>
		<c:if test="${mainPage==null }">
			<jsp:include page="rentMain.jsp"></jsp:include>
		</c:if>
		<jsp:include page="${mainPage }"></jsp:include>
	</div>

  
   
    
    
	
	
	
   
 
 	<script>
 	rent.func();
 	/*
 	swal.fire({
 		  title: "Good job!",
 		  text: "You clicked the button!",
 		  icon: "success",
 		  button: "Aww yiss!",
 		});
 	*/
 	
 	</script>
 </body>
 
 
</html>
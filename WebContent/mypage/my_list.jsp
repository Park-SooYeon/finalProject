<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- change -->
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="./template/img/fav.png">
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
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="./css/custom.css">
			<!--datepicker css-->
			<link rel="stylesheet" href="./plugin/air-datepicker/css/datepicker.min.css">
<title>Insert title here</title>
</head>
<body>

		<body>	
			  
			  
			  <section class="about-banner relative">
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								My Trip				
							</h1>	
							<p class="text-white link-nav text-center"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="hotels.html"> My Trips</a></p>
						</div>	
					</div>
				</div>
			</section>
			<div class="container">
		            <div class="row d-flex justify-content-center">
		                <div class="button-container p-40 col-lg-8 text-center">
		                    <button class="btn dropdown-toggle" data-toggle="dropdown">여행 리스트</button>
		                    
		                    <div class="dropdown-menu">
		                    	<button class="dropdown-item">모든 여행</button>
        						<button class="dropdown-item">여행 (비공개)</button>
        						<button class="dropdown-item">여행 (공개)</button>
      						</div>
		                    
		                    <button class="btn"><i class="fa fa-heart"></i> 관심 리스트</button>
		                    <button class="btn add-new-trip" data-toggle="modal" data-target="#newTripModal" style="display:none;" id="addTripBtn">여행 추가</button>
		                </div>
		            </div>
			  
			<jsp:include page="like_list.jsp"></jsp:include>
			<jsp:include page="trip_list.jsp"></jsp:include>
			</div>

			<jsp:include page="../bottom.jsp"></jsp:include>			

			<script src="../template/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="../template/js/popper.min.js"></script>
			<script src="../template/js/vendor/bootstrap.min.js"></script>			
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>		
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
			<script src="./js/trip_list.js"></script>
			
			<!-- fontawesome -->
			
			 <!-- datepicker -->
	<script src="./plugin/air-datepicker/js/datepicker.js"></script>
	<script src="./plugin/air-datepicker/js/i18n/datepicker.en.js"></script>
	<script src="./plugin/air-datepicker/js/i18n/datepicker.kr.js"></script>

</body>
</html>
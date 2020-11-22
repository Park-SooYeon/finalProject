<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="../template/css/linearicons.css">
<link rel="stylesheet" href="../template/css/font-awesome.min.css">
<link rel="stylesheet" href="../template/css/bootstrap.css">
<link rel="stylesheet" href="../template/css/magnific-popup.css">
<link rel="stylesheet" href="../template/css/jquery-ui.css">
<link rel="stylesheet" href="../template/css/nice-select.css">
<link rel="stylesheet" href="../template/css/animate.min.css">
<link rel="stylesheet" href="../template/css/owl.carousel.css">
<link rel="stylesheet" href="../template/css/main.css">
<link rel="stylesheet" href="../css/css_syj.css">


<script src='../lib/jquery-3.4.1.js'></script>

<style>
li {
padding-bottom:5px;


}

</style>
</head>
<body>
<!-- start banner Area -->
<section class="banner-area relative">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-12">
				<div class="title text-center">
					<h1 class="text-white mb-10"> 호텔 예약하기</h1>
				
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->


<div class="container">
						<div class="row">
							<div class="col-lg-6 col-md-4 offset-1">

				<div class="jumbotron" style="padding-top: 20px; background: white">
					
					<form method="post" name="frm_ms" id="frm_ms">
					<h4>고객님의 정보를 입력해주세요!</h4>
					<hr>
					<br>
				
						<div class="mt-6">
							<label>이름</label> <input type="text" class="form-control"
								name="mName" id="mName" placeholder="이름을 입력해주세요" maxlength="20"
								required><br>
						</div>




						<div class="mt-6" id="email_syj">
							<label for="InputEmail">이메일 주소</label> <input type="text"
								class="form-control" name="email" id="email"
								placeholder="이메일을 입력해주세요" required>

						</div>


						<div class="mt-6" id="email_syj">
							<label for="reInputEmail">이메일 주소 확인</label> <input type="text"
								class="form-control" name="reEmail" id="reEmail"
								placeholder="이메일을 입력해주세요" required>

						</div>
						
						<br>
						
					
</form>
		</div>
				</div>
				
				
				
						<div class="col-lg-4 col-md-4 mt-sm-30 element-wrap" style="font-size:20px;padding-bottom:2px;" >
								<div class="single-element-widget" >
	<div class="jumbotron" style="padding-top: 20px; background: white">
								<h4 class="switch-wrap d-flex justify-content-between">
									<span>Hilton Star Hotel</span>
									<div class="star">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span> 
										<span class="fa fa-star checked"></span> 
										<span class="fa fa-star checked"></span> 
										<span class="fa fa-star"></span>
									</div>
								</h4>
								<p>주소 : 땡땡 땡떙</p>
								<ul class="package-list" >
									<li class="d-flex justify-content-between align-items-center">
										<span>Swimming pool</span> <span>Yes</span>
									</li>
									<li class="d-flex justify-content-between align-items-center">
										<span>Gymnesium</span> <span>No</span>
									</li>
									<li class="d-flex justify-content-between align-items-center">
										<span>Wi-fi</span> <span>Yes</span>
									</li>
									<li class="d-flex justify-content-between align-items-center">
										<span>Room Service</span> <span>No</span>
									</li>
									<li class="d-flex justify-content-between align-items-center">
										<span>Air Condition</span> <span>Yes</span>
									</li>
									<li class="d-flex justify-content-between align-items-center">
										<span>Restaurant</span> <span>Yes</span>
									</li>
									<li class="d-flex justify-content-between align-items-center">
										<span>Price per night</span> <a href="#" class="price-btn">$250</a>
									</li>
								</ul>
								<br>
								<br>
								<div class="single-testimonial item d-flex flex-row" style="background:#F6F6F6;">
								<p style="font-size:20px;"> 총 결제 금액 : nnnnn 원 </p>
								</div>
							</div>
 
 
  

</div>
						</div>


				
			</div>
			<div class="row">
			
			
			<div class="offset-6">
				&nbsp;	&nbsp;	&nbsp; &nbsp;	&nbsp; 	&nbsp;
						<input type="button" class="genric-btn info min-width-180  e-large"
						value="취소하기" id="btnHotelList">
						&nbsp;	&nbsp;	
						<input type="button" class="genric-btn info min-width-180  e-large"
						value="예약하기" id="btnReservation"><br>
			       
						
                       </div>
                      
            </div>
				
			</div>		
                      

	<script>
	
	$("#btnReservation").click(function(){
		
		
	
		
		     document.frm_ms.action="?inc=Reserv.ht"
			 document.frm_ms.submit();
	
	
	})
	
	
	
	
	
	</script>
		
   
	
	

</body>
</html>

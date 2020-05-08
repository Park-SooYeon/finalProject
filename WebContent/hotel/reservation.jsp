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
<link rel="stylesheet" href="../css/linearicons.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/animate.min.css">
<link rel="stylesheet" href="../css/owl.carousel.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/css_syj.css">

<script src='../lib/jquery-3.4.1.js'></script>

<style>
li {
padding-bottom:5px;


}

</style>
</head>
<body>

	<header id="header">
		<div class="header-top">
			<div class="container">
				<div class="row align-items-center">
				
				
					<div class="col-lg-6 col-sm-6 col-6 header-top-left">
						<ul>
							<li><a href="#">Visit Us</a></li>
							<li><a href="#">Buy Tickets</a></li>
						</ul>
					</div>
					<div class="col-lg-6 col-sm-6 col-6 header-top-right">
						<div class="header-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.html">Home</a></li>
						<li><a href="about.html">About</a></li>
						<li><a href="packages.html">Packages</a></li>
						<li><a href="hotels.html">Hotels</a></li>
						<li><a href="insurance.html">Insurence</a></li>
						<li class="menu-has-children"><a href="">Blog</a>
							<ul>
								<li><a href="blog-home.html">Blog Home</a></li>
								<li><a href="blog-single.html">Blog Single</a></li>
							</ul></li>
						<li class="menu-has-children"><a href="">Pages</a>
							<ul>
								<li><a href="elements.html">Elements</a></li>
								<li class="menu-has-children"><a href="">Level 2 </a>
									<ul>
										<li><a href="#">Item One</a></li>
										<li><a href="#">Item Two</a></li>
									</ul></li>
							</ul></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- #header -->
	<!-- start banner Area -->
	<section class="relative about-banner" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">회원가입</h1>
					<p class="text-white link-nav">
						<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="elements.html">회원가입</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->



<div style="background: #38a4ff">
	<div class="container" style="background: #38a4ff">
			<div class="jumbotron" style="padding-top: 20px; background: #38a4ff">
		<div class="col-lg-10 offset-2 " >
		
 </div>           

<form  method="post" name="frm_ms" id="frm_ms" class="row" >
	                        <div class="col-lg-2 offset-lg-1 col-md-12 ">
									<input type="text" class="form-control" name="name" placeholder="From " onfocus="this.placeholder = ''" onblur="this.placeholder = 'From '">									
									</div>
									<div class="col-lg-2  " >
									<input type="text" class="form-control date-picker" name="start" placeholder="Start " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start '">
									</div>
									<div class="col-lg-2">
									<input type="text" class="form-control date-picker" name="return" placeholder="Return " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Return '">
									</div>
									<div class="col-lg-2  ">
									<input type="number" min="1" max="20" class="form-control" name="adults" placeholder="Adults " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Adults '">
									</div>
									
									<div class="col-lg-2 ">	
									<input type="button" class="genric-btn info-border"  value="검색" id="btnReservation">
										</div>						
								</form>		
</div>
</div>
</div>

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
                      

	
		
   
	
	

</body>
</html>
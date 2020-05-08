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


	<div class="container">
		<div class="col-lg-7 offset-lg-3">
			<div class="jumbotron" style="padding-top: 20px; background: white">
				<form method="post" name="frm" id="frm"></form>

				<div class="form-group col-lg-10">

					<label>회사 로고</label> 
					<input type="text" class="form-control"   name="mId" id="mId" placeholder="아이디을 입력해 주세요" maxlength="20"><br>

				</div>
			

				<div class="form-group col-lg-10">
					<label>회사명</label> <input type="text" class="form-control"
						name="pName" id="pName" placeholder="회사명을 입력해주세요" maxlength="20"><br>
				</div>

				
	          <div class="form-group col-lg-10">
					<label>사업자등록번호</label> <input type="text" class="form-control"
						name="pNumber" id="pNumber" placeholder="사업자등록번호를 입력해주세요" maxlength="20"><br>
				</div>
				
					<div class="form-group col-lg-10">
					<label>회사 전화번호</label> <input type="text" class="form-control"
						name="pPhone" id="pPhone" placeholder="회사 전화번호를 입력해주세요" maxlength="20"><br>
				</div>
				

			
		


				<div class="col-lg-7 offset-lg-3">
					<input type="button" class="genric-btn info min-width-180  e-large"
						value="파트너 등록하기" id="btnRegPartner">
				</div>
			</div>
		</div>

	</div>

<script>
$('#btnSendMail').click(function(){
 
	 $('#codeCheck').toggle();
})


</script>
</body>
</html>
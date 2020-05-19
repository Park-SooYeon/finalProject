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
			CSSdfada
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

<script src='./lib/jquery-3.4.1.js'></script>

</head>
<body>

<section class="banner-area relative">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">로그인</h1>
				</div>
			
			</div>
		</div>
	</div>
</section>

	
	
	<div class="container">
		<div class="col-lg-7 offset-lg-3">
			<div class="jumbotron" style="padding-top: 20px; background: white">
				
				
				<form method="post" name="frm_ms" id="frm_ms"></form>

				<div class="form-group col-lg-10">

					<label>아이디</label> <input type="text" class="form-control"
						name="mId" id="mId" placeholder="아이디을 입력해 주세요" maxlength="20">
				</div>


				<div class="form-group col-lg-10">
					<label>비밀번호</label><br> <input type="password"
						class="form-control" name="pwd" id="pwd"
						placeholder="비밀번호를 입력해주세요" maxlength="20" required>
				</div>

				<div class="form-group col-lg-10">
					<div class="input-group">
						<div class="primary-checkbox">
							<input type="checkbox" id="default-checkbox"><label
								for="default-checkbox"></label>
						</div>
                   
                  
						
						<div class="offset-6 ">
						<a href="./membership/findPwd.jsp" >비밀번호 찾기</a>
						</div>
						
						
					</div>

				</div>

				<div class="col-lg-7 offset-lg-3">
					<input type="button" class="genric-btn info min-width-180  e-large"
						value="로그인" id="btnLogin"><br>
				</div>
        <br>
             <div class="col-lg-7 offset-lg-3">
             <label>아직 회원이 아니신가요? </label><a href="./membership/memberJoin.jsp" >&nbsp;&nbsp;회원가입</a>
             </div>


			</div>
		</div>

	</div>


</body>
</html>
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

</head>
<body>



	<div class="container">
		<div class="col-lg-7 offset-lg-3">
			<div class="jumbotron" style="padding-top: 20px; background: white">
				<form method="post" name="frm" id="frm"></form>

				<div class="form-group col-lg-10">

					<label>회사 로고</label> 
						<jsp:include page='../happy/fileUpload.jsp'/>  

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
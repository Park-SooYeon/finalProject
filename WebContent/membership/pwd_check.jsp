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

<link rel="stylesheet" href="../css/css_syj.css">

</head>
<body>

<section class="banner-area relative">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">회원정보 수정</h1>
				</div>
			
			</div>
		</div>
	</div>
</section>
<!-- start banner -->





	<div class="container">
		<div class="col-lg-7 offset-lg-3">
			<div class="jumbotron" style="padding-top: 20px; background: white">
				<form method="post" name="frm_ms" id="frm_ms" action="?inc=pwdCheck.ms" >	            
				
				<div class="form-group col-lg-10"> 
					<label>아이디</label> 
					<input type="text" class="form-control" name="mId" id="mId" value="${sessionScope.member_id }" readonly><br>
				</div>
				
				<div class="form-group col-lg-10">
					<label>현재 비밀번호</label><input type="password"
						class="form-control" name="pwd" id="pwd"
						placeholder="현재 비밀번호를 입력해주세요." maxlength="20" required>
				</div>
		 		
		 		<div class="col-lg-7">
			 		<input type="submit" class="genric-btn info min-width-150 e-large pull-right" value="비밀번호 확인">	 		
				</div>
				</form>
			</div>
		</div>

	</div>
	
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript"> //<![CDATA[ $(function() { $("#frm_ms").validate(); }); //]]> </script>

<script>
$('#btnSendMail').click(function(){
 
	 $('#codeCheck').toggle();
})


</script>


</body>
</html>
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
				<form method="post" name="frm_ms" id="frm_ms"  >



				<div class="form-group col-lg-10 "> 

					<label>아이디</label> 
					<input type="text" class="form-control "
						name="mId" id="mId" value="id1234"><br>
               
      
     

				</div>
		            

				<div class="form-group col-lg-10">
					<label>비밀번호</label><br> <input type="password"
						class="form-control" name="pwd" id="pwd"
						placeholder="비밀번호를 입력해주세요" maxlength="20" required><br>
				</div>

				<div class="form-group col-lg-10">
					<label>비밀번호 재확인</label><br> <input type="password"
						class="form-control" name="pwd_check" id="pwd_check"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" maxlength="20" required>
				</div>
					

				<div class="form-group col-lg-10">
					<label>이름</label> <input type="text" class="form-control"
						name="mName" id="mName" placeholder="이름을 입력해주세요" maxlength="20"  required><br>
				</div>

				

			
				<div class="form-group col-lg-10" id="email_syj">
					<label for="InputEmail">이메일 주소</label> 
					<div class="input-group">
					  <input type="text" class="form-control" placeholder="이메일을 입력해주세요" aria-describedby="basic-addon2"  required>
					 
					  <input type="button" class="genric-btn info radius input-group-append" value="인증받기"
						id="btnSendMail">
						
					</div>
				
				
				</div>


					<div class="form-group col-lg-8 "  id='codeCheck'>
					<label>인증 번호</label> 
				     <input type="text" class="form-control" id="emailCodeCheck">
				    </div><br>
				 
				


				<div class="col-lg-7 offset-lg-3">
					<input type="button" class="genric-btn info min-width-180  e-large"
						value="회원가입" id="btnInsert" >
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
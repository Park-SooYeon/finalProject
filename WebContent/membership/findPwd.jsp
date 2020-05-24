<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<body>
<!-- start banner -->

<section class="banner-area relative">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">비밀번호 찾기</h1>
				</div>
			
			</div>
		</div>
	</div>
</section>
<!-- start banner -->


	<div class="container">
		<div class="col-lg-7 offset-lg-3">
			<div class="jumbotron ms">
				 <div style="border: 1px solid #EAEAEA; padding: 50px;">
				<form method="post" name="frm_ms" id="frm_ms">
                   
		
			     <br>
		          <p style="font-size:20px">가입 시 사용한 이메일 주소를 입력해주시면  <br/>
		                   비밀번호 재설정 링크를 보내드립니다. </p> 
			     <br>
				<div class="form-group col-lg-12" id="email_syj">
				
					<div class="input-group">
					  <input type="text" class="form-control" 
					  placeholder="이메일을 입력해주세요" 
					  aria-describedby="basic-addon2" name="email" id="email">
				 
				
					</div>
				
				
				
				</div>
				</form>



				<div class="col-lg-6 offset-lg-2">
				<br>
					<input type="button" class="genric-btn info min-width-180  e-large"
						value="비밀번호 재설정 링크보내기" id="btnFindPwd">
				</div>
			</div>
		</div>

	</div>

</div>
</body>

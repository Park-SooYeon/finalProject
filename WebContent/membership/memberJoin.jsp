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
					<h1 class="text-white mb-10">회원가입</h1>
				</div>
			
			</div>
		</div>
	</div>
</section>
<!-- start banner -->

	
    


	<div class="container">
		<div class="col-lg-7 offset-lg-3">
			<div class="jumbotron ms" >
			  <div style="border: 1px solid #EAEAEA; padding: 50px;">
				<form method="post" name="frm_ms" id="frm_ms"  >

				<div class="form-group col-lg-10 "> 

					<label>아이디</label> 
				
					<input type="text" class="form-control "
						name="member_id" id="member_id" placeholder="아이디을 입력해 주세요" maxlength="20"  required><br>

                     
                     	<div class="check_font" id="id_check" name="id_check"></div>
              
        
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
						name="member_name" id="member_name" placeholder="이름을 입력해주세요" maxlength="20"  required><br>
				</div>


			   <div class="form-group col-lg-10">
								<label>전화번호</label> <input type="text" class="form-control"
									name="phone" id="phone" placeholder="전화번호를 입력해주세요~" maxlength="20"  required><br>
							</div>
			   
				

			
				<div class="form-group col-lg-10" id="email_syj">
					<label for="InputEmail">이메일 주소</label> 
					<div class="input-group">
					  <input type="text" class="form-control"  id="email" name="email"
					  placeholder="이메일을 입력해주세요" aria-describedby="basic-addon2" 
					   required>
					 
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
						value="회원가입" id="btnMemberInsert" >
				</div>
				</form>
			</div>
		</div>
 </div>
	</div>

<script>
$('#btnSendMail').click(function(){
	 
	 $('#codeCheck').toggle();
	 
})

ms.func();


</script>


</body>

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





<form method="post" name="frm_ms" id="frm_ms" action="?inc=changeUserInfo.ms" >
	<div class="container">
		<div class="col-lg-7 offset-lg-3">
			<div class="jumbotron" style="padding-top: 20px; background: white">



				<div class="form-group col-lg-10"> 

					<label>아이디</label> 
					<input type="text" class="form-control "
						name="mId" id="mId" value="${sessionScope.member_id }" readonly><br>
               
      
     

				</div>
		            

				<div class="form-group col-lg-10">
					<label>비밀번호</label><input type="password"
						class="form-control" name="pwd" id="pwd"
						placeholder="계정 변경을 위해 비밀번호를 입력해주세요." maxlength="20" required>
				</div>

				<div class="form-group col-lg-10">
					<label>비밀번호 재확인</label> <input type="password"
						class="form-control" name="pwd_check" id="pwd_check"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요." maxlength="20" required><br/>
				</div>
				<div class="form-group col-lg-10">
					<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				</div>
				
				<div class="form-group col-lg-10">
					<label>이름</label> <input type="text" class="form-control"
						name="mName" id="mName" value="${UserInfo.member_name }" required>
				</div>

				

				<div class="form-group col-lg-10" id="email_syj">
					<label for="InputEmail">이메일 주소</label> 
					<div class="input-group">
					  <input type="text" name="email" id="email" class="form-control" placeholder="이메일을 입력해주세요" aria-describedby="basic-addon2"  required value="${UserInfo.email }">
					  <input type="button" class="genric-btn info radius input-group-append" value="인증받기" id="btnSendMail">
					</div>
				</div>


				<div class="form-group col-lg-10"  id='codeCheck'>
					<label for="emailCodeCheck">인증 번호</label>
					<div class="input-group">
				    	<input type="text" class="form-control" id="emailCodeCheck">
				    	<input type="button" class="genric-btn info radius input-group-append" value="확인" id="btnChkMail">
					</div>
			    </div><br>
				 
				
						<hr/>

				<div class="col-lg-7">
						<a class="pull-left" href="#" data-toggle="modal"
            				data-target="#mp-memberLeave">회원탈퇴</a>
					<input type="button" class="genric-btn info min-width-150  e-large pull-right"
						value="변경사항 저장" id="btnUpdate">
				</div>
			</div>
		</div>

	</div>
	
	<div
      class="modal fade"
      id="mp-memberLeave"
      tabindex="-1"
      role="dialog"
      aria-labelledby="mp-memberLeave"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document" style="max-width: 450px;">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="mp-memberLeaveLabel">회원탈퇴</h5>
            
            
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" style="color: #000; padding: 1rem 1rem;">
          
          <div>
            	<h5>개선할 점이 있다면 알려주세요.</h5><small class="mb-2">왜 Travelista를 떠나시나요 😢</small><br/>
            	<textArea name="delete_reason" name="delete_reason" class="form-control my-1"></textArea>
            </div>
				<p>'탈퇴' 버튼을 누르시면 계정이 삭제됩니다. 한번 탈퇴하면 로그인할 수 없으니 신중하게 선택해주세요.</p>
            </div><!-- modal-body -->
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="btnLeaveMember">탈퇴</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          </div>
          </div>
        </div>
      </div>
</form>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript"> //<![CDATA[ $(function() { $("#frm_ms").validate(); }); //]]> </script>
<script src="js/changeUserInfo.js"></script>


</body>
</html>
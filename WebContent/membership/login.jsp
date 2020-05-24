<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!DOCTYPE html>

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
			<div class="jumbotron ms">
				<div style="border: 1px solid #EAEAEA; padding: 50px;">


					<form method="post" name="frm_ms" id="frm_ms">

					<div class="form-group col-lg-10 offset-1">

						<label>아이디</label> <input type="text" class="form-control"
							name="member_id" id="member_id" placeholder="아이디을 입력해 주세요" maxlength="20">
					</div>


					<div class="form-group col-lg-10 offset-1">
						<label>비밀번호</label><br> <input type="password"
							class="form-control" name="pwd" id="pwd"
							placeholder="비밀번호를 입력해주세요" maxlength="20" required>
					</div>

					<div class="form-group col-lg-10 offset-1 ">



						<input type="button"
							class="genric-btn info min-width-350  e-large" value="로그인"
							id="btnLogin" 
							 style="padding-left: 20px;">




					</div>

					<div class="form-group col-lg-10 offset-1">

						<input type="text" class="genric-btn min-width-350 link"
							id="findPwd" onclick="location.href='./?inc=findPwd.ms'"
							value="비밀번호 찾기"> <br /> 
							
							<input type="text"
							class="genric-btn min-width-350 link" id="memberJoin"
							onclick="location.href='./?inc=memberJoin.ms'" value="회원가입">


					</div>
					
				
					<c:if test="${msg == 'noId'}">
				      <div class="form-group col-lg-10 offset-1">
				           <label>아이디가 존재하지 않습니다!</label>
				      </div>
				      
					</c:if>
					
						<c:if test="${msg == 'noPwd'}">
				      <div class="form-group col-lg-10 offset-1">
				           <label>비밀번호를 다시 확인해주세요!</label>
				      </div>
				      
					</c:if>
					
					
					</form>
				</div>
			</div>

		</div>
	</div>
	<script>
           ms.func();

	</script>
</body>

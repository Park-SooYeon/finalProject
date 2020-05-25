<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>


<!-- start banner -->

<section class="banner-area relative">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">파트너 등록하기</h1>
				</div>
			
			</div>
		</div>
	</div>
</section>
<!-- start banner -->


	<div class="container">
		<div class="col-lg-7 offset-lg-3">
			<div class="jumbotron" style="padding-top: 20px; background: white">
				<form method="post" name="frm_ms" id="frm_ms">
             <input type="text" id="mId" name="mId" value = ${sessionScope.member_id }>
		
				<div class="form-group col-lg-10">
			<div class="single-element-widget">
									<label>회사 종류</label>
									<div class="default-select" id="default-select">
										<select id="type">
											<option value="1">호텔</option>
											<option value="2">렌트카</option>
										
								
										</select>
									</div>
								</div>
			</div>
				<div class="form-group col-lg-10">
					<label>회사명</label> <input type="text" class="form-control"
						name="pName" id="pName" placeholder="회사명을 입력해주세요" maxlength="20"><br>
				</div>

				
             	<div class="form-group col-lg-10">
					<label>회사 전화번호</label> <input type="text" class="form-control"
						name="pPhone" id="pPhone" placeholder="회사 전화번호를 입력해주세요" maxlength="20"><br>
				</div>

	          <div class="form-group col-lg-10">
					<label>사업자등록번호</label> <input type="text" class="form-control"
						name="pNumber" id="pNumber" placeholder="사업자등록번호를 입력해주세요" maxlength="20"><br>
				</div>
								
				
			    	<div class="form-group col-lg-12">
					<label>회사 주소</label> 
				

							<div class="form-inline">
						<div class="input-group">
					 
						
				
							<input type="text" class="form-control col-lg-4" id="sample6_postcode"
								name='add1' placeholder="우편번호"> 
							
								<input type="button"  class="genric-btn info radius input-group-append " onclick="sample6_execDaumPostcode()"value="우편번호 찾기"><br> 
					</div>
								
								<input type="text"
								class="form-control " id="sample6_address" name='add2'
								placeholder="주소">
								
								
								
								
								 <input type="text"
								class="form-control" id="sample6_detailAddress" name='add3'
								placeholder="상세주소"> <input type="text"
								class="form-control" id="sample6_extraAddress" name='add4'
								placeholder="참고항목">
						</div>
				</div>
				
				 
				   
				</form>
		


				<div class="col-lg-7 offset-lg-3">
					<input type="button" class="genric-btn info min-width-180  e-large"
						value="파트너 등록하기" id="btnRegPartner">
				</div>
			</div>
		</div>

	</div>

<script>
ms.func();

</script>

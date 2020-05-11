<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../partials/header.jsp" %>
        <div class="content-wrapper">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item active" aria-current="page">회사등록</span>
		                            </h5>
                                </div>

                            </div>
                            <form action="" name="frmAdmHtCompAdd" id="frmAdmHtCompAdd">
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">업체명 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <input class="form-control" maxlength="50" name="admRtComptNm" id="admRtComptNm" type="text"> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">연락처 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <input class="form-control form-phone" data-inputmask-alias="(+99) 9999-9999" im-insert="true">
									</div>
                                </div>
                                <div class="form-group row">
					                <div class="col-lg-3">
					                    <label for="zonecode" class="col-form-label">차고지 주소 <span class="text-danger">*</span></label>
					                </div>
					                <div class="col-lg-8">
					                    <div class="input-group">
					                        <input type="text" class="form-control" value="${vo.addr1 }" required="required" id="address" name="address" readonly>
		                                    <div class="input-group-append">
		                                        <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress();">주소 검색</button>
		                                    </div>
					                    </div>
					                </div>
					            </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">총 보유대수 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<input class="form-control" type="number" min="0"> 
									</div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">승용차 보유대수 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<input class="form-control" type="number" min="0"> 
									</div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">승합차 보유대수 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<input class="form-control" type="number" min="0"> 
									</div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">위도 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<input class="form-control" type="text">
									</div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">경도 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<input class="form-control" type="text">
									</div>
                                </div>
                                <div class="form-group col-12 text-right mt-5">
                                	<button type="submit" class="btn btn-secondary mr-2">취소</button>
                                	<button type="submit" class="btn btn-success">등록</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <%@include file="../partials/footer.jsp" %>
        
        <script>
	     // 다음 우편번호 서비스
	        function openDaumZipAddress() {
	            new daum.Postcode({
	                oncomplete: function (data) {
	                    jQuery("#postcode1").val(data.postcode1);
	                    jQuery("#postcode2").val(data.postcode2);
	                    jQuery("#zonecode").val(data.zonecode);
	                    jQuery("#address").val(data.address);
	                    jQuery("#address2").focus();
	                    console.log(data);
	                }
	            }).open();
	        }
        </script>
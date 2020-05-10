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
		                            	<span class="breadcrumb-item active" aria-current="page">차량등록</span>
		                            </h5>
                                </div>
                            </div>
                            <form action="" name="frmAdmHtCompAdd" id="frmAdmHtCompAdd">
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">회사명 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <select class="form-control" id="rtCompNm">
				                        <option value="">A 렌터카</option>
				                        <option value="">B 렌터카</option>
				                        <option value="">C 렌터카</option>
				                    </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">차량명 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" />
				                    </select>
                                    </div>
                                </div>
								<div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">종류 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <select class="form-control" id="rtCompNm">
					                        <option value="">소형</option>
					                        <option value="">중형</option>
					                        <option value="">대형</option>
					                        <option value="">승합</option>
					                        <option value="">SUV/5인승</option>
					                        <option value="">수입/전기차</option>
					                    </select>
									</div>
                                </div>
                                <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">가격(시간당) <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" data-inputmask="'alias': 'currency'" im-insert="true" style="text-align: right;">
	                                </div>
	                            </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">사진</label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<div class="row">
	                                    	<div class="col-md-4 mb-2">
	                                    		<input type="file" class="dropify" />
	                                    	</div>
                                    		<div class="col-md-4 mb-2">
	                                    		<input type="file" class="dropify" />
	                                    	</div>
	                                    	<div class="col-md-4 mb-2">
	                                    		<input type="file" class="dropify" />
	                                    	</div>
                                    	</div>
                                        
									</div>
                                </div>
                                <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">차량 문수 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" type="number" min="0">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">기어타입 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" type="number" min="0">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">탑승자 정원 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" type="number" min="0">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">옵션 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
                                    	<div class="row">
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input"> 짐가방 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input"> 작은가방 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input"> 에어컨 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    	</div>
			                            
									</div>
	                            </div>
                                <div class="form-group col-12 text-right mt-5">
                                	<button type="submit" class="btn btn-secondary mr-2">취소</button>
                                	<button type="submit" class="btn btn-success" onclick="showSwal('success-message')">등록</button>
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
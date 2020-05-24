<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item active" aria-current="page">호텔등록</span>
		                            </h5>
                                </div>

                            </div>
                            <form action="" name="frmAdmHtCompAdd" id="frmAdmHtCompAdd" enctype="multipart/form-data">
                                <input type="hidden" name="member_id" id="mId" value="${member_id }" />
                                <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">지역 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <select class="form-control" id="htPlaceNm">
					                        <option value="1">서울</option>
					                        <option value="2">제주도</option>
					                        <option value="3">부산</option>
					                        <option value="4">대구</option>
					                        <option value="5">경기도</option>
					                        <option value="6">인천</option>
					                    </select>
				                    </div>
			                    </div>
			                    <div class="form-group row">
	                                <div class="col-lg-3">
                                        <label class="col-form-label">호텔명 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <input class="form-control" maxlength="50" name="admHCompNm" id="admHCompNm" type="text"> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">연락처 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <input class="form-control form-phone" name="admHCompTel" id="admHCompTel" data-inputmask-alias="(+99) 9999-9999" im-insert="true">
									</div>
                                </div>
                                <div class="form-group row">
					                <div class="col-lg-3">
					                    <label for="place_location" class="col-form-label">주소 <span class="text-danger">*</span></label>
					                </div>
					                <div class="col-lg-8">
					                    <div class="input-group">
					                        <input type="text" class="form-control" value="" required="required" id="place_location" name="place_location" readonly>
		                                    <div class="input-group-append">
		                                        <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress2();">주소 검색</button>
		                                    </div>
					                    </div>
					                </div>
					            </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">사진</label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<div class="row" id="attList">
	                                    	<div class="col-md-4 mb-2">
	                                    		<input type="file" name="" class="dropify" />
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
                                        <label class="col-form-label">옵션</label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<div class="row">
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input" name="wifi" id="wifi"> Wi-Fi <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input" name="breakfast" id="breakfast"> 조식 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input" name="parking" id=""> 주차장 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    	</div>
			                            
			                            
									</div>
                                </div>
                                <div class="form-group col-12 text-right mt-5">
                                	<button type="button" class="btn btn-secondary mr-2" id="btnPtHtCancle">취소</button>
                                	<button type="button" class="btn btn-success" id="btnPtHtRegister">등록</button>
                                </div>
                                <input type="text" name="nowPage" value="${param.nowPage }" />
								<input type="text" name="findStr" value="${param.findStr }" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
       
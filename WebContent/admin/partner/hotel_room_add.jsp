<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item active" aria-current="page">객실등록</span>
		                            </h5>
                                </div>
                            </div>
                            <form action="" name="frmAdmHtRoomAdd" id="frmAdmHtRoomAdd" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="place_serial" id="place_serial" value="" />
                                <input type="hidden" name="rooms_name" id="rooms_name" />
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">호텔 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <select class="form-control" name="" id="htCompNm">
                                        	<option value="">선택하세요.</option>
                                        	<c:forEach var="vo" items="${list }" varStatus="i">
						                        <option value="${vo.place_serial }">${vo.place_name }</option>
					                        </c:forEach>
					                    </select>
                                    </div>
                                </div>
								<div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">객실유형 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <select class="form-control" id="htRommType">
                                        	<option value="">선택하세요.</option>
					                        <option value="1">디럭스</option>
					                        <option value="2">패밀리</option>
					                        <option value="3">스위트</option>
					                    </select>
									</div>
                                </div>
                                <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">인원수 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input type="number" name="people" class="form-control" >
	                                </div>
	                            </div>
                                <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">가격 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" name="price" data-inputmask="'alias': 'currency'" im-insert="true" style="text-align: right;">
	                                </div>
	                            </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">사진</label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<div class="row">
	                                    	<div class="col-md-4 mb-2">
	                                    		<input type="file" name="fileName1" class="dropify" />
	                                    	</div>
                                    		<div class="col-md-4 mb-2">
	                                    		<input type="file" name="fileName2" class="dropify" />
	                                    	</div>
	                                    	<div class="col-md-4 mb-2">
	                                    		<input type="file" name="fileName3" class="dropify" />
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
					                                <input type="checkbox" class="form-check-input" name="no_smoking" id="no_smoking"> 금연 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input" name="ocean_view" id="ocean_view"> 오션뷰 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input" name="city_view" id="city_view"> 시티뷰 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-sm-3 col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input" name="mt_view" id="mt_view"> 마운틴뷰 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    	</div>
			                            
			                            
									</div>
                                </div>
                                <div class="form-group col-12 text-right mt-5">
                                	<button type="submit" class="btn btn-secondary mr-2">취소</button>
                                	<button type="button" id="btnPtRmRegister" class="btn btn-success">등록</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        
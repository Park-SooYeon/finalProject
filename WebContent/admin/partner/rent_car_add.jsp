<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					                        <c:forEach var="vo" items="${list }" varStatus="i">
						                        <option value="${vo.place_serial }">${vo.place_name }</option>
					                        </c:forEach>
					                    </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">차량명 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <input type="text" name="car_name" id="car_name" class="form-control" />
				                    </select>
                                    </div>
                                </div>
								<div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">종류 <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <select class="form-control" id="rtCompNm">
                                        	<option value="">선택하세요.</option>
					                        <option value="소형 차량">소형 차량</option>
					                        <option value="중형 차량">중형 차량</option>
					                        <option value="대형 차량">대형 차량</option>
					                        <option value="SUV">SUV</option>
					                        <option value="프리미엄 차량">프리미엄 차량</option>
					                        <option value="미니밴">미니밴</option>
					                    </select>
									</div>
                                </div>
                                <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">가격(시간당) <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" type="number" name="price" id="price" />
	                                </div>
	                            </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">사진</label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<div class="row">
	                                    	<div class="col-12 mb-2">
	                                    		<input type="file" name="photo" id="photo" class="dropify" />
	                                    	</div>
                                    	</div>
                                        
									</div>
                                </div>
                                <div class="form-group row">
	                                <div class="offset-lg-3 col-lg-8">
	                                    <div class="row">
                                    		<div class="col-sm-6">
                                    			<div class="row">
                                    				<div class="col-lg-4">
					                                    <label class="col-form-label">차량 문수 <span class="text-danger">*</span></label>
					                                </div>
					                                <div class="col-lg-8">
					                                    <input class="form-control" name="door" type="number" min="0">
					                                </div>
                                    			</div>
                                    		</div>
                                    		<div class="col-sm-6">
                                    			<div class="row">
	                                   				<div class="col-lg-4">
					                                    <label class="col-form-label">탑승자 정원 <span class="text-danger">*</span></label>
					                                </div>
					                                <div class="col-lg-8">
					                                    <input class="form-control" name="max_people" type="number" min="0">
					                                </div>
	                                   			</div>
                                    		</div>
                                    	</div>
                                    </div>
								</div>
								<div class="form-group row">
                                    <div class="offset-lg-3 col-lg-8">
	                                    <div class="row">		
                                    		<div class="col-sm-6">
	                                   			<div class="row">
	                                   				<div class="col-lg-4">
					                                    <label class="col-form-label">기어타입 <span class="text-danger">*</span></label>
					                                </div>
					                                <div class="col-lg-8">
					                                    <input class="form-control" name="gear" type="text" min="0">
					                                </div>
	                                   			</div>
	                                   		</div>
	                                   		<div class="col-sm-6">
	                                   			<div class="row">
	                                   				<div class="col-lg-4">
					                                    <label class="col-form-label">짐가방 <span class="text-danger">*</span></label>
					                                </div>
					                                <div class="col-lg-8">
					                                    <input class="form-control" name="big_bag" type="number" min="0">
					                                </div>
	                                   			</div>
	                                   		</div>
										</div>
                                    </div>
								</div>
								<div class="form-group row">
                                    <div class="offset-lg-3 col-lg-8">
	                                    <div class="row">
	                                   		<div class="col-sm-6">
	                                   			<div class="row">
	                                   				<div class="col-lg-4">
					                                    <label class="col-form-label">작은가방 <span class="text-danger">*</span></label>
					                                </div>
					                                <div class="col-lg-8">
					                                    <input class="form-control" name="small_bag" type="number" min="0">
					                                </div>
	                                   			</div>
	                                   		</div>
	                                   		<div class="col-sm-6">
	                                   			<div class="row">
	                                   				<div class="col-lg-4">
					                                    <label class="col-form-label">옵션 <span class="text-danger">*</span></label>
					                                </div>
					                                <div class="col-lg-8">
					                                    <div class="form-check form-check-flat">
							                              <label class="form-check-label">
							                                <input type="checkbox" class="form-check-input"> 에어컨 <i class="input-helper"></i></label>
							                            </div>
					                                </div>
	                                   			</div>
	                                   		</div>
	                                   </div>
                                    </div>
								</div>
	                           
	                            
                                <div class="form-group col-12 text-right mt-5">
                                	<button type="submit" class="btn btn-secondary mr-2">취소</button>
                                	<button type="submit" class="btn btn-success" onclick="showSwal('success-message')">등록</button>
                                </div>

                                <input type="text" name="aircon" id="aircon" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <div class="row profile-page">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex pb-4 mb-4 border-bottom">
                        <div class="d-flex align-items-center">
                            <h5 class="page-title mb-n2 font-weight-bold">
                                <span class="breadcrumb-item">
                                    <a href="#">호텔 관리</a>
                                </span>
                                <span class="breadcrumb-item active" aria-current="page">호텔 정보 수정하기</span>
                            </h5>
                        </div> 
                        <div class="ml-auto d-flex align-items-stretch justify-content-end"> 
                            <button type="button" id="btnPtHtSave" class="btn btn-inverse-success no-wrap ml-4">저장</button>
                            <a href="./?inc=hotel_comp_list.ph" id="btnPtHtDelete" class="btn btn-inverse-primary no-wrap ml-2">취소</a>
                        </div> 
                    </div>
                    <form class="" name="frmAdmHtCompModi" id='frmAdmHtCompModi' method="post" enctype="multipart/form-data">
                        <input type="hidden" name="place_serial" value="${serial }" />
                        <input type="hidden" name="htPlaceCode" id="htPlaceCode" value="" />
                        <input type="hidden" name="PtnHtStatus" id="PtnHtStatus" value="" />
                        
                        <div class="">
                            <div class="d-flex justify-content-center justify-content-md-between mr-4 mr-xl-5 pr-xl-5 flex-wrap">
                                <div class="profile-info d-flex align-items-center justify-content-center flex-wrap mr-sm-3" name="photoList" id="photoList">
                                	<c:if test="${!empty vo.photos}">
                                   		<c:forEach var="photo" items="${vo.photos}" varStatus="i" >
                                   			<div class="col-6 col-lg-4">
                                   				<input type="hidden" name="photo_serial_${i.count }" value="${photo.photo_serial }" />
                                   				<input type="file" name="fileName${i.count }" class="dropify mr-2" id="" data-default-file="../../assets/images/upload/${photo.sysFile }" />
                                   			</div>
										</c:forEach>
                                    </c:if>           
                                    <c:if test="${empty vo.photos}"> 
                                    	<div class="col-md-4 mb-2">
                                    		<input type="file" name="fileName1" class="dropify" />
                                    	</div>
                                    	<div class="col-md-4 mb-2">
                                    		<input type="file" name="fileName2" class="dropify" />
                                    	</div>
                                    	<div class="col-md-4 mb-2">
                                    		<input type="file" name="fileName3" class="dropify" />
                                    	</div>
                                    </c:if>
                                   
                                </div> 
                                <div class="details mt-2 mt-md-0">
                                    <div class="detail-col pr-3 mr-3">
                                        <p class="font-weight-bold">누적예약건수</p>
                                        <p>130</p>
                                    </div>
                                    <div class="detail-col">
                                        <p class="font-weight-bold">누적판매금액</p>
                                        <p>43</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="profile-body">
	                        <ul class="nav tab-switch" role="tablist">
	                            <li class="nav-item">
	                                <a class="nav-link active" id="user-profile-info-tab" data-toggle="pill" href="#user-profile-info" role="tab" aria-controls="user-profile-info" aria-selected="true">Info</a>
	                            </li>
	                        </ul>
	                        <div class="row">
	                            <div class="col-12">
	                                <div class="tab-content tab-body" id="profile-log-switch">
	                                    <div class="tab-pane fade pr-3 active show" id="user-profile-info" role="tabpanel" aria-labelledby="user-profile-info-tab">
	                                        <div class="row mt-3 pl-3">
	                                            <div class="col-6">
													<div class="form-group row">
						                                <div class="col-lg-3">
						                                    <label class="col-form-label"><strong>지역 :</strong> <span class="text-danger">*</span></label>
						                                </div>
						                                <div class="col-lg-8">
						                                    <select class="form-control" id="htPlaceNm" name="local_code" required>
										                        <option value="">선택해주세요.</option>
										                        <option value="1">서울</option>
										                        <option value="2">인천</option>
										                        <option value="3">제주</option>
										                        <option value="4">대구</option>
										                        <option value="5">부산</option>
										                        <option value="6">경기도</option>
										                    </select>
									                    </div>
								                    </div>
	                                                <div class="form-group row">
						                                <div class="col-lg-3">
					                                        <label class="col-form-label"><strong>호텔명 :</strong> <span class="text-danger">*</span></label>
					                                    </div> 
					                                    <div class="col-lg-8">
					                                        <input class="form-control" maxlength="50" value="${vo.place_name }" required="required" name="place_name" id="place_name" type="text"> 
					                                    </div>
					                                </div>
					                                <div class="form-group row">
					                                    <div class="col-lg-3">
					                                        <label class="col-form-label"><strong>연락처 :</strong> <span class="text-danger">*</span></label>
					                                    </div>
					                                    <div class="col-lg-8">
					                                        <input class="form-control form-phone" value="${vo.place_tel }" required="required" name="place_tel" id="admHCompTel" data-inputmask-alias="(+99) 9999-9999" im-insert="true">
														</div>
					                                </div>
	                                            </div>
	                                            <div class="col-6">
	                                                <div class="form-group row">
										                <div class="col-lg-3">
										                    <label for="placeLocation" class="col-form-label"><strong>주소 :</strong> <span class="text-danger">*</span></label>
										                </div>
										                <div class="col-lg-8">
										                    <div class="input-group">
										                        <input type="text" class="form-control" value="${vo.place_location }" required="required" id="placeLocation" name="place_location" readonly>
							                                    <div class="input-group-append">
							                                        <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress2();">주소 검색</button>
							                                    </div>
										                    </div>
										                </div>
										            </div>
										            <div class="form-group row">
					                                    <div class="col-lg-3">
					                                        <label class="col-form-label"><strong>옵션 :</strong> </label>
					                                    </div>
					                                    <div class="col-lg-8">
					                                    	<div class="row">
					                                    		<div class="col-sm-4 col-6">
					                                    			<div class="form-check form-check-flat mt-2">
										                              	<label class="form-check-label">
								                                		<input type="checkbox" class="form-check-input" name="wifi" id="wifi"> Wi-Fi <i class="input-helper"></i></label>
										                            </div>
					                                    		</div>
					                                    		<div class="col-sm-4 col-6">
					                                    			<div class="form-check form-check-flat mt-2">
										                              <label class="form-check-label">
										                                <input type="checkbox" class="form-check-input" name="breakfast" id="breakfast"> 조식 <i class="input-helper"></i></label>
										                            </div>
					                                    		</div>
					                                    		<div class="col-sm-4 col-6">
					                                    			<div class="form-check form-check-flat mt-2">
										                              <label class="form-check-label">
										                                <input type="checkbox" class="form-check-input" name="parking" id="parking"> 주차장 <i class="input-helper"></i></label>
										                            </div>
					                                    		</div>
					                                    	</div>
								                            
								                            
														</div>
					                                </div>
					                                <div class="form-group row">
						                                <div class="col-lg-3">
						                                    <label class="col-form-label"><strong>판매상태 :</strong> <span class="text-danger">*</span></label>
						                                </div>
						                                <div class="col-lg-8">
						                                    <select class="form-control" id="PtnhtState" name="state" required>
						                                    	<option value="">선택해주세요.</option>
										                        <option value="1">활성화</option>
										                        <option value="0">비활성화</option>
										                    </select>
									                    </div>
								                    </div>
	                                            </div>
	                                        </div>
	                                        <div class="row">
	                                            <div class="col-12 mt-5">
	                                                <h5 class="mb-3">보유객실 목록</h5>
	                                                <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
	                                                    <div class="table-responsive">
	                                                        <table id="product-listing" class="table">
	                                                            <thead>
	                                                                <tr>
	                                                                    <th>#</th>
	                                                                    <th>-</th>
	                                                                    <th>객실유형</th>
	                                                                    <th>가격</th>
	                                                                    <th>옵션</th>
	                                                                    <th>판매상태</th>
	                                                                    <th>Actions</th>
	                                                                </tr>
	                                                            </thead>
	                                                            <tbody>
	                                                                <!-- 어려워보임;; -->
	                                                                <tr>
	                                                                    <td>1</td>
	                                                                    <td>
	                                                                        <div class="d-flex align-items-center">
	                                                                            <img class="img-xs rounded" src="../../assets/images/faces/face2.jpg" alt="profile image">
	                                                                        </div>
	                                                                    </td>
	                                                                    <td>디럭스</td>
	                                                                    <td>3,552,600원</td>
	                                                                    <td>253개</td>
	                                                                    <td>
							                                                <c:if test="${vo.state == 0}">
							                                                	<div class="badge badge-secondary text-muted">비활성화</div>
							                                                </c:if>
							                                                <c:if test="${vo.state == 1}">
							                                                	<div class="badge badge-primary">활성화</div>
							                                                </c:if>
						                                                </td>
	                                                                    <td>
	                                                                        <a class="btn btn-outline-primary" href="./partner_view.jsp">View</a>
	                                                                    </td>
	                                                                </tr>
	                                                            </tbody>
	                                                        </table>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	
	                                </div>
	                            </div>
	
	                        </div>
	                    </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>  
<script type="text/javascript">
	// 지역 값 세팅 	
	const code = '${vo.local_code}';
	var sel = document.getElementById("htPlaceNm");
	
	console.log(code);
	switch (code) {
		case '1':
			sel.options[1].selected = true;
			break;
		case '2':
			sel.options[2].selected = true;
			break;
		case '3':
			sel.options[3].selected = true;
			break;
		case '4':
			sel.options[4].selected = true;
			break;
		case '5':
			sel.options[5].selected = true;
			break;
		case '6':
			sel.options[6].selected = true;
			break;
	}
	
	// 판매상태 세팅 
	const state = '${vo.state}';
	var sel2 = document.getElementById("PtnhtState");
	
	switch (state) {
		case '0':
			sel2.options[0].selected = true;
			break;
		case '1':
			sel2.options[1].selected = true;
			break;
	}
	
	
	// 옵션 값 세팅 
	let wifi = ${vo.wifi};
	let breakfast = ${vo.breakfast};
	let parking = ${vo.parking};
	
	if(wifi == 1){
		document.getElementById("wifi").checked = true;
	}
	if(breakfast == 1){
		document.getElementById("breakfast").checked = true;
	}
	if(parking == 1){ 
		document.getElementById("parking").checked = true;
	} 
	
	
</script>
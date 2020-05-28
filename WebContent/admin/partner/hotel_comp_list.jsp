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
		                            	<span class="breadcrumb-item active" aria-current="page">호텔 관리</span>
		                            </h5>

                                </div>

                                <div class="ml-auto d-flex align-items-stretch justify-content-end">
                                    <a href="./?inc=hotel_comp_add.ph" id="btnPtHtInsert" class="btn btn-inverse-primary no-wrap ml-4">호텔등록</a>
                                </div>
                            </div>
                            <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <form class="table-responsive" name="frmAdmHtCompList" id="frmAdmHtCompList" method="post">
                                    <input type="hidden" name="mamber_id" id="mamberId" value="${member_id }">
                                    <input type="hidden" name="pserial" id="pserial" value="" />
                                    <table id="order-listing" class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>-</th>
                                                <th>호텔명</th>
                                                <th>주소</th>
                                                <th>연락처</th>
                                                <th>보유객실</th>
                                                <th>상태</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="vo" items="${list }" varStatus="i">
                                        		<tr>
	                                                <td>${i.count }</td>
	                                                <td>
	                                                	<input type="hidden"  id="place_serial_${vo.place_serial}" value="${vo.place_serial }" />
	                                                    <div class="d-flex align-items-center">
	                                                    	<c:if test="${!empty vo.photos}">
	                                                    		<c:forEach var="photo" items="${vo.photos}" begin="0" end="0" varStatus="status">
																    <img class="img-xs rounded" src="../../assets/images/upload/${photo.oriFile }" alt="${photo.oriFile } image">
																</c:forEach>

                                                    				
	                                                        </c:if>
	                                                        
	                                                        <c:if test="${empty vo.photos}">
	                                                        	<img class="img-xs rounded" src="https://via.placeholder.com/150" alt="이미지 없음">
	                                                        </c:if>
	                                                    </div>
	                                                </td>
	                                                <td>${vo.place_name }</td>
	                                                <td>${vo.place_location }</td>
	                                                <td>${vo.place_tel }</td>
	                                                <td>${vo.room_cnt }</td>
	                                                <td>
		                                                <c:if test="${vo.state == 0}">
		                                                	<div class="badge badge-secondary text-muted">비활성화</div>
		                                                </c:if>
		                                                <c:if test="${vo.state == 1}">
		                                                	<div class="badge badge-primary">활성화</div>
		                                                </c:if>
	                                                </td>
	                                                <td>
	                                                    <button type="button" class="btn btn-outline-primary" id="btnPtnHtView_${vo.place_serial }" onclick="ptn.go(${vo.place_serial})">View</button>
	                                                </td>
	                                            </tr>
                                        	
                                        	</c:forEach>
                                            
                                            
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <!-- 사용자 정보 modal -->
        <div class="modal fade" id="ModalHotelInfo" tabindex="-1" role="dialog" aria-labelledby="ModalHotelInfo" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel-2">호텔정보 상세조회</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pt-2">

                        <form action="" name="frmAdmHtCompAdd" id="frmAdmHtCompAdd" class="pt-2">
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">지역 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <select class="form-control" id="htPlaceNm" required>
				                        <option value="">선택해주세요.</option>
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
                                    <input class="form-control" maxlength="50" name="admHComptNm" id="admHComptNm" type="text">
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
                                    	<div class="col-md-12 mb-2">
                                    		<input type="file" name="fileName1" class="dropify" multiple="multiple" />
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
				                                <input type="checkbox" class="form-check-input" name="parking" id="parking"> 주차장 <i class="input-helper"></i></label>
				                            </div>
                                   		</div>
                                   	</div>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label for="address_etc" class="col-form-label">보유객실</label>
                                </div>
                                <div class="col-lg-8">
                                    <p class="mb-0 py-2">A호텔 스위트룸</p>
                                    <p class="mb-0 py-2">A호텔 패밀리룸</p>
                                    <p class="mb-0 py-2">A호텔 디럭스룸</p>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-secondary" onclick="showSwal('warning-message-and-cancel')">비활성화</button>
                        <button type="button" class="btn btn-danger" onclick="showSwal('warning-message-and-cancel')">삭제</button>
                        <button type="button" class="btn btn-success" onclick="showSwal('success-message')">저장</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of 사용자 정보 modal -->
        
        
       
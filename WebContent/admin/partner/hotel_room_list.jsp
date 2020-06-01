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
		                            	<span class="breadcrumb-item active" aria-current="page">객실 관리</span>
		                            </h5>

                                </div>

                                <div class="ml-auto d-flex align-items-stretch justify-content-end">
                                    <a href="./?inc=hotel_room_add.ph" class="btn btn-inverse-primary no-wrap ml-4">객실등록</a>
                                </div>
                            </div>
                            <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <form class="table-responsive" name="frmAdmHtRmList" id="frmAdmHtRmList" method="post" enctype="multipart/form-data"> 
                                    <table id="order-listing" class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th></th>
                                                <th>호텔명</th>
                                                <th>객실유형</th>
                                                <th>가격</th>
                                                <th>옵션</th>
                                                <th>판매 상태</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                        	<input type="text" name="rooms_serial" id="rooms_serial" />
                                        	<c:forEach var="vo" items="${list }" varStatus="i">
	                                            <tr>
	                                                <td>${vo.rooms_serial }</td>
	                                                <td>
	                                                	<input type="text" name="place_serial_${i.count }" value="${vo.place_serial }" id="place_serial_${i.count }" />
	                                                	<input type="hidden"  id="rooms_serial_${vo.rooms_serial}" name="rooms_serial_${vo.rooms_serial}" value="${vo.rooms_serial }" />
	                                                    <div class="d-flex align-items-center">
	                                                    	<c:if test="${!empty vo.photos}">
	                                                    		<c:forEach var="photo" items="${vo.photos}" begin="0" end="0" varStatus="status">
																    <img class="img-lg rounded" src="../../assets/images/upload/${photo.sysFile }" alt="${photo.oriFile } image">
																</c:forEach>
	                                                        </c:if>
	                                                        
	                                                        <c:if test="${empty vo.photos}">
	                                                        	<img class="img-xs rounded" src="https://via.placeholder.com/150" alt="이미지 없음">
	                                                        </c:if>
	                                                    </div>
	                                                </td>
	                                                <td>${vo.place_name }</td>
	                                                <td>
	                                                	<c:if test="${vo.rooms_name == 1}">디럭스</c:if>
	                                                	<c:if test="${vo.rooms_name == 2}">패밀리</c:if>
	                                                	<c:if test="${vo.rooms_name == 3}">스위트</c:if>
	                                                </td>
	                                                <td>${vo.price } 원</td>
	                                                <td>
	                                                	<c:if test="${vo.no_smoking == 1}">금연</c:if>
	                                                	<c:if test="${vo.mt_view == 1}">마운틴뷰</c:if>
	                                                	<c:if test="${vo.ocean_view == 1}">오션뷰</c:if>
	                                                	<c:if test="${vo.city_view == 1}">시티뷰</c:if>
													</td>
	                                                <td>
		                                                <c:if test="${vo.state == 0}">
		                                                	<div class="badge badge-secondary text-muted">비활성화</div>
		                                                </c:if>
		                                                <c:if test="${vo.state == 1}">
		                                                	<div class="badge badge-primary">활성화</div>
		                                                </c:if>
	                                                </td>
	                                                <td>
	                                                    <button class="btn btn-outline-primary" id="btnPtRmView_${vo.rooms_serial }" onclick="roomDetialView(${vo.rooms_serial})">View</button>
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
                        <h5 class="modal-title" id="exampleModalLabel-2">객실정보 상세조회</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pt-2">

                        <form action="" name="frmAdmHtRmDtView" id="frmAdmHtRmDtView" class="pt-2">
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
                                    <label class="col-form-label">가격 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input class="form-control" name="price" value="${vo.price }" data-inputmask="'alias': 'currency'" im-insert="true" style="text-align: right;">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">사진</label>
                                </div>
                                <div class="col-lg-8">
                                    <div class="row">
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

                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">옵션</label>
                                </div>
                                <div class="col-lg-8">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 오션뷰 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 시티뷰 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 마운틴뷰 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                    </div>
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
	
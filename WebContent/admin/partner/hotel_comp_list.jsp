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
                                    <a href="./?inc=hotel_comp_add.jsp" class="btn btn-inverse-primary no-wrap ml-4">호텔등록</a>
                                </div>
                            </div>
                            <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="table-responsive">
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
	                                                    <div class="d-flex align-items-center">
	                                                    	<c:if test="${vo.photo_name }">
	                                                        	<img class="img-xs rounded" src="../../assets/images/upload/hotel/${vo.photo_name }" alt="profile image">
	                                                        </c:if>
	                                                        
	                                                        <c:if test="${vo.photo_name == null}">
	                                                        	<img class="img-xs rounded" src="https://via.placeholder.com/150" alt="${vo.place_name } image">
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
	                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
	                                                </td>
	                                            </tr>
                                        	
                                        	</c:forEach>
                                            
                                            
                                        </tbody>
                                    </table>
                                </div>
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
                                    <label for="zonecode" class="col-form-label">우편번호 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" value="${vo.zip }" required="required" id="zonecode" name="zonecode" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress();">우편번호 찾기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label for="address" class="col-form-label">주소 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" value="${vo.addr1 }" required="required" id="address" name="address" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label for="address_etc" class="col-form-label">상세주소 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" value="${vo.addr2 }" required="required" id="address2" name="address2">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">사진</label>
                                </div>
                                <div class="col-lg-8">
                                    <div class="row">
                                        <div class="col-md-6 mb-2">
                                            <input type="file" class="dropify" />
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <input type="file" class="dropify" />
                                        </div>
                                        <div class="col-md-6 mb-2">
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
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> Wi-Fi <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 금연 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 주차장 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
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

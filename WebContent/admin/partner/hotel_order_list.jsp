<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div class="row">
        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 grid-margin stretch-card">
            <div class="card card-statistics">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-left">
                            <i class="mdi mdi-cube text-danger icon-lg"></i>
                        </div>
                        <div class="float-right">
                            <p class="mb-0 text-right">전체예약건수</p>
                            <div class="fluid-container">
                                <h3 class="font-weight-medium text-right mb-0">6,560</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 grid-margin stretch-card">
            <div class="card card-statistics">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-left">
                            <i class="mdi mdi-receipt text-warning icon-lg"></i>
                        </div>
                        <div class="float-right">
                            <p class="mb-0 text-right">예약취소</p>
                            <div class="fluid-container">
                                <h3 class="font-weight-medium text-right mb-0">3,455</h3>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 grid-margin stretch-card">
            <div class="card card-statistics">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-left">
                            <i class="mdi mdi-account-box-multiple text-info icon-lg"></i>
                        </div>
                        <div class="float-right">
                            <p class="mb-0 text-right">총 매출액</p>
                            <div class="fluid-container">
                                <h3 class="mb-0 font-weight-medium text-right">￦ 32,451,690</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex pb-4 mb-4 border-bottom">
                        <div class="d-flex align-items-center">
                            <h5 class="page-title mb-n2 font-weight-bold">
                                <span class="breadcrumb-item active" aria-current="page">예약관리</span>
                            </h5>
                        </div>
                    </div>

                    <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="table-responsive">
                            <table id="order-listing" class="table">
                                <thead>
                                    <tr>
                                        <th>예약번호</th>
                                        <th>호텔명</th>
                                        <th>객실유형</th>
                                        <th>가격</th>
                                        <th>아이디</th>
                                        <th>체크인</th>
                                        <th>체크아웃</th>
                                        <th>상태</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="vo" items="${list }" varStatus="i">
	                                    <tr>
	                                        <td>${vo.booking_serial }</td>
	                                        <td>${vo.place_name }</td>
	                                        <td>${vo.rooms_name }</td>
	                                        <td>${vo.price }원</td>
	                                        <td>${vo.member_id }</td>
	                                        <td>${vo.checkin_date }</td>
	                                        <td>${vo.checkout_date }</td>
	                                        <td>
	                                        	<c:if test="${vo.state == 1 }">                                        	
		                                            <div class="badge badge-inverse-primary text-muted font-weight-bold">예약완료</div>
	                                        	</c:if>
	                                        	<c:if test="${vo.state == 2 }">                                        	
		                                            <div class="badge badge-inverse-secondary text-muted font-weight-bold">예약취소</div>
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
                    <h5 class="modal-title" id="exampleModalLabel-2">예약정보 상세조회</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pt-2">
                    <div class="wrapper d-flex align-items-center py-2 mb-3">
                        <img class="img-sm rounded-circle" src="../../assets/images/faces/face5.jpg" alt="profile">
                        <div class="wrapper ml-3">
                            <h6 class="ml-1 mb-1">Stella Davidson</h6>
                        </div>
                        <small class="time d-none d-sm-block ml-auto ">2018.02.05 예약됨</small>
                    </div>
                    <form class="" name="usrInfoFrm">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">사용자명</label>
                                    <p id="usrInfoUsrNm" class="">userNm</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">주문번호</label>
                                    <p id="usrInfoTel" class="">20200428051</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">호텔명</label>
                                    <p id="usrInfoUsrNm" class="">A Hotel</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">객실유형</label>
                                    <p id="usrInfoUsrNm" class="">스위트</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">체크인</label>
                                    <p id="usrInfoUsrNm" class="">2020/04/28</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">체크아웃</label>
                                    <p id="usrInfoUsrNm" class="">2020/04/29</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">상태</label>
                                    <p><span class="badge badge-inverse-primary font-weight-bold">예약완료</span></p>

                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-danger" onclick="showSwal('custom-html')">예약취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end of 사용자 정보 modal -->
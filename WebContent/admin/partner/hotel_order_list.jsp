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
                                <h3 class="font-weight-medium text-right mb-0">${info.orderCnt }</h3>
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
                                <h3 class="font-weight-medium text-right mb-0">${info.cancleCnt }</h3>
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
                                <h3 class="mb-0 font-weight-medium text-right">￦ ${info.sales }</h3>
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
	                                            <button class="btn btn-outline-primary" id="btnHtOrderModal" onclick="orderDtView(${vo.booking_serial})">View</button>
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
	
	<jsp:include page="./hotel_order_modal.jsp" />

	
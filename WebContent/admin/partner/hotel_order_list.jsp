<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	                                        <td id="bserial_${vo.booking_serial }">${vo.booking_serial }</td>
	                                        <td id="placeNm_${vo.booking_serial }">${vo.place_name }</td>
	                                        <td id="roomNm_${vo.booking_serial }">
	                                        	<c:if test="${vo.rooms_name == 1 }">디럭스</c:if>
	                                        	<c:if test="${vo.rooms_name == 2 }">패밀리</c:if>
	                                        	<c:if test="${vo.rooms_name == 3 }">스위트</c:if>
	                                        </td>
	                                        <td id="price_${vo.booking_serial }">${vo.price }원</td>
	                                        <td id="memberId_${vo.booking_serial }">${vo.member_id }</td>
	                                        <td id="chkIn_${vo.booking_serial }">
	                                        	<fmt:formatDate value="${vo.checkin_date }" pattern="yyyy-MM-dd"/>
	                                        </td>
	                                        <td id="chkOut_${vo.booking_serial }"> 
	                                        	<fmt:formatDate value="${vo.checkout_date }" pattern="yyyy-MM-dd"/>
	                                        </td>
	                                        <td>
	                                        	<c:if test="${vo.state == 1 }">                                        	
		                                            <div id="state_${vo.booking_serial }" class="badge badge-inverse-primary font-weight-bold">예약완료</div>
		                                        </c:if>
	                                        	<c:if test="${vo.state == 2 }">                                        	
		                                            <div id="state_${vo.booking_serial }" class="badge badge-inverse-secondary text-muted font-weight-bold">예약취소</div>
	                                        	</c:if>
	                                        </td>
	                                        <td>
	                                        	<c:if test="${empty vo.member_photo }">
	                                        		<input type="hidden" id="memberPhoto_${vo.booking_serial }" value="queen.png" />
	                                        	</c:if>
	                                        	<c:if test="${!empty vo.member_photo }">
		                                        	<input type="hidden" name="" id="memberPhoto_${vo.booking_serial }" value="${vo.member_photo }" />	                                        	
	                                        	</c:if>
	                                        	<span class="d-none" id="reserveDt_${vo.booking_serial }"><fmt:formatDate value="${vo.reserve_date}" pattern="yyyy-MM-dd"/></span>
	                                        	<input type="hidden" name="" id="memberNm_${vo.booking_serial }" value="${vo.member_name }"/>
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
	<form action="" name="frmAdmHtOrder" id="frmAdmHtOrder" method="post">
		<input type="text" name="bserial" id="bserial" />
	</form>
	<jsp:include page="./hotel_order_modal.jsp" />
	
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <span class="breadcrumb-item active" aria-current="page">호텔 정보 상세조회</span>
                            </h5>
                        </div>
                        <div class="ml-auto d-flex align-items-stretch justify-content-end">
                            <button type="button" id="btnPtHtModify" class="btn btn-inverse-success no-wrap ml-4">수정</button>
                            <button type="button" id="btnPtHtDelete" class="btn btn-inverse-danger no-wrap ml-2">삭제</button>
                        </div>
                    </div> 
                    <form class="" name="frmAdmHtCompView" id='frmAdmHtCompView' method="post"> 
                        <input type="hidden" name="pserial" id="pserial" value="${serial }" /> 
					
                        <div class=""> 
                            <div class="d-flex justify-content-center justify-content-md-between mr-4 mr-xl-5 pr-xl-5 flex-wrap">
                                <div class="profile-info d-flex align-items-center justify-content-center flex-wrap mr-sm-3">
                                	<c:if test="${!empty vo.photos}">
                                   		<c:forEach var="photo" items="${vo.photos}" varStatus="status">
										    <img class="img-xl rounded mr-2" src="../../assets/images/upload/${photo.sysFile }" alt="${photo.oriFile } image">
										</c:forEach>
                                    </c:if>           
                                    <c:if test="${empty vo.photos}">
                                    	<img class="img-xl rounded" src="https://via.placeholder.com/150" alt="이미지 없음">
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
                    </form>
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
                                                <p>
                                                    <strong>지역 :</strong>
													<c:if test="${vo.local_code == 1 }">
														서울 
													</c:if>
													<c:if test="${vo.local_code == 2 }">
														인천 
													</c:if>
													<c:if test="${vo.local_code == 3 }">
														제주 
													</c:if>
													<c:if test="${vo.local_code == 4 }">
														대구 
													</c:if>
													<c:if test="${vo.local_code == 6 }">
														부산 
													</c:if>
													<c:if test="${vo.local_code == 31 }">
														경기도 
													</c:if>
                                                </p>
                                                <p>
                                                    <strong>호텔명 :</strong> ${vo.place_name }
                                                </p>
                                                <p>
                                                    <strong>연락처 :</strong> ${vo.place_tel }
                                                </p>
                                            </div>
                                            <div class="col-6">
                                                <p>

                                                    <strong>주소 :</strong> ${vo.place_location }
                                                </p>
                                                <p>
                                                    <strong>옵션 :</strong>
                                                    <c:if test='${vo.breakfast == 1 }'>
                                                        조식
                                                    </c:if>
                                                    <c:if test='${vo.wifi == 1 }'>
                                                        wifi
                                                    </c:if>
                                                    <c:if test='${vo.parking == 1 }'>
                                                        주차장
                                                    </c:if>
                                                </p>
                                                <p>
                                                    <strong>판매상태 :</strong> 
                                                    <c:if test="${vo.state == 0}">
	                                                	<span class="badge badge-secondary text-muted">비활성화</span>
	                                                </c:if>
	                                                <c:if test="${vo.state == 1}">
	                                                	<span class="badge badge-primary">활성화</span>
	                                                </c:if>
                                                </p>
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
                                                                <c:forEach var="roomVo" items="${roomList }" varStatus="i">
	                                                                <tr>
	                                                                    <td>${i.count }</td>
	                                                                    <td>
	                                                                        <div class="d-flex align-items-center">
	                                                                            <c:if test="${!empty roomVo.photos}">
						                                                    		<c:forEach var="photo" items="${roomVo.photos}" begin="0" end="0" varStatus="status">
																					    <img class="img-lg rounded" src="../../assets/images/upload/${photo.sysFile }" alt="${photo.oriFile } image">
																					</c:forEach>
						                                                        </c:if>
						                                                        
						                                                        <c:if test="${empty roomVo.photos}">
						                                                        	<img class="img-xs rounded" src="https://via.placeholder.com/150" alt="이미지 없음">
						                                                        </c:if>
	                                                                        </div>
	                                                                    </td>
	                                                                    <td>
	                                                                    	<c:if test="${roomVo.rooms_name == 1}">디럭스</c:if>
						                                                	<c:if test="${roomVo.rooms_name == 2}">패밀리</c:if>
						                                                	<c:if test="${roomVo.rooms_name == 3}">스위트</c:if>
	                                                                    </td>
	                                                                    <td><fmt:formatNumber value="${roomVo.price }" type="currency"/></td>
	                                                                    <td>
	                                                                    	<c:if test="${roomVo.no_smoking == 1}">금연</c:if>
						                                                	<c:if test="${roomVo.mt_view == 1}">마운틴뷰</c:if>
						                                                	<c:if test="${roomVo.ocean_view == 1}">오션뷰</c:if>
						                                                	<c:if test="${roomVo.city_view == 1}">시티뷰</c:if>
	                                                                    </td>
	                                                                    <td>
							                                                <c:if test="${roomVo.state == 0}">
							                                                	<div class="badge badge-secondary text-muted">비활성화</div>
							                                                </c:if>
							                                                <c:if test="${roomVo.state == 1}">
							                                                	<div class="badge badge-primary">활성화</div>
							                                                </c:if>
						                                                </td>
	                                                                    <td>
	                                                                        <button type="button" class="btn btn-outline-primary" id="btnPtRmView_${roomVo.rooms_serial }" onclick="roomDetialView(${roomVo.rooms_serial})">View</button>
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
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
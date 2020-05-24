<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <div class="row profile-page">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item">
		                                    <a href="#">파트너 관리</a>
		                                </span>
		                                <span class="breadcrumb-item active" aria-current="page">파트너 정보 상세조회</span>
		                            </h5>
                                </div>

                            </div>
                            <div class="">
                                <div class="d-flex justify-content-center justify-content-md-between mx-4 mx-xl-5 px-xl-5 flex-wrap">
                                    <div class="profile-info d-flex align-items-center justify-content-center flex-wrap mr-sm-3">
                                        <img class="rounded-circle img-lg mb-3 mb-sm-0" src="../../assets/images/faces/profile/profile.jpg" alt="profile image">
                                        <div class="wrapper pl-sm-4">
                                            <p class="profile-user-name text-center text-sm-left">${pv.member_id }</p>
                                            <div class="wrapper d-flex flex-wrap">
                                                <button type="button" class="btn btn-outline-primary" id="btnAdmStateCh" onclick="show('deprive','${pv.member_id}')">파트너 권한 박탈</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="details mt-2 mt-md-0">
                                        <div class="detail-col pr-3 mr-3">
                                            <p class="font-weight-bold">Product</p>
                                            <p>130</p>
                                        </div>
                                        <div class="detail-col">
                                            <p class="font-weight-bold">Sales</p>
                                            <p>43</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-body">
                                <ul class="nav tab-switch" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="user-profile-info-tab" data-toggle="pill" href="#user-profile-info" role="tab" aria-controls="user-profile-info" aria-selected="true">Profile</a>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="tab-content tab-body" id="profile-log-switch">
                                            <div class="tab-pane fade pr-3 active show" id="user-profile-info" role="tabpanel" aria-labelledby="user-profile-info-tab">
                                                <div class="row mt-3 pl-3">
                                                    <div class="col-6">
                                                        <p>
                                                            <strong>회사명 :</strong> ${pv.partner_name }
                                                        </p>
                                                        <p>
                                                            <strong>사업자등록번호 :</strong> ${pv.business_number }
                                                        </p>
                                                        <p>
                                                            <strong>연락처 :</strong> ${pv.partner_phone }
                                                        </p>
                                                    </div>
                                                    <div class="col-6">
                                                        <p>
                                                            <strong>이메일 :</strong> ${pv.vo.email }
                                                        </p>
                                                        <p>
                                                            <strong>파트너 분류 :</strong>
                                                            <c:if test='${pv.state ==8 }'>
                                                             	렌트
                                                            </c:if>
                                                            <c:if test='${pv.state ==9 }'>
                                                            	호텔
                                                            </c:if>
                                                        </p>
                                                        <p>
                                                            <strong>주소 :</strong> ${pv.partner_location }
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 mt-5">
                                                        <h5 class="mb-3">등록된 상품 목록</h5>
                                                        <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                                            <div class="table-responsive">
                                                                <table id="product-listing" class="table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>-</th>
                                                                            <th>상품명</th>
                                                                            <th>누적 판매금액</th>
                                                                            <th>누적 판매개수</th>
                                                                            <th>등록일</th>
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
                                                                            <td>호텔</td>
                                                                            <td>3,552,600원</td>
                                                                            <td>253개</td>
                                                                            <td>2019.09.12</td>
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
                        </div>
                    </div>
                </div>
            </div>
            

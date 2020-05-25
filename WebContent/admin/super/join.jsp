<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                    	<div class="d-flex pb-4 mb-4 border-bottom">
                      <div class="d-flex align-items-center">
                          <h5 class="page-title mb-n2 font-weight-bold">
                          	<span class="breadcrumb-item active" aria-current="page">파트너 가입 승인</span>
                          </h5>
                      </div>
                      
                  </div>
                        <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                            <div class="table-responsive">
                                <table id="order-listing" class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>아이디</th>
                                            <th>파트너 분류</th> 
                                            <th>회사명</th>
                                            <th>사업자등록번호</th>
                                            <th>상태</th> 
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <c:forEach var='i' items='${list }' varStatus="status"> <!-- 컨트롤러에서 list로한게 이리들어옴 -->
                                        <tr>
                                            <td>${status.count }</td>
                                            <td>${i.member_id }</td>
                                            <c:if test='${i.state==888 }'>
                                            	<td>렌트 파트너 신청</td>
											</c:if>
											<c:if test='${i.state==999 }'>
                                            	<td>호텔 파트너 신청</td>
											</c:if>
                                            <td>${i.partner_name }</td>
                                            <td>${i.business_number }</td>
                                            <td>
                                                <label class="badge font-weight-bold badge-inverse-warning">승인대기</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#modalPartnerJoin"
                                                onclick="a_partner_view('${i.member_id }','${i.partner_name }','${i.business_number }','${i.partner_phone }',
                                                		'${i.partner_location}','${i.state}','${i.vo.email}')">View</button>
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
    <div class="modal fade" id="modalPartnerJoin" tabindex="-1" role="dialog" aria-labelledby="modalPartnerJoin" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel-2">승인요청 상세조회</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pt-2">
                    <div class="wrapper d-flex align-items-center py-2 mb-3">
                        <img class="img-sm rounded-circle" src="../../assets/images/faces/face5.jpg" alt="profile">
                        <div class="wrapper ml-3">
                            <h6 class="ml-1 mb-1" id='member_id'></h6>
                        </div>
                        <small class="time d-none d-sm-block ml-auto ">2018.02.05 요청됨</small>
                    </div>
                    <form class="" name="usrInfoFrm" id='p_form'>
                        <div class="row">
                           <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">구분</label>
                                    <p id="usrInfoUsrNm" class="">파트너 가입 승인</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">상태</label>
                                      
                                       <p id='state2'></p>
                                    
                                    <!-- 
                                    <p><label class="badge font-weight-bold badge-inverse-warning">승인대기</label></p>
                                     -->
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">업체명</label>
                                    <p id="usrInfoUsrNm" class="partner_name"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">사업자등록번호</label>
                                    <p class='business_number'></p>
                                </div> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">이메일</label>
                                    <p class='eamil'></p>   		
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">연락처</label>
                                    <p class='partner_phone'></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="">주소</label>
                                    <p class='partner_location'></p>
                                </div>
                            </div>
                        </div>
                    <input type='hidden'  id='p_id' name='p_id'>
		            <input type='hidden'  id='p_save' name='p_save'> 
                    </form>
                </div> 
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" onclick="showSwal('custom-html')">거절</button>
					<button type="button" class="btn btn-success" id='partner_save'>승인</button>
                    
                    
                    <!-- 
                    <button type="button" class="btn btn-success" onclick="showSwal('success-message')">승인</button>
                     -->
                </div>
            </div>
        </div>
     </div>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="../../js/admin.js">    
</script>
    
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                    	<div class="d-flex pb-4 mb-4 border-bottom">
                      <div class="d-flex align-items-center">
                          <h5 class="page-title mb-n2 font-weight-bold">
                          	<span class="breadcrumb-item active" aria-current="page">회원관리</span>
                          </h5>
                      </div>
                      
                  </div>
                        <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                            <div class="table-responsive">
                                <table id="order-listing" class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>가입일</th>
                                            <th>사용자 권한</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <%-- <c:forEach var='i' items='${list }'>
										<div class='items row' onclick='brd.view(${i.serial})'>
											<span class ='no col-md-1'>${i.serial }</span>
											<span class='subject col-md-3'>${i.subject }</span>
											<span class='id col-md-3'>${i.id }</span>
											<span class='mDate col-md-3'>${i.mDate }</span>
											<span class='hit col-md-1'>${i.hit }</span>
										</div>	
									
									</c:forEach> --%>
                                    <tbody>
                                       <c:forEach var='i' items='${list }' varStatus="status"> <!-- 컨트롤러에서 list로한게 이리들어옴 -->
                                        <tr>
                                            <td>${status.count }</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face2.jpg" alt="profile image">
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">${i.member_name }</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>${i.member_id }</td>
                                            <td>${i.phone }</td>
                                            <td>${i.email }</td>
                                            <td><fmt:formatDate value="${i.mDate}" pattern="yyyy-MM-dd"/></td>
                                            <td>
                                            	<c:if test='${i.state==1 }'>
                                 	               <label class="badge badge-inverse-info">user</label>
												</c:if>
												<c:if test='${i.state==88 }'>
                                        	        <label class="badge badge-inverse-primary">partner</label>
												</c:if>
												<c:if test='${i.state==99 }'>
                                                	<label class="badge badge-inverse-danger">admin</label>
												</c:if>
												
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalUserInfo" 
                                                	onclick="member_view('${i.member_id }','${i.member_name }','${i.phone }','${i.email }',
                                                		'${i.state}','<fmt:formatDate value="${i.mDate}" pattern="yyyy-MM-dd"/>' )">View
                                                </button>
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
    <div class="modal fade" id="ModalUserInfo" tabindex="-1" role="dialog" aria-labelledby="ModalUserInfo" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel-2">회원정보 상세조회</h5>
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
                        <small class="time d-none d-sm-block ml-auto " id='member_date'></small>
                    </div>
                    <form class="" name="usrInfoFrm">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">사용자명</label>
                                    <p id="usrInfoUsrNm" class="member_name"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">연락처</label>
                                    <p id="usrInfoTel" class="member_phone"></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">이메일</label>
                                    <p id="usrInfoUsrNm" class="member_email"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">사용자 권한</label>
                                    <select class="form-control" id="member_state">
                                        <option>User</option>
                                        <option>Partner</option>
                                        <option>Admin</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-success">저장</button>
                </div>
            </div>
        </div>
    </div>
    
           
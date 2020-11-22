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
                                    <tbody>
                                       <c:forEach var='i' items='${list }' varStatus="status"> <!-- 컨트롤러에서 list로한게 이리들어옴 -->
                                        <tr>
                                            <td>${status.count }</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs rounded-circle" src="../../images/myPage/${ empty i.member_photo? 'queen.png' : i.member_photo }" alt="profile image">
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
												<c:if test='${i.state==2 }'>
                                                	<label class="badge badge-inverse-warning">회원탈요청</label>
												</c:if>
												
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalUserInfo" 
                                                	onclick="member_view('${i.member_id }','${i.member_name }','${i.phone }','${i.email }',
                                                		'${i.state}','<fmt:formatDate value="${i.mDate}" pattern="yyyy-MM-dd"/>' ,'${i.member_photo }') ">View
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
 	                      <img class="img-sm rounded-circle member_photo" alt="profile">
                        <div class="wrapper ml-3">
                            <h6 class="ml-1 mb-1" id='member_id'></h6>
                        </div>
                        <small class="time d-none d-sm-block ml-auto " id='member_date'></small>
                    </div>
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
             		<form id='hidden_form'><!-- 수정해주기위해  폼으로..js로보낸다 -->
                                    <label class="">사용자 권한</label>
                                    <select class="form-control" id="usrInfoState"  name='hidden_status'>
                                        <option value='1'>User</option>
                                        <option value='99'>Admin</option>
                                    </select>
		             		<input type='hidden'  id='hidden_id' name='hidden_id'>
		             		<input type='hidden'  id='hidden_status'> 
             		</form>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-success" id='member_save'>저장</button>
             		
                </div>
            </div>
        </div>
    </div>
  
          
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
                         	<span class="breadcrumb-item active" aria-current="page">회원탈퇴 승인</span>
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
                                           <th>연락처</th> 
                                           <th>이메일</th>
                                           <th>사용자 권한</th>
                                           <th>상태</th> 
                                           <th>Actions</th>
                                       </tr>
                                   </thead>
                                   <tbody>
                                   <c:forEach var='i' items='${list }' varStatus="status"> <!-- 컨트롤러에서 list로한게 이리들어옴 -->
                                       <tr>
                                           <td>${status.count }</td>
                                           <td>${i.member_id }</td>
                                           <td>${i.phone }</td>
                                           <td>${i.email }</td>
	                                       <td>
	                                           <c:if test='${i.state == 2}'>
                                            <p class="badge font-weight-bold badge-inverse-info">User</p>
	                                           </c:if>
	                                       </td>
                                           <td>
                                               <label class="badge font-weight-bold badge-inverse-warning">승인대기</label>
                                           </td>
                                           <td>
                                               <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalUserOut"
                                               onclick="member_out_view('${i.member_name }','${i.phone }','${i.email }','${i.state }','<fmt:formatDate value="${i.mDate}" pattern="yyyy-MM-dd"/>','${i.member_id }')"
                                               >View</button>
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
   <div class="modal fade" id="ModalUserOut" tabindex="-1" role="dialog" aria-labelledby="ModalUserOut" aria-hidden="true">
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
                           <h6 class="ml-1 mb-1" id='idid'></h6>
                       </div>
                       <small class="time d-none d-sm-block ml-auto " id='datedate'></small>
                   </div>
                   <form class="out_form" id="out_form" name="usrInfoFrm">
                       <div class="row">
                          <div class="col-md-6">
                               <div class="form-group">
                                   <label class="">구분</label>
                                   <p id="usrInfoUsrNm" class="">회원탈퇴 승인</p>
                               </div>
                           </div> 
                           <div class="col-md-6">
                               <div class="form-group">
                                   <label class="">상태</label>
                                   <p><label class="badge font-weight-bold badge-inverse-warning">승인대기</label></p>
                               </div>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-md-6">
                               <div class="form-group">
                                   <label class="">사용자명</label>
                                   <p id="usrInfoUsrNm" class="naname"></p>
                               </div>
                           </div>
                           <div class="col-md-6">
                               <div class="form-group">
                                   <label class="">연락처</label>
                                   <p id="usrInfoTel" class="phonephone"></p>
                               </div>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-md-6">
                               <div class="form-group">
                                   <label class="">이메일</label>
                                   <p id="usrInfoUsrNm" class="emailemail"></p>
                               </div>
                           </div>
                           <div class="col-md-6">
                               <div class="form-group">
                                   <label class="">사용자 권한</label>
                                   	<p><label class="badge font-weight-bold badge-inverse-info">User</label></p>
                               </div> 
                           </div>
                       </div>
                       <input type='hidden'  id='out_id' name='out_id'>
		           	   <input type='hidden'  id='out_state' name='out_state'>
                   </form>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-success" id="out_save">승인</button>
               </div>
           </div>
       </div>
     </div>

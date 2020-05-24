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
                         	<span class="breadcrumb-item active">파트너 관리</span>
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
                                           <th>보유상품 수</th>
                                           <th>이메일 </th>
                                           <th>Actions</th>
                                       </tr>
                                   </thead>
                                   <tbody>
                                   	<c:forEach var='i' items='${list }' varStatus="status"> <!-- 컨트롤러에서 list로한게 이리들어옴 -->
                                       <tr>
                                       	 <td>${status.count }</td>
                                           <td>
                                               <div class="d-flex align-items-center">
                                                   <img class="img-xs rounded-circle" src="../../assets/images/faces/face2.jpg" alt="profile image">
                                                   <div class="wrapper pl-2">
                                                       <p class="mb-0 text-gray">${i.member_id }</p>
                                                   </div>
                                               </div>
                                           </td>
                                           <td>
	                                           <c:if test='${i.state==8 }'>
	                                           		렌트
	                                           </c:if>
	                                           <c:if test='${i.state==9 }'>
	                                           		호텔
	                                           </c:if>
                                           </td>
                                           <td>${i.partner_name }</td>
                                           <td>234</td>
                                           <td>${i.vo.email }</td>
                                           <td>
                                               <a class="btn btn-outline-primary" href="./?inc=partner_view.os&member_id=${i.member_id }"<%--  onclick="partner_view('${i.member_id }')" --%>>
                                               View</a>
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
   
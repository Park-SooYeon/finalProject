<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item active" aria-current="page">회사 관리</span>
		                            </h5>

                                </div>

                                <div class="ml-auto d-flex align-items-stretch justify-content-end">
                                    <button type="button" id="btnPtRtInsert" data-toggle="modal" data-target="#ModalRentCompAdd" class="btn btn-inverse-primary no-wrap ml-4">회사등록</button>
                                </div>
                            </div>
                            <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="table-responsive">
                                    <table id="order-listing" class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>업체명</th>
                                                <th>주소</th>
                                               	<th>보유대수</th>
                                                <th>상태</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="vo" items="${list }" varStatus="i">
	                                            <tr>
	                                                <td>${i.count }</td>
	                                                <td id="compNm_${vo.company_serial }">${vo.company_name }</td>
	                                                <td id="compAddr_${vo.company_serial }">${vo.address }</td>
	                                                <td>${vo.cars_count }</td>
	                                                <td>
	                                                	<c:if test="${vo.state eq 'n'}">
		                                                	<div class="badge badge-secondary text-muted" id="state_${vo.company_serial }">비활성화</div>
		                                                </c:if>
		                                                <c:if test="${vo.state eq 'y'}">
		                                                	<div class="badge badge-primary" id="state_${vo.company_serial }">활성화</div>
		                                                </c:if>
	                                                </td>
	                                                <td>
	                                                	<input type="hidden" name="" id="compSerial_${vo.company_serial }" value="${vo.company_serial }" />
	                                                	<input type="hidden" name="" id="latitude_${vo.company_serial }" value="${vo.latitude }" />
	                                                	<input type="hidden" name="" id="longitude_${vo.company_serial }" value="${vo.longitude }" />
	                                                	<input type="hidden" name="" id="compPhone_${vo.company_serial }" value="${vo.company_phone }" />
	                                                    <button class="btn btn-outline-primary" onclick="rentCompDtView(${vo.company_serial})">View</button>
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
		<form action="" name="frmAdmRtComp" id="frmAdmRtComp" method="post">
			<input type="text" name="compSerial" id="compSerial" />
		</form>
        <jsp:include page="./rent_comp_insert_modal.jsp" />
        <jsp:include page="./rent_comp_modify_modal.jsp" />
        
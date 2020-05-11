<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../partials/header.jsp" %>
        <div class="content-wrapper">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item active" aria-current="page">차량 관리</span>
		                            </h5>

                                </div>

                                <div class="ml-auto d-flex align-items-stretch justify-content-end">
                                    <a href="./rent_car_add.jsp" class="btn btn-inverse-primary no-wrap ml-4">차량등록</a>
                                </div>
                            </div>
                            <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="table-responsive">
                                    <table id="order-listing" class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>회사명</th>
                                                <th>차량명</th>
                                                <th>종류</th>
                                                <th>기어타입</th>
                                                <th>탑승자 정원</th>
                                                <th>가격(시간당)</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>A 렌터카</td>
                                                <td>산타페</td>
                                                <td>SUV</td>
                                                <td>auto</td>
                                                <td>5인</td>
                                                <td>20,000원</td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRtCarInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>A 렌터카</td>
                                                <td>산타페</td>
                                                <td>SUV</td>
                                                <td>auto</td>
                                                <td>5인</td>
                                                <td>20,000원</td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRtCarInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>A 렌터카</td>
                                                <td>산타페</td>
                                                <td>SUV</td>
                                                <td>auto</td>
                                                <td>5인</td>
                                                <td>20,000원</td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRtCarInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>A 렌터카</td>
                                                <td>산타페</td>
                                                <td>SUV</td>
                                                <td>auto</td>
                                                <td>5인</td>
                                                <td>20,000원</td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRtCarInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>A 렌터카</td>
                                                <td>산타페</td>
                                                <td>SUV</td>
                                                <td>auto</td>
                                                <td>5인</td>
                                                <td>20,000원</td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRtCarInfo">View</button>
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

        <!-- 사용자 정보 modal -->
        <div class="modal fade" id="ModalRtCarInfo" tabindex="-1" role="dialog" aria-labelledby="ModalRtCarInfo" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel-2">차량정보 상세조회</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pt-2">

                        <form action="" name="frmAdmHtCompAdd" id="frmAdmHtCompAdd" class="pt-2">
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">회사명<span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <select class="form-control" id="rtCompNm">
				                        <option value="">A 렌터카</option>
				                        <option value="">B 렌터카</option>
				                        <option value="">C 렌터카</option>
				                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">차량명 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">종류<span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <select class="form-control" id="rtCompNm">
				                        <option value="">소형</option>
				                        <option value="">중형</option>
				                        <option value="">대형</option>
				                        <option value="">승합</option>
				                        <option value="">SUV/5인승</option>
				                        <option value="">수입/전기차</option>
				                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">가격(시간당) <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input class="form-control" data-inputmask="'alias': 'currency'" im-insert="true" style="text-align: right;">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">사진</label>
                                </div>
                                <div class="col-lg-8">
                                    <div class="row">
                                        <div class="col-md-6 mb-2">
                                            <input type="file" class="dropify" />
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <input type="file" class="dropify" />
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <input type="file" class="dropify" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">차량 문수 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" type="number" min="0">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">기어타입 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" type="number" min="0">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">탑승자 정원 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
	                                    <input class="form-control" type="number" min="0">
	                                </div>
	                            </div>
	                            <div class="form-group row">
	                                <div class="col-lg-3">
	                                    <label class="col-form-label">옵션 <span class="text-danger">*</span></label>
	                                </div>
	                                <div class="col-lg-8">
                                    	<div class="row">
                                    		<div class="col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input"> 짐가방 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input"> 작은가방 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    		<div class="col-6">
                                    			<div class="form-check form-check-flat">
					                              <label class="form-check-label">
					                                <input type="checkbox" class="form-check-input"> 에어컨 <i class="input-helper"></i></label>
					                            </div>
                                    		</div>
                                    	</div>
			                            
									</div>
	                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-danger" onclick="showSwal('warning-message-and-cancel')">삭제</button>
                        <button type="button" class="btn btn-success" onclick="showSwal('success-message')">저장</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of 사용자 정보 modal -->


        <%@include file="../partials/footer.jsp" %>

            <script src="../../assets/js/shared/data-table.js"></script>
            <!-- End custom js for this page -->
            <script>
                // 다음 우편번호 서비스
                function openDaumZipAddress() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            jQuery("#postcode1").val(data.postcode1);
                            jQuery("#postcode2").val(data.postcode2);
                            jQuery("#zonecode").val(data.zonecode);
                            jQuery("#address").val(data.address);
                            jQuery("#address2").focus();
                            console.log(data);
                        }
                    }).open();
                }
            </script>
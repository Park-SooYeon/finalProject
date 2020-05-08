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
                                            <tr>
                                                <td>1</td>
                                                <td>Derrick</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2012/08/03</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-warning">승인대기</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalUserOut">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Austin</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2014/08/03</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-warning">승인대기</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Iva</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2018/08/03</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-success">승인완료</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Della</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2011/08/03</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-success">승인완료</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Alexander</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2017/08/03</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-success">승인완료</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Helen</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2018/09/03</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-warning">승인대기</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>Douglas</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2018/08/23</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-success">승인완료</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td>Jim</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2011/08/03</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-warning">승인대기</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td>Maude</td>
                                                <td>010-0000-0000</td>
                                                <td>abc@domain.com</td>
                                                <td>2018/05/03</td>
                                                <td>
                                                    <label class="badge font-weight-bold badge-inverse-success">승인완료</label>
                                                </td>
                                                <td>
                                                    <button class="btn btn-outline-primary">View</button>
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
                                <h6 class="ml-1 mb-1">Stella Davidson</h6>
                            </div>
                            <small class="time d-none d-sm-block ml-auto ">2018.02.05 가입됨</small>
                        </div>
                        <form class="" name="usrInfoFrm">
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
                                        <p id="usrInfoUsrNm" class="">userNm</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">연락처</label>
                                        <p id="usrInfoTel" class="">010-0000-0000</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">이메일</label>
                                        <p id="usrInfoUsrNm" class="">abc@domain.com</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">사용자 권한</label>
                                        <p><label class="badge font-weight-bold badge-inverse-info">Partner</label></p>
                                    </div> 
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>개선요청사항</label>
                                        <p id="outTxt" class="mb-0">-</p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="showSwal('success-message')">승인</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of 사용자 정보 modal -->

        <%@include file="../partials/footer.jsp" %>
            <!-- Custom js for this page -->
            <script src="../../assets/js/shared/data-table.js"></script>
            <!-- End custom js for this page -->
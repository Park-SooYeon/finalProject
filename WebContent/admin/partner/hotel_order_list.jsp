<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item active" aria-current="page">예약관리</span>
		                            </h5>
                                </div>
                            </div>
                            <div class="row">
						        <div class="col-md-3 grid-margin">
						            <div class="card">
						                <div class="card-body">
					                    	<h4 class="card-title">전체예약건수</h4>
					                        <h3 class="mb-0 font-weight-semibold text-right">32,451</h3>
						                </div>
						            </div>
						        </div>
						        
						        <div class="col-md-3 grid-margin"> 
						            <div class="card">
						                <div class="card-body">
					                    	<h4 class="card-title">예약취소</h4>
					                        <h3 class="mb-0 font-weight-semibold text-right">32,451</h3>
						                </div>
						            </div>
						        </div>
						        <div class="col-md-3 grid-margin">
						            <div class="card">
						                <div class="card-body">
					                    	<h4 class="card-title">예약완료</h4>
					                        <h3 class="mb-0 font-weight-semibold text-right">32,451</h3>
						                </div>
						            </div>
						        </div>
						        
						        <div class="col-md-3 grid-margin">
						            <div class="card">
						                <div class="card-body">
					                    	<h4 class="card-title">투숙완료</h4>
					                        <h3 class="mb-0 font-weight-semibold text-right">32,451</h3>
						                </div>
						            </div>
						        </div>
						    </div>
                            <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="table-responsive">
                                    <table id="order-listing" class="table">
                                        <thead>
                                            <tr>
                                                <th>예약번호</th>
                                                <th>호텔명</th>
                                                <th>객실유형</th>
                                                <th>가격</th>
                                                <th>아이디</th>
                                                <th>체크인</th>
                                                <th>체크아웃</th>
                                                <th>상태</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>20200428051</td>
                                                <td>A Hotel</td>
                                                <td>디럭스</td>
                                                <td>183,000원</td>
                                                <td>Derrick</td>
                                                <td>2020/04/24</td>
                                                <td>2020/04/25</td>
                                                <td><div class="badge badge-inverse-secondary text-muted font-weight-bold">예약취소</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>20200428051</td>
                                                <td>A Hotel</td>
                                                <td>디럭스</td>
                                                <td>183,000원</td>
                                                <td>Derrick</td>
                                                <td>2020/04/24</td>
                                                <td>2020/04/25</td>
                                                <td><div class="badge badge-inverse-primary font-weight-bold">예약완료</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>20200428051</td>
                                                <td>A Hotel</td>
                                                <td>디럭스</td>
                                                <td>183,000원</td>
                                                <td>Derrick</td>
                                                <td>2020/04/24</td>
                                                <td>2020/04/25</td>
                                                <td><div class="badge badge-inverse-warning font-weight-bold">투숙완료</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>20200428051</td>
                                                <td>A Hotel</td>
                                                <td>디럭스</td>
                                                <td>183,000원</td>
                                                <td>Derrick</td>
                                                <td>2020/04/24</td>
                                                <td>2020/04/25</td>
                                                <td><div class="badge badge-inverse-primary font-weight-bold">예약완료</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>20200428051</td>
                                                <td>A Hotel</td>
                                                <td>디럭스</td>
                                                <td>183,000원</td>
                                                <td>Derrick</td>
                                                <td>2020/04/24</td>
                                                <td>2020/04/25</td>
                                                <td><div class="badge badge-inverse-primary font-weight-bold">예약완료</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
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
            
        <!-- 사용자 정보 modal -->
        <div class="modal fade" id="ModalHotelInfo" tabindex="-1" role="dialog" aria-labelledby="ModalHotelInfo" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel-2">예약정보 상세조회</h5>
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
                            <small class="time d-none d-sm-block ml-auto ">2018.02.05 예약됨</small>
                        </div>
                        <form class="" name="usrInfoFrm">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">사용자명</label>
                                        <p id="usrInfoUsrNm" class="">userNm</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">주문번호</label>
                                        <p id="usrInfoTel" class="">20200428051</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">호텔명</label>
                                        <p id="usrInfoUsrNm" class="">A Hotel</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">객실유형</label>
                                        <p id="usrInfoUsrNm" class="">스위트</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">체크인</label>
                                        <p id="usrInfoUsrNm" class="">2020/04/28</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">체크아웃</label>
                                        <p id="usrInfoUsrNm" class="">2020/04/29</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="">상태</label>
                                        <p><span class="badge badge-inverse-primary font-weight-bold">예약완료</span></p>
                                        
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" onclick="showSwal('custom-html')">예약취소</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of 사용자 정보 modal -->

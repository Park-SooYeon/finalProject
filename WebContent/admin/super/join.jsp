<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                        <tr>
                                            <td>1</td>
                                            <td>Derrick</td>
                                            <td>호텔</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
                                            <td>
                                                <label class="badge font-weight-bold badge-inverse-warning">승인대기</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#modalPartnerJoin">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Austin</td>
                                            <td>호텔</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
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
                                            <td>호텔</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
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
                                            <td>호텔</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
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
                                            <td>렌트</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
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
                                            <td>호텔</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
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
                                            <td>호텔</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
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
                                            <td>호텔</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
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
                                            <td>호텔</td>
                                            <td>A업체</td>
                                            <td>34-295849-0923</td>
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
                            <h6 class="ml-1 mb-1">Stella Davidson</h6>
                        </div>
                        <small class="time d-none d-sm-block ml-auto ">2018.02.05 요청됨</small>
                    </div>
                    <form class="" name="usrInfoFrm">
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
                                    <p><label class="badge font-weight-bold badge-inverse-warning">승인대기</label></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">업체명</label>
                                    <p id="usrInfoUsrNm" class="">AB Corp</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">사업자등록번호</label>
                                    <p>329045-329402-23</p>
                                </div> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">이메일</label>
                                    <p>sakdas@domain.com</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">연락처</label>
                                    <p>02-3420-0433</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="">주소</label>
                                    <p>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</p>
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
                    <button type="button" class="btn btn-danger" onclick="showSwal('custom-html')">거절</button>
                    <button type="button" class="btn btn-success" onclick="showSwal('success-message')">승인</button>
                </div>
            </div>
        </div>
    
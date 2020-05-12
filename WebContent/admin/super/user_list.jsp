<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face2.jpg" alt="profile image">
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Derrick Morton</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Derrick</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2012/08/03</td>
                                            <td>
                                                <label class="badge badge-inverse-info">Partner</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalUserInfo">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="img-xs rounded-circle bg-warning text-white text-avatar">AV</span>
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Austin Vaughn</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Austin</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2014/08/03</td>
                                            <td>
                                                <label class="badge badge-inverse-danger">Admin</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face4.jpg" alt="profile image">
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Iva Craig</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Iva</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2018/08/03</td>
                                            <td>
                                                <label class="badge badge-inverse-success">User</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face5.jpg" alt="profile image">
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Della Yates</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Della</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2011/08/03</td>
                                            <td>
                                                <label class="badge badge-inverse-success">User</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="img-xs rounded-circle bg-primary text-white text-avatar">AW</span>
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Alexander Wallace</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Alexander</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2017/08/03</td>
                                            <td>
                                                <label class="badge badge-inverse-success">User</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face7.jpg" alt="profile image">
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Helen Holt</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Helen</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2018/09/03</td>
                                            <td>
                                                <label class="badge badge-inverse-info">Partner</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="img-xs rounded-circle bg-info text-white text-avatar">DR</span>
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Douglas Reese</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Douglas</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2018/08/23</td>
                                            <td>
                                                <label class="badge badge-inverse-success">User</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face9.jpg" alt="profile image">
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Jim Jennings</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Jim</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2011/08/03</td>
                                            <td>
                                                <label class="badge badge-inverse-info">Partner</label>
                                            </td>
                                            <td>
                                                <button class="btn btn-outline-primary">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="img-xs rounded-circle bg-primary text-white text-avatar">MH</span>
                                                    <div class="wrapper pl-2">
                                                        <p class="mb-0 text-gray">Maude Hawkins</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Maude</td>
                                            <td>010-0000-0000</td>
                                            <td>abc@domain.com</td>
                                            <td>2018/05/03</td>
                                            <td>
                                                <label class="badge badge-inverse-success">User</label>
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
                            <h6 class="ml-1 mb-1">Stella Davidson</h6>
                        </div>
                        <small class="time d-none d-sm-block ml-auto ">2018.02.05 가입됨</small>
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
                                    <select class="form-control" id="usrInfoState">
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
    
           
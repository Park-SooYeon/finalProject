<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item active" aria-current="page">호텔 관리</span>
		                            </h5>

                                </div>

                                <div class="ml-auto d-flex align-items-stretch justify-content-end">
                                    <a href="./?inc=hotel_comp_add.jsp" class="btn btn-inverse-primary no-wrap ml-4">호텔등록</a>
                                </div>
                            </div>
                            <div id="order-listing_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="table-responsive">
                                    <table id="order-listing" class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>-</th>
                                                <th>호텔명</th>
                                                <th>주소</th>
                                                <th>연락처</th>
                                                <th>보유객실</th>
                                                <th>상태</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img class="img-xs rounded" src="../../assets/images/faces/face2.jpg" alt="profile image">
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <span class="img-xs rounded bg-warning text-white text-avatar">AV</span>
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img class="img-xs rounded" src="../../assets/images/faces/face4.jpg" alt="profile image">
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img class="img-xs rounded" src="../../assets/images/faces/face5.jpg" alt="profile image">
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <span class="img-xs rounded bg-primary text-white text-avatar">AW</span>
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-secondary text-muted">비활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img class="img-xs rounded" src="../../assets/images/faces/face7.jpg" alt="profile image">
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <span class="img-xs rounded bg-info text-white text-avatar">DR</span>
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img class="img-xs rounded" src="../../assets/images/faces/face9.jpg" alt="profile image">
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalHotelInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <span class="img-xs rounded bg-primary text-white text-avatar">MH</span>
                                                    </div>
                                                </td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>02-2341-5123</td>
                                                <td>9개</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
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
                        <h5 class="modal-title" id="exampleModalLabel-2">호텔정보 상세조회</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pt-2">

                        <form action="" name="frmAdmHtCompAdd" id="frmAdmHtCompAdd" class="pt-2">
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">호텔명 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input class="form-control" maxlength="50" name="admHComptNm" id="admHComptNm" type="text">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">연락처 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input class="form-control form-phone" data-inputmask-alias="(+99) 9999-9999" im-insert="true">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label for="zonecode" class="col-form-label">우편번호 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" value="${vo.zip }" required="required" id="zonecode" name="zonecode" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress();">우편번호 찾기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label for="address" class="col-form-label">주소 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" value="${vo.addr1 }" required="required" id="address" name="address" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label for="address_etc" class="col-form-label">상세주소 <span class="text-danger">*</span></label>
                                </div>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" value="${vo.addr2 }" required="required" id="address2" name="address2">
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
                                    <label class="col-form-label">옵션</label>
                                </div>
                                <div class="col-lg-8">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> Wi-Fi <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 금연 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 주차장 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 오션뷰 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 시티뷰 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-check form-check-flat">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input"> 마운틴뷰 <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label for="address_etc" class="col-form-label">보유객실</label>
                                </div>
                                <div class="col-lg-8">
                                    <p class="mb-0 py-2">A호텔 스위트룸</p>
                                    <p class="mb-0 py-2">A호텔 패밀리룸</p>
                                    <p class="mb-0 py-2">A호텔 디럭스룸</p>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-secondary" onclick="showSwal('warning-message-and-cancel')">비활성화</button>
                        <button type="button" class="btn btn-danger" onclick="showSwal('warning-message-and-cancel')">삭제</button>
                        <button type="button" class="btn btn-success" onclick="showSwal('success-message')">저장</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of 사용자 정보 modal -->

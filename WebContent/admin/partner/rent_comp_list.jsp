<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <a href="./rent_comp_add.jsp" class="btn btn-inverse-primary no-wrap ml-4">회사등록</a>
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
                                                <th>총 보유대수</th>
                                                <th>상태</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>924대</td>
                                                <td><div class="badge badge-secondary text-muted">비활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>924대</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>

                                                <td>924대</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>

                                                <td>924대</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>

                                                <td>924대</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>

                                                <td>924대</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>

                                                <td>924대</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>

                                                <td>924대</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td>Derrick</td>
                                                <td>경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</td>
                                                <td>924대</td>
                                                <td><div class="badge badge-primary">활성화</div></td>
                                                <td>
                                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalRentCompInfo">View</button>
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
        <div class="modal fade" id="ModalRentCompInfo" tabindex="-1" role="dialog" aria-labelledby="ModalRentCompInfo" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel-2">회사정보 상세조회</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pt-2">
                        <form action="" name="frmAdmHtCompAdd" id="frmAdmRtCompModi" class="pt-2">
                            <div class="form-group">
                                <label class="col-form-label">회사명 <span class="text-danger">*</span></label>
                                <input class="form-control" maxlength="50" name="admRtComptNm" id="admRtComptNm" type="text">
                            </div>
                            <div class="form-group">
                               	<label class="col-form-label">연락처 <span class="text-danger">*</span></label>
                                <input class="form-control form-phone" data-inputmask-alias="(+99) 9999-9999" im-insert="true">
                            </div>
                            <div class="form-group">
                                <label for="zonecode" class="col-form-label">차고지 주소 <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input type="text" class="form-control" value="${vo.addr1 }" required="required" id="address" name="address" readonly>
                                    <div class="input-group-append">
                                        <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress();">주소 검색</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">총 보유대수 <span class="text-danger">*</span></label>
                                <input class="form-control" type="number" min="0">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">승용차 보유대수 <span class="text-danger">*</span></label>
                                <input class="form-control" type="number" min="0">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">승합차 보유대수 <span class="text-danger">*</span></label>
                                <input class="form-control" type="number" min="0">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">위도 <span class="text-danger">*</span></label>
                                <input class="form-control" type="text">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">경도 <span class="text-danger">*</span></label>
                                <input class="form-control" type="text">
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
        
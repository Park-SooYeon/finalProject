<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <!-- 사용자 정보 modal -->
    <div class="modal fade" id="ModalHtOrderInfo" tabindex="-1" role="dialog" aria-labelledby="ModalHtOrderInfo" aria-hidden="true">
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
                        <img id="profileImg" class="img-sm rounded-circle" src="" alt="profile">
                        <div class="wrapper ml-3">
                            <h6 class="ml-1 mb-1" id="memberId"></h6>
                        </div>
                        <small class="time d-none d-sm-block ml-auto "><span id="reserveDt"></span> 예약됨</small>
                    </div>
                    <form class="" name="frmPtnHtOrderView" id="frmPtnHtOrderView">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">사용자명</label>
                                    <p id="userNm" class=""></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">주문번호</label>
                                    <p id="serial" class=""></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">호텔명</label>
                                    <p id="placeNm" class=""></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">객실유형</label>
                                    <p id="roomNm" class=""></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">체크인</label>
                                    <p id="chkInDt" class=""></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">체크아웃</label>
                                    <p id="chkOutDt" class=""></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="">상태</label>
                                    <p><span id="state" class="badge badge-inverse-primary font-weight-bold"></span></p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-danger" id="btnPtHtOrderCancle" onclick="bookingCancle()">예약취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end of 사용자 정보 modal -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 회사 정보 modal -->
<div class="modal fade" id="ModalRentCompAdd" tabindex="-1" role="dialog" aria-labelledby="ModalRentCompAdd" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel-2">회사정보 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-2">
                <form action="" name="frmAdmRtCompAdd" id="frmAdmRtCompAdd" method="post" class="pt-2">
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
                        <label class="col-form-label">위도 <span class="text-danger">*</span></label>
                        <input class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">경도 <span class="text-danger">*</span></label>
                        <input class="form-control" type="text">
                    </div>
                    <div class="form-group">
                    	<label class="col-form-label">판매상태 <span class="text-danger">*</span></label>
                    	<select class="form-control" id="state" name="state" required="">
							<option value="">선택해주세요.</option>
	                        <option value="y">활성화</option>
	                        <option value="n">비활성화</option>
	                    </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" id="btnPtRtCompModal" onclick="rentCompInsert()">등록</button>
            </div>
        </div>
    </div>
</div>
<!-- end of 회사 정보 modal -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 회사 정보 modal -->
<div class="modal fade" id="ModalRentCompView" tabindex="-1" role="dialog" aria-labelledby="ModalRentCompView" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel-2">회사정보 상세보기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-2">
                <form action="" name="frmAdmRtCompView" id="frmAdmRtCompView" method="post" class="pt-2">
                    <div class="form-group">
                        <label class="col-form-label">회사명 <span class="text-danger">*</span></label>
                        <input class="form-control" maxlength="50" name="rtCompNm" id="rtCompNm" type="text">
                    </div>
                    <div class="form-group">
                       	<label class="col-form-label">연락처 <span class="text-danger">*</span></label>
                        <input class="form-control form-phone" id="compPhone" data-inputmask-alias="(+99) 9999-9999" im-insert="true">
                    </div>
                    <div class="form-group">
                        <label for="zonecode" class="col-form-label">차고지 주소 <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="text" class="form-control" value="${vo.addr1 }" required="required" id="compAddr" name="compAddr" readonly>
                            <div class="input-group-append">
                                <button class="btn btn-primary btn-sm" type="button" id="btnDaumAddr" onclick="openDaumZipAddress();">주소 검색</button>
                            </div>
                        </div>
                    </div>
                    <div id="map" style="width:100%;height:240px;"></div>
                    <div class="form-group">
                    	<label class="col-form-label">판매상태 <span class="text-danger">*</span></label>
                    	<select class="form-control" id="compState" name="compState" required="">
							<option value="">선택해주세요.</option>
	                        <option value="y">활성화</option>
	                        <option value="n">비활성화</option>
	                    </select>
                    </div>
                    <span id="result"></span>
                    <span class="d-none" id="latitude"></span>
                    <span class="d-none" id="longitude"></span>
                   <!--  <input type="text" name="latitude2" id="latitude2" />
                    <input type="text" name="longitude2" id="longitude2" /> -->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" id="btnPtRtCompModal" onclick="rentCompUpdate()">저장</button>
            </div>
        </div>
    </div>
</div>
<!-- end of 회사 정보 modal -->


<!-- kakaoMap API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=527cf805baf486f2b91339b4ae2d7abf&libraries=services"></script>
	
<script>


	

</script>

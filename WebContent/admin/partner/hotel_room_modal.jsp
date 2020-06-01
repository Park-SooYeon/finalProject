<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 사용자 정보 modal -->
<div class="modal fade" id="ModalHotelInfo" tabindex="-1" role="dialog" aria-labelledby="ModalHotelInfo" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel-2">객실정보 상세조회</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-2">

                <form action="" name="frmAdmHtRmDtView" id="frmAdmHtRmDtView" class="pt-2" enctype="multipart/form-data">
                    <input type="hidden" name="place_serial" id="place_serial" value="" />
                        <input type="hidden" name="rooms_name" id="rooms_name" />
                    <div class="form-group row">
                        <div class="col-lg-3">
                            <label class="col-form-label">호텔 <span class="text-danger">*</span></label>
                        </div>
                        <div class="col-lg-8">
                            <select class="form-control" name="" id="htCompNm">
                               	<option value="">선택하세요.</option>
                               	<c:forEach var="list" items="${list }" varStatus="i">
			                     	<option value="${list.place_serial }">${list.place_name }</option>
			                    </c:forEach>
			                </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-lg-3">
                            <label class="col-form-label">객실유형 <span class="text-danger">*</span></label>
                        </div>
                        <div class="col-lg-8">
                            <select class="form-control" id="htRommType">
                               	<option value="">선택하세요.</option>
				                    <option value="1">디럭스</option>
				                    <option value="2">패밀리</option>
				                    <option value="3">스위트</option>
				                </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-lg-3">
                            <label class="col-form-label">인원수 <span class="text-danger">*</span></label>
                        </div>
                        <div class="col-lg-8">
                            <input type="number" name="people" value="${roomVo.people }" class="form-control" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-lg-3">
                            <label class="col-form-label">가격 <span class="text-danger">*</span></label>
                        </div>
                        <div class="col-lg-8">
                            <input type="number" name="people" class="form-control" value="${roomVo.price }" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-lg-3">
                            <label class="col-form-label">사진</label>
                        </div>
                        <div class="col-lg-8">
                            <div class="row">
                                <c:if test="${!empty roomVo.photos}">
                            		<c:forEach var="photo" items="${roomVo.photos}" varStatus="i" >
                            			<div class="col-6 col-lg-4">
                            				<input type="hidden" name="photo_serial_${i.count }" value="${photo.photo_serial }" />
                            				<input type="file" name="fileName${i.count }" class="dropify mr-2" id="" data-default-file="../../assets/images/upload/${photo.sysFile }" />
                            			</div>
								</c:forEach>
                             </c:if>           
                             <c:if test="${empty roomVo.photos}"> 
                             	<div class="col-md-4 mb-2">
                             		<input type="file" name="fileName1" class="dropify" />
                             	</div>
                             	<div class="col-md-4 mb-2">
                             		<input type="file" name="fileName2" class="dropify" />
                             	</div>
                             	<div class="col-md-4 mb-2">
                             		<input type="file" name="fileName3" class="dropify" />
                             	</div>
                             </c:if>
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
                                            <input type="checkbox" class="form-check-input" name="no_smoking" id="no_smoking"> 금연 <i class="input-helper"></i></label>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-check form-check-flat">
                                        <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" name="ocean_view" id="ocean_view"> 오션뷰 <i class="input-helper"></i></label>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-check form-check-flat">
                                        <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" name="city_view" id="city_view"> 시티뷰 <i class="input-helper"></i></label>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-check form-check-flat">
                                        <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" name="mt_view" id="mt_view"> 마운틴뷰 <i class="input-helper"></i></label>
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

<script>

//객실유형 세팅 
const state = '${vo.rooms_name}';
var sel = document.getElementById("htRommType");

switch (state) {
	case '1':
		sel.options[0].selected = true;
		break;
	case '2':
		sel.options[1].selected = true;
		break;
	case '3':
		sel.options[2].selected = true;
		break;
}


//옵션 값 세팅 
let no_smoking = '${roomVo.no_smoking}';
let ocean_view = '${roomVo.ocean_view}';
let city_view = '${roomVo.city_view}';
let mt_view = '${roomVo.mt_view}';

if(no_smoking == 1){
	document.getElementById("no_smoking").checked = true;
}
if(ocean_view == 1){
	document.getElementById("ocean_view").checked = true;
}
if(city_view == 1){ 
	document.getElementById("city_view").checked = true;
} 
if(mt_view == 1){ 
	document.getElementById("mt_view").checked = true;
} 

</script>
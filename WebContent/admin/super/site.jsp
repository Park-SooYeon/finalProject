<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex pb-4 mb-4 border-bottom">
                                <div class="d-flex align-items-center">
                                    <h5 class="page-title mb-n2 font-weight-bold">
		                            	<span class="breadcrumb-item active" aria-current="page">홈페이지 관리</span>
		                            </h5>
                                </div>

                            </div>
                            <p class="card-description">홈페이지의 기본 정보를 설정합니다.</p>
                            <form action="" name="frmAdmSiteMng" id="frmAdmSiteMng">
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">홈페이지 이름</label>
                                    </div>
                                    <div class="col-lg-8">
                                        <input class="form-control" maxlength="50" name="defaultconfig-2" id="defaultconfig-2" type="text" placeholder="Type Something.."> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">홈페이지 로고</label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<p class="text-muted">확장자는 png로 업로드해주세요.</p>
                                        <input type="file" class="dropify" />
									</div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="col-form-label">메인 배너 이미지</label>
                                    </div>
                                    <div class="col-lg-8">
                                    	<p class="text-muted">권장 이미지 사이즈 (1024*620)</p>
                                        <input type="file" class="dropify" />
									</div>
                                </div>
                                <div class="form-group col-12 text-right mt-5">
                                	<button type="submit" class="btn btn-secondary mr-2">취소</button>
                                	<button type="submit" class="btn btn-success">변경내용 저장</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

	   
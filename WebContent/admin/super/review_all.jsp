<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
    	<div id='wrapper'>
    		 <%-- <form name='frm_list' id= 'frm_list' method='post' >
				<input type='button' value='검색' id='btnFind'/>
				<input type='text' name='findStr' 	id='findStr' value='${p.findStr }'/>
				<input type='text' id = 'nowPage' name='nowPage' value='${p.nowPage }'/>
				<input type='text' name='serial' value='${param.serial }'/>
			</form>  --%>
            <div class="tab-content tab-content-basic">
                <div class="tab-pane fade active show" id="open-tickets" role="tabpanel" aria-labelledby="open-tickets">
                    <!-- <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                        <div class="tickets-details col-md-8">
                            <div class="wrapper">
                                <h5><span id="admReviewNum">#39033</span> - <span id="admReviewSuj">Design Admin Dashboard</span></h5>
                                <div class="badge badge-success font-weight-bold">미확인</div>
                                <div class="badge badge-danger font-weight-bold">신고</div>
                            </div>
                            <div class="wrapper text-muted">
                                <span id="admProdNm">워커힐 호텔 스위트 시티뷰</span>
                                <i class="mdi mdi-clock-outline ml-2"></i>
                                <span id="writeDt" class="ml-1">2020/05/12 03:34AM</span>
                            </div>
                        </div>
                        <div class="ticket-float col-md-2 col-6">
                            <img class="img-xs rounded-circle" src="../../assets/images/faces/face16.jpg" alt="profile image">
                            <span class="text-muted">Frank Briggs</span>
                        </div>
                        <div class="ticket-float col-md-2 col-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">호텔</span>
                        </div>
                    </a>
                    <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                        <div class="tickets-details col-md-8">
                            <div class="wrapper">
                                <h5>#39040 - Website Redesign</h5>
                                <div class="badge badge-danger font-weight-bold">신고</div>
                            </div>
                            <div class="wrapper text-muted">
                                <span>Assigned to</span>
                                <img class="assignee-avatar" src="../../assets/images/faces/face18.jpg" alt="profile image">
                                <span>Olivia Cross</span>
                                <span><i class="mdi mdi-clock-outline"></i>04:23AM</span>
                            </div>
                        </div>
                        <div class="ticket-float col-md-2 col-6">
                            <img class="img-xs rounded-circle" src="../../assets/images/faces/face14.jpg" alt="profile image">
                            <span class="text-muted">Frank Briggs</span>
                        </div>
                        <div class="ticket-float col-md-2 col-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
                            <span class="text-muted">Wireframe</span>
                        </div>
                    </a> -->
                    <!-- 데이터넣깅... -->
                    <c:forEach var='i' items='${list }'>
                    <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                        <div class="tickets-details col-md-8">
                            <div class="wrapper">
                                <h5>${i.review_serial }  -  ${i.review_title }</h5>

                            </div>
                            <div class="wrapper text-muted">
                                <span>review_date</span>
                                <span><i class="mdi mdi-clock-outline"></i>${i.review_date }</span>
                            </div>
                        </div>
                        <div class="ticket-float col-md-2 col-6">
                            <img class="img-xs rounded-circle" src="../../assets/images/faces/face10.jpg" alt="profile image">
                            <span class="text-muted">${i.member_id }</span>
                        </div>
                        <div class="ticket-float col-md-2 col-6">
                            <i class="category-icon mdi mdi-folder-outline"></i>
	                          
	                            <c:if test='${i.p.place_code == 0 }'>
	                            	<span class="text-muted" >즐길거리(문화시설)</span>
	                            </c:if>
                        		<c:if test='${i.p.place_code == 1 }'>
	                            	<span class="text-muted">즐길거리(관광지)</span>
	                            </c:if>
	                            <c:if test='${i.p.place_code == 2 }'>
	                            	<span class="text-muted">음식점</span>
	                            </c:if>
	                            <c:if test='${i.p.place_code == 3 }'>
	                            	<span class="text-muted">축제</span>
	                            </c:if>
	                            <c:if test='${i.p.place_code == 4 }'>
	                            	<span class="text-muted">호텔</span>
	                            </c:if>
                        	
                        
                        
                        </div>
                    </a>
	       		</c:forEach>            
	              </div>
	            
           
           
         
        <%--    <div id='paging' class="text-center mt-3">
	<c:if test='${p.startPage>p.blockSize }'>
		<input type='button' value='이전' onclick='brd.go(${p.startPage-1}) '/>
	</c:if>
		
			<c:forEach var='i' begin='${p.startPage}' end='${p.endPage}'>
				<input type='button' value='${i }' class="${(i==p.nowPage)?  'active' : ''}" onclick='brd.go(${i})'/>
			</c:forEach>
			
	<c:if test='${p.endPage<p.totPage }'>
				<input type='button' value='다음' onclick='brd.go(${p.endPage+1 })'/>
	</c:if>
	</div> --%>
	   <div class="col-md-12" style='margin-top:-20px'>
      <ul class="pagination justify-content-center mt-5">
        <li class="page-item ${(p.startPage>p.blockSize)? '' : 'disabled' }disabled">
         <a
           class="page-link"
           href="#"
           tabindex="-1"
           aria-disabled="true"
           onclick="brd.go(${p.startPage-1})"
           >이전</a
         >
        </li>
        <c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
         <li class="page-item ${(i==p.nowPage)? 'active' : '' }">
           <a class="page-link" href="#" onclick="brd.go(${i})">${i}</a>
         </li>
        </c:forEach>
        <li class="page-item ${(p.endPage<p.totPage? '' : 'disabled' )}">
         <a class="page-link" href="#" onclick="brd.go(${p.endPage+1})">다음</a>
        </li>
      </ul>
     </div>
     
     
	
	<%-- 
	<div id='paging' class='text-center mt-1'>
			<c:if test="${p.startPage>p.blockSize}">
				<input type='button' value='이전' onclick='brd.go(${p.startPage-1})' class='btn-sm btn-ok' />
			</c:if>

			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
				<input type='button' value='${i }' class='${ (i== p.nowPage)? "btn-sm btn-sw" : "btn-sm btn-ok" }' onclick='brd.go(${i})' />
			</c:forEach>

			<c:if test="${p.nowPage<page.totPage }">
				<input type='button' value='다음' onclick='brd.go(${p.endPage+1 })' class='btn-sm btn-ok' />
			</c:if>
		</div>
	
        </div> --%>


    <!-- 리뷰 상세조회 modal -->
    <div class="modal fade" id="modalReviewDt" tabindex="-1" role="dialog" aria-labelledby="modalReviewDt" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel-2">리뷰 상세조회</h5>
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
                        <small class="time d-none d-sm-block ml-auto " id="ReviewRegDt">2018.02.05 작성됨</small>
                    </div>
                    <form class="row" name="usrInfoFrm">
                        <div class="col-12">
                            <div class="form-group">
                                <label class="">제목</label>
                                <p id="ReviewSbj" class="">너무 좋아요~!</p>
                            </div>


                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label class="">내용</label>
                                <p id="ReviewContent" class="">좋아요</p>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label class="">사진</label>
                                <div id="lightgallery" class="row lightGallery">
                                    <a href="../../assets/images/samples/1280x768/1.jpg" class="image-tile">
                                        <img src="../../assets/images/samples/300x300/1.jpg" alt="image small">
                                    </a>
                                    <a href="../../assets/images/samples/1280x768/2.jpg" class="image-tile">
                                        <img src="../../assets/images/samples/300x300/2.jpg" alt="image small">
                                    </a>
                                    <a href="../../assets/images/samples/1280x768/3.jpg" class="image-tile">
                                        <img src="../../assets/images/samples/300x300/3.jpg" alt="image small">
                                    </a>
                                    <a href="../../assets/images/samples/1280x768/4.jpg" class="image-tile">
                                        <img src="../../assets/images/samples/300x300/4.jpg" alt="image small">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="wrapper d-flex align-items-center py-2">
                                <label class="mb-0">신고</label>
                                <small id="reportTot" class="ml-auto">총 20건</small>
                            </div>
                            <div class="wrapper">
                                <div class="d-flex align-items-center py-2 border-bottom">
                                    <p class="mb-0 "><a href="#" class="font-weight-bold" data-toggle="modal" data-target="#modalRptView">욕설/인신공격</a></p>
                                    <p class="badge badge-pill badge-danger ml-auto mb-0">5</p>
                                </div>
                                <div class="d-flex align-items-center py-2 border-bottom">

                                    <p class="mb-0 "><a href="#" class="font-weight-bold" data-toggle="modal" data-target="#modalRptView">기타</a></p>
                                    <p class="badge badge-pill badge-danger ml-auto mb-0">5</p>
                                </div>
                                <div class="d-flex align-items-center py-2">

                                    <p class="mb-0 "><a href="#" class="font-weight-bold" data-toggle="modal" data-target="#modalRptView">영리목적/홍보성</a></p>
                                    <p class="badge badge-pill badge-danger ml-auto mb-0">5</p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-success" onclick="showSwal('warning-message-and-cancel')">게시글 삭제</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end of 리뷰 상세조회 modal -->


    <!-- 신고내역 상세보기 modal -->
    <div class="modal fade" id="modalRptView" tabindex="-1" role="dialog" aria-labelledby="modalRptView" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header border-0 pb-2">
                    <h5 class="modal-title" id="exampleModalLabel-2">신고내용 조회</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pt-2">
                    <div class="dropdown mb-4">
                        <button class="btn btn-outline-danger dropdown-toggle" type="button" id="dropdownMenuOutlineButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 욕설/인신공격 </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuOutlineButton1" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 35px, 0px);">
                            <a class="dropdown-item" href="#">욕설/인신공격</a>
                            <a class="dropdown-item" href="#">기타</a>
                            <a class="dropdown-item" href="#">영리목적/홍보성</a>
                        </div>
                    </div>
                    <div class="wrap report-wrap">
                        <div class="card aligner-wrapper col-12 mb-2">
                            <div class="card-body p-3">
                                <div class="absolute left top bottom h-100 v-strock-2 bg-danger"></div>
                                <p class="text-muted mb-2 text-small">2020-04-20 신고됨</p>

                                <div class="d-flex align-items-center">
                                    <div class="bg-danger dot-indicator"></div>
                                    <p class="text-muted mb-0 ml-2 w-100">Payout for next week $100 </p>
                                </div>
                            </div>
                        </div>
                        <div class="card aligner-wrapper col-12 mb-2">
                            <div class="card-body p-3">
                                <div class="absolute left top bottom h-100 v-strock-2 bg-danger"></div>
                                <p class="text-muted mb-2 text-small">2020-04-20 신고됨</p>

                                <div class="d-flex align-items-center">
                                    <div class="bg-danger dot-indicator"></div>
                                    <p class="text-muted mb-0 ml-2 w-100">Payout for next week $100 </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>
 


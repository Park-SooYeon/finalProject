<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	
<!DOCTYPE html>
<html>
<head>
<script src='./css/css_syj.css'></script>
<script src="./js/festival_detail.js"></script>
<script src="./js/main.js"></script>
<script src='./lib/jquery-3.4.1.js'></script>
<script src="./swiper-5.3.8/package/js/swiper.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8effece1d8215cec0ceddf314763998&libraries=services,clusterer"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="css/detail_view.css">


</head>
<body>
	<!-- top.jsp -->
	<section class="banner-area relative">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">호텔</h1>
					<div class="ui-widget" style="display: flex;">
						<input id="mainFindStr" type="text"
							placeholder="지역 또는 검색어를 입력해주세요!" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '지역 또는 검색어를 입력해주세요!'"
							class="single-input">
						<button id="mainSearch" class="btn btn-primary"
							style="width: 15%; height: 40px;">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
	
	<!--  -->
	
	<input type="text" id="place_serial" name="place_serial" value="${param.place_serial }">
	
	
	<form name='frm_review' id='frm_review' method='post'
		class='frm_review'>
		<br /> <br /> <br />
		<div class='container'>
			<div class="title1" style="margin-bottom: 10px">
				<h2>${vo.place_name}</h2>
			</div>
			<div class="float-right" style="display: flex">
				<div class="p-1 heart" onclick="main.like(this)">
					<i class="fa fa-heart-o"
						style="cursor: pointer; middle; margin-right: 20px; font-size: 28px; padding: 0.10rem !important;"></i>
				</div>
				<div>
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle"
							style='color: #007bff; background: ghostwhite; margin-left: -15px;'
							data-toggle="dropdown" aria-expanded="false">
							<i class="fa fa-share-alt mr-1"></i> 공유하기 <span class="caret"></span>
						</button>
						<div class="dropdown-menu" role="menu">
							<div id="kakao-link-btn" href="javascript:sendLink()">
								<img
									src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
									style='width: 18px; padding-left: 3px;' />카카오톡
							</div>
							<span> <script type="text/javascript"
									src="//developers.band.us/js/share/band-button.js?v=11052020"></script>
								<script type="text/javascript">
									new ShareBand.makeButton({
										"lang" : "ko-KR",
										"type" : "a"
									});
								</script>
							</span>
						</div>
					</div>
					<!--  -->
				</div>
			</div>

			<div class='preinfo'>
				<div class='rating' data-rate='4'
					style='font-size: 23px; margin-bottom: 10px;'>
					<!-- data-rate에 별점을입력(평균별점입력5를넘기지않아야함) -->
					<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star" style="margin-right: 10px;"></i>
				</div>


			</div>

			<div class='preinfo' style='font-size: 18px'>
				<span><i class="fa fa-location-arrow"
					style="margin-right: 3px; margin-bottom: 10px" aria-hidden="true">
					</i>${vo.place_location } </span> <span>
					<i class="fa fa-mobile" style="margin-right: 3px" aria-hidden="true">
					</i>${vo.place_tel }</span><br />
			

			</div>
			<div class="info row justify-content-center mb-5">
				<div class='col-lg-8 col-md-12'>
					<!-- 큰사이즈에서 8 스몰에서 12 -->
					<!-- Swiper -->
					<div class="swiper-container gallery-top">
			<c:forEach var='i' items='${photoList}'>	
					<div class="swiper-container gallery-thumbs">
						<div class="swiper-wrapper">
							 <img class="swiper-slide"
								src="./assets/images/upload/${i.sysFile}" style="cursor: pointer;" />
						</div>
					</div>
                </c:forEach>
				
 
						<!-- Add Arrows -->
						<div class="swiper-button-next swiper-button-white"></div>
						<div class="swiper-button-prev swiper-button-white"></div>
					</div>
					
		 <c:forEach var='i' items='${photoList}'>	
					<div class="swiper-container gallery-thumbs">
						<div class="swiper-wrapper">
							 <img class="swiper-slide"
								src="./assets/images/upload/${i.sysFile}" style="cursor: pointer;" />
						</div>
					</div>
                </c:forEach>
				
 
 
						
						<div>
			 <c:forEach var='list' items='${list}'>	
			      
							<div class="col-md-12" id="hotel_list" style="padding-top: 10px;">
								<div class="row" style="margin:10px;">
									<div class="col-md-6">
										<img src="assets/images/upload/${photoList[0].sysFile}">
									</div>
									<div class="col-md-6">
									  <c:if test="${list.rooms_name==1 }">
										<h3>디럭스</h3>
									   </c:if>
									   <c:if test="${list.rooms_name==2 }">
										<h3>패밀리</h3>
									   </c:if>
									   <c:if test="${list.rooms_name==3 }">
										<h3>스위트</h3>
									   </c:if>
										<div class="tags">
											<div>
											
											 <c:if test="${list.mt_view ==1 }">
												<span class="badge badge-info">마운틴뷰</span> 
												</c:if>
												
												 <c:if test="${list.city_view ==1 }">
												<span class="badge badge-info">시티뷰</span>
												</c:if>
												
												 <c:if test="${list.ocean_view ==1 }">
												<span class="badge badge-info">오션뷰</span>
												</c:if>
												
											</div>
                                          <p>1박    ${list.price} 원</p>
                                          <p>수용 가능 인원수 : ${list.people}</p>

										 <input type="button"
												class="genric-btn info min-width-180 pull-right  "
												value="예약하러 가기" id="btnReserv" onclick="reserveMove()">
										</div>
									</div>

								</div>
							</div>

							<br/>
              </c:forEach>

									
									

			</div>
	
				
					
					
					
					
					
					
					
					
					
					<br />
					
					<div id="sw-map" style="width: 100%; height: 400px;"></div>
				</div>
			</div>
			
			
			
			
			
			<div class="row">
				<div class="col-12 pt-3"
					style='height: 70px; border-top: 1px solid black;'>
					<h3 style='float: left'>리뷰</h3>
					<input class="btn btn-primary float-right" onclick="insertMove()"
						type='button' id='review' name='review' value='리뷰작성' />

				</div>

			</div>
			<div class="row border-bottom py-3">
				<div class="col-2">
					<img class="rounded-circle" src="./images/festival/1.png" alt="글쓴이">
					<p class='text-center mt-3'>작성자</p>
				</div>
				<div class="col-10">
					<div class='rating' data-rate='5'>
						<!-- data-rate에 별점을입력(5초과금지) -->
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
					<span>2020년 1월 15일에 작성</span> <span class="float-right">8명의
						이용자가 도움이 됐다고 하던뎁숑?!</span>
					<h5>리뷰제목</h5>
					<div class="review-box">
						<p class="pre-view">리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다입니다리뷰입니다입니다리뷰입니다입니다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난ㄴㄴ</p>
						<span class="btn-moreInfo">[더보기]</span>
					</div>
					<p>
						<span>방문 날짜 : </span>2020년 1월
					</p>
					<p>
						도움이 됐나요?
						<button class="btn btn-outline-secondary">
							<i class="fa fa-thumbs-up"></i>
						</button>
					</p>

					<button id="testBtn" class="testBtn btn btn-primary"
						style='float: right'>신고하기</button>
					<!-- 회원가입 확인 Modal-->
					<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content" style="width: 477px;">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">리뷰신고하기!</h5>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">X</span>
									</button>
								</div>
								<div class="modal-body mb-1">
									<span>이미지 또는 내용 신고</span>
									<div class=row>
										<div class='col-md-6'>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-1"
													class="custom-control-input"> <label
													class="custom-control-label" for="jb-radio-1">영리목적/홍보성</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-2"
													class="custom-control-input"> <label
													class="custom-control-label" for="jb-radio-2">개인정보노출</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-3"
													class="custom-control-input"> <label
													class="custom-control-label" for="jb-radio-3">불법정보</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-4"
													class="custom-control-input"> <label
													class="custom-control-label" for="jb-radio-4">음란성/선정성</label>
											</div>
										</div>
										<div class='col-md-6'>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-5"
													class="custom-control-input"> <label
													class="custom-control-label" style="" for="jb-radio-5">욕설/인신공격</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-6"
													class="custom-control-input"> <label
													class="custom-control-label" style="" for="jb-radio-6">아이디/DB거래</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-7"
													class="custom-control-input"> <label
													class="custom-control-label" style="" for="jb-radio-7">같은내용반복(도배)</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-8"
													class="custom-control-input"> <label
													class="custom-control-label" style="" for="jb-radio-8">기타</label>
											</div>
										</div>
										<div style='float: left; margin-left: 16px; margin-top: 8px;'>
											<h5>신고 내용을 입력해주세요..</h5>
										</div>
										<div class='col-md-12'>
											<textarea class='accuse_text' style="margin-top: 10px"
												name='review_accuse' form='inform' cols='60' rows='10'
												placeholder="신고하실내용을 입력해주세여"></textarea>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button class="btn success btn-primary" id="asd">접수하기</button>
									<button class="btn btn-primary" type="button"
										data-dismiss="modal">취소하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row border-bottom py-3">
				<div class="col-2">
					<img class="rounded-circle" src="./images/festival/1.png" alt="글쓴이">
					<p class='text-center mt-3'>작성자</p>
				</div>
				<div class="col-10">
					<div class="rating" data-rate="3">
						<!-- data-rate에 별점을입력(5초과금지) -->
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
					<span>2020년 1월 15일에 작성</span> <span class="float-right">8명의
						이용자가 도움이 됐다고 하던뎁숑?!</span>
					<h5>리뷰제목</h5>
					<div class="review-box">
						<p class="pre-view">리뷰입니다</p>
						<span class="btn-moreInfo">[더보기]</span>
					</div>
					<p>
						<span>방문 날짜 : </span>2020년 1월
					</p>
					<p>
						도움이 됐나요?
						<button class="btn btn-outline-secondary">
							<i class="fa fa-thumbs-up"></i>
						</button>
					</p>

					<!-- Modal -->
					<button id="testBtn" class="testBtn btn btn-primary"
						style='float: right'>신고하기</button>


					<div class="modal fade" data-backdrop="static"
						id="exampleModalScrollable" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-scrollable" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalScrollableTitle">여행
										목록에 추가</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body" id="modal-body">
									<div class="folder p-2" id="folderInsert"
										onclick="main.insertFolder(this)">
										<i class="fa fa-plus pr-2"></i>여행 추가
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary"
										id="btnLikeInsert" onclick="main.makeHeart()">추가</button>
								</div>
							</div>
						</div>
					</div>

		

				</div>
				<!-- 리뷰내용 -->
			</div>
			<!-- 리뷰사진부분 -->
		</div>
		<!-- 컨테이너끝 -->
	</form>






</body>
</html>
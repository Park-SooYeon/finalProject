<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>


<script src="js/festival_detail.js"></script>
<script src="js/hotel.js"></script>

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
			</i>${vo.place_location } </span> <span> <i class="fa fa-mobile"
				style="margin-right: 3px" aria-hidden="true"> </i>${vo.place_tel }</span><br />


		</div>
		<div class="info row justify-content-center mb-5">
			<div class='col-lg-8 col-md-12'>
				<!-- 큰사이즈에서 8 스몰에서 12 -->
				<!-- Swiper -->



				<section class="destinations-area pb-60">
					<div class="container">

						<div class="row">
							<div class="swiper-container m-2">
								<div class="swiper-wrapper pl-50 pr-50">



									<c:forEach var='i' items='${photoList}'>
										<div class="swiper-slide">

											<div class="single-destinations">
												<div class="thumb">


													<img class="swiper-slide"
														src="./assets/images/upload/${i.sysFile}"
														style="cursor: pointer;" />
												</div>


											</div>
										</div>
									</c:forEach>



									<!-- Add Arrows -->
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
							</div>
						</div>


					</div>
				</section>



				<%--객실 --%>

				<div>
					<c:forEach var='list' items='${list}' varStatus="vs">

						<div class="col-md-12" id="hotel_list"
							style="padding-top: 10px; padding-bottom: 10px; box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.2);">
							<div class="row" style="margin: 10px;">
								<div class="col-md-6">
									<img src="./assets/images/upload/${photoList[0].sysFile}">
								</div>
								<div class="col-md-6">
									<c:if test="${list.rooms_name == 1 }">
										<h3>디럭스</h3>
									</c:if>
									<c:if test="${list.rooms_name == 2 }">
										<h3>패밀리</h3>
									</c:if>
									<c:if test="${list.rooms_name ==3  }">
										<h3>스위트</h3>
									</c:if>
									<div class="tags">
										<div>

											<c:if test="${list.mt_view == 1 }">
												<span class="badge badge-info">마운틴뷰</span>
											</c:if>

											<c:if test="${list.city_view == 1 }">
												<span class="badge badge-info">시티뷰</span>
											</c:if>

											<c:if test="${list.ocean_view == 1 }">
												<span class="badge badge-info">오션뷰</span>
											</c:if>

										</div>
										<p>1박 ${list.price} 원</p>
										<p>수용 가능 인원수 : ${list.people}</p>

										<input type="button"
											class="genric-btn info min-width-180 pull-right  "
											data-toggle="modal" data-target="#hotelReserv${vs.index}"
											value="예약하러하기">

									</div>

								</div>

							</div>
						</div>

						<br />



						<%--  모달모달 --%>

						<!-- Modal -->


						<div class="modal fade" id="hotelReserv${vs.index}" tabindex="-1"
							role="dialog" aria-labelledby="hotelReservLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									
									
									
									<form method="post" id="frm_ht" name="frm_ht">
										
										 <input type="hidden" id="rooms_serial" name="rooms_serial"
																	value="${list.rooms_serial }">
						               
						              
										 
										<input type="hidden" id="place_serial" name="place_serial"
											value="${param.place_serial }">
											
										<input type="hidden" id="place_name" name="place_name"
										value="${vo.place_name}">
										
										<input type="hidden" id="place_location" name="place_location"
										value="${vo.place_location}">
										
										
										
										<div class="modal-header">
											<h4 class="modal-title" id="hotelReservLabel">예약하기</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">Close</button>
										</div>
										<div class="modal-body">







											<div class='container'>
												<div class="row">


													<div class="col-md-12" id="hotel_list"
														style="padding-top: 10px;">
														<div class="row" style="margin: 10px;">




															<h2 style="margin-bottom: 10px">${vo.place_name}</h2>

															<p>${vo.place_location }</p>
															<br />

															<p>${vo.place_tel }</p>


															<div class="col-md-6">
																<img src="./assets/images/upload/${photoList[0].sysFile}">
															</div>
															<div class="col-md-6">

																
																<c:if test="${list.rooms_name == 1 }">
																	<h3>디럭스</h3>
																</c:if>
																<c:if test="${list.rooms_name == 2 }">
																	<h3>패밀리</h3>
																</c:if>
																<c:if test="${list.rooms_name ==3  }">
																	<h3>스위트</h3>
																</c:if>
																<div class="tags">
																	<div>

																		<c:if test="${list.mt_view == 1 }">
																			<span class="badge badge-info">마운틴뷰</span>
																		</c:if>

																		<c:if test="${list.city_view == 1 }">
																			<span class="badge badge-info">시티뷰</span>
																		</c:if>

																		<c:if test="${list.ocean_view == 1 }">
																			<span class="badge badge-info">오션뷰</span>
																		</c:if>

																	</div>
																	<p>1박 ${list.price} 원</p>
																	<p>수용 가능 인원수 : ${list.people}</p>


																</div>
															</div>

														</div>
													</div>

													<br />




													<div class="col-md-12">




														<div class="form-group trip-cal-input">
															<label for="trip-cal-input" class="col-form-label">
																체크인 </label> <input type="text" id="start_date"
																class="form-control col-sm-8 col-xm-12 datepicker-here"
																data-range="true" data-language="kr"
																data-multiple-dates-separator=" - "
																data-toggle-selected="true" name="start_date">

															<label for="trip-cal-input" class="col-form-label">
																체크 아웃 </label> <input type="text" id="end_date"
																class="form-control col-sm-8 col-xm-12 datepicker-here"
																data-range="true" data-language="kr"
																data-multiple-dates-separator=" - "
																data-toggle-selected="true" name="end_date">

															<div class="check_font" id="date_check" name="date_check"></div>

														</div>

														<button type="button"
															class="genric-btn info min-width-180"
															onclick="goNextReserv()">다음 단계로~</button>


													</div>


												</div>



											</div>

										</div>



										<div style="display: none" id="reserv">




												
											<div class="container">
												<div class="row">
													<div class="col-md-12">

														<div class="jumbotron"
															style="padding-top: 20px; background: white">

															<h4>고객님의 정보를 입력해주세요!</h4>
															<hr>
															<br>

                                                         <div class="mt-6">

																
																<div class="mt-6">
																	<label>숙박일 : </label> 
																	<label id="between_day"
																		style="font-size: 15px;"> </label>
																		<label> 일 </label>
																</div>
															</div>

															<div class="mt-6">

																<input type="hidden" id="price" value="${list.price}">
																<div class="mt-6">
																	<label>결제 금액 : </label> <label id="total_price"
																		style="font-size: 15px;"> </label>
																</div>
															</div>

															<div class="mt-6">
																<label>이름</label> 
																<input type="text"
																	class="form-control" name="member_name" id="member_name"
																	placeholder="이름을 입력해주세요" maxlength="20" required><br>
															</div>




															<div class="mt-6" id="email_syj">
																<label for="InputEmail">이메일 주소</label> <input
																	type="text" class="form-control" name="email"
																	id="email" placeholder="이메일을 입력해주세요" required>

															</div>


															<div class="mt-6" id="email_syj">
																<label for="reInputEmail">이메일 주소 확인</label> <input
																	type="text" class="form-control" name="reEmail"
																	id="reEmail" placeholder="이메일을 입력해주세요" required>

															</div>

															<br>

														</div>
													</div>

												</div>
											</div>

										</div>
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<button type="button" class="btn btn-default pull-right"
												data-dismiss="modal" id="close">닫기</button>

											<button type="button" class="btn btn-primary pull-right"
												onclick="hotel.goReserve()">예약하기</button>
										</div>
									</div>
								</div>
									</form>
								</div>


								<br>

							</div>



						</div>

					</c:forEach>
				</div>


			</div>

			<br />

			<%-- <div id="sw-map" style="width: 100%; height: 400px;"></div>
				    --%>
		</div>
	




	<c:if test="${!empty reviewList}">
		<div class="row">
			<div class="col-12 pt-3"
				style='height: 70px; border-top: 1px solid black;'>
				<h3 style='float: left'>리뷰</h3>
				<input class="btn btn-primary float-right" onclick="insertMove()"
					type='button' id='review' name='review' value='리뷰작성' />

			</div>

		</div>


		<c:forEach var='i' items='${reviewList}'>
			<div class="row border-bottom py-3">
				<div class="col-2">


					<img class="rounded-circle" src="./images/myPage/${i.member_photo}">


					<p class='text-center mt-3'>${i.nickName }</p>
				</div>
				<div class="col-10">
					<div class='rating' data-rate='5'>
						<!-- data-rate에 별점을입력(5초과금지) -->
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>

					<span>${i.review_date}에 작성</span> <span class="float-right">${i.likecount}
						명의 사용자가 좋아합니다! </span>
					<h5>${i.review_title }</h5>
					<div class="review-box">
						<p class="pre-view">${i.review_content }</p>
						<span class="btn-moreInfo">[더보기]</span>
					</div>
					<p>
						<span>방문 날짜 :${t.visit_date} </span>
					</p>
					<p>
						도움이 됐나요?
						<button class="btn btn-outline-secondary">
							<i class="fa fa-thumbs-up"></i>
						</button>
					</p>

					<button id="testBtn" class="testBtn btn btn-primary"
						style='float: right'>신고하기</button>


				</div>
			</div>

		</c:forEach>
	</c:if>
</div>


	<!-- Button trigger modal -->









	<!-- modal -->
	<!-- 신고 모달 -->
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
					<button class="btn btn-primary" type="button" data-dismiss="modal">취소하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 라이크 리스트 추가 모달 -->
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
					<button type="button" class="btn btn-primary" id="btnLikeInsert"
						onclick="main.makeHeart()">추가</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 컨테이너끝 -->

</body>
</html>

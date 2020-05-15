<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


    <style>
        ul {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        
        .preinfo>span {
            margin-right: 16px;
        }
        
        .info {
            margin-top: 50px;
        }
        
        .review-box {
            overflow: hidden;
        }
        
        .review-box .pre-view.hidden {
            white-space: nowrap;
            word-wrap: normal;
            width: 90%;
            overflow: hidden;
            text-overflow: ellipsis;
            float: left;
        }
        
        .rounded-circle {
            width: 100%;
        }
        
        .btn-moreInfo {
            display: none;
            white-space: nowrap;
            float: right;
        }
        
        @media screen and (max-width: 533px) {
            .review-box .pre-view.hidden {
                width: 75%;
            }
        }
        
        .swiper-container {
            width: 500px;
            height: 300px;
            margin: 20px auto;
        }
        
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            line-height: 300px;
        }
        
        .progress {
            width: 300px;
        }
        
        .gallery-thumbs {
            height: 130px;
        }
    </style>

    <script src='./js/hotel.js'></script>
    <script src="js/main.js"></script>
    <script  src='./lib/jquery-3.4.1.js'></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	a8effece1d8215cec0ceddf314763998&libraries=services,clusterer"></script>
     <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="//developers.band.us/js/share/band-button.js?v=11052020"></script>
	<script type="text/javascript">
	new ShareBand.makeButton({"lang":"ko-KR","type":"a"});
	 
		//  다음 지도  api 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('서울특별시 종로1.2.3.4가동', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			} 
		});  
	 </script>

    <!-- start banner Area -->
    <section class="banner-area relative">
        <div class="container pt-50 mb-30">
            <div class="row d-flex justify-content-center align-items-center" style="height: 250px">
                <div class="menu-content col-lg-12">
                    <div class="title text-center">
                        <h1 class="text-white mb-10">객실 상세보기</h1>
                        <form method="post" name="frm_ms" id="frm_ms" class="row">
                            <div class="col-lg-2  col-md-12 ">
                                <input type="text" class="form-control" name="name" placeholder="From " onfocus="this.placeholder = ''" onblur="this.placeholder = 'From '">
                            </div>
                            <div class="col-lg-3  ">
                                <input type="text" id="datePickInput" class="form-control  datepicker-here" data-range="true" data-position="right top" data-language="kr" data-multiple-dates-separator=" - " name="start" placeholder="Start " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start '">
                            </div>
                            <div class="col-lg-3">
                                <input type="text" id="datePickInput" class="form-control  datepicker-here" data-range="true" data-position="right top" data-language="kr" data-multiple-dates-separator=" - " name="return" placeholder="Return " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Return '">
                            </div>
                            <div class="col-lg-2  ">
                                <input type="number" min="1" max="20" class="form-control" name="adults" placeholder="인원 " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Adults '">
                            </div>


                            <button class="btn btn-primary" style="width: 15%; height: 40px;" type="submit">
                                <i class="fa fa-search"></i>
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End banner Area -->


    <form name='frm_review' id='frm_review' method='post' class='frm_review'>
        <br />
        <br />
        <br />
        <div class='container'>
            <div class="title1" style="margin-bottom: 10px">
                <h2>맛있는 치킨집</h2>
            </div>
            <div class="float-right" style="display: flex">
                <!--   <a href='#' style='padding:.450rem .75rem ;font-size: medium; margin-right:15px'><i class="fas fa-heart"></i>저장</a>
        -->
                <div class="p-1 heart" onclick="main.like(this)">
                    <i class="fa fa-heart-o" style="cursor: pointer;  margin-right: 20px; font-size: 28px; padding: 0.10rem !important;"></i>
                </div>
                <div>
                    <!--  -->
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" style='color: #007bff; background: ghostwhite; margin-left: -15px;' data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-share-alt mr-1"></i> 공유하기 <span class="caret"></span>
                        </button>

                    </div>
                    <!--  -->
                </div>
            </div>

            <div class='preinfo'>

                <div class='rating' data-rate='4' style='font-size: 23px; margin-bottom: 10px;'>
                    <!-- data-rate에 별점을입력(평균별점입력5를넘기지않아야함) -->
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star" style="margin-right: 10px;"></i> 
                    <span>4건의 리뷰</span> 
                    <span>Type , World , menu , Local , Price </span>
                </div>


            </div>

            <div class='preinfo' style='font-size: 18px'>
                <span><i class="fa fa-location-arrow"
               style="margin-right: 3px" aria-hidden="true"></i>주소: 서울트윽벼얼시 조오옹로구우
            </span>
                <span><i class="fa fa-mobile" style="margin-right: 3px"
               aria-hidden="true"></i>연락처: 02-222-2222</span>
                <br />
                <div class="clearfix">
                    <i class="fa fa-desktop" style="margin-right: 3px; margin-top: 10px 3px" aria-hidden="true"></i>홈페이지 <a href='http://localhost:8888/review/review.jsp' style="margin-right: 5px">http://localhost:8888/review/review.jsp</a>
                    <span><i class="fa fa-clock-o " style="margin-right: 3px" aria-hidden="true"></i>오픈:10:00, 마감22:00 ,휴일 (일요일)</span>
                </div>

            </div>
            <div class="info row justify-content-center mb-5">
                <div class='col-lg-8 col-sm-12'>
                    <!-- 큰사이즈에서 8 스몰에서 12 -->
                    <!-- Swiper -->
                    <div class="swiper-container gallery-top">
                        <div class="swiper-wrapper">
                            <img class="swiper-slide" src="./images/festival/1.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/2.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/3.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/4.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/5.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/6.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/7.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/8.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/9.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/10.png" style="cursor: pointer;" />
                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next swiper-button-white"></div>
                        <div class="swiper-button-prev swiper-button-white"></div>
                    </div>
                    <div class="swiper-container gallery-thumbs">
                        <div class="swiper-wrapper">
                            <img class="swiper-slide" src="./images/festival/1.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/2.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/3.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/4.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/5.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/6.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/7.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/8.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/9.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/10.png" style="cursor: pointer;" />
                        </div>
                    </div>

                    <div>
                        <h3>평가</h3>
                        <div class="clearfix" style='margin-top: 5px'>
                            <ul class='float-left'>
                                <li><i class="fa fa-cutlery" style="margin-right: 3px"></i>음식</li>
                                <li><i class="fa fa-share-alt" style="margin-right: 3px" aria-hidden="true"></i>서비스</li>
                                <li><i class="fa fa-krw" style="margin-right: 3px" aria-hidden="true"></i>가격</li>
                            </ul>
                            <ul class="float-right">
                                <li>
                                    <div class='rating' data-rate='1'>
                                        <!-- data-rate에 별점을입력(5초과금지) -->
                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                    </div>
                                </li>
                                <li>
                                    <div class='rating' data-rate='2'>
                                        <!-- data-rate에 별점을입력(5초과금지) -->
                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                    </div>
                                </li>
                                <li>
                                    <div class='rating' data-rate='3'>
                                        <!-- data-rate에 별점을입력(5초과금지) -->
                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                    </div>
                                </li>

                            </ul>
                        </div>

                        <div>
                            <h3>상세정보</h3>
                            <div style="border: 1px solid #666; padding: 8px; margin-top: 10px">
                                가격대<i class="fa fa-krw" style="margin-right: 3px" aria-hidden="true"></i>1000~2000
                                <br /> 일반음식점
                                <br />
                            </div>
                        </div>
                        <div class="col-lg-7 offset-lg-3">
                            <input type="button" class="genric-btn info min-width-350  e-large" value="예약하러 가기" id="btnReserv" onclick="ReservMove()">
                            <br>
                        </div>

                    </div>
                    <br />
                
                </div>
                
            </div>
         <%@include file="./hotelReview.jsp" %> 
     </div>
     
     </form>      		
		
		    
		<!-- Modal -->
		<div class="modal fade" data-backdrop="static"
			id="exampleModalScrollable" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalScrollableTitle">여행 목록에 추가</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="modal-body">
						<div class="folder p-2" id="folderInsert" onclick="main.insertFolder(this)">
							<i class="fa fa-plus pr-2"></i>여행 추가
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="btnLikeInsert" onclick="main.makeHeart()">추가</button>
					</div>
				</div>
			</div>
		</div>
		



	
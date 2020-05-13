<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./template/css/linearicons.css">
<link rel="stylesheet" type="text/css" href="./template/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="./template/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./template/css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="./template/css/jquery-ui.css">				
<link rel="stylesheet" type="text/css" href="./template/css/nice-select.css">							
<link rel="stylesheet" type="text/css" href="./template/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="./template/css/owl.carousel.css">				
<link rel="stylesheet" type="text/css" href="./template/css/main.css">
<link rel="stylesheet" href="./css/css_syj.css">

<meta charset="UTF-8">
<meta property="og:url"           content="https://www.naver.com/" />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="Your Website Title" />
<meta property="og:description"   content="Your description" />
<meta property="og:image"         content="https://www.your-domain.com/path/image.jpg" />

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script  src='./lib/jquery-3.4.1.js'></script>
<script  src='./js/hotel.js'></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	a8effece1d8215cec0ceddf314763998&libraries=services,clusterer"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="./swiper-5.3.8/package/css/swiper.min.css">
  
<style>
ul { 
	margin: 0;
	padding: 0;
	list-style-type: none; 
}
.preinfo > span{
	margin-right:16px;
}
.info{
	margin-top:50px;
}
.review-box{overflow:hidden;}
.review-box .pre-view.hidden{
	white-space:nowrap;
	word-wrap:normal;
	width:90%;
	overflow:hidden;
	text-overflow: ellipsis;
	float:left;
	
}
.rounded-circle{
	width: 100%;
}
.btn-moreInfo{display:none;white-space:nowrap;float:right;}

@media screen and (max-width: 533px){
	.review-box .pre-view.hidden{
		width:75%;
	}
}
</style>
<!-- Demo styles -->
 <style>
 body {
     background:#white;
     font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
     font-size: 14px;
     color:#000;
     margin: 0;
     padding: 0;
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
 .progress{
 	width:300px;
 }
 .gallery-thumbs{
 	height:130px;
 }
 
 </style>

</head>
<body>
	

<!-- start banner Area -->
<section class="banner-area relative">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-12">
				<div class="title text-center">
					<h1 class="text-white mb-10">객실 상세보기</h1>
					<form  method="post" name="frm_ms" id="frm_ms" class="row" >
	                        <div class="col-lg-2  col-md-12 ">
									<input type="text" class="form-control" name="name" placeholder="From " onfocus="this.placeholder = ''" onblur="this.placeholder = 'From '">									
									</div>
									<div class="col-lg-3  " >
									<input type="text" class="form-control date-picker" name="start" placeholder="Start " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start '">
									</div>
									<div class="col-lg-3">
									<input type="text" class="form-control date-picker" name="return" placeholder="Return " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Return '">
									</div>
									<div class="col-lg-2  ">
									<input type="number" min="1" max="20" class="form-control" name="adults" placeholder="인원 " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Adults '">
									</div>
									
								
										<button class="btn btn-primary" style="width: 15%; height: 40px;"
									type="submit"><i class="fa fa-search"></i></button>
													
								</form>		
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->
	

<form name='frm_review' id='frm_review' method='post' class='frm_review'>
	<br/>
	<br/>
	<br/>
	<div class='container'>
		디럭 스 
		<div class="float-right" style="display:flex">
			<a href='#' style='padding:.450rem .75rem ;font-size: medium;'><i class="fas fa-heart"></i>저장</a>
  			<div>
  			<!--  -->
			<div class="btn-group">
			  <button type="button" class="btn btn-default dropdown-toggle" style='color: #007bff; margin-left:-15px;' data-toggle="dropdown" aria-expanded="false"><i class="fas fa-share-alt mr-1"></i>
			   공유하기 <span class="caret"></span>
			  </button>
			  <div class="dropdown-menu" role="menu">
			   <div id="kakao-link-btn" href="javascript:sendLink()">
					<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png "style='width:18px;padding-left:3px'/>카카오톡
				</div>
				<span>
					<script type="text/javascript" src="//developers.band.us/js/share/band-button.js?v=11052020"></script>
					<script type="text/javascript">
					    new ShareBand.makeButton({"lang":"ko-KR","type":"a"});
					</script>
				</span>
			  </div>
			</div>
			<!--  -->
  			</div>
		</div>

		<div class='preinfo'>
		
			<div class='rating' data-rate='4'> <!-- data-rate에 별점을입력(평균별점입력5를넘기지않아야함) -->
				<span>별점:
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				</span>
			</div>
			<span>4건의 리뷰</span>
			<span>Type , World , menu , Local , Price </span>
		</div>
		
		<div class='preinfo'>
			<span>주소: 서울특별시..... </span>
			<span>연락처: 02-222-2222</span><br/>
			<div class="clearfix">홈페이지
				<a href='http://localhost:8888/review/review.jsp'>http://localhost:8888/review/review.jsp</a>
				<span>오픈:10:00, 마감22:00 ,휴일 (일요일)</span>
			</div>
			
		</div>
				<div class="info row justify-content-center mb-5">
					<div class='col-lg-8 col-sm-12'><!-- 큰사이즈에서 8 스몰에서 12 -->
						  <!-- Swiper -->
				  <div class="swiper-container gallery-top">
				    <div class="swiper-wrapper">
				    	<img class="swiper-slide" src="../images/festival/1.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/2.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/3.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/4.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/5.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/6.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/7.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/8.png"style="background-image" />
					    <img class="swiper-slide" src="../images/festival/9.png"style="background-image" />   
				   		<img class="swiper-slide" src="../images/festival/10.png"style="background-image"/>
				    </div>
				    <!-- Add Arrows -->
				    <div class="swiper-button-next swiper-button-white"></div>
				    <div class="swiper-button-prev swiper-button-white"></div>
				  </div>
				  <div class="swiper-container gallery-thumbs">
				    <div class="swiper-wrapper">
						<img class="swiper-slide" src="../images/festival/1.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/2.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/3.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/4.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/5.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/6.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/7.png"style="background-image" />
						<img class="swiper-slide" src="../images/festival/8.png"style="background-image" />
					    <img class="swiper-slide" src="../images/festival/9.png"style="background-image" />   
				   		<img class="swiper-slide" src="../images/festival/10.png"style="background-image"/>				    </div>
				  </div>
				
				
				
				
				
				
				
				<div >
					<h3>평가</h3>
					<div class="clearfix">
						<ul class='float-left' >
							<li><i class="fas fa-utensils mr-2"></i>음식</li>
							<li><i class="fas fa-hand-holding-heart mr-2"></i>서비스</li>
							<li><i class="far fa-money-bill-alt mr-2"></i>가격</li>
						</ul>
						<ul class="float-right">
							<li>
								<div class='rating' data-rate='1'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fas fa-star"></i>
									<i class="fas 
									fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</li>
							<li>
								<div class='rating' data-rate='2'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</li>
							<li>
								<div class='rating' data-rate='3'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</li>
							
						</ul>
					</div>
				
					<div>
						<h3>상세정보</h3>
						<div style="border:1px solid #666; padding:8px">
							가격대 $1000~$2000<br/> 
							일반음식점<br/>
						</div>
					</div>
					
					
				
					
					
						
							<div class="col-lg-7 offset-lg-3">
					<input type="button" class="genric-btn info min-width-350  e-large"
						value="예약하러 가기" id="btnReserv" onclick="ReservMove()"><br>
				</div>
						
						
						
				
				</div><br/>
				<div id="map" style="width:100%;height:400px;"></div>	
			</div>
		</div>
		<div class="row">
			<div class="col-12 pt-3" style='height:70px; border-top:1px solid black;' >
				<h3 style='float:left'>리뷰(4)</h3>
				<input class="btn btn-primary float-right" type='button' id='review'  name='review' value='리뷰작성'/>
			</div>
				
			<div class="col-12">
				<span style='display:inline-block;margin-bottom:10px; font-size:larger'>여행자 평가</span><br/>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name='5' id='5' value='star5' />
					<label class="custom-control-label float-left mr-3" for="5">최고였어요</label>
					<div class="progress">
				 		 <div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div class="custom-control custom-checkbox">
					<input type='checkbox' class="custom-control-input" name='4' id='4' value='star4' /> 
					<label class="custom-control-label float-left mr-3" for="4">좋았어요...</label>
					<div class="progress">
				  		<div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div class="custom-control custom-checkbox">
					<input type='checkbox' class="custom-control-input" name='3' id='3' value='star3'> 
					<label class="custom-control-label float-left mr-3" for="3">평범했어요</label>
					<div class="progress">
				 		 <div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div class="custom-control custom-checkbox">
					<input type='checkbox' class="custom-control-input" name='2' id='2' value='stra2'> 
					<label class="custom-control-label float-left mr-3" for="2">별로였어요</label>
					<div class="progress">
				  		<div class="progress-bar progress-bar-striped float-right " role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div class="custom-control custom-checkbox">
					<input type='checkbox' class="custom-control-input" name='1' id='1' value='stra1'> 
					<label class="custom-control-label float-left mr-3" for="1">실망했어요</label>
					<div class="progress">
				  		<div class="progress-bar progress-bar-striped float-right " role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>

			<br/>

			<div class="col-12 mt-2 " >
				<h5>여행자 리뷰 보기:</h5>
				<div class="form-row mt-3">
					<input type='text' class="form-control col-11" id='find' name='find' value=''  placeholder="검색하실 리뷰를 작성해주세요........." >
					<button class="form-group btn btn-primary col-1" id='findStr' name='findStr' ><i class="fas fa-search"></i></button>
				</div>
			</div>
		</div>
		<div class="row border-bottom py-3">
			<div class="col-2">
				<img class="rounded-circle" src="../images/festival/1.png" alt="글쓴이">
				<p class='text-center mt-3'>작성자</p>
			</div>
			<div class="col-10">
				<div class='rating' data-rate='5'> <!-- data-rate에 별점을입력(5초과금지) -->
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
				</div>
				<span>2020년 1월 15일에 작성</span>
				<span class="float-right">8명의 이용자가 도움이 됐다고 하던뎁숑?!</span>
				<h5>리뷰제목</h5>
				<div class="review-box">
					<p class="pre-view">리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다입니다리뷰입니다입니다리뷰입니다입니다리뷰입니다ㄴ난ㄴㄴ</p>
					<span class="btn-moreInfo">[더보기]</span>
				</div>
				<p><span>방문 날짜 : </span>2020년 1월</p>
				<p>도움이 됐나요? <button class="btn btn-outline-secondary"><i class="far fa-thumbs-up"></i></button></p>
			</div>
		</div>
		<div class="row border-bottom py-3">
			<div class="col-2">
				<img class="rounded-circle" src="../images/festival/1.png"alt="글쓴이">
			</div>
			<div class="col-10">
				<div class='rating' data-rate='3'> <!-- data-rate에 별점을입력(5초과금지) -->
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
				</div>
				<span>2020년 1월 15일에 작성</span>
				<span class="float-right">8명의 이용자가 도움이 됐다고 하던뎁숑?!</span>
				<h5>리뷰제목</h5>
				<div class="review-box">
					<p class="pre-view">리뷰입니다</p>
					<span class="btn-moreInfo">[더보기]</span>
				</div>
				<p><span>방문 날짜 : </span>2020년 1월</p>
				<p>도움이 됐나요? <button class="btn btn-outline-secondary"><i class="far fa-thumbs-up"></i></button></p>
			</div>
		</div>			
		
		
	<!-- paging -->

	<%--
		스프링 셋팅 후  	
		<div id='page' class='text-center mt-1'>
			<c:if test="${page.nowPage >1}">
				<input type='button' value='이전' onclick='goPage(${page.nowPage -1})' class='btn-sm btn-ok' />
			</c:if>

			<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
				<input type='button' value='${i }' class='${ (i== page.nowPage)? "btn-sm btn-sw" : "btn-sm btn-ok" }' onclick='goPage(${i })' />
			</c:forEach>

			<c:if test="${page.nowPage<page.totPage }">
				<input type='button' value='다음' onclick='goPage(${page.nowPage +1})' class='btn-sm btn-ok' />
			</c:if>
		</div>
	--%>
		<!-- 스프링 셋팅 전 -->
			<div id='page' class='text-center mt-1'>
			<c:if test="${1 >1}">
				<input type='button' value='이전' onclick='goPage(${1 -1})'
					class='btn-sm btn-ok' />
			</c:if>

			<c:forEach var="i" begin="${1 }" end="${5 }">
				<input type='button' value='${i }' 
					class='${ (i== 1)? "btn-sm btn-sw" : "btn-sm btn-ok" }' 
					onclick='goPage(${i })' />

			</c:forEach>

			<c:if test="${1<10 }">
				<input type='button' value='다음' onclick='goPage(${1 +1})'
					class='btn-sm btn-ok' />
			</c:if>
		</div>
		
	</div>
	</form>




	<script>
	
	
	// 리뷰 두줄이상 넘어가면 더보기
		jQuery(function ($) {
			var colorbox = $('.review-box .pre-view');
			colorbox.each( function() {
				$( this ).outerHeight();
				if( $(this).outerHeight() > 21 ){
				$(this).addClass('hidden');
				var btnMoreCmt = $(this).siblings('.btn-moreInfo');
				btnMoreCmt.show();
				btnMoreCmt.on("click",function(){
					$(this).siblings('.pre-view').removeClass('hidden');
					$(this).remove();
				});
				}
			} );
		});

	//별점표시하기
	
		$(function(){
			var rating = $('.rating');
			
			rating.each(function(){
				var targetScore = $(this).attr('data-rate');
				$(this).find('svg:nth-child(-n' + targetScore +')').css({color:'#ffc107'});
			});
				
		});
	
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

			<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a8effece1d8215cec0ceddf314763998');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: '딸기 치즈 케익',
        description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
        imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com'
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        }
      ]
    });
  //]]>
</script>
	
  <!-- Swiper JS -->
  <script src="../swiper-5.3.8/package/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
  var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
      slidesPerView: 4,
      freeMode: true,
      watchSlidesVisibility: true,
      watchSlidesProgress: true,
    });
    var galleryTop = new Swiper('.gallery-top', {
      spaceBetween: 10,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      thumbs: {
        swiper: galleryThumbs
      }
    });
  </script>
   
   
   
<script src="../template/js/vendor/jquery-2.2.4.min.js"></script>
<script src="../template/js/popper.min.js"></script>
<script src="../template/js/vendor/bootstrap.min.js"></script>
<script src="../template/js/jquery-ui.js"></script>					
<script src="../template/js/easing.min.js"></script>
<script src="../template/js/hoverIntent.js"></script>
<script src="../template/js/superfish.min.js"></script>	
<script src="../template/js/jquery.ajaxchimp.min.js"></script>
<script src="../template/js/jquery.magnific-popup.min.js"></script>						
<script src="../template/js/jquery.nice-select.min.js"></script>					
<script src="../template/js/owl.carousel.min.js"></script>							
<script src="../template/js/mail-script.js"></script>	
<script src="../template/js/main.js"></script>
    
</body>
</html>
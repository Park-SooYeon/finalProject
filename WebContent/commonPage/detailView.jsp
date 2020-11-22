<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<script src="js/main.js"></script>
<script src='./lib/jquery-3.4.1.js'></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link  rel="stylesheet" href="css/detail_view.css">

</head>
<body>
	<!-- top.jsp -->
	<section class="banner-area relative">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">어떤 축제를 즐기고 싶으세요?</h1>
				</div>
				<form class="" style="display: flex;">
					<input type="text" placeholder="축제를 검색해주세요!"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '축제를 검색해주세요!'" class="single-input">
					<button class="btn btn-primary" style="width: 15%; height: 40px;"
						type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
	</div>
	</section>
<input type="hidden" id="place_serial" name="place_serial" value="${param.code }" />
	<br/>
	<br/>
	<br/>
	<div class='container'>
		<div class="title1" style="margin-bottom:10px">
		<h2>${vo.place_name}</h2>
		</div>
		<div class="float-right" style="display:flex">
  			<div class="p-1 heart" onclick="main.like(this)">
				<i class="fa fa-heart-o" style="vertical-align;cursor:pointer; middle;margin-right: 20px; font-size: 28px; padding: 0.10rem !important; "></i>
			</div>
  			<div>
			<div class="btn-group">
			  <button type="button" class="btn btn-default dropdown-toggle" style='color: #007bff; background:ghostwhite; margin-left:-15px;' data-toggle="dropdown" aria-expanded="false"><i class="fa fa-share-alt mr-1"></i>
			   공유하기 <span class="caret"></span>
			  </button>
			  <div class="dropdown-menu" role="menu">
				 <div href="javascript:;" id="kakao-link-btn"> 
					<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style='width:18px;padding-left:3px;'/>카카오톡
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

<%-- 		<div class='preinfo'>
			<div class='rating' data-rate='${vo.avg_repu }' style='font-size: 23px; margin-bottom: 10px;'> <!-- data-rate에 별점을입력(평균별점입력5를넘기지않아야함) -->
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"style="margin-right: 10px;"></i>
				<span>${vo.cnt_review }건의 리뷰</span>
				<span>Type , World , menu , Local , Price </span>
			</div> 

			
		</div> --%>
		
		<div class='preinfo' style='font-size:18px'>
			<span><i class="fa fa-location-arrow" style="margin-right: 3px; margin-bottom:10px"aria-hidden="true"></i>주소: ${vo.place_location }</span>
			<%-- <span><i class="fa fa-mobile"style="margin-right: 3px" aria-hidden="true"></i>연락처: ${vo2.place_tel }</span><br/> --%>
			<div class="clearfix"><i class="fa fa-desktop"style="margin-right: 3px" aria-hidden="true"></i>홈페이지 
				<a href='http://localhost:8888/review/review.jsp' style="margin-right:5px">${vo.homepage }</a>
				<!-- <span><i class="fa fa-clock-o"style="margin-right: 3px" aria-hidden="true"></i>오픈:10:00, 마감22:00 ,휴일 (일요일)</span> -->
			</div>
			
		</div>
				<div class="info row justify-content-center mb-5">
					<div class='col-lg-8 col-md-12'><!-- 큰사이즈에서 8 스몰에서 12 -->
						  <!-- Swiper -->
				    <%-- <c:forEach var="i" items="${list }" varStatus="status"> --%>
				 		<div class="swiper-container gallery-top">
				    		<div class="swiper-wrapper">
						    	<img class="swiper-slide" src="${vo.photo_name }"style="background-image;cursor:pointer;" />
				    		</div>
							 <!-- Add Arrows -->
						     <div class="swiper-button-next swiper-button-white"></div>
							 <div class="swiper-button-prev swiper-button-white"></div>
				 		 </div>
					  <%-- <div class="swiper-container gallery-thumbs">
					    <div class="swiper-wrapper">
							<img class="swiper-slide" src="./images/${i.place_type }/${i.local_name }/${i.photo_name }${status.index+1 }.png"style="background-image;cursor:pointer;" />
					    </div>
					  </div> --%>
					  <%-- </c:forEach> --%>
				<div>
								
				<%-- <c:if test="${1 == vo.place_code }"><!-- 테스트 후 1를 2로 변경 -->
					<h3>평가</h3>
					<div class="clearfix" style='margin-top:5px'>
						<ul class='float-left' >
							<li><i class="fa fa-cutlery"style="margin-right: 3px"></i>음식</li>							
							<li><i class="fa fa-share-alt"style="margin-right: 3px" aria-hidden="true"></i>서비스</li>
							<li><i class="fa fa-krw"style="margin-right: 3px" aria-hidden="true"></i>가격</li>
						</ul>
						<ul class="float-right">
							<li>
								<div class='rating' data-rate='${vo.avg_food }'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</li>
							<li>
								<div class='rating' data-rate='${vo.avg_serv }'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</li>
							<li>
								<div class='rating' data-rate='${vo.avg_price }'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</li>
							
						</ul>
					</div>							
				</c:if>						
				<c:if test="${3 == vo.place_code }">
					<h3>평가</h3>
					<div class="clearfix" style='margin-top:5px'>
						<ul class='float-left' >
							<li><i class="fa fa-map-marker"style="margin-right: 3px"></i>접근성</li>
							<li><i class="fa fa-share-alt"style="margin-right: 3px" aria-hidden="true"></i>서비스</li>
							<li><i class="fa fa-expand"style="margin-right: 3px" aria-hidden="true"></i>규모</li>											
						</ul>
						<ul class="float-right">
							<li>
								<div class='rating' data-rate='${vo.avg_acces }'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</li>
							<li>
								<div class='rating' data-rate='${vo.avg_serv }'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</li>
							<li>
								<div class='rating' data-rate='${vo.avg_scale }'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</li>
							
						</ul>
					</div>
				</c:if>						
									
					<div>
						<h3>상세정보</h3>
						<div style="border:1px solid #666; padding:8px; margin-top:10px">
						<c:if test="${1 == vo.place_code }">
							가격대<i class="fa fa-krw" style="margin-right:3px;" aria-hidden="true"></i>1000~2000<br/> 
							일반음식점<br/>
						</c:if>
						<c:if test="${2 == vo.place_code }">
							가격대<i class="fa fa-krw" style="margin-right:3px;" aria-hidden="true"></i>1000~2000<br/> 
							일반음식점<br/>
						</c:if>
						<c:if test="${3 == vo.place_code }">
							가격대<i class="fa fa-krw" style="margin-right:3px;" aria-hidden="true"></i>1000~2000<br/> 
							일반음식점<br/>
						</c:if>
						<c:if test="${4 == vo.place_code }">
							가격대<i class="fa fa-krw" style="margin-right:3px;" aria-hidden="true"></i>1000~2000<br/> 
							일반음식점<br/>
						</c:if>
						</div>
					</div> --%>
				
				</div><br/>
				<div id="sw-map" style="width:100%;height:400px;"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 pt-3" style='height:70px; border-top:1px solid black;' >
				<h3 style='float:left'>리뷰(${review_cnt })</h3>
				<input class="btn btn-primary float-right"  onclick="insertMove(${param.code })"  type='button' id='review'  name='review' value='리뷰작성'/>
				 
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
					<input type='text' class="form-control col-11 " id='find' name='find' value=''  placeholder="검색하실 리뷰를 작성해주세요........." style="height: fit-content;" >
					<button class="form-group btn btn-primary col-1" id='findStr' name='findStr' ><i class="fa fa-search"></i></button>
				</div>
			</div>
		</div>
		<div class="row border-bottom py-3">
		<c:forEach var='i' items='${list }'>
			<div class="col-2">
				<img class="rounded-circle" src="./images/myPage/니니즈_20200602-14-25-41.png" alt="글쓴이">
				<p class='text-center mt-3'>${i.nickName }</p>
			</div>
			<div class="col-10">
				<div class='rating' data-rate='${i.reputation }'> <!-- data-rate에 별점을입력(5초과금지) -->
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
				</div>
				<span>${i.review_date }에 작성</span>
				<span class="float-right">${i.like_id }명의 이용자가 도움이 됐다고 하던뎁숑?!</span>
				<h5>${i.review_title }</h5>
				<div class="review-box">
					<p class="pre-view">${i.review_content }</p>
					<span class="btn-moreInfo">[더보기]</span>
				</div>
				<p><span>방문 날짜 : </span>${i.visit_date }</p>
				<p>도움이 됐나요? <button class="btn btn-outline-secondary"><i class="fa fa-thumbs-up"></i></button></p>
					<button id="testBtn" class="testBtn btn btn-primary" style='float:right' data-toggle="modal" data-target="#testModal">신고하기</button>
			</div>
		</c:forEach>
		</div>
<!-- <form name='frm_report' id='frm_report' method='post' class='frm_report'> -->
						<!-- 신고하기 Modal-->
						<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content" style="width:477px;">
									<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">리뷰신고하기!</h5>
										<button class="close" type="button" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">X</span>
										</button>
									</div>
								<div class="modal-body mb-1"><span>이미지 또는 내용 신고</span>
										<div class=row>
										<div class='col-md-6'>
											<div class="custom-control custom-radio" >
												<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input" value='1'>
												<label class="custom-control-label" for="jb-radio-1">영리목적/홍보성</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input" value='2'>
												<label class="custom-control-label" for="jb-radio-2">개인정보노출</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-3" class="custom-control-input" value='3'>
												<label class="custom-control-label" for="jb-radio-3">불법정보</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-4" class="custom-control-input" value='4'>
												<label class="custom-control-label" for="jb-radio-4">음란성/선정성</label>
											</div>
										</div>
										<div class='col-md-6'>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-5" class="custom-control-input" value='5'>
												<label class="custom-control-label" style="float-right" for="jb-radio-5">욕설/인신공격</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-6" class="custom-control-input" value='6'>
												<label class="custom-control-label" style="float-right"for="jb-radio-6">아이디/DB거래</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-7" class="custom-control-input" value='7'>
												<label class="custom-control-label" style="float-right"for="jb-radio-7">같은내용반복(도배)</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" name="jb-radio" id="jb-radio-8" class="custom-control-input" value='8'>
												<label class="custom-control-label" style="float-right"for="jb-radio-8">기타</label>
											</div>
										</div>
												<div style='float:left; margin-left: 16px;margin-top: 8px;'>
													<h5>신고 내용을 입력해주세요..</h5>
												</div>
										<div class='col-md-12'>
											<textarea class='accuse_text' style="margin-top:10px" id='review_accuse' form='inform' 
												cols='60' rows='10' placeholder="신고하실내용을 입력해주세여" ></textarea>
										</div>									
									</div>
								</div>
									<div class="modal-footer">
										<button class="btn success btn-primary" onclick="report()" >접수하기</button>
										<button class="btn btn-primary" type="button" data-dismiss="modal">취소하기</button>
									</div>
								</div>
							</div>
						</div>
		</div>
	<!-- </form> -->
		<!-- <div class="row border-bottom py-3">
			<div class="col-2">
				<img class="rounded-circle" src="./images/festival/1.png"alt="글쓴이">
				<p class='text-center mt-3'>작성자</p>
			</div>
			<div class="col-10">
				<div class="rating" data-rate="3"> data-rate에 별점을입력(5초과금지)
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
				</div>
				<span>2020년 1월 15일에 작성</span>
				<span class="float-right">8명의 이용자가 도움이 됐다고 하던뎁숑?!</span>
				<h5>리뷰제목</h5>
				<div class="review-box">
					<p class="pre-view">리뷰입니다</p>
					<span class="btn-moreInfo">[더보기]</span>
				</div>
				<p><span>방문 날짜 : </span>2020년 1월</p>
				<p>도움이 됐나요? <button class="btn btn-outline-secondary"><i class="fa fa-thumbs-up"></i></button></p> 
			 
				<button id="testBtn" class="testBtn btn btn-primary" style='float:right'>신고하기</button> -->
		
		    
		<!-- Modal -->
<!-- 		<div class="modal fade" data-backdrop="static"
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
		</div> -->
		
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
		<div class="col-md-12 blog-pagination justify-content-center d-flex">
		    <ul class="pagination">
		        <li class="page-item">
		            <a href="#" class="page-link" aria-label="Previous">
		                <span aria-hidden="true">
		                    <span class="lnr lnr-chevron-left"></span>
		                </span>
		            </a>
		        </li>
		        <li class="page-item"><a href="#" class="page-link">01</a></li>
		        <li class="page-item active"><a href="#" class="page-link">02</a></li>
		        <li class="page-item"><a href="#" class="page-link">03</a></li>
		        <li class="page-item"><a href="#" class="page-link">04</a></li>
		        <li class="page-item"><a href="#" class="page-link">09</a></li>
		        <li class="page-item">
		            <a href="#" class="page-link" aria-label="Next">
		                <span aria-hidden="true">
		                    <span class="lnr lnr-chevron-right"></span>
		                </span>
		            </a>
		        </li>
		    </ul>
		</div><!-- 페이징 -->
		
		</div><!-- 리뷰내용 -->
		</div><!-- 리뷰사진부분 -->
	</div> <!-- 컨테이너끝 -->
<!-- 리뷰작성페이지 이동 -->
<script>
  let insertMove = function(code) {
  	location.href = './?inc=review_insert.rv&code=' + code;
  }
</script>
<script type="text/javascript">
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a8effece1d8215cec0ceddf314763998');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',  // 컨테이너는 아까 위에 버튼이 쓰여진 부분 id 
      objectType: 'feed',
      content: {  // 여기부터 실제 내용이 들어갑니다. 
        title: '마시꾼마시써', // 본문 제목
        description: '#맛있다. #삼평동 #카페 #분위기 #소개팅',  // 본문 바로 아래 들어가는 영역?
        imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png', // 이미지
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com'
        }
      },
      social: {  /* 공유하면 소셜 정보도 같이 줄 수 있는데, 이 부분은 기반 서비스마다 적용이 쉬울수도 어려울 수도 있을듯 합니다. 전 연구해보고 안되면 제거할 예정 (망할 google  blogger...) */
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
<script src="js/festival_detail.js"></script>
<script src="js/cookie.js"></script>
</body>
</html>
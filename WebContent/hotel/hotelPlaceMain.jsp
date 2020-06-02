<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/main.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="likeList" value="${likeList }" />

<!-- start banner Area -->
<section class="banner-area relative">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">호텔</h1>
					<c:choose>
							<c:when test="${param.local == 1 }">
								서울
							</c:when>
							<c:when test="${param.local == 39 }">
								제주도
							</c:when>
							<c:when test="${param.local == 6 }">
								부산
							</c:when>
							<c:when test="${param.local == 4 }">
								대구
							</c:when>
							<c:when test="${param.local == 31 }">
								경기도
							</c:when>
							<c:when test="${param.local == 2 }">
								인천
							</c:when>
						</c:choose>
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
<!-- End banner Area -->

<script>
	let hotelSearchMove = function() {
		location.href = './?inc=hotel/hotel_body.jsp';
	}

	let locationMove = function() {

		location.href = './?inc=hotel/hotelPlaceMain.jsp'
	}
</script>

<!-- Swiper -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">최근 본 장소</h1>
				<a href="./?inc=hotel/hotel_body.jsp">더 많은 호텔 검색하기</a>
			</div>
		</div>
		<div class="row">
			<div class="single-destinations" onclick="locationMove()">

				<div class="details p-2">

					<h4>부산</h4>
					<p>2020/05/26~2020/06/28, 4명</p>

				</div>
			</div>
		</div>
	</div>

</section>


<!-- Swiper -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">예약 가능 호텔 !</h1>
				<a href="./?inc=hotel/hotel_body.jsp">더 많은 호텔 검색하기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">


					<c:forEach var='i' items='${hotelList2 }'>
						<div class="swiper-slide">
							<div class="p-1 heart" onclick="main.like(this)">
								<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
							</div>
							<div class="single-destinations">
								<div class="thumb">
									<img src="assets/images/upload/${i.oriFile}"
										style="height: 200px;">
								</div>
								<div class="tags">
									<div>
										&nbsp;&nbsp;<span class="badge badge photel"
											style="font-size: 15px;">예약 가능</span>

									</div>
								</div>
								<div class="details p-2">

									<h4>${i.place_name}</h4>
									<p>${i.place_tel}</p>
									<h6 class="date">${i.place_location}</h6>
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




<!-- Swiper -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">예약 불가능 호텔 !</h1>
				<a href="./?inc=hotel/hotel_body.jsp">더 많은 호텔 검색하기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">


					<c:forEach var='i' items='${hotelList }' begin='1' end='20'>
						<div class="swiper-slide">
							<div class="p-1 heart" onclick="main.like(this)">
								<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
							</div>
							<div class="single-destinations">
								<div class="thumb">
									<img src="images/hotel/seoul/${i.place_name}1.jpg"
										style="height: 200px;">
								</div>
								<div class="tags">
									<div>
										&nbsp;&nbsp;<span class="badge badge-warning"
											style="font-size: 15px; margin: 2px;">제휴준비중</span>

									</div>
								</div>
								<div class="details p-2">

									<h4>${i.place_name}</h4>

									<h6 class="date">${i.place_location}</h6>
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


<!-- Swiper -->


<!-- Modal -->
<div class="modal fade" data-backdrop="static"
	id="exampleModalScrollable" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalScrollableTitle">여행 목록에
					추가</h5>
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="btnLikeInsert"
					onclick="main.makeHeart()">추가</button>
			</div>
		</div>
	</div>
</div>

<script src="./swiper-5.3.8/package/js/swiper.min.js"></script>
<script src="js/main.js"></script>

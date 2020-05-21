<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="css/main.css">
<!-- start banner Area -->
<section class="banner-area relative">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">
						<c:choose>
							<c:when test="${param.menu == 1 }">
								즐길거리
								<c:set var="menu_name" value="happy"/>
							</c:when>
							<c:when test="${param.menu == 2 }">
								음식점
								<c:set var="menu_name" value="food"/>
							</c:when>
							<c:when test="${param.menu == 3 }">
								축제
								<c:set var="menu_name" value="festival"/>
							</c:when>
						</c:choose>
					</h1>
					<form class="" style="display:flex;">
						<input type="text" placeholder="지역 또는 검색어를 입력해주세요!"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '지역 또는 검색어를 입력해주세요!'"
						class="single-input">
						<button class="btn btn-primary" style="width: 15%; height: 40px;"
									type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->

<!-- Swiper -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">최근 본 장소</h1>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">

					<c:forEach var="i" begin="1" end="10">
						<div class="swiper-slide">
							<div class="p-1 heart" onclick="main.like(this)">
								<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
							</div>
							<div class="single-destinations" onclick="main.detailMove()">
								<div class="thumb">
									<img src="template/img/packages/d${i }.jpg" alt="no-image">
								</div>
								<div class="details p-2">
									<h4>Holiday Sea beach Blue Ocean</h4>
									<p>United staes of America</p>
									<h6 class="date">위치</h6>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
	</div>
</section>

<!-- Swiper -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">별점순</h1>
				<a href="#" onclick="main.searchMove(${param.menu})">더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">

					<c:forEach var="i" items="${starList }" begin="0" end="9">
						<div class="swiper-slide">
							<div class="p-1 heart" onclick="main.like(this)">
								<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
							</div>
							<div class="single-destinations" onclick="main.detailMove(${i.place_serial})">
								<div class="thumb">
									<img src="images/${menu_name }/${i.local_name }/${i.photo_name }1.jpg" alt="no-image">
								</div>
								<div class="details p-2">
									<h4>${i.place_name }</h4>
									<p class="rating" data-rate="${i.reputation }">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									 ${i.review_cnt } 건의 리뷰
									</p>
									<h6 class="date">${i.place_location }</h6>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
	</div>
</section>

<!-- Swiper -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">리뷰 많은 순</h1>
				<a href="#" onclick="main.searchMove(${param.menu})">더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">

					<c:forEach var="i" items="${reviewList }" begin="0" end="9">
						<div class="swiper-slide">
							<div class="p-1 heart" onclick="main.like(this)">
								<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
							</div>
							<div class="single-destinations" onclick="main.detailMove(${i.place_serial})">
								<div class="thumb">
									<img src="images/${menu_name }/${i.local_name }/${i.photo_name }1.jpg" alt="no-image">
								</div>
								<div class="details p-2">
									<h4>${i.place_name }</h4>
									<p class="rating" data-rate="${i.reputation }">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									 ${i.review_cnt } 건의 리뷰
									</p>
									<h6 class="date">${i.place_location }</h6>
								</div>
							</div>
						</div>
					</c:forEach>
				
				</div>

				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
	</div>
</section>
    
<!-- Modal -->
<div class="modal fade" data-backdrop="static"
	id="exampleModalScrollable" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalScrollableTitle">여행 목록에 추가</h5>
			</div>
			<div class="modal-body" id="modal-body">
				<c:forEach var="i" items="${tripList }">
					<div class='folder p-2' onclick='main.selectFolder(this)'><i class='fa fa-folder pr-2'></i>${i.trip_name }</div>
				</c:forEach>
				<div class="folder p-2" id="folderInsert" onclick="main.insertFolder()">
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

<!-- Swiper JS -->
<script src="./swiper-5.3.8/package/js/swiper.min.js"></script>
<script src="js/main.js"></script>
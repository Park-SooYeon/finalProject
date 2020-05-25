<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="css/main.css">

<c:set var = "likeList" value = "${likeList }"/>

<!-- start banner Area -->
<section class="banner-area relative">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">
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
					</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->

<section>
	<div class="container pb-40 pt-2">
		<div class="row">
			<div class="col-lg-4">
				<div class="row">
					<div class="col">
						<div class="single-menu relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h4>호텔</h4>
								
							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-menu relative" onclick="main.searchMove(12, ${param.local})">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h4>즐길거리</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="row">
					<div class="col">
						<div class="single-menu relative" onclick="main.searchMove(39, ${param.local})">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h4>음식점</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-menu relative" onclick="main.searchMove(15, ${param.local})">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h4>축제</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="row">
					<div class="col">
						<div class="single-menu relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h4>렌트카</h4>
							</div>
						</div>
					</div>
					<div class="col"></div>
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
				<h1 class="mb-10">추천 즐길거리</h1>
				<a href="#" onclick="main.searchMove(12, ${param.local})">더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">
				
					<c:forEach var="i" items="${happyList }" begin="0" end="9">
						<div class="swiper-slide">
							<div class="p-1 heart" onclick="main.like(this, ${i.place_serial})">
								<c:set var = "temp_serial" value = "${i.place_serial }"/>
								<c:choose>
									<c:when test="${fn:contains(likeList, temp_serial ) }">
										<i class="fa fa-heart" style="vertical-align: middle;"></i>
									</c:when>
									<c:otherwise>
										<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="single-destinations" onclick="main.detailMove(${i.place_serial})">
								<div class="thumb">
									<img src="images/${i.place_type }/${i.local_name }/${i.photo_name }1.jpg" alt="no-image">
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
				<h1 class="mb-10">추천 음식점</h1>
				<a href="#" onclick="main.searchMove(39, ${param.local})">더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">
					
					<c:forEach var="i" items="${foodList }" begin="0" end="9">
						<div class="swiper-slide">
							<div class="p-1 heart" onclick="main.like(this, ${i.place_serial})">
								<c:set var = "temp_serial" value = "${i.place_serial }"/>
								<c:choose>
									<c:when test="${fn:contains(likeList, temp_serial ) }">
										<i class="fa fa-heart" style="vertical-align: middle;"></i>
									</c:when>
									<c:otherwise>
										<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="single-destinations" onclick="main.detailMove(${i.place_serial})">
								<div class="thumb">
									<img src="images/${i.place_type }/${i.local_name }/${i.photo_name }1.jpg" alt="no-image">
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
				<h1 class="mb-10">추천 축제</h1>
				<a href="#"  onclick="main.searchMove(15, ${param.local})">더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">
					
					<c:forEach var="i" items="${festivalList }" begin="0" end="9">
						<div class="swiper-slide">
							<div class="p-1 heart" onclick="main.like(this, ${i.place_serial})">
								<c:set var = "temp_serial" value = "${i.place_serial }"/>
								<c:choose>
									<c:when test="${fn:contains(likeList, temp_serial ) }">
										<i class="fa fa-heart" style="vertical-align: middle;"></i>
									</c:when>
									<c:otherwise>
										<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="single-destinations" onclick="main.detailMove(${i.place_serial})">
								<div class="thumb">
									<img src="images/${i.place_type }/${i.local_name }/${i.photo_name }1.jpg" alt="no-image">
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
					<div class='folder p-2' onclick='main.selectFolder(this, ${i.trip_list_serial})'><i class='fa fa-folder pr-2'></i>${i.trip_name }</div>
				</c:forEach>
				<div class="folder p-2" id="folderInsert" onclick="main.insertFolder()">
					<i class="fa fa-plus pr-2"></i>여행 추가
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnClose">닫기</button>
				<button type="button" class="btn btn-primary" id="btnLikeInsert">추가</button>
			</div>
		</div>
	</div>
</div>

<!-- Swiper JS -->
<script src="./swiper-5.3.8/package/js/swiper.min.js"></script>
<script src="js/main.js"></script>
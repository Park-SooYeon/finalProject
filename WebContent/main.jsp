<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/main.css">
<!-- start banner Area -->
<section class="banner-area relative">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">어디로 떠나세요?</h1>
				</div>
				<form class="" style="display: flex;">
					<input type="text" placeholder="지역을 검색해주세요!"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '지역을 검색해주세요!'" class="single-input">
					<button class="btn btn-primary" style="width: 15%; height: 40px;"
						type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->
<script>
let placeMove = function() {
	location.href = './?inc=commonPage/placeMain.jsp';
}
let detailMove = function() {
	location.href = './?inc=commonPage/detailView.jsp';
}
</script>
<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destination relative" onclick="placeMove()">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h3>서울</h3>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-destination relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h3>제주도</h3>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-destination relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h3>강릉</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destination relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h3>여수</h3>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-destination relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h3>경주</h3>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-destination relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h3>부산</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Start hot-deal Area -->
<section class="hot-deal-area pt-30 pb-50">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12 active-hot-deal-carusel">
				<div class="single-carusel">
					<div class="thumb relative" style="height: 230px">
						<div class="overlay overlay-bg"></div>
						<img class="img-fluid" src="#" alt="광고 이미지1">
					</div>
				</div>
				<div class="single-carusel">
					<div class="thumb relative" style="height: 230px">
						<div class="overlay overlay-bg"></div>
						<img class="img-fluid" src="#" alt="광고 이미지2">
					</div>
				</div>
				<div class="single-carusel">
					<div class="thumb relative" style="height: 230px">
						<div class="overlay overlay-bg"></div>
						<img class="img-fluid" src="#" alt="광고 이미지3">
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End hot-deal Area -->

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
					<div class="swiper-slide">
						<div class="p-1 heart" onclick="main.like(this)">
							<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
						</div>
						<div class="single-destinations" onclick="detailMove()">
							<div class="thumb">
								<img src="template/img/packages/d1.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d2.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d3.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d4.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
					<div class="swiper-slide">Slide 10</div>
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
				<a href="?inc=commonPage/food_index.jsp">더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">
					<div class="swiper-slide">
						<div class="p-1 heart" onclick="main.like(this)">
							<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
						</div>
						<div class="single-destinations" onclick="detailMove()">
							<div class="thumb">
								<img src="template/img/packages/d1.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d2.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d3.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d4.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
					<div class="swiper-slide">Slide 10</div>
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
				<a>더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">
					<div class="swiper-slide">
						<div class="p-1 heart" onclick="main.like(this)">
							<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
						</div>
						<div class="single-destinations" onclick="detailMove()">
							<div class="thumb">
								<img src="template/img/packages/d1.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d2.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d3.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d4.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
					<div class="swiper-slide">Slide 10</div>
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
				<a>더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="swiper-container m-2">
				<div class="swiper-wrapper pl-50 pr-50">
					<div class="swiper-slide">
						<div class="p-1 heart" onclick="main.like(this)">
							<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
						</div>
						<div class="single-destinations" onclick="detailMove()">
							<div class="thumb">
								<img src="template/img/packages/d1.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d2.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d3.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="single-destinations">
							<div class="thumb">
								<img src="template/img/packages/d4.jpg" alt="">
							</div>
							<div class="details p-2">
								<div class="tags">
									<ul>
										<li><a href="#">태그1</a></li>
										<li><a href="#">태그2</a></li>
									</ul>
								</div>
								<h4>Holiday Sea beach Blue Ocean</h4>
								<p>United staes of America</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
					<div class="swiper-slide">Slide 10</div>
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

<!-- Swiper JS -->
<script src="./Swiper-3.4.2/dist/js/swiper.min.js"></script>
<script src="js/main.js"></script>
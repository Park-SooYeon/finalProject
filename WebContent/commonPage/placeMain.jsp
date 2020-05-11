<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/main.css">
<script src="lib/jquery-3.4.1.js"></script>
<!-- start banner Area -->
<section class="banner-area relative">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">지역명</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->
<script>
let move = function() {
	location.href = './?inc=commonPage/food_index.jsp';
}
</script>
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
						<div class="single-menu relative" onclick="move()">
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
						<div class="single-menu relative">
							<div class="thumb relative">
								<div class="overlay overlay-bg"></div>
							</div>
							<div class="desc">
								<h4>음식점</h4>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="single-menu relative">
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
<script src="./swiper-5.3.8/package/js/swiper.min.js"></script>
<script src="js/main.js"></script>
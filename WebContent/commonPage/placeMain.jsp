<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<div class="single-menu relative">
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

<script>

let like = function(ele) {
	let heart = ele.childNodes[1];
	
	if(heart.classList.contains("fa-heart-o")) {
		heart.classList.remove("fa-heart-o");
		heart.classList.add("fa-heart");
	} else if(heart.classList.contains("fa-heart")) {
		heart.classList.remove("fa-heart");
		heart.classList.add("fa-heart-o");
	}
}
</script>
<!-- Start destinations Area -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">최근 본 장소</h1>
				<a>더 보기</a>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d1.jpg" alt="">
								<div class="p-1" onclick="like(this)">
									<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
								</div>
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
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d2.jpg" alt="">
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
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d3.jpg" alt="">
								<div class="p-1" onclick="like(this)">
									<i class="fa fa-heart-o" style="vertical-align: middle;"></i>
								</div>
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
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d4.jpg" alt="">
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
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End destinations Area -->

<!-- Start destinations Area -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1>추천 여행지</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d1.jpg" alt="">
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
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d2.jpg" alt="">
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
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d3.jpg" alt="">
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
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d4.jpg" alt="">
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
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End destinations Area -->

<!-- Start destinations Area -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">추천 음식점</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d1.jpg" alt="">
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
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d2.jpg" alt="">
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
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d3.jpg" alt="">
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
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d4.jpg" alt="">
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
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End destinations Area -->

<!-- Start destinations Area -->
<section class="destinations-area pb-60">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content col-lg-12">
				<h1 class="mb-10">추천 축제</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d1.jpg" alt="">
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
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d2.jpg" alt="">
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
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d3.jpg" alt="">
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
					<div class="col">
						<div class="single-destinations">
							<div class="thumb">
								<img src="img/packages/d4.jpg" alt="">
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
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End destinations Area -->

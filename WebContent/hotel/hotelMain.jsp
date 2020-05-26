<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/main.css">



<!-- start banner Area -->

<section class="banner-area relative" id="hotel_top">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 400px">
			<div class="menu-content col-lg-12">
				<div class="title text-center">
					<h1 class="text-white mb-10">호텔 메인</h1>
					<form  method="post" name="frm_ht" id="frm_ht" class="row">
	                               <div class="col-lg-4  ">
									<input type="text" class="form-control" name="name" placeholder="From " onfocus="this.placeholder = ''" onblur="this.placeholder = 'From '">									
									</div>
									<div class="col-lg-4  " >
									<input type="text" id="datePickInput" class="form-control  datepicker-here" data-range="true" data-position="right top" data-language="kr" data-multiple-dates-separator=" - " name="start" placeholder="Start " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start '">
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

<script>
let hotelSearchMove = function() {
	location.href = './?inc=hotel/hotel_body.jsp';
}

let locationMove = function(){
	
	location.href='./?inc=hotel/hotelPlaceMain.jsp'
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
				<h1 class="mb-10">추천 호텔(별점순)</h1>
				<a href="./?inc=hotel/hotel_body.jsp">더 많은 호텔 검색하기</a>
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
								<p>지역</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
				
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
				<h1 class="mb-10">추천 호텔(리뷰 많은 순)</h1>
				<a href="./?inc=hotel/hotel_body.jsp">더 많은 호텔 검색하기</a>
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
								<p>지역</p>
								<h6 class="date">위치</h6>
							</div>
						</div>
					</div>
					

				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="js/review_insert.js"></script>

<!-- start banner Area -->
<section class="banner-area relative" style="height: 104px">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center">
		</div>
	</div>
</section>
<!-- End banner Area -->

<!-- Start about-info Area -->
<section class="about-info-area bt-4">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-4">
				<img class="img-fluid" src="img/about/info-img.jpg" alt="">
			</div>
			<div class="col-8">
				<h3>관광지명</h3>
				<h6>위치</h6>
			</div>
		</div>
		<hr />
		
		
		<form name="review_insert_frm" id="review_insert_frm" >
		
		
		<h3>이 관광지의 전반적인 평가</h3>
		<input type="hidden" name="star_input" id="star_input">
		<div class="review_star p-2" id="review_star" name="reputation">
			<span class="fa fa-star fa-3x" onclick="star(1)" id="star_5"></span>
			<span class="fa fa-star fa-3x" onclick="star(3)" id="star_4"></span>
			<span class="fa fa-star fa-3x" onclick="star(5)" id="star_3"></span>
			<span class="fa fa-star fa-3x" onclick="star(7)" id="star_2"></span>
			<span class="fa fa-star fa-3x checked" onclick="star(9)" id="star_1"></span>
		</div>
		<br />
		<h3>리뷰 제목</h3>
		<input type="text" placeholder="방문 목적이나 인상 깊었던 프로모션에 대해 언급하세요"
			onfocus="this.placeholder = ''"
			onblur="this.placeholder = '방문 목적이나 인상 깊었던 프로모션에 대해 언급하세요'"
			class="review-title mt-2"
			name="review_title"> <br />
		<h3>리뷰 내용</h3>
		<textarea class="review-textarea mt-2"
			placeholder="고객님의 경험을 공유하세요. 장소 또는 액티비티, 여행자를 위한 추천 정보를 알려주세요."
			onfocus="this.placeholder = ''"
			onblur="this.placeholder = '고객님의 경험을 공유하세요. 장소 또는 액티비티, 여행자를 위한 추천 정보를 알려주세요.'"
			required
			name="review_content"></textarea>
		<a style="float: right;">(최소 50자 이상)</a>
		<br />
		<h3>언제 방문하셨나요?</h3>
		<div class="review-select mt-2" id="default-select">
			<select name="visit_date">
				<option value="0">1개월 이내</option>
				<option value="1">2개월 이내</option>
				<option value="2">3개월 이내</option>
				<option value="3">4개월 이내</option>
				<option value="4">5개월 이내</option>
				<option value="5">6개월 이내</option>
			</select>
		</div>
		<hr/>
		<div>
			<h3 style="float:left">사진을 첨부하시겠어요?</h3><a>(선택사항)</a>
		</div>
		<br/>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable">
		 	사진 추가
		</button>
		<div class="picture_area mt-2" name="photo_name"></div>
		
		<div class="mt-2">리뷰 선택사항 목록</div>
		
		
		</form>
		
		
		<!-- Modal -->
		<div class="modal fade" data-backdrop="static" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalScrollableTitle">사진 업로드하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" id="modal-body">
		        <div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here<br/><br/>or Browse Files</div>
        		<input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="btnImgInsert">사진 추가</button>
		      </div>
		    </div>
		  </div>
		</div>
		<hr/>
		<div class="mb-20">
			<button class="btn btn-primary my-2 my-sm-0" type="button" id="review_insert">리뷰 저장</button>
		</div>
	</div>
</section>
<!-- End about-info Area -->
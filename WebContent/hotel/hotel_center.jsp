<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
let roomDetailMove = function() {
	location.href = './?inc=hotel/roomDetailView.jsp';
}
</script>


<div class="col-md-12" id="widthsort_list" onclick="roomDetailMove()">
  <div class="row" >
	<div class="col-md-3">
		<img src="../template/img/elements/d.jpg" alt="" class="img-fluid">
	</div>	
	<div class="col-md-9 mt-sm-20 left-align-p" >	
	    <span>1(순번). 업체명</span></br>
	    <div class="star">
	    <span>별점</span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>				
		<span>00 건의 리뷰 (개수), 오픈 , 마감 , 휴일 시간에 따른 마감여부</span></br>
		</div>
	    <span>간단설명 (타입 , 세계 , 메뉴 , 지역 가격)</span></br>
	    <hr/>
	    <span>한줄평</span></br>
	    <span>한줄평</span></br>
	    
	</div>
  </div>
</div>

<div class="col-md-3" id="cardsort_list">
	<div class="col-md-12">
		<img src="../template/img/elements/d.jpg" alt="" class="img-fluid">
	</div>	
	<div class="col-md-12 mt-sm-20 left-align-p" >	
	    <span>1(순번). 업체명</span></br>
	    <div class="star">
	    <span>별점</span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span><br/>
		</div>
	    <span>타입 : </span></br>
	    <span>메뉴 : </span></br>
	    <span>세계요리 :</span></br>	    
	</div>
</div>
 
<!-- 페이징 -->
	
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
		
		</div>
	
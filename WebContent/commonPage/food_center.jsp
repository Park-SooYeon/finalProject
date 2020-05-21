<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="widthsort_list" style="display:none">
<c:forEach var="i" items="${list }">
	<div class="row col-0">
	  <div class="col-md-12 widthsort_list" onclick="detailMove()">
	    <div class="row mb-10">
		  <div class="col-md-3 nopadding">
			<img src="images/${i.place_type }/${i.local_name }/${i.photo_name }1.jpg" alt="no-image" class="img-fluid">
		  </div>	
		    <div class="col-md-9 mt-sm-20 left-align-p" style="background-color:white;">	
		      <span>${i.place_name }</span></br>
		        <div style="width: 30px; float: left;">별점</div>	    
		        <div class="rating" data-rate="${i.reputation }" style="float: left;">	    
				  <i class="fa fa-star"></i>
				  <i class="fa fa-star"></i>
				  <i class="fa fa-star"></i>
				  <i class="fa fa-star"></i>
				  <i class="fa fa-star"></i>
			    	<span>${i.review_cnt } 건의 리뷰</span>
			    </div>
			    <br/>
		      <span>${i.place_location }</span>
		      <hr/>
		      <span>간단설명 (타입 , 세계 , 메뉴 , 지역 가격)</span></br>
		      <span>한줄평</span></br>
		    
		  </div>
	    </div>
	  </div>
	</div>
</c:forEach>
</div>

  <div class="row" id="cardsort_list">
  
	<c:forEach var="i" items="${list }">
		<div class="col-md-3 col-6 p-1 cardsort_list" onclick="detailMove()">
			<div class="row">
				<div class="col-md-12">
					<img src="images/${i.place_type }/${i.local_name }/${i.photo_name }1.jpg" alt="no-image" class="img-fluid">
				</div>
				<div class="col-md-12 mt-sm-20 left-align-p">
					<div style="background-color: white; padding: 10px;">
						<div style="height: 10px;">&nbsp</div>
						<span>${i.place_name }</span>
						<div class="rating" data-rate="${i.reputation }">
							<i class="fa fa-star checked"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i> 
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<span>${i.review_cnt } 건의 리뷰</span>
						</div>
						<span>${i.place_location }</span>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
		  	  
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

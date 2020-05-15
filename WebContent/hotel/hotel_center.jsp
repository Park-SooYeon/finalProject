<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
let hotelDetailMove = function() {
	location.href = './?inc=hotel/hotelDetailView.jsp';
}
</script>


<div class="col-md-12" id="hotel_list"  style="padding-top:10px;"
 >
 <div class="row">

	<div class="col-md-6">

		    <img src="template/img/packages/d4.jpg" alt="">
			</div>
				<div class="col-md-6">		
								<h3>그랜드 하얏트 호텔 (서울)
								&nbsp;&nbsp;<span class="badge badge photel">예약 가능</span></h3>
								<label>위치</label>
								
								<br>
						
								<div class="tags"> 
								       <div>
									    <span class="badge badge-info">와이파이</span>
								    	<span class="badge badge-info">조식</span>
								      </div>
		     
		     <div class="clearfix" style='margin-top:5px'>
		     <ul >
							<li>
								<div class='rating' data-rate='1'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</li>
				</ul>
				</div>			
	        
	            
	              
	 
	          
	                <label style="font-size:20px; padding-right:33px;">최저가 nnnnnn원
                        </label>
	            <br>
	               
                    <input type="button" class="genric-btn info min-width-180 pull-right  " 
                    value="예약하러 가기" id="btnReserv" onclick="hotelDetailMove()">
                        </div>
	        </div>
	        
	         
		</div>
								</div>
						
					
						<br>
					
				
						
<div class="col-md-12" id="noHotel_list"  style="padding-top:10px;" >
 <div class="row">

	<div class="col-md-6">
								<img src="template/img/packages/d4.jpg" alt="">
			</div>
				<div class="col-md-6">		
								<h3>Holiday Sea beach Blue Ocean</h3>
								<label>위치</label>
								
								<br>
						
								<div class="tags"> 
								       <div>
									    <span>태그1</span>
								    	<span>태그2</span>
								      </div>
		     
		     <div class="clearfix" style='margin-top:5px'>
		     <ul >
							<li>
								<div class='rating' data-rate='1'> <!-- data-rate에 별점을입력(5초과금지) -->
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</li>
				</ul>
				</div>			
	        
	            
	                <br>
	                <br>
	                <label style="font-size:20px;">최저가 nnnnnn원  ~ 최고가 nnnnnn원 </label>
	            
	    
	        
	        
	         
		</div>
								</div>
						
							</div>
						</div>
						
						

<!-- 페이징 -->
	
		<div class="col-md-12 blog-pagination justify-content-center d-flex">
		<div class="row">
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
		</div>
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
let roomDetailMove = function() {
	location.href = './?inc=hotel/roomDetailView.jsp';
}
</script>


<div class="col-md-12" id="widthsort_list" onclick="roomDetailMove()" >
 <div class="row">

	<div class="col-md-6">
								<img src="template/img/packages/d4.jpg" alt="">
			</div>
				<div class="col-md-6">		
								<h4>Holiday Sea beach Blue Ocean</h4>
								<label>위치</label>
								
								
						
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
	                <h4>최저가 nnnnn원  ~ 최고가 </h4>
	            
	    
	        
	        
	         
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
	
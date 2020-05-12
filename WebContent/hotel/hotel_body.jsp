<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top.jsp -->
	<%@ include file="../top.jsp" %>

<div class="whole-wrap">
  <div class="container">
    <div class="section-top-border">
      <div class="row">
      
      
        <div class="col-lg-3 col-md-4 mt-sm-30 element-wrap posts-list">
          <div class="col-lg-12" style="background-color:white;">
	        <%@include file="./hotel_filter.jsp" %>  
	      </div>     
		</div>	    
          
        <div class="col-lg-9 col-md-9">         
	      <div class="row">	      
	        <div class="col-lg-12">
	        
	          <div class="row">
	            <div class="col-lg-12" style="padding: 0 !important; margin: 0 !important;">
	              <%@include file="./hotel_search.jsp" %>
	            </div>
	          </div>	          
	          <br/>
	          
	          <div class="row" style="background-color:white;">
	            <div class="col-lg-12">
	              <div class="row">
		            <%@include file="./hotel_center.jsp" %>		              
		          </div>
		        </div>
		      </div>
		      
		    </div>	      	          
		  </div>
		</div>
		

      </div>
    </div>
  </div>
</div>


<!-- top.jsp -->
	<%@ include file="../bottom.jsp" %>
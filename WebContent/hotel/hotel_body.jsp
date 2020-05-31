<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="whole-wrap">
  <div class="container">
    <div class="section-top-border">
      <div class="row">
      
       <%@include file="hotel_filter.jsp" %>  
	      
        <div class="col-lg-9 col-md-9">         
	      <div class="row">	      
	        <div class="col-lg-12">
	        
	          <div class="row">
	            <div class="col-lg-12" style="padding: 0 !important; margin: 0 !important;">
	              <%@include file="hotel_search.jsp" %>	              
	            </div>
	          </div>
	              <%@include file="hotel_center.jsp" %>
		    </div>	      	          
		  </div>
		</div>
		

      </div>
    </div>
  </div>
</div>
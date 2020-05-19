<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="whole-wrap">
  <div class="container">
    <div class="section-top-border">
      <div class="row">
      
      
        <c:choose>
        	<c:when test="${param.menu == 1 }">
        		<%@include file="../happy/happy_filter.jsp" %>  
        	</c:when>
        	<c:when test="${param.menu == 2 }">
        		<%@include file="../food/food_filter.jsp" %>  
        	</c:when>
        	<c:when test="${param.menu == 3 }">
        		<%@include file="../festival/fe_filter.jsp" %>  
        	</c:when>
        </c:choose>
	          
          
        <div class="col-lg-9 col-md-9">         
	      <div class="row">	      
	        <div class="col-lg-12">
	        
	          <div class="row">
	            <div class="col-lg-12" style="padding: 0 !important; margin: 0 !important;">
	              <%@include file="food_search.jsp" %>	              
	            </div>
	          </div>
	              <%@include file="food_center.jsp" %>
		    </div>	      	          
		  </div>
		</div>
		

      </div>
    </div>
  </div>
</div>
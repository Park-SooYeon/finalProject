<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 관심리스트 -->
<section class="destinations-area my-list-area mb-20">
  
  
  <div class="row">
  <c:forEach items="${list }" var="i" varStatus="status">
    <div class="col-lg-4">
      <div class="single-destinations">
        <div class="thumb-review">
          <img src="images/${i.p.place_type}/${i.p.local_name }/${i.p.photo_name }${status.count }.jpg" alt="no-image"/>
        </div>
        <div class="details">
          <h4 class="d-flex justify-content-between">
            <span>${i.p.place_name }</span>
          </h4>
          <p>작성자 : ${i.member_id }</p>
          <h5 class="d-flex justify-content-between my-2">
            "${i.review_title }"
            <div class="star rating" data-rate="${ i.p.reputation}">
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
            </div>
          </h5>
          <p>
            ${i.review_content }
          </p>
        </div>
      </div>
    </div>
    </c:forEach>
  </div>
</section>
<!-- End destinations Area -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 관심리스트 항목 전체보기-->
<section class="destinations-area my-list-area mb-20">
  <div class="row">
  
  <c:forEach var="i" items="${list }">
    <div class="col-lg-4">
      <div class="single-destinations">
        <div class="thumb-custom">
          <img src="./template/img/hotels/d2.jpg" alt="" />
        </div>
        <div class="details">
          <h4 class="d-flex justify-content-between">
            <span>${i.place_name }</span>
            <div class="star">
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star"></span>
            </div>
          </h4>
          <p>
            경주, 대한민국 | 49 Reviews
          </p>
          <div class="trip-list-box text-center">${i.trip_name }</div>
        </div>
      </div>
    </div>
    </c:forEach>
  </div>
</section>
<!-- End destinations Area -->

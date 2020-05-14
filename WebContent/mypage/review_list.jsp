<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 관심리스트 -->
<section class="destinations-area my-list-area mb-20">
  
  
  <div class="row">
  <c:forEach begin="1" end="6">
    <div class="col-lg-4">
      <div class="single-destinations">
        <div class="thumb-review">
          <img src="./images/myPage/food3.jpg" alt="" />
        </div>
        <div class="details">
          <h4 class="d-flex justify-content-between">
            <span>롤인익선</span>
          </h4>
          <p>작성자 : 누구누구</p>
          <h5 class="d-flex justify-content-between my-2">
            "리뷰 제목"
            <div class="star">
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star"></span>
            </div>
          </h5>
          <p>
            여기는 제가 학원에 다닐 때 자주 갔던 곳인데 어쩌구 저쩌구.....
          </p>
        </div>
      </div>
    </div>
    </c:forEach>
  </div>
</section>
<!-- End destinations Area -->

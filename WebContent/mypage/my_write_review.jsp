<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Favicon-->
    <link rel="shortcut icon" href="../template/img/fav.png" />
    <!-- Author Meta -->
    <meta name="author" content="colorlib" />
    <!-- Meta Description -->
    <meta name="description" content="" />
    <!-- Meta Keyword -->
    <meta name="keywords" content="" />
    <!-- meta character set -->
    <meta charset="UTF-8" />
    <!-- Site Title -->
    <title>Travel</title>

    <link rel="stylesheet" href="./css/custom.css" />
  </head>

  <body style="z-index:-1;">
    <!-- start banner Area -->
    <section class="relative about-banner" style="z-index: -1;">
      <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
          <div class="about-content col-lg-12">
            <h2 class="text-white mb-4">방문한 장소 리뷰 작성하기</h2>
            <div class="row">
              <div class="input-group-icon col-md-6">
                <div class="icon"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                <input
                  type="text"
                  placeholder="도시 또는 목적지 검색"
                  onfocus="this.placeholder = ''"
                  onblur="this.placeholder = '도시 또는 목적지 검색'"
                  class="single-input"
                />
              </div>

              <div class="input-group-icon col-md-6">
                <div class="icon"><i class="fa fa-search" aria-hidden="true"></i></div>
                <input
                  type="text"
                  placeholder="호텔, 음식점, 관광명소, 렌터카"
                  onfocus="this.placeholder = ''"
                  onblur="this.placeholder = '호텔, 음식점, 관광명소, 렌터카'"
                  class="single-input"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Start post-content Area -->
    <div class="container mb-3 mt-5"><h4>당신의 리뷰를 기다리고 있어요!</h4></div>

    <section class="mp-total-wrapper">
      <div class="container">
        <div class="row">
        
        <c:forEach begin="1" end="3">
          <div class="col-lg-12">
            <div class="mp-body-single" style="height:auto;">
              <div class="row">
                <div class="col-lg-3 mp-img" style="height:23vh;">
                  <img
                    src="https://i.ibb.co/TvM5WBJ/food17.jpg"
                  />
                </div>
                <div class="col-lg-9 p-3">
                  <ul class="mp-inner">
                    <li class="mp-hotel-name">레스토랑 이름</li>
                    <li class="mp-hotel-desc"><i class="fa fa-map-marker"></i> <span>서울 서초구 서초동 1317</span></li>
                  	<li class="star">
                  		<i class="fa fa-star checked"></i>
                  		<i class="fa fa-star checked"></i>
                  		<i class="fa fa-star checked"></i>
                  		<i class="fa fa-star"></i>
                  		<i class="fa fa-star"></i>
                  	<small>283명이 이 장소를 평가했습니다.</small>
                  	</li>
                  </ul>
                  <div class="col-md-12 mb-3">
                <button class="btn btn-outline-primary pull-right" style="position:absolute; right:0; top:9px;">평가하러 가기</button>
              </div>
                </div>
                </div>
              </div>
              <hr />
              
            </div>
            </c:forEach>
          </div>
        </div>
    </section>
  </body>
</html>

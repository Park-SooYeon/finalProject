<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--posting wrapper-->
          
          <!-- 리뷰 시작 -->
            <c:forEach var="i" items="list">
              <div class="posts-review">
                <div class="posting-title row">
                  <span class="col-xl-1 col-lg-1 col-md-1 text-center p-0">
                    <img class="rounded-circle posting-profile" src="./template/img/blog/s-img.jpg" />
                  </span>
                  <div class="col-xl-11 col-lg-11 col-md-11 mt-1" style="position: relative;">
                    <div>
                      <b>${i.member_id }</b>
                      님이 새 <strong>리뷰</strong>를 추가했습니다.
                      <div class="ellipsis-btn">
                        <img width="17px" src="./images/myPage/ellipsis-h-solid.svg" /><span class="ellipsis-menu"
                          >삭제</span
                        >
                      </div>
                    </div>
                    <small>${i.review_date }</small>
                  </div>
                </div>
                <div class="single-post row mb-2">
                  <div class="col-lg-12 p-2" style="background: #f9f9f9; margin-bottom: 15px;">
                    <div class="container">
                      <h3 class="star my-2">
                        <i class="fa fa-star checked"></i>
                        <i class="fa fa-star checked"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </h3>
                      <h4>"${i.review_title }"</h4>
                      <p class="my-2">
                        ${i.review_content }
                      </p>
                      <span><strong>방문날짜</strong> : ${i.visit_date }</span>
                    </div>

                    <div class="col-lg-12 col-md-12">
                      <div class="item-list-wrapper" style="width: 92%;">
                        <div class="travel-item-list">
                          <span class="travel-box my-2" style="width: 250px;">
                            <img src="./template/img/blog/pp1.jpg" />
                            <div class="m-2">
                              <h5>${i.p.place_name }</h5>
                              <div>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <small>(${i.review_cnt }건)</small>
                              </div>
                              <div>${i.p.local_name }, 대한민국</div>
                            </div>
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="post-bottom-bar">
                    <span class="social-like"><i class="fa fa-thumbs-up"></i> 도움이 됐어요</span>
                    <span class="social-share"><i class="fa fa-share-alt"></i> 공유하기</span>
                  </div>
                </div>
              </div>
            </c:forEach>
          
            <!--one post-->
            <c:forEach begin="1" end="2">
              <div class="posts-list">
                <div class="posting-title row">
                  <span class="col-xl-1 col-lg-1 col-md-1 text-center p-0">
                    <img class="rounded-circle posting-profile" src="./template/img/blog/s-img.jpg" />
                  </span>
                  <div class="col-xl-11 col-lg-11 col-md-11 mt-1" style="position: relative;">
                    <div>
                      <b>JuHyeon An</b>
                      님이 새 <strong>여행리스트</strong>를 추가했습니다.
                      <div class="ellipsis-btn">
                        <img width="17px" src="./images/myPage/ellipsis-h-solid.svg" /><span class="ellipsis-menu"
                          >삭제</span
                        >
                      </div>
                    </div>
                    <small>2019년 6월 26일</small>
                  </div>
                </div>
                <div class="single-post row mb-2">
                  <div class="col-lg-12 p-2" style="background: #f9f9f9; margin-bottom: 15px;">
                    <div class="text-center post-img-pa">
                      <img class="post-img" src="https://i.ibb.co/xhTnhzH/place2.jpg" alt="" />
                    </div>

                    <div class="col-lg-12 col-md-12 trip-slide">
                      <h3 class="mt-20 mb-20 px-3">
                        부싼
                      </h3>
                      <div class="item-list-wrapper swiper-container" style="width: 92%;">
                        <div class="travel-item-list swiper-wrapper">
                          <c:forEach begin="1" end="5">
                            <span class="travel-box swiper-slide">
                              <img src="./template/img/blog/pp1.jpg" />
                              <div class="m-2">
                                <h5>해운대</h5>
                                <div>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <small>(3건)</small>
                                </div>
                                <div>부산, 대한민국</div>
                              </div>
                            </span>
                          </c:forEach>
                        </div>
                      </div>
                      <div class="swiper-button-next"></div>
                      <div class="swiper-button-prev"></div>
                    </div>
                  </div>
                  <div class="post-bottom-bar">
                    <span class="social-save"><i class="fa fa-heart-o"></i> 모두 관심리스트에 담기</span>
                    <span class="social-share"><i class="fa fa-share-alt"></i> 공유하기</span>
                  </div>
                </div>
              </div>
            </c:forEach>
            <!--post 끝-->

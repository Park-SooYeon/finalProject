<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Favicon-->
    <link rel="shortcut icon" href="./template/img/fav.png" />
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
  <body>
    <!-- start banner Area -->
    <section class="relative about-banner" style="z-index: -1;">
      <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
          <div class="about-content col-lg-12"></div>
        </div>
      </div>
    </section>
    <!-- End banner Area -->
    <div class="container profile">
      <div class="row">
        <div class="col-lg-2 col-md-3 img-container text-center">
          <img class="rounded-circle profile-image" id="pro-main-img" src="./template/img/blog/c1.jpg" alt="" />
        </div>
        <span class="col-lg-7 col-md-6 col-sm-9 profile-main-detail">
          <h2 id="pro-nick">JuHyeon An</h2>
          <span id="pro-id"><i class="fa fa-at" aria-hidden="true"></i> IT_Traveler</span>
          <div class="row">
            <div class="col-md-12 give-a-space"></div>
          </div>
          <div class="row follow-status">
            <span class="col-lg-2 col-md-4 col-sm-4 col-xs-4 text-center">
              <h4>포스팅</h4>
              <h4>10</h4>
            </span>

            <span class="col-lg-2 col-md-4 col-sm-4 col-xs-4 text-center">
              <h4>팔로잉</h4>
              <h4>3</h4>
            </span>
            <span class="col-lg-2 col-md-4 col-sm-4 col-xs-4 text-center">
              <h4>팔로워</h4>
              <h4>5</h4>
            </span>
            <span class="col-lg-6"></span>
          </div>
        </span>
        <span class="col-md-3 col-sm-3"
          ><button
            type="button"
            class="btn btn-default pull-right modify-btn"
            data-toggle="modal"
            data-target="#mp-modifyModal"
            id="mp-btnModifyProfile"
          >
            프로필수정
          </button></span
        >
      </div>
      <br />
      <nav class="navbar navbar-expand-sm profile-menu">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link on" href="#">활동 피드</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">여행</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">리뷰</a>
          </li>
        </ul>
      </nav>
    </div>

    <!-- Start post-content Area -->
    <section class="post-content-area single-post-area" style="padding-top: 20px;">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 sidebar-widgets profile-widget pl-0">
            <div class="widget-wrap py-0">
              <div class="single-sidebar-widget search-widget">
                <form class="search-form" action="#">
                  <input
                    placeholder="검색어입력"
                    name="search"
                    type="text"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = '검색어입력'"
                  />
                  <button type="submit"><i class="fa fa-search"></i></button>
                </form>
              </div>
              <div
                class="single-sidebar-widget user-info-widget profile-detail"
                data-toggle="modal"
                data-target="#mp-modifyModal"
              >
                <a href="#"><h4 class="my-3">JuHyeon An</h4></a>
                <ul>
                  <li>
                    <i class="fa fa-thumb-tack" aria-hidden="true"></i> <span id="pro-addr">경기도 고양시 덕양구</span>
                  </li>
                  <li><i class="fa fa-calendar"></i> <span id="pro-enroll">2019년 6월 26일 가입</span></li>
                  <li><i class="fa fa-internet-explorer"></i> <span id="pro-web">www.ajh2042.com</span></li>
                </ul>
                <p id="self-desc">
                  안녕하세요. 저는 안주현입니다. 자기소개 자기소개 자기소개 자기소개 입니다. 잘 부탁드립니다. 자기소개
                  자기소개 자기소개 자기소개 끝.
                </p>
              </div>
              <div class="single-sidebar-widget user-info-widget profile-detail">
                <a href="./?inc=mypage/my_write_review.jsp"><h4 class="my-3">여행경험을 공유하세요!</h4></a>
                <ul>
                  <li><i class="fa fa-edit"></i> 리뷰 작성하러 가기</li>
                </ul>
              </div>
            </div>
          </div>

          <!--posting wrapper-->
          <div class="col-lg-9 post-wrapper" style="padding: 0;">
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
                    <span class="social-save"><i class="fa fa-heart-o"></i> 내 여행목록에 담기</span>
                    <span class="social-share"><i class="fa fa-share-alt"></i> 공유하기</span>
                  </div>
                </div>
              </div>
            </c:forEach>
            <!--post 끝-->

            <!-- 리뷰 시작 -->
            <c:forEach begin="1" end="2">
              <div class="posts-review">
                <div class="posting-title row">
                  <span class="col-xl-1 col-lg-1 col-md-1 text-center p-0">
                    <img class="rounded-circle posting-profile" src="./template/img/blog/s-img.jpg" />
                  </span>
                  <div class="col-xl-11 col-lg-11 col-md-11 mt-1" style="position: relative;">
                    <div>
                      <b>JuHyeon An</b>
                      님이 새 <strong>리뷰</strong>를 추가했습니다.
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
                    <div class="container">
                      <h3 class="star my-2">
                        <i class="fa fa-star checked"></i>
                        <i class="fa fa-star checked"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </h3>
                      <h4>"여긴 가지마세요....</h4>
                      <p class="my-2">
                        여기서 먹고 식욕을 잃었습니다.ㅠㅠ 여긴 제발 가지마세요 비추x100 여기서 먹고 식욕을
                        잃었습니다.ㅠㅠ 여긴 제발 가지마세요 비추x100 여기서 먹고 식욕을 잃었습니다.ㅠㅠ 여긴 제발
                        가지마세요 비추x100 여기서 먹고 식욕을 잃었습니다.ㅠㅠ 여긴 제발 가지마세요 비추x100
                      </p>
                      <span><strong>방문날짜</strong> : 2020년 5월</span>
                    </div>

                    <div class="col-lg-12 col-md-12">
                      <div class="item-list-wrapper" style="width: 92%;">
                        <div class="travel-item-list">
                          <span class="travel-box my-2" style="width: 250px;">
                            <img src="./template/img/blog/pp1.jpg" />
                            <div class="m-2">
                              <h5>Sook Hostel</h5>
                              <div>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <small>(3건)</small>
                              </div>
                              <div>치앙마이, 태국</div>
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
          </div>
        </div>
      </div>
    </section>
    <!-- End post-content Area -->

    <!--  여기서부터 모달  -->
    <div
      class="modal fade"
      id="mp-modifyModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="mp-modifyModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document" style="max-width: 590px;">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="mp-modifyModalLabel">프로필 수정하기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" style="color: #000; padding: 2rem 2rem;">
            <div class="row">
              <div class="col-md-3 col-sm-3 text-center mb-4">
                <img
                  class="rounded-circle profile-image pro-modify-img"
                  id="pro-img"
                  src="./template/img/blog/c2.jpg"
                />
                <div class="rounded-circle profile-image pro-img-back" onclick="photoUpload();">
                  <span class="text-white"><i class="fa fa-edit"></i><strong>수정</strong></span>
                </div>
                <div class="my-1" onclick="photoUpload();"></div>
                <input type="file" id="pro-upload" name="pro-upload" />
              </div>
              <div class="col-md-9 col-sm-9">
                <form id="mp-proModifyFrm" action="#">
                  <label for="mp-name">닉네임</label>
                  <div class="mb-10">
                    <input
                      type="text"
                      name="mp-name"
                      id="mp-name"
                      placeholder="닉네임을 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '닉네임을 입력해주세요.'"
                      class="single-input"
                    />
                  </div>
                  <label for="mp-id">아이디</label>
                  <div class="input-group-icon mb-10">
                    <div class="icon"><i class="fa fa-at" aria-hidden="true"></i></div>
                    <input
                      type="text"
                      name="mp-id"
                      placeholder="아이디를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '아이디를 입력해주세요.'"
                      class="single-input"
                    />
                  </div>
                  <label for="mp-address">거주도시</label>
                  <div class="input-group-icon mb-10">
                    <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                    <input
                      type="text"
                      name="mp-address"
                      placeholder="거주도시를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '거주도시를 입력해주세요.'"
                      class="single-input"
                    />
                  </div>
                  <label for="mp-web">웹사이트</label>
                  <div class="input-group-icon mb-10">
                    <div class="icon"><i class="fa fa-internet-explorer" aria-hidden="true"></i></div>
                    <input
                      type="text"
                      name="mp-web"
                      placeholder="웹사이트를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '웹사이트를 입력해주세요.'"
                      class="single-input"
                    />
                  </div>
                  <label for="mp-detail">자기소개</label>
                  <div class="mb-10">
                    <textarea
                      class="single-textarea"
                      placeholder="자기소개를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '자기소개를 입력해주세요.'"
                    ></textarea>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            <button type="submit" class="btn btn-primary" data-dismiss="modal" id="btnCreateTrip">수정</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

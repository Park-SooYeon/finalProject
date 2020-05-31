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
    <div class="container profile position-relative">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 img-container text-center">
          <img class="rounded-circle profile-image" id="pro-main-img" src="images\myPage\profile\3_20200527-16-44-00.jpg" alt="${vo.nickName }_profilePhoto" />
        </div>
        <div class="col-lg-10 col-md-9 col-sm-9 profile-main-detail">
          <div class="mp-modify-area">
          <div>
          <h2 class="d-inline-block" id="pro-nick" data-toggle="modal"
            data-target="#mp-modifyModal">${vo.nickName }&nbsp;</h2>
          <a
          	href="#"
            id="mp-btnModifyProfile"
            data-toggle="modal"
            data-target="#mp-modifyModal"
           style="display:none;"
          >
          <i class="fa fa-edit"></i>
            프로필수정
          </a>
          <c:if test="${sessionScope.member_id != vo.member_id}">
          <button class="pull-right  
          	<c:if test="${flag==0}">btn-follow</c:if>
          	<c:if test="${flag==1}">btn-following</c:if>" 
          		  type="button" id="mp-btnFollow" data-target="${vo.member_id }" data-follow="${sessionScope.member_id }"></button>
          </c:if>
          </div>
          <div id="pro-id"><i class="fa fa-at" aria-hidden="true"></i>${vo.member_id }</div>
          
           
          <div class="row">
            <div class="col-md-12 give-a-space"></div>
          </div>
          <div class="row follow-status">
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-4 text-center">
              <h4>포스팅</h4>
              <h4><c:out value="${map[('follow')]}"/></h4>
            </div>

            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-4 text-center">
              <h4>팔로잉</h4>
              <h4><c:out value="${map[('follow')]}"/></h4>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 col-xs-4 text-center">
              <h4>팔로워</h4>
              <h4><c:out value="${map[('follower')]}"/></h4>
            </div>
            <span class="col-lg-6"></span>
          </div>
        </div>
      </div>
      <nav class="navbar navbar-expand-sm profile-menu position-absolute" style="bottom:-9px;">
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
                <div><h4 class="my-3">JuHyeon An</h4></div>
                <ul>
                  <li>
                    <i class="fa fa-thumb-tack" aria-hidden="true"></i> <span id="pro-addr">${vo.member_city }</span>
                  </li>
                  <li><i class="fa fa-calendar"></i> <span id="pro-enroll">${vo.mDate }</span></li>
                  <li><i class="fa fa-internet-explorer"></i> <span id="pro-web">${vo.member_web }</span></li>
                </ul>
                <p id="self-desc">
                 ${vo.member_info }
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
          
		<div class="col-lg-9 post-wrapper" id="posts-here" style="padding: 0;">          
			<!-- 여기에 my_social_posts 들어감 -->
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
      <!-- 수정form -->
        <div class="modal-content">
          <form id="mp-proModifyFrm" name="mp-proModifyFrm" enctype="multipart/form-data">
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
                <input type="file" name="imgFile" id="member_photo" />
              </div>
              <div class="col-md-9 col-sm-9">
                  <label for="nickName">닉네임</label>
                  <div class="mb-10">
                    <input
                      type="text"
                      name="nickName"
                      id="nickName"
                      placeholder="닉네임을 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '닉네임을 입력해주세요.'"
                      class="single-input"
                    />
                  </div>
                  <label for="member_id">아이디</label>
                  <div class="input-group-icon mb-10">
                    <div class="icon"><i class="fa fa-at" aria-hidden="true"></i></div>
                    <input
                      type="text"
                      name="member_id"
                      placeholder="아이디를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '아이디를 입력해주세요.'"
                      class="single-input"
                      readOnly
                    />
                  </div>
                  <label for="member_city">거주도시</label>
                  <div class="input-group-icon mb-10">
                    <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                    <input
                      type="text"
                      name="member_city"
                      placeholder="거주도시를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '거주도시를 입력해주세요.'"
                      class="single-input"
                    />
                  </div>
                  <label for="member_web">웹사이트</label>
                  <div class="input-group-icon mb-10">
                    <div class="icon"><i class="fa fa-internet-explorer" aria-hidden="true"></i></div>
                    <input
                      type="text"
                      name="member_web"
                      placeholder="웹사이트를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '웹사이트를 입력해주세요.'"
                      class="single-input"
                    />
                  </div>
                  <label for="member_info">자기소개</label>
                  <div class="mb-10">
                    <textarea
                      class="single-textarea"
                      name="member_info"
                      placeholder="자기소개를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '자기소개를 입력해주세요.'"
                    ></textarea>
                  </div>
                <!-- 수정 form 끝 -->
                
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            <input type="button"  class="btn btn-primary" value="수정" id="btnModifyProfile">
          </div>
           </form>
        </div>
      </div>
    </div>
  </body>
</html>

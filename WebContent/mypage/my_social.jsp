<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet" />
    <!--
			CSS
			============================================= -->
    <link rel="stylesheet" href="../template/css/linearicons.css" />
    <link rel="stylesheet" href="../template/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../template/css/bootstrap.css" />
    <link rel="stylesheet" href="../template/css/magnific-popup.css" />
    <link rel="stylesheet" href="../template/css/jquery-ui.css" />
    <link rel="stylesheet" href="../template/css/nice-select.css" />
    <link rel="stylesheet" href="../template/css/animate.min.css" />
    <link rel="stylesheet" href="../template/css/owl.carousel.css" />
    <link rel="stylesheet" href="../template/css/main.css" />
    <link rel="stylesheet" href="../css/custom.css" />
  </head>
  <body>
    <header id="header">
      <div class="header-top">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-sm-6 col-6 header-top-left">
              <ul>
                <li><a href="#">Visit Us</a></li>
                <li><a href="#">Buy Tickets</a></li>
              </ul>
            </div>
            <div class="col-lg-6 col-sm-6 col-6 header-top-right">
              <div class="header-social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-dribbble"></i></a>
                <a href="#"><i class="fa fa-behance"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container main-menu">
        <div class="row align-items-center justify-content-between d-flex">
          <div id="logo">
            <a href="index.html"><img src="../template/img/logo.png" alt="" title="" /></a>
          </div>
          <nav id="nav-menu-container">
            <ul class="nav-menu">
              <li><a href="index.html">Home</a></li>
              <li><a href="about.html">About</a></li>
              <li><a href="packages.html">Packages</a></li>
              <li><a href="hotels.html">Hotels</a></li>
              <li><a href="insurance.html">Insurence</a></li>
              <li class="menu-has-children">
                <a href="">Blog</a>
                <ul>
                  <li><a href="blog-home.html">Blog Home</a></li>
                  <li><a href="blog-single.html">Blog Single</a></li>
                </ul>
              </li>
              <li class="menu-has-children">
                <a href="">Pages</a>
                <ul>
                  <li><a href="elements.html">Elements</a></li>
                  <li class="menu-has-children">
                    <a href="">Level 2 </a>
                    <ul>
                      <li><a href="#">Item One</a></li>
                      <li><a href="#">Item Two</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li><a href="contact.html">Contact</a></li>
            </ul>
          </nav>
          <!-- #nav-menu-container -->
        </div>
      </div>
    </header>
    <!-- #header -->

    <!-- start banner Area -->
    <section class="relative about-banner" style="z-index: -1;">
      <div class="overlay overlay-bg"></div>
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
          <img class="rounded-circle profile-image" src="../template/img/blog/c1.jpg" alt="" />
        </div>
        <span class="col-lg-7 col-md-6 col-sm-9 profile-main-detail">
          <h2>JuHyeon An</h2>
          <span class="profile-nickname">@IT_Traveler</span>
          <div class="row">
            <div class="col-md-12 give-a-space"></div>
          </div>
          <div class="row">
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
          ><button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#mp-modifyModal" id="mp-btnModifyProfile">
            프로필수정
          </button></span
        >
      </div>
      <br />
      <nav class="navbar navbar-expand-sm profile-menu">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#">활동 피드</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">여행</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">사진</a>
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
          <div class="col-lg-3 sidebar-widgets" style="padding-left: 0px;">
            <div class="widget-wrap pt-0" style="background: #ffffff;">
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
              <div class="single-sidebar-widget user-info-widget profile-detail">
                <a href="#"><h4 class="my-3">JuHyeon An</h4></a>
                <ul>
                  <li><i class="fa fa-thumb-tack" aria-hidden="true"></i> <span>경기도 고양시 덕양구</span></li>
                  <li><i class="fa fa-calendar"></i> <span>2019년 6월 26일 가입</span></li>
                  <li><i class="fa fa-internet-explorer"></i> <span>www.ajh2042.com</span></li>
                </ul>
                <p>
                  안녕하세요. 저는 안주현입니다. 자기소개 자기소개 자기소개 자기소개 입니다. 잘 부탁드립니다. 자기소개
                  자기소개 자기소개 자기소개 끝.
                </p>
              </div>
              <div class="single-sidebar-widget user-info-widget profile-detail">
                <a href="#"><h4 class="my-3">여행경험을 공유하세요!</h4></a>
                <ul>
                  <li><i class="fa fa-camera" aria-hidden="true"></i> 사진 게시</li>
                  <li><i class="fa fa-edit"></i> 리뷰 작성하기</li>
                </ul>
              </div>
            </div>
          </div>

          <div class="col-lg-9 posts-list">
            <div class="posting-title row">
              <span class="col-md-1 text-center">
                <img class="rounded-circle posting-profile" src="../template/img/blog/s-img.jpg" />
              </span>
              <div class="col-md-11 mt-1" style="position:relative;">
                <div>
                  <b>JuHyeon An</b>
                  님이 새 여행리스트를 추가했습니다.
                  <span style="float: right; position:absolute; right:-23px;"
                  ><img width="17px" src="./custom-image/ellipsis-h-solid.svg"
                /></span>
                </div>
                <small>2019년 6월 26일</small>
                
              </div>
            </div>
            <div class="single-post row">
              <div class="col-lg-12" style="padding-right: 0px; background: #f9f9f9; margin-bottom: 15px;">
                <div class="feature-img">
                  <img class="img-fluid" src="../template/img/blog/feature-img1.jpg" alt="" />
                </div>

                <div class="col-lg-12 col-md-12">
                  <h3 class="mt-20 mb-20">
                    ChiangMai
                  </h3>
                  <div class="travel-item-list">
                    <span class="travel-box">
                      <img src="../template/img/blog/pp1.jpg" />
                      <div class="m-2">
                        <h5>Sook Hostel</h5>
                        <div>❤❤❤❤❤<small>3건의 리뷰</small></div>
                        <div>치앙마이, 태국</div>
                      </div>
                    </span>
                    <span class="travel-box">
                      <img src="../template/img/blog/pp1.jpg" />
                      <div class="m-2">
                        <h5>Sook Hostel</h5>
                        <div>❤❤❤❤❤<small>3건의 리뷰</small></div>
                        <div>치앙마이, 태국</div>
                      </div>
                    </span>
                    <span class="travel-box">
                      <img src="../template/img/blog/pp1.jpg" />
                      <div class="m-2">
                        <h5>Sook Hostel</h5>
                        <div>❤❤❤❤❤<small>3건의 리뷰</small></div>
                        <div>치앙마이, 태국</div>
                      </div>
                    </span>
                    <span class="travel-box">
                      <img src="../template/img/blog/pp1.jpg" />
                      <div class="m-2">
                        <h5>Sook Hostel</h5>
                        <div>❤❤❤❤❤<small>3건의 리뷰</small></div>
                        <div>치앙마이, 태국</div>
                      </div>
                    </span>
                  </div>
                </div>
              </div>
              <div class="post-bottom-bar">
                <span><i class="fa fa-thumbs-up"></i> 도움이 됐어요</span
                ><span><i class="fa fa-share-alt"></i> 공유하기</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- End post-content Area -->

<div
    class="modal fade"
    id="mp-modifyModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="mp-modifyModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog" role="document" style="max-width:590px;">
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
			<img class="rounded-circle profile-image" src="../template/img/blog/c2.jpg">
		</div>
		<div class="col-md-9 col-sm-9">
		<form id="mp-proModifyFrm" action="#">
				<label for="mp-id">아이디</label>
				<div class="mb-10">
					<input type="text" name="mp-id" placeholder="아이디를 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디를 입력해주세요.'" class="single-input">
				</div>
				<label for="mp-name">이름</label>
				<div class="mb-10">
					<input type="text" name="mp-name" placeholder="이름을 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이름을 입력해주세요.'" class="single-input">
				</div>
				<label for="mp-address">거주도시</label>
				<div class="input-group-icon mb-10">
					<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
					<input type="text" name="mp-address" placeholder="거주도시를 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '거주도시를 입력해주세요.'" class="single-input">
				</div>
				<label for="mp-detail">자기소개</label>
				<div class="mb-10">
					<textarea class="single-textarea" placeholder="자기소개를 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '자기소개를 입력해주세요.'"></textarea>
				</div>
		</form>
		</div>
		</div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-primary" data-dismiss="modal" id="btnCreateTrip">저장</button>
        </div>
      </div>
    </div>
  </div>
  <!-- model end -->


    <!-- start footer Area -->
    <footer class="footer-area section-gap">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-footer-widget">
              <h6>About Agency</h6>
              <p>
                The world has become so fast paced that people don’t want to stand by reading a page of information,
                they would much rather look at a presentation and understand the message. It has come to a point
              </p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-footer-widget">
              <h6>Navigation Links</h6>
              <div class="row">
                <div class="col">
                  <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Feature</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Portfolio</a></li>
                  </ul>
                </div>
                <div class="col">
                  <ul>
                    <li><a href="#">Team</a></li>
                    <li><a href="#">Pricing</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Contact</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-footer-widget">
              <h6>Newsletter</h6>
              <p>
                For business professionals caught between high OEM price and mediocre print and graphic output.
              </p>
              <div id="mc_embed_signup">
                <form
                  target="_blank"
                  action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                  method="get"
                  class="subscription relative"
                >
                  <div class="input-group d-flex flex-row">
                    <input
                      name="EMAIL"
                      placeholder="Email Address"
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = 'Email Address '"
                      required=""
                      type="email"
                    />
                    <button class="btn bb-btn">
                      <span class="lnr lnr-location"></span>
                    </button>
                  </div>
                  <div class="mt-10 info"></div>
                </form>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-footer-widget mail-chimp">
              <h6 class="mb-20">InstaFeed</h6>
              <ul class="instafeed d-flex flex-wrap">
                <li><img src="../template/img/i1.jpg" alt="" /></li>
                <li><img src="../template/img/i2.jpg" alt="" /></li>
                <li><img src="../template/img/i3.jpg" alt="" /></li>
                <li><img src="../template/img/i4.jpg" alt="" /></li>
                <li><img src="../template/img/i5.jpg" alt="" /></li>
                <li><img src="../template/img/i6.jpg" alt="" /></li>
                <li><img src="../template/img/i7.jpg" alt="" /></li>
                <li><img src="../template/img/i8.jpg" alt="" /></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="row footer-bottom d-flex justify-content-between align-items-center">
          <p class="col-lg-8 col-sm-12 footer-text m-0">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;
            <script>
              document.write(new Date().getFullYear());
            </script>
            All rights reserved | This template is made with
            <i class="fa fa-heart-o" aria-hidden="true"></i> by
            <a href="https://colorlib.com" target="_blank">Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
          <div class="col-lg-4 col-sm-12 footer-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-dribbble"></i></a>
            <a href="#"><i class="fa fa-behance"></i></a>
          </div>
        </div>
      </div>
    </footer>
    <!-- End footer Area -->

    <script src="../template/js/vendor/jquery-2.2.4.min.js"></script>
    <script src="../template/js/popper.min.js"></script>
    <script src="../template/js/vendor/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
    <script src="../template/js/jquery-ui.js"></script>
    <script src="../template/js/easing.min.js"></script>
    <script src="../template/js/hoverIntent.js"></script>
    <script src="../template/js/superfish.min.js"></script>
    <script src="../template/js/jquery.ajaxchimp.min.js"></script>
    <script src="../template/js/jquery.magnific-popup.min.js"></script>
    <script src="../template/js/jquery.nice-select.min.js"></script>
    <script src="../template/js/owl.carousel.min.js"></script>
    <script src="../template/js/mail-script.js"></script>
    <script src="../template/js/main.js"></script>
    <script src="../js/my_social.js"></script>
  </body>
</html>

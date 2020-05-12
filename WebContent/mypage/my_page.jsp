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
    <link rel="stylesheet" href="../swiper-5.3.8/package/css/swiper.min.css" />
  </head>
  <body>
    <jsp:include page="../top.jsp"></jsp:include>

    <!-- start banner Area -->
    <section class="relative about-banner" style="z-index: -1;">
      <div class="overlay overlay-bg"></div>
      <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
          <div class="about-content col-lg-12"><h2 class="text-white">My Page</h2></div>
        </div>
      </div>
    </section>

    <!-- Start post-content Area -->
    <div class="container mb-3 mt-5"><h3>예약내역</h3></div>
    <section class="mp-total-wrapper">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 mp-side-wrapper">
            <div class="mp-border-wrapper py-0">
              <ul>
                <li class="mp-side-li on">
                  <div class="mp-li-text">숙소예약 확인</div>
                  <div class="mp-li-cnt">1</div>
                </li>
                <li class="mp-side-li">
                  <div class="mp-li-text">렌트카 예약 확인</div>
                  <div class="mp-li-cnt">3</div>
                </li>
                <li class="mp-side-li">
                  <div class="mp-li-text">지난 여행/후기</div>
                  <div class="mp-li-cnt">2</div>
                </li>
                <li class="mp-side-li">
                  <div class="mp-li-text">취소된 여행</div>
                  <div class="mp-li-cnt">6</div>
                </li>
              </ul>
            </div>
          </div>

          <div class="col-lg-9 mp-body-wrapper">
            <div class="mp-body-single">
              <div class="row">
                <div class="col-lg-3 mp-img">
                  <img
                    src="https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80"
                  />
                </div>
                <div class="col-lg-6 p-0">
                  <ul class="mp-inner">
                    <li class="mp-hotel-name">통일신라 호텔</li>
                    <li class="mp-hotel-no">예약 번호 : <span>283245983</span></li>
                    <li class="mp-hotel-desc"><i class="fa fa-map-marker"></i> <span>경주</span></li>
                  </ul>
                </div>
                <div class="col-lg-3 p-0">
                  <div class="row mp-hotel-date">
                    <div class="col-lg-6 mp-hotel-date-in" style="border-right: 1px solid #eee;">
                      <div>체크인</div>
                      <div>2020.5.12</div>
                    </div>
                    <div class="col-lg-6 mp-hotel-date-out">
                      <div>체크아웃</div>
                      <div>2020.5.15</div>
                    </div>
                  </div>
                  <div class="mp-hotel-price"><i class="fa fa-won"></i> <span>120,000</span></div>
                </div>
              </div>
              <hr />
              <div class="col-md-12 mb-3">
                <button class="btn btn-primary pull-right">예약취소</button>
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
                <img class="rounded-circle profile-image" id="pro-img" src="../template/img/blog/c2.jpg" />
              </div>
              <div class="col-md-9 col-sm-9">
                <form id="mp-proModifyFrm" action="#">
                  <label for="mp-id">아이디</label>
                  <div class="mb-10">
                    <input
                      type="text"
                      name="mp-id"
                      placeholder="아이디를 입력해주세요."
                      onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '아이디를 입력해주세요.'"
                      class="single-input"
                    />
                  </div>
                  <label for="mp-name">닉네임</label>
                  <div class="input-group-icon mb-10">
                    <div class="icon"><i class="fa fa-at" aria-hidden="true"></i></div>
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
    <!-- swiper -->
    <script src="../swiper-5.3.8/package/js/swiper.min.js"></script>
    <script src="../js/my_page.js"></script>
  </body>
</html>

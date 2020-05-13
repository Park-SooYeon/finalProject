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

    <link rel="stylesheet" href="./css/custom.css" />
  </head>
  <body>

    <!-- start banner Area -->
    <section class="relative about-banner" style="z-index: -1;">
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

  </body>
</html>

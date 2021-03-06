<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
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

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet" />
    <!--
			CSS
			============================================= -->
    <link rel="stylesheet" href="./template/css/linearicons.css" />
    <link rel="stylesheet" href="./template/css/font-awesome.min.css" />
    <link rel="stylesheet" href="./template/css/bootstrap.css" />
    <link rel="stylesheet" href="./template/css/magnific-popup.css" />
    <link rel="stylesheet" href="./template/css/jquery-ui.css" />
    <link rel="stylesheet" href="./template/css/nice-select.css" />
    <link rel="stylesheet" href="./template/css/animate.min.css" />
    <link rel="stylesheet" href="./template/css/owl.carousel.css" />
    <link rel="stylesheet" href="./template/css/main.css" />
    <link rel="stylesheet" href="./css/custom.css" />

    <!--datepicker css-->
    <link rel="stylesheet" href="./plugin/air-datepicker/css/datepicker.min.css">
    
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52d0cd9eb539c564cdc52bb34a626875&libraries=services"
    ></script>
    
    <title>Insert title here</title>
    <style>
    
    .dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
    
    </style>
  </head>

  <body>
  
    <header id="header" style="width: 100%; position: relative; float: left; background: #1C5E9A">
      <div class="main-menu">
        <div class="row align-items-center justify-content-between d-flex">
          <div id="logo">
            <a href="./index.jsp"><img src="./template/img/logo.png" alt="" title="" /></a>
          </div>
          <nav id="nav-menu-container">
            <ul class="nav-menu" style="position:absolute; left:11rem;">
              <li><a href="./index.jsp">호텔</a></li>
              <li><a href="./index.jsp">즐길거리</a></li>
              <li><a href="./index.jsp">음식점</a></li>
              <li><a href="./index.jsp">축제</a></li>
              <li><a href="./index.jsp">리뷰</a></li>
            </ul>
                        <ul class="nav-menu pull-left">
              <li>
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="search" style="width: 80%;"
								placeholder="지역, 관광지 검색" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '지역, 관광지 검색'" aria-label="Search">
							<button class="btn btn-primary my-2 my-sm-0" style="width: 15%;"
								type="submit"><i class="fa fa-search"></i></button>
						</form>

					</li>
					
					<!-- 
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					 -->
					 <li><a style="color:#fff;" onclick="history.back();">되돌아가기</a></li>
</ul>
          </nav>
          <!-- #nav-menu-container -->
        </div>
      </div>
    </header>
    <!-- #header -->

	<fmt:parseDate value="${vo.start_date}" var="start_date" pattern="yyyy-MM-dd"/>
	<fmt:parseDate value="${vo.end_date}" var="end_date" pattern="yyyy-MM-dd"/>
	
    <div class="my-main-wrapper">
      <div class="my-main-side">
        <div class="date-box">
        
        	<input type="hidden" id="start_hidden" value="${vo.start_date }">
        	<input type="hidden" id="end_hidden" value="${vo.end_date }">
        	<input type="hidden" id="cnt_hidden" value="${vo.another_days}">
        	<input type="hidden" id="trip_list_serial" value="${vo.trip_list_serial}">
        
            <div id="edit-day"><i class="far fa-calendar-alt"></i> 
            <c:if test="${empty vo.start_date }">
            	총 여행 일수 : ${vo.days_count} 일
            </c:if>
            
            <c:if test="${vo.days_count == 0 }">
            <fmt:formatDate value="${start_date}" pattern="MM.dd"/> ~ 
            <fmt:formatDate value="${end_date}" pattern="MM.dd"/>
            </c:if>
            
            </div>
          <div class="show-all-day text-center">전체 일정 보기</div>
        </div>
        <ul class="plan-category">
        
        <c:forEach var="i" begin="1" end="${vo.another_days }">
          <li>
            <div class="cat-date-left-box">
              <div class="cat-left-day">DAY ${i }</div>
            </div>
            <div class="cat-date-right-box">
              <div class="cat-left-date-${i } pr-2 trip-date" style="color: #49b2e9;"></div>
              <div class="cat-right-weekday-${i } trip-day"></div>
            </div>
          </li>
         </c:forEach>


        </ul>
        <div class="cat-add-box">
          <div onclick="add_plan_day()">DAY 추가</div>
          <div id="trip-save-btn" class="mt-2">저장하기</div>
        </div>
      </div>

      <!----------------- depth1 -------------------------->
      <div class="schedule-detail-box" style="display: none;">
        <!--title-->
        <div class="title-box">
          <div id="schedule_detail_title" data-date="05-06" style="display: block;">
            <div class="schedule_detail_title_text">
              <span id="result-date" style="color: #fff;"></span>
              <button type="button" class="toggle-on"><h4><i class="fas fa-caret-down"></i></h4></button>
            </div>
            <div style="position: relative;">
              <button type="button" id="on-city-open-btn">
                <i class="fas fa-chevron-right"></i>
              </button>
            </div>
            <div class="day_reset_btn" onclick="del_plan_inspot_day_all()"></div>
            <div class="day_next_btn" onclick="plan_day_next()"></div>
            <div class="day_prev_btn" onclick="plan_day_prev()"></div>
          </div>
        </div>

        <!--//(s)스케쥴 디테일 리스트-->
        <div id="schedule-here" class="connectedSortable ui-sortable">
        
        <div id="temp-div" class="text-center pt-5">
        <h4 style="color:#707070;">여행일정을 추가해주세요!</h4>
        <img style="opacity:0.6; width:70%;"src="./images/myPage/car.png"/>
        </div>
        
        
          <!-- 
          <div
            class="day-spot-item"
            data="1"
            data-set_day="1"
            data-rel_srl="6725"
            data-pl_type="0"
            data-no="0"
            data-pl_cat="301"
            data-latlng="37.57903300,126.98640400"
            data-ci="310"
          >
             <div class="item-ctrl-box" style="display: none;">
                <div class="btn-del" title="삭제">
				<img class="add-icon" src="./images/myPage/sign.png"></img>
                </div>
              </div>

            <div class="spot-distance-box">0.88Km</div>

            <div class="img-box">
              <div class="spot-order-box">1</div>
              <img src="http://img.earthtory.com/img/place_img/310/6725_0_et.jpg" />
            </div>
            <div class="info-box">
              <div class="info-title">북촌 한옥 마을</div>
              <div class="small info-small">유명한거리/지역</div>
            </div>
          </div>
            <div
              class="day-spot-item"
              data="1"
              data-set_day="1"
              data-rel_srl="6725"
              data-pl_type="0"
              data-no="0"
              data-pl_cat="301"
              data-latlng="37.57903300,126.98640400"
              data-ci="310"
            >
               <div class="item-ctrl-box" style="display: none;">
                <div class="btn-del" title="삭제">
				<img class="add-icon" src="./images/myPage/sign.png"></img>
                </div>
              </div>

              <div class="spot-distance-box">3.14km</div>

              <div class="img-box">
                <div class="spot-order-box">2</div>
                <img src="http://img.earthtory.com/img/place_img/310/6638_0_et.jpg" />
              </div>
              <div class="info-box">
                <div class="info-title">경복궁</div>
                <div class="small info-small">랜드마크, 성/궁궐</div>
              </div>

          </div>
          
          -->
        </div>

        <div class="trip-detail-added">
          <div class="title-box">
          <div id="schedule_detail_title" data-date="05-06" style="display: block;">
            <div class="schedule_detail_title_text">
              DAY2 <span style="color: #999999;"> | </span> 05.07(목요일)
              <button type="button" class="toggle-on"><h4><i class="fas fa-caret-down"></i></h4></button>
            </div>
            <div style="position: relative;">
              <button type="button" id="on-city-open-btn">
                <i class="fas fa-chevron-right"></i>
              </button>
            </div>
            <div class="day_reset_btn" onclick="del_plan_inspot_day_all()"></div>
            <div class="day_next_btn" onclick="plan_day_next()"></div>
            <div class="day_prev_btn" onclick="plan_day_prev()"></div>
          </div>
        </div>

          <div id="schedule-detail-list" class="connectedSortable ui-sortable">
            <div
              class="day-spot-item"
              data="1"
              data-set_day="1"
              data-rel_srl="6725"
              data-pl_type="0"
              data-no="0"
              data-pl_cat="301"
              data-latlng="37.57903300,126.98640400"
              data-ci="310"
            >
               <div class="item-ctrl-box" style="display: none;">
                <div class="btn-del" title="삭제">
				<img class="add-icon" src="./images/myPage/sign.png"></img>
                </div>
              </div>

              <div class="spot-distance-box">0.88Km</div>

              <div class="img-box">
                <div class="spot-order-box">1</div>
                <img src="http://img.earthtory.com/img/place_img/310/6725_0_et.jpg" />
              </div>
              <div class="info-box">
                <div class="info-title">북촌 한옥 마을</div>
                <div class="small info-small">유명한거리/지역</div>
              </div>
            </div>

            <div
              class="day-spot-item"
              data="1"
              data-set_day="1"
              data-rel_srl="6725"
              data-pl_type="0"
              data-no="0"
              data-pl_cat="301"
              data-latlng="37.57903300,126.98640400"
              data-ci="310"
            >
               <div class="item-ctrl-box" style="display: none;">
                <div class="btn-del" title="삭제">
				<img class="add-icon" src="./images/myPage/sign.png"></img>
                </div>
              </div>

              <div class="spot-distance-box">3.14km</div>

              <div class="img-box">
                <div class="spot-order-box">2</div>
                <img src="http://img.earthtory.com/img/place_img/310/6638_0_et.jpg" />
              </div>
              <div class="info-box">
                <div class="info-title">경복궁</div>
                <div class="small info-small">랜드마크, 성/궁궐</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end of depth1 -->

      <!-- depth 2 -->
      <div id="right-full-box" style="display: none;">
        <div class="title-box" style="background: #1a7ad9;">
          
          <div class="default-select" id="default-select">
				<select style="display: none;" id="chooseCity">
					<option value="0">도시선택</option>
					<option value="1">서울</option>
					<option value="3">제주도</option>
					<option value="6">부산</option>
					<option value="4">대구</option>
					<option value="31">경기도</option>
					<option value="2">인천</option>
				</select><div class="nice-select" tabindex="0"><span class="current">도시선택</span>
				<ul class="list">
				<li data-value="0" class="option">도시선택</li>
				<li data-value="1" class="option">서울</li>
				<li data-value="3" class="option">제주도</li>
				<li data-value="6" class="option">부산</li>
				<li data-value="4" class="option">경주</li>
				<li data-value="31" class="option">강릉</li>
				<li data-value="2" class="option">여수</li>
</ul></div>
			</div>
          <button type="button" id="on-city-close-btn">
            <i class="fas fa-chevron-left"></i>
          </button>
        </div>

        <div class="list-search-full-wrap">
          <div class="list-search-box">
            <div class="input-group mb-2" style="padding: 0 20px;">
              <input name="searchPlace" type="text" class="form-control" placeholder="장소검색" id="searchPlace"/>
              <div class="input-group-append search-append">
                <button type="button">
                  <i class="fas fa-search"></i>
                </button>
              </div>
            </div>

          </div>
          <div class="list-category-wrapper">
            <div class="list-category-box pt-2">
              <div class="list-cat-item rounded-circle" data-cat="12" title="즐길거리">
                <span class="fas fa-camera-retro search-cat-icon"></span>
              </div>
              <div class="list-cat-item rounded-circle" data-cat="39" title="레스토랑/카페">
                <span class="fas fa-utensils search-cat-icon"></span>
              </div>
              <div class="list-cat-item rounded-circle" data-cat="32" title="숙소">
                <span class="fas fa-bed search-cat-icon"></span>
              </div>
              <div class="list-cat-item rounded-circle" data-cat="1" title="관심리스트에서 보기">
                <span class="fas fa-inbox search-cat-icon"></span>
              </div>
            </div>
          </div>
        </div>

        <div class="list-box connectedSortable" id="place-here" style="max-height:68%;">

			<c:forEach items="${list }" var="d">
          <div class='day-spot-item ui-draggable' data='0'
					data-set_day='0' data-rel_srl='845972' data-pl_type='0'
					data-no='0' data-pl_cat='301' data-ci='10907'>
					<div class='img-box fl'>
						<img src='${d.photo_name}' />
					</div>
					<div class='info-box' style='width:210px;'>
						<div class='info-title'>${d.place_name}</div>
						<div class='small info-small'>${d.local_name}</div>
					</div>
					<div class='spot-to-inspot'>
						<img class='add-icon' src='./images/myPage/sign.png'></img>
					</div>
				</div>
          </c:forEach>
        </div>
      </div>
      <!-- right full wrap -->

      <div class="list-search-box-small">
        <div class="input-group mb-2" style="padding: 0 20px;">
          <input type="text" class="form-control" name="searchPlace" placeholder="장소검색" />
          <div class="input-group-append search-append">
            <button class="btn btn-outline-secondary" style="padding-top:4px; border: 1px solid #ced4da;" type="button">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>

      </div>

      <div id="mp-map" class="my-main-map" style="width: 100%; height: 100%;"></div>
    </div>
    <!-- 전체 wrapper -->

    <script src="./template/js/vendor/jquery-2.2.4.min.js"></script>
    <script src="./template/js/popper.min.js"></script>
    <script src="./template/js/vendor/bootstrap.min.js"></script>
    <script src="./template/js/jquery-ui.js"></script>
    <script src="./template/js/easing.min.js"></script>
    <script src="./template/js/hoverIntent.js"></script>
    <script src="./template/js/superfish.min.js"></script>
    <script src="./template/js/jquery.ajaxchimp.min.js"></script>
    <script src="./template/js/jquery.magnific-popup.min.js"></script>
    <script src="./template/js/jquery.nice-select.min.js"></script>
    <script src="./template/js/owl.carousel.min.js"></script>
    <script src="./template/js/mail-script.js"></script>
    <script src="./template/js/main.js"></script>
    <script src="./js/custom_trip.js"></script>
    <script src="./js/custom_map.js"></script>
    <!-- fontawesome -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    <!-- datepicker -->
    <script src="./plugin/air-datepicker/js/datepicker.min.js"></script>
  </body>
</html>

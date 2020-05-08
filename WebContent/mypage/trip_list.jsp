<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Favicon-->
<link rel="shortcut icon" href="./img/fav.png" />
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
<link rel="stylesheet" href="./css/linearicons.css" />
<link rel="stylesheet" href="./css/font-awesome.min.css" />
<link rel="stylesheet" href="./css/bootstrap.css" />
<link rel="stylesheet" href="./css/magnific-popup.css" />
<link rel="stylesheet" href="./css/jquery-ui.css" />
<link rel="stylesheet" href="./css/nice-select.css" />
<link rel="stylesheet" href="./css/animate.min.css" />
<link rel="stylesheet" href="./css/owl.carousel.css" />
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/custom.css" />

<section class="destinations-area mb-20">
  <div class="container">
    <div class="row">
      <div class="col-lg-4 add-new-trip" data-toggle="modal" data-target="#exampleModal">
        <div class="single-destinations">
          <div class="list-container">
            <span><h3><i class="fa fa-plus-circle"></i> 추가하기</h3></span
            >
          </div>
        </div>
      </div>
      <div class="col-lg-4" onclick="location.href='./edit-trip2.jsp';">
        <div class="single-destinations">
          <div class="list-container">
            <div class="thumb-custom">
              <img src="./custom-image/food10.jpg" alt="" />
            </div>
            <div class="details">
              <h4 class="d-flex justify-content-between">
                <span>카페투어</span>
              </h4>
              <p>작성자 : <b> 카페왕</b></p>
              <small>만든 날짜 : 2020년 5월 1일</small>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="single-destinations">
          <div class="list-container">
            <div class="thumb-custom">
              <img src="./custom-image/food16.jpg" alt="" />
            </div>
            <div class="details">
              <h4 class="d-flex justify-content-between">
                <span>강남 맛집투어</span>
              </h4>
              <p>작성자 : <b> 오세왕</b></p>
              <small>만든 날짜 : 2020년 5월 1일</small>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="single-destinations">
          <div class="list-container">
            <div class="thumb-custom">
              <img src="./custom-image/place.jpg" alt="" />
            </div>
            <div class="details">
              <h4 class="d-flex justify-content-between">
                <span>연남동 나들이</span>
              </h4>
              <p>작성자 : <b> 김연남</b></p>
              <small>만든 날짜 : 2020년 5월 1일</small>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="single-destinations">
          <div class="list-container">
            <div class="thumb-custom">
              <img src="./custom-image/hotel1.jpg" alt="" />
            </div>
            <div class="details">
              <h4 class="d-flex justify-content-between">
                <span>부산 여행</span>
              </h4>
              <p>작성자 : <b> 김부산</b></p>
              <small>만든 날짜 : 2020년 5월 1일</small>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="single-destinations">
          <div class="list-container">
            <div class="thumb-custom">
              <img src="img/hotels/d5.jpg" alt="" />
            </div>
            <div class="details">
              <h4 class="d-flex justify-content-between">
                <span>떠나보자 서울여행</span>
              </h4>
              <p>작성자 : <b>JuHyeonAn</b></p>
              <small>만든 날짜 : 2020년 5월 1일</small>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
  <!-- modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">여행 추가하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="trip-name" class="col-form-label">여행이름 : </label>
            <input type="text" class="form-control" id="trip-name">
          </div>
          <div class="form-group">
            <label for="set-privacy" class="col-form-label">공개범위 설정 : </label>
            
            <div style="border:1px solid #ced4da; border-radius:0.25rem; padding:5px;">
				<div><label><input type="radio" name="privacy"><i class="fas fa-unlock-alt"></i> 공개</label></div>
				<div><label><input type="radio" name="privacy"><i class="fas fa-lock"></i> 비공개</label></div>
			</div>
            
          </div>
           <div class="form-group">
            <label for="set-privacy" class="col-form-label">날짜 또는 일수 사용 </label>
			<select id="select-day">
				<option>선택하세요</option>
				<option value="1">일수 사용</option>
				<option value="2">날짜 사용</option>
			</select>
          </div>
          
          <div class="form-group" id="trip-day-input" style="display:none;">
            <label for="trip-day-input" class="col-form-label">일수 입력 : </label>
            <input type="text" class="form-control col-sm-4"> 
          </div>
          
          <div class="form-group" id="trip-cal-input" style="display:none;">
            <label for="trip-cal-input" class="col-form-label">날짜 선택 : </label>
            <input type="text" class="form-control col-sm-4"> 
          </div>
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnCreateTrip">저장</button>
      </div>
    </div>
  </div>
</div><!-- model end -->

</section>

<script src="./js/vendor/jquery-2.2.4.min.js"></script>
<script src="./js/popper.min.js"></script>
<script src="./js/vendor/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="./js/jquery-ui.js"></script>
<script src="./js/easing.min.js"></script>
<script src="./js/hoverIntent.js"></script>
<script src="./js/superfish.min.js"></script>
<script src="./js/jquery.ajaxchimp.min.js"></script>
<script src="./js/jquery.magnific-popup.min.js"></script>
<script src="./js/jquery.nice-select.min.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<script src="./js/mail-script.js"></script>
<script src="./js/main.js"></script>
<script src="./trip_list.js"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

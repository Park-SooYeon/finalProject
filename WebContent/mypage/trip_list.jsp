<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<section class="destinations-area my-list-area mb-20">
  <div class="row">
    <div class="col-lg-4 add-new-trip" data-toggle="modal" data-target="#newTripModal">
      <div class="single-destinations">
        <div class="list-container">
          <div class="add-new-container">
            <h3><i class="fa fa-plus-circle"></i> 추가하기</h3>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4">
      <div class="single-destinations" onclick="location.href='./mypage/edit_trip.jsp';">
        <div class="list-container">
          <div class="thumb-custom">
            <img src="./images/myPage/food10.jpg" alt="" />
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
            <img src="./images/myPage/food16.jpg" alt="" />
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
            <img src="./images/myPage/place.jpg" alt="" />
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
            <img src="./images/myPage/hotel1.jpg" alt="" />
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
            <img
              src="https://images.unsplash.com/photo-1540998145333-e2eef1a9822d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80"
              alt=""
            />
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

  <!-- modal -->
  <div
    class="modal fade"
    id="newTripModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="newTripModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="newTripModalModalLabel">여행 추가하기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" style="color: #000; padding: 2rem 5rem;">
          <form>
            <div class="form-group">
              <input
                type="text"
                id="trip-name"
                placeholder="여행이름을 입력해주세요."
                onfocus="this.placeholder=''"
                onblur="this.placeholder='여행이름을 입력해주세요."
              />
            </div>
            <div class="form-group">
              <label for="set-privacy" class="col-form-label"><h5>공개범위 설정하기</h5> </label>

              <div class="privacy-option">
                <div>
                  <label
                    ><input type="radio" name="privacy" /><span class="privacy-circle mx-1"
                      ><i class="fa fa-unlock-alt"></i
                    ></span>
                    <h6>공개</h6>
                  </label>
                </div>
                <div>
                  <label
                    ><input type="radio" name="privacy" /><span
                      class="privacy-circle mx-1"
                      style="background: #fff; color: #000;"
                      ><i class="fa fa-lock"></i
                    ></span>
                    <h6>비공개</h6></label
                  >
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="set-privacy" class="col-form-label"><h5>날짜 또는 일수 사용</h5></label>
              <select id="select-day">
                <option>선택하세요</option>
                <option value="1">일수 사용</option>
                <option value="2">날짜 사용</option>
              </select>
            </div>

            <div class="form-group" id="trip-day-input" style="display: none;">
              <label for="trip-day-input" class="col-form-label"><h5>일수 입력</h5> </label><br/>
              <input type="number" class="form-control col-sm-3" style="display:inline-block;"/> 일
            </div>

            <div class="form-group" id="trip-cal-input" style="display: none;">
              <label for="trip-cal-input" class="col-form-label"><h5>날짜 선택</h5> </label>
              <input
                type="text"
                id="datePickInput"
                class="form-control col-sm-8 datepicker-here"
                data-range="true"
                data-position="right top"
                data-language="kr"
                data-multiple-dates-separator=" - "
              />
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-primary" data-dismiss="modal" id="btnCreateTrip">저장</button>
        </div>
      </div>
    </div>
  </div>
  <!-- model end -->
</section>

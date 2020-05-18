<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <c:forEach begin="1" end="6">
    <div class="col-lg-4">
      <div class="single-destinations">
        <div class="list-container">
          <div class="thumb-custom">
            <img src="./images/myPage/food16.jpg" alt="" />
          </div>
          <div class="details">
            <span class="privacy-circle mx-1 position-absolute"><i class="fa fa-unlock-alt"></i></span>
            <div class="d-flex justify-content-between">
              <h4 id="mp-tripName">강남 맛집투어</h4>
				<div class="mp-trip-modify-btn">
	              <span class="mp-trip-modify" data-toggle="modal"
            data-target="#mp-modifyTripModal">수정</span>
	              <span> | </span>
	              <span class="mp-trip-delete">삭제</span>
              	</div>
            </div>
            <p>작성자 : <b class="mp-authorName">오세왕</b></p>
            <small>만든 날짜 : 2020년 5월 1일</small>
          </div>
        </div>
      </div>
    </div>
    </c:forEach>
    
    
    
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
     <form name="mp-newtripFrm" action="./?inc=newtrip.mp" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="newTripModalLabel">여행 추가하기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" style="color: #000; padding: 2rem 5rem;">
            <div class="form-group">
              <input
                type="text"
                id="trip_name"
                name="trip_name"
                placeholder="여행이름을 입력해주세요."
                onfocus="this.placeholder=''"
                onblur="this.placeholder='여행이름을 입력해주세요.'"
              />
            </div>
            <div class="form-group">
              <label for="set-privacy" class="col-form-label"><h5>공개범위 설정하기</h5> </label>

              <div class="privacy-option">
                <div>
                  <label
                    ><input type="radio" name="trip_auth" value="1" checked/><span class="privacy-circle mx-1"
                      ><i class="fa fa-unlock-alt"></i
                    ></span>
                    <h6>공개</h6>
                  </label>
                </div>
                <div>
                  <label
                    ><input type="radio" name="trip_auth" value="1"/><span
                      class="privacy-circle circle-dark mx-1"
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
              <input type="number" name="days_count" class="form-control col-sm-3" style="display:inline-block;"/> 일
            </div>

            <div class="form-group" id="trip-cal-input" style="display: none;">
              <label for="trip-cal-input" class="col-form-label"><h5>날짜 선택</h5> </label>
              <input
                type="text"
                id="datePickInput"
                class="form-control col-sm-8 col-xm-12 datepicker-here"
                data-range="true"
                data-position="top left"
                data-language="kr"
                data-multiple-dates-separator=" - "
                data-toggle-selected="true"
                name="start_date"
              />
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-primary" id="btnCreateTrip">저장</button>
        </div>
      </div>
         </form>
    </div>
  </div>
  <!-- model end -->
  
  
  
  <!-- 여행 수정 모달 -->
  <div
    class="modal fade"
    id="mp-modifyTripModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="newTripModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="newTripModalLabel">여행 수정하기</h5>
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
                onblur="this.placeholder='여행이름을 입력해주세요.'"
              />
            </div>
            <div class="form-group">
              <label for="set-privacy" class="col-form-label"><h5>공개범위 설정하기</h5> </label>

              <div class="privacy-option">
                <div>
                  <label
                    ><input type="radio" name="privacy" checked/><span class="privacy-circle mx-1"
                      ><i class="fa fa-unlock-alt"></i
                    ></span>
                    <h6>공개</h6>
                  </label>
                </div>
                <div>
                  <label
                    ><input type="radio" name="privacy" /><span
                      class="privacy-circle circle-dark mx-1"
                      ><i class="fa fa-lock"></i
                    ></span>
                    <h6>비공개</h6></label
                  >
                </div>
              </div>
            </div>
            <!-- 
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
             -->
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-primary" data-dismiss="modal" id="btnCreateTrip">저장</button>
        </div>
      </div>
    </div>
  </div>
</section>

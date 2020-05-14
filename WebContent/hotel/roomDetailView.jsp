<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


    <style>
        ul {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        
        .preinfo>span {
            margin-right: 16px;
        }
        
        .info {
            margin-top: 50px;
        }
        
        .review-box {
            overflow: hidden;
        }
        
        .review-box .pre-view.hidden {
            white-space: nowrap;
            word-wrap: normal;
            width: 90%;
            overflow: hidden;
            text-overflow: ellipsis;
            float: left;
        }
        
        .rounded-circle {
            width: 100%;
        }
        
        .btn-moreInfo {
            display: none;
            white-space: nowrap;
            float: right;
        }
        
        @media screen and (max-width: 533px) {
            .review-box .pre-view.hidden {
                width: 75%;
            }
        }
        
        .swiper-container {
            width: 500px;
            height: 300px;
            margin: 20px auto;
        }
        
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            line-height: 300px;
        }
        
        .progress {
            width: 300px;
        }
        
        .gallery-thumbs {
            height: 130px;
        }
    </style>

    <script src='./js/hotel.js'></script>

    <!-- start banner Area -->
    <section class="banner-area relative">
        <div class="container pt-50 mb-30">
            <div class="row d-flex justify-content-center align-items-center" style="height: 250px">
                <div class="menu-content col-lg-12">
                    <div class="title text-center">
                        <h1 class="text-white mb-10">객실 상세보기</h1>
                        <form method="post" name="frm_ms" id="frm_ms" class="row">
                            <div class="col-lg-2  col-md-12 ">
                                <input type="text" class="form-control" name="name" placeholder="From " onfocus="this.placeholder = ''" onblur="this.placeholder = 'From '">
                            </div>
                            <div class="col-lg-3  ">
                                <input type="text" id="datePickInput" class="form-control  datepicker-here" data-range="true" data-position="right top" data-language="kr" data-multiple-dates-separator=" - " name="start" placeholder="Start " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start '">
                            </div>
                            <div class="col-lg-3">
                                <input type="text" id="datePickInput" class="form-control  datepicker-here" data-range="true" data-position="right top" data-language="kr" data-multiple-dates-separator=" - " name="return" placeholder="Return " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Return '">
                            </div>
                            <div class="col-lg-2  ">
                                <input type="number" min="1" max="20" class="form-control" name="adults" placeholder="인원 " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Adults '">
                            </div>


                            <button class="btn btn-primary" style="width: 15%; height: 40px;" type="submit">
                                <i class="fa fa-search"></i>
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End banner Area -->


    <form name='frm_review' id='frm_review' method='post' class='frm_review'>
        <br />
        <br />
        <br />
        <div class='container'>
            <div class="title1" style="margin-bottom: 10px">
                <h2>맛있는 치킨집</h2>
            </div>
            <div class="float-right" style="display: flex">
                <!--   <a href='#' style='padding:.450rem .75rem ;font-size: medium; margin-right:15px'><i class="fas fa-heart"></i>저장</a>
        -->
                <div class="p-1 heart" onclick="main.like(this)">
                    <i class="fa fa-heart-o" style="cursor: pointer;  margin-right: 20px; font-size: 28px; padding: 0.10rem !important;"></i>
                </div>
                <div>
                    <!--  -->
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" style='color: #007bff; background: ghostwhite; margin-left: -15px;' data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-share-alt mr-1"></i> 공유하기 <span class="caret"></span>
                        </button>

                    </div>
                    <!--  -->
                </div>
            </div>

            <div class='preinfo'>

                <div class='rating' data-rate='4' style='font-size: 23px; margin-bottom: 10px;'>
                    <!-- data-rate에 별점을입력(평균별점입력5를넘기지않아야함) -->
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star" style="margin-right: 10px;"></i> 
                    <span>4건의 리뷰</span> 
                    <span>Type , World , menu , Local , Price </span>
                </div>


            </div>

            <div class='preinfo' style='font-size: 18px'>
                <span><i class="fa fa-location-arrow"
               style="margin-right: 3px" aria-hidden="true"></i>주소: 서울트윽벼얼시 조오옹로구우
            </span>
                <span><i class="fa fa-mobile" style="margin-right: 3px"
               aria-hidden="true"></i>연락처: 02-222-2222</span>
                <br />
                <div class="clearfix">
                    <i class="fa fa-desktop" style="margin-right: 3px; margin-top: 10px 3px" aria-hidden="true"></i>홈페이지 <a href='http://localhost:8888/review/review.jsp' style="margin-right: 5px">http://localhost:8888/review/review.jsp</a>
                    <span><i class="fa fa-clock-o " style="margin-right: 3px" aria-hidden="true"></i>오픈:10:00, 마감22:00 ,휴일 (일요일)</span>
                </div>

            </div>
            <div class="info row justify-content-center mb-5">
                <div class='col-lg-8 col-sm-12'>
                    <!-- 큰사이즈에서 8 스몰에서 12 -->
                    <!-- Swiper -->
                    <div class="swiper-container gallery-top">
                        <div class="swiper-wrapper">
                            <img class="swiper-slide" src="./images/festival/1.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/2.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/3.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/4.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/5.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/6.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/7.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/8.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/9.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/10.png" style="cursor: pointer;" />
                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next swiper-button-white"></div>
                        <div class="swiper-button-prev swiper-button-white"></div>
                    </div>
                    <div class="swiper-container gallery-thumbs">
                        <div class="swiper-wrapper">
                            <img class="swiper-slide" src="./images/festival/1.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/2.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/3.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/4.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/5.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/6.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/7.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/8.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/9.png" style="cursor: pointer;" /> 
                            <img class="swiper-slide" src="./images/festival/10.png" style="cursor: pointer;" />
                        </div>
                    </div>

                    <div>
                        <h3>평가</h3>
                        <div class="clearfix" style='margin-top: 5px'>
                            <ul class='float-left'>
                                <li><i class="fa fa-cutlery" style="margin-right: 3px"></i>음식</li>
                                <li><i class="fa fa-share-alt" style="margin-right: 3px" aria-hidden="true"></i>서비스</li>
                                <li><i class="fa fa-krw" style="margin-right: 3px" aria-hidden="true"></i>가격</li>
                            </ul>
                            <ul class="float-right">
                                <li>
                                    <div class='rating' data-rate='1'>
                                        <!-- data-rate에 별점을입력(5초과금지) -->
                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                    </div>
                                </li>
                                <li>
                                    <div class='rating' data-rate='2'>
                                        <!-- data-rate에 별점을입력(5초과금지) -->
                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                    </div>
                                </li>
                                <li>
                                    <div class='rating' data-rate='3'>
                                        <!-- data-rate에 별점을입력(5초과금지) -->
                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                    </div>
                                </li>

                            </ul>
                        </div>

                        <div>
                            <h3>상세정보</h3>
                            <div style="border: 1px solid #666; padding: 8px; margin-top: 10px">
                                가격대<i class="fa fa-krw" style="margin-right: 3px" aria-hidden="true"></i>1000~2000
                                <br /> 일반음식점
                                <br />
                            </div>
                        </div>
                        <div class="col-lg-7 offset-lg-3">
                            <input type="button" class="genric-btn info min-width-350  e-large" value="예약하러 가기" id="btnReserv" onclick="ReservMove()">
                            <br>
                        </div>

                    </div>
                    <br />
                
                </div>
            </div>
            <div class="row">
                <div class="col-12 pt-3" style='height: 70px; border-top: 1px solid black;'>
                    <h3 style='float: left'>리뷰(2)</h3>
                    <input class="btn btn-primary float-right" onclick="insertMove()" type='button' id='review' name='review' value='리뷰작성' />
                </div>

                <div class="col-12">
                    <span style='display: inline-block; margin-bottom: 10px; font-size: larger'>여행자 평가</span>
                    <br />
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" name='5' id='5' value='star5' />
                        <label class="custom-control-label float-left mr-3" for="5">최고였어요</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type='checkbox' class="custom-control-input" name='4' id='4' value='star4' />
                        <label class="custom-control-label float-left mr-3" for="4">좋았어요...</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type='checkbox' class="custom-control-input" name='3' id='3' value='star3'>
                        <label class="custom-control-label float-left mr-3" for="3">평범했어요</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type='checkbox' class="custom-control-input" name='2' id='2' value='stra2'>
                        <label class="custom-control-label float-left mr-3" for="2">별로였어요</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped float-right " role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type='checkbox' class="custom-control-input" name='1' id='1' value='stra1'>
                        <label class="custom-control-label float-left mr-3" for="1">실망했어요</label>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped float-right " role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>

                <br />

                <div class="col-12 mt-2 ">
                    <h5>여행자 리뷰 보기:</h5>
                    <div class="form-row mt-3">
                        <input type='text' class="form-control col-11 " id='find' name='find' value='' placeholder="검색하실 리뷰를 작성해주세요........." style="height: fit-content;">
                        <button class="form-group btn btn-primary col-1" id='findStr' name='findStr'>
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row border-bottom py-3">
                <div class="col-2">
                    <img class="rounded-circle" src="./images/festival/1.png" alt="글쓴이">
                    <p class='text-center mt-3'>작성자</p>
                </div>
                <div class="col-10">
                    <div class='rating' data-rate='5'>
                        <!-- data-rate에 별점을입력(5초과금지) -->
                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                    </div>
                    <span>2020년 1월 15일에 작성</span> <span class="float-right">8명의
                  이용자가 도움이 됐다고 하던뎁숑?!</span>
                    <h5>리뷰제목</h5>
                    <div class="review-box">
                        <p class="pre-view">리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다입니다리뷰입니다입니다리뷰입니다입니다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난ㄴㄴ</p>
                        <span class="btn-moreInfo">[더보기]</span>
                    </div>
                    <p>
                        <span>방문 날짜 : </span>2020년 1월
                    </p>
                    <p>
                        도움이 됐나요?
                        <button class="btn btn-outline-secondary">
                            <i class="fa fa-thumbs-up"></i>
                        </button>
                    </p>
                </div>
            </div>
            <div class="row border-bottom py-3">
                <div class="col-2">
                    <img class="rounded-circle" src="./images/festival/1.png" alt="글쓴이">
                    <p class='text-center mt-3'>작성자</p>
                </div>
                <div class="col-10">
                    <div class="rating" data-rate="3">
                        <!-- data-rate에 별점을입력(5초과금지) -->
                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                    </div>
                    <span>2020년 1월 15일에 작성</span> <span class="float-right">8명의
                  이용자가 도움이 됐다고 하던뎁숑?!</span>
                    <h5>리뷰제목</h5>
                    <div class="review-box">
                        <p class="pre-view">리뷰입니다</p>
                        <span class="btn-moreInfo">[더보기]</span>
                    </div>
                    <p>
                        <span>방문 날짜 : </span>2020년 1월
                    </p>
                    <p>
                        도움이 됐나요?
                        <button class="btn btn-outline-secondary">
                            <i class="fa fa-thumbs-up"></i>
                        </button>
                    </p>
                </div>
            </div>


            <!-- Modal -->
            <div class="modal fade" data-backdrop="static" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalScrollableTitle">여행
                        목록에 추가</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div class="folder p-2" id="folderInsert" onclick="main.insertFolder(this)">
                                <i class="fa fa-plus pr-2"></i>여행 추가
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-primary" id="btnLikeInsert" onclick="main.makeHeart()">추가</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>

    <!-- Swiper JS -->
    <script src="./swiper-5.3.8/package/js/swiper.min.js"></script>


    <script>
        var galleryThumbs = new Swiper('.gallery-thumbs', {
            spaceBetween: 10,
            slidesPerView: 4,
            freeMode: true,
            watchSlidesVisibility: true,
            watchSlidesProgress: true,
        });
        var galleryTop = new Swiper('.gallery-top', {
            spaceBetween: 10,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            thumbs: {
                swiper: galleryThumbs
            }
        });


        let insertMove = function () {
            location.href = './?inc=commonPage/review_insert.jsp';
        }
    </script>

    
    <script src="js/festival_review.js"></script>
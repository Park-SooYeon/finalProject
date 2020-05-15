// 리뷰 두줄이상 넘어가면 더보기

function init() {
  var colorbox = $(".review-box .pre-view");
  colorbox.each(function () {
    $(this).outerHeight();
    if ($(this).outerHeight() > 21) {
      $(this).addClass("hidden");
      var btnMoreCmt = $(this).siblings(".btn-moreInfo");
      btnMoreCmt.show();
      btnMoreCmt.on("click", function () {
        $(this).siblings(".pre-view").removeClass("hidden");
        $(this).remove();
      });
    }
  });

  //별점표시하기
  var rating = $(".rating");

  rating.each(function () {
    var targetScore = $(this).attr("data-rate");
    $(this)
      .find("i:nth-child(-n+" + targetScore + ")")
      .css({ color: "#ffc107" });
  });

  //  다음 지도  api
  var mapContainer = document.getElementById("sw-map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

  // 지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  // 주소로 좌표를 검색합니다
  geocoder.addressSearch("서울특별시 종로1.2.3.4가동", function (result, status) {
    // 정상적으로 검색이 완료됐으면
    if (status === kakao.maps.services.Status.OK) {
      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

      // 결과값으로 받은 위치를 마커로 표시합니다
      var marker = new kakao.maps.Marker({
        map: map,
        position: coords,
      });
      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
    }
  });

  var galleryThumbs = new Swiper(".gallery-thumbs", {
    spaceBetween: 10,
    slidesPerView: 4,
    freeMode: true,
    watchSlidesVisibility: true,
    watchSlidesProgress: true,
  });
  var galleryTop = new Swiper(".gallery-top", {
    spaceBetween: 10,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    thumbs: {
      swiper: galleryThumbs,
    },
  });

  $(".testBtn").click(function (e) {
    e.preventDefault();
    $("#testModal").modal("show");
  });

  $(".success").click(function (e) {
    alert("성공적으로 접수되었습니다.");
  });
}

init();
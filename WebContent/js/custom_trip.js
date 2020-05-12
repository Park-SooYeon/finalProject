function init() {
  var mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

  // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  $("#on-city-close-btn").click(function () {
    $("#right-full-box").toggle({ direction: "left" });
  });

  $("#on-city-open-btn").click(function () {
    $("#right-full-box").toggle("fade", { direction: "left" });
  });

  $(".plan-category li").click(function () {
    $(".schedule-detail-box").show("fade", { direction: "left" });
    $(".plan-category li").not(this).removeClass("on");
    $(".show-all-day").removeClass("on");
    $(this).addClass("on");
  });

  $(".show-all-day").click(function () {
    $(".schedule-detail-box, #right-full-box").hide();
    $(".plan-category li").removeClass("on");
    $(this).addClass("on");
  });

  $(".toggle-on").click(function () {
    $(this).find("svg").toggleClass("fa-caret-up fa-caret-down");
    $(this).parentsUntil(".schedule-detail-box").next().toggle();
  });

  $(".schedule-detail-box .day-spot-item").hover(function () {
    $(this).find(".item-ctrl-box").toggle();
  });

  // 검색 필터 아이콘을 클릭하면 색 변화
  $(".list-cat-item").click(function () {
    $(".list-cat-item").not(this).removeClass("on");
    $(this).toggleClass("on");
  });

  $("#btnEditDay").click(function () {});
} // end of init

init();

function add_plan_day() {
	// 리스트의 마지막 항목 on 클래스 제거한 뒤 append
  $(".plan-category li:last-child").removeClass("on").clone().appendTo(".plan-category");
}

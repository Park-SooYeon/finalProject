/**
 * main 페이지에 사용되는 js
 */

let main = {};

/* 좋아요 하트와 관련된 함수들 */
var nowEle; // 여행 추가시 좋아요가 선택될 요소를 저장할 변수

// 좋아요 하트 선택시 작동
main.like = function (ele) {
  let heart = ele.childNodes[1];
  nowEle = heart;
  if (heart.classList.contains("fa-heart-o")) {
    // 여행 폴더 선택할 모달창 열기
    heart.setAttribute("data-toggle", "modal");
    heart.setAttribute("data-target", "#exampleModalScrollable");
  } else if (heart.classList.contains("fa-heart")) {
    // 좋아요 해제
    heart.classList.remove("fa-heart");
    heart.classList.add("fa-heart-o");
    heart.removeAttribute("data-toggle", "modal");
    heart.removeAttribute("data-target", "#exampleModalScrollable");
  }
};

/* 여행 선택 모달창에서와 관련된 함수들 */
//모달창에서 추가 버튼 클릭시 작동
main.makeHeart = function () {
  // 추가버튼 클릭시 좋아요가 선택됨
  nowEle.classList.remove("fa-heart-o");
  nowEle.classList.add("fa-heart");
  $("#exampleModalScrollable").modal("hide");
};

// 선택된 여행 폴더를 나타내주는 css 제어
main.selectFolder = function (ele) {
  let pele = ele.parentNode;
  let cele = pele.childNodes;
  for (var i = 1; i < cele.length; i++) {
    if (cele[i].nodeName === "DIV") {
      cele[i].classList.remove("folderSelect");
    }
  }
  ele.classList.add("folderSelect");
};

// 여행 추가시 새로운 여행 추가
main.insertFolder = function (ele) {
  let newele =
    "<div class='folder p-2' onclick='main.selectFolder(this)'><i class='fa fa-folder pr-2'></i>여행명4</div>";
  $("#folderInsert").before(newele);
};

/* 메뉴 swiper 동작과 관련된 함수들 */
// 스크린 크기 가져오기
var mql = window.matchMedia("screen and (max-width: 768px)");
var sliderPage = 4;

// 초기 스크린 크기에 따라 slider 개수를 다르게 표기
if (mql.matches) {
  sliderPage = 3;
} else {
  sliderPage = 4;
}
var swiper = new Swiper(".row .swiper-container", {
  slidesPerView: sliderPage,
  paginationClickable: true,
  spaceBetween: 5,
  nextButton: ".swiper-button-next",
  prevButton: ".swiper-button-prev",
});

// 스크린 크기가 변할때마다 slider 개수를 다르게 표기
mql.addListener(function (e) {
  if (e.matches) {
    sliderPage = 3;
  } else {
    sliderPage = 4;
  }
  var swiper = new Swiper(".row .swiper-container", {
    slidesPerView: sliderPage,
    paginationClickable: true,
    spaceBetween: 5,
    nextButton: ".swiper-button-next",
    prevButton: ".swiper-button-prev",
  });
});

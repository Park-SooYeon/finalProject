/**
 * main 페이지에 사용되는 js
 */

let main = {};

/* 좋아요 하트와 관련된 함수들 */
var nowEle; // 여행 추가시 좋아요가 선택될 요소를 저장할 변수
var now_trip_serial; // 여행 추가시 선택된 여행의 serial 번호를 저장할 변수
var now_place_serial; // 현재 선택한 관광지의 serial 번호를 저장할 변수

// 좋아요 하트 선택시 작동
main.like = function (ele, place_serial) {
  let heart = ele.childNodes[1];
  nowEle = heart;
  now_place_serial = place_serial;
  
  if (heart.classList.contains("fa-heart-o")) {
    // 여행 폴더 선택할 모달창 열기
    heart.setAttribute("data-toggle", "modal");
    heart.setAttribute("data-target", "#exampleModalScrollable");
  } else if (heart.classList.contains("fa-heart")) {
	  alert(place_serial)
	$.ajax({
		url : "deleteLikeTrip.sb",
		data : {"place_serial" : place_serial},
		method : "post",
		success : function() {
			alert("성공!");
			// 좋아요 해제
		    heart.classList.remove("fa-heart");
		    heart.classList.add("fa-heart-o");
		    heart.removeAttribute("data-toggle", "modal");
		    heart.removeAttribute("data-target", "#exampleModalScrollable");
		}
	});
	heart.classList.remove("fa-heart");
	heart.classList.add("fa-heart-o");
	heart.removeAttribute("data-toggle", "modal");
	heart.removeAttribute("data-target", "#exampleModalScrollable");
  }
};

// 선택된 여행 해제하는 함수
main.removeSelect = function() {
	let check_trip = document.getElementsByClassName("folderSelect");
	if(check_trip.length != 0) {
		check_trip[0].classList.remove("folderSelect");		
	}
}


/* 여행 선택 모달창에서와 관련된 함수들 */
// 선택된 여행 폴더를 나타내주는 css 제어
main.selectFolder = function (ele, serial) {
	main.removeSelect();
  ele.classList.add("folderSelect");
  now_trip_serial = serial;
};

// 여행 추가시 새로운 여행 추가
main.insertFolder = function () {
  // prompt로 생성할 여행명 받기
  let trip_name = prompt("새로 생성할 여행 이름을 입력해주세요.");
  
  // 여행명 입력되면 요소 추가
  if(trip_name != null) {
	  // DB에 새로운 여행 폴더 생성
	  $.ajax({
		  url : "insertTrip.sb",
		  method : "post",
		  data : { "trip_name" : trip_name},
		  dataType : "text",
		  success : function(data) {
			  let newele =
				    "<div class='folder p-2' onclick='main.selectFolder(this," + Number(data) + ")'><i class='fa fa-folder pr-2'></i>" + trip_name + "</div>";
			  $("#folderInsert").before(newele);
		  }
	  });
  }
};

$('#btnLikeInsert').on("click", function() {
	let check_trip = document.getElementsByClassName("folderSelect");
	if(check_trip.length == 1) { // 체크된 여행 폴더가 있으면 여행지 저장
		alert(now_trip_serial);
		alert(now_place_serial);
		$.ajax({
			url : "insertLikeTrip.sb",
			method : "post",
			data : {
				"trip_serial" : now_trip_serial,
				"place_serial" : now_place_serial
			},
			success : function() {
				// 추가버튼 클릭 후, 여행 정보가 저장되면 좋아요가 선택됨
				nowEle.classList.remove("fa-heart-o");
				nowEle.classList.add("fa-heart");
				alert("여행지 저장");
				main.removeSelect();
				$("#exampleModalScrollable").modal("hide");
			}
		});	
	} else { // 없으면 선택된 여행지가 없다고 알려줌
		alert("저장할 여행 폴더를 선택해주세요.");
	}
});

// 모달창 닫으면 선택된 폴더 해제
$('#btnClose').on("click", function() {
	main.removeSelect();
});


// main에서 지역별 메인 페이지로 이동
main.placeMove = function(local) {
	location.href = './?inc=placeMain.sb&local=' + local;
}

// 관광지 검색 페이지로 이동
main.searchMove = function(menu, local = 0) {
	location.href = './?inc=mainMore.sb&local=' + local + '&menu=' + menu;
}

// detailView로 이동
main.detailMove = function(code) {
	location.href = './?inc=detailView.dv&code=' + code;
}






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
var swiper = new Swiper(".swiper-container", {
  slidesPerView: sliderPage,
  paginationClickable: true,
  spaceBetween: 5,
  navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    }
});

// 스크린 크기가 변할때마다 slider 개수를 다르게 표기
mql.addListener(function (e) {
  if (e.matches) {
    sliderPage = 3;
  } else {
    sliderPage = 4;
  }
  var swiper = new Swiper(".swiper-container", {
    slidesPerView: sliderPage,
    paginationClickable: true,
    spaceBetween: 5,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      }
  })
});
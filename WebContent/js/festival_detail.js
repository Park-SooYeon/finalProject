//place_serial 값 저장
//var place_serial = document.getElementById("place_serial").value;

//쿠키에 place_serial 저장
function setCookie(place_serial, value, exp){
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = place_serial + '=' + value + ';expires=' + date.toUTCString() + ';path=/';	
};
//setCookie(변수이름, 변수값, 기간);
setCookie("place_serial", place_serial, 1);

//쿠키추가
function addCookie(id){
	var items = getCookie('place_serial'); //이미 저장된 값을 쿠키에서 가져오기
	var maxItemNum = 5; //최대 저장 가능한 아이템 개수
	var expire = 7; //쿠키값을 저장할 기간
	
	if(items){
		var itemArray = items.split(',');
		if(itemArray.indexOf(id) != -1){
			//이미 존재하는 경우 종료
			console.log('Already exists.');
		}
		else{
			//새로운 값 저장 및 최대 개수 유지하기
			itemArray.unshift(id);
			if(itemArray.length > maxItemNum)itemArray.length=5;
			items=itemArray.join(',');
			setCookie('place_serial', items, expire);
		}
	}else{
		//신규 id rkqt wjwkdgkrl
		setCookie('place_serial', id, expire);
	}	
	
	
}


//쿠키 가저오기
var getCookie = function(place_serial){
	var value = document.cookie.match('(^|;) ?' + place_serial + '=([^;]*)(;|$)');	
	return value? value[2] : null;
}
// getCookie(변수이름)
var is_expend = getCookie("place_serial");

//쿠키(Cookie) 삭제하기
var deleteCookie = function(place_serial){
	document.cookie = place_serial + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
}
deleteCookie('place_serial');



//리뷰 두줄이상 넘어가면 더보기

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
  
  	//swiper
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

  
  //신고하기 버튼
  $(".testBtn").click(function (e) {
    e.preventDefault();
    $("#testModal").modal("show");
  });
  
  //접수하기 버튼
  $(".success").click(function (e) {
    alert("성공적으로 접수되었습니다.");
  });
  
  //접수하기버튼 아이디
  $("#asd").click(function () {	  
	  report();	  
  });

}
function report(){
	//name이 같은 체크박스의 value값 받아오기
	var report_code = [];
	$("input[name='jb-radio']:checked").each(function(i){
		report_code.push($(this).val());
	});

	//신고내용 가저오기
	var report_content = document.getElementByName('review_accuse').value();
	
	//사용자 ID(문자열)와 체크박스 값들(배열)을  name/value 형태로 담는다.
	var allDate = { "report_code": report_code, "report_content": report_content };
	
	$.ajax({
		url:"report.dv", //컨트롤 어노테이션의 주소값
		type:'GET',
		data:allData,
		success:function(data){
			alert("신고가 정상적으로 접수되었습니다.");
			window.opener.location.reload();
			self.close();
		},
		error:function(jqXHR, textStatus, errorThrown){
			alert("관리자에게 문의하여 주세요. \n" + textStatus + " : " + errorThrown);
			self.close();
		}
		
	});
	
}

init();

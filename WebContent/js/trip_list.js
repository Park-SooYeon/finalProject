const TRIP_CAL = ".trip-cal-input";
const TRIP_DAY = ".trip-day-input";
let fullDate = "";
let member = "";
let serial = "";

function load(){
	// 첫화면에 모든 여행리스트 조회
	$("#list-here").load("mytrip.mp");
}

load();

	//수정 모달창이 켜졌을때
	$(document).on("show.bs.modal", "#mp-modifyTripModal", function(event){
		
		let modal = $(this);
		const ADD_BTN = $(event.relatedTarget);
		
		let name = ADD_BTN.data("name");
		let auth = ADD_BTN.data("auth");
		let days = ADD_BTN.data("days");
		let start = ADD_BTN.data("start");
		let end = ADD_BTN.data("end");

		// 추후 사용하기 위해서 전역변수로
		member = ADD_BTN.data("member");
		serial = ADD_BTN.data("serial");
		
		if(days==0 || days==null){
			//입력한 여행일수 값이 없으면 CAL를 SHOW
			inputToggle(TRIP_CAL, TRIP_DAY);
		}else if (days>0){ 
			inputToggle(TRIP_DAY, TRIP_CAL);
		}
		
		fullDate = start+" - "+end;
		$("#mTrip_name").val(name);
		$("#mDays_count").val(days);
		$("#datePickInput2").val(fullDate);
		$("#trip_serial").val(serial);
		
		if(auth==1){
			$("#unlock").prop("checked", true);
		}else if(auth==0){
			$("#lock").prop("checked", true);
		}
	})
	
		// 일수 or 날짜 선택 가능
	  $(document).on('change', '.select-day', function(){
	  $this = $(this);
		  
	  let date = $("#datePickInput2").val();
	  let str = date.split(" - ");
		  
	  if ($this.val() == 1) {
		  inputToggle(TRIP_DAY, TRIP_CAL);
	  } else if($this.val() == 2){
		  inputToggle(TRIP_CAL, TRIP_DAY);
	  }
  });
	
	// 여행 추가 버튼을 클릭했을 때 form ajax로 submit
	$(document).on("click", "#btnCreateTrip", function(){
	  let param = $("#mpNewtripFrm").serialize();
	  
		$.post("newtrip.mp", param, function(data, state) {
				alert(data);
				location.reload();
			});
		})
		
	// 여행 수정 버튼을 클릭했을 때 form ajax로 submit
	$(document).on("click", "#btnModifyTrip", function(){
	  let param = $("#mpModifyTripFrm").serialize();
	  	console.log(param);
		$.post("modify_trip.mp", param, function(data, state) {
				alert(data);
				location.reload();
			});
		})
	
	// 여행(공개, 비공개)보기 토글
  $(document).on("click", "#mpPrivacyFilter span", function(e){
	  console.log(e);
	  console.log(e.target.dataset.index);
	  const SELECT = e.target.dataset.index;//2 : 전체, 1 : 비공개, 0 : 공개
	  const ELEMENTS = document.querySelectorAll(".mp-trip");

	  for(const elem of ELEMENTS){
		  if(elem.dataset.flag==SELECT){
			  elem.style.display = "none"; // 다른 element는 숨김
		  }else{
			  elem.style.display = "block";  
		  }
	  }
  });
	
	// 관심리스트 전체 보기
	$("#mpLikeAll").on("click", function(){
		$("#list-here").load("likeList.mp");
	})
	
	// 추천한 리뷰 전체 보기
	$("#mpLikeRev").on("click", function(){
		$("#list-here").load("likeReview.mp");
	})
	

// 일수선택, 날짜선택 토글
function inputToggle(a, b){
	$(a).show();
	$(a).find("input").attr("disabled", false);
	$(b).hide();
	
	// '일수선택' -> '날짜선택' 해도 날짜에 값 남아있도록 
	$("#datePickInput2").val(fullDate);
	$(b).find("input").attr("disabled", true);
	$(".datepicker-here").datepicker();
}


function deleteTrip(serial){
	// 여행 삭제 버튼을 클릭했을 때 form ajax로 submit
	$.get("deleteTrip.mp?serial="+serial, function(data, state) {
		alert(data);
		location.reload();
	});
}

function goTrip(){
	location.href="editTrip.mp?se="+serial;
}

function init(){
	// 두 줄 이상 '더보기'
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
}

init();
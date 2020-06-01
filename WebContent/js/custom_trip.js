let cnt;
let addDate;

function init() {

  // 장소검색 디테일 바 숨기기
  $("#on-city-close-btn").click(function () {
    $("#right-full-box").toggle({ direction: "left" });
  });

  // 장소검색 디테일 바 숨기기
  $("#on-city-open-btn").click(function () {
    $("#right-full-box").toggle("fade", { direction: "left" });
  });

  // Day 누르면 detail box 나타나고 on class toggle
  $(document).on("click", ".plan-category li", function(){
	  const $this = $(this);
	  
	  let day_cnt = $this.find(".cat-left-day").html();
	  let trip_date = $this.find(".trip-date").html();
	  let trip_day = $this.find(".trip-day").html();
	  let result = day_cnt + " | " +trip_date+" ("+trip_day+")";

	  $(".schedule-detail-box").show("fade", { direction: "left" });
	    $(".plan-category li").not(this).removeClass("on");
	    $(".show-all-day").removeClass("on");
	    $this.addClass("on");
	    $("#result-date").html(result);
	    
  })

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
  
  
  // 시작날짜
  let start = $("#start_hidden").val();
  //일수
  cnt = $("#cnt_hidden").val();
  
  // start_date가 있을 때에만 날짜 계산
  if(start!=""){
	  start = getInitDate(start);
	  
	  for (var i = 1; i <= cnt; i++) {
		  // 총 일수만큼 for문 돌면서 start_date에 +1 해주고
		  addDate = start.getDate()+1;		  
		  start.setDate(addDate);
		  
		  $(".cat-left-date-"+i).html(getFormatDate(start));
		  $(".cat-right-weekday-"+i).html(getDay(getFormatDate(start)));
	  }
	  start = getFormatDate(start);
  }
  
} // end of init

init();



function add_plan_day() {
	let end_value = $(".cat-left-date-"+cnt).html();
	// yyyy-mm-dd 형태를 Date 형태로
	let end = getInitDate(end_value);
	
	// cnt에 1, date에 2 더해주고
	let newCnt = Number(cnt)+1;
	addDate = end.getDate()+2;
	end.setDate(addDate);
	
	// 리스트의 마지막 항목 on 클래스 제거한 뒤 append
  //$(".plan-category li:last-child").removeClass("on").clone().appendTo(".plan-category");
  $(".plan-category").append("<li>"+
            "<div class='cat-date-left-box'>"+
              "<div class='cat-left-day'>DAY "+newCnt+"</div>"+
            "</div>"+
            "<div class='cat-date-right-box'>"+
              "<div class='cat-left-date-"+newCnt+" pr-2 trip-date' style='color: #49b2e9;'>"+
              getFormatDate(end)+"</div>"+
              "<div class='cat-right-weekday-"+newCnt+" trip-day'>"+getDay(getFormatDate(end))+"</div>"+
            "</div>"+
          "</li>");
  cnt++;
}


// String -> Date로
function getInitDate(date){

	let com_ymd = new Date(date);
	
	// start_date부터 시작해야하기 때문에 -1을 먼저 해준다
 	com_ymd.setDate(com_ymd.getDate()-1);
	 
	 return com_ymd; 
	 // Date형으로 반환됨
}

// Date형 -> yyyy-mm-dd로
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}


// 날짜 String 넣으면 요일 반환
function getDay(date){
	let week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	let dayOfWeek = week[new Date(date).getDay()];
	return dayOfWeek;
}

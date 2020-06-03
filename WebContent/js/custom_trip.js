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
	  let result = " | " +trip_date+" ("+trip_day+")";

	  $(".schedule-detail-box").show("fade", { direction: "left" });
	    $(".plan-category li").not(this).removeClass("on");
	    $(".show-all-day").removeClass("on");
	    $this.addClass("on");
	    
	    if((trip_date)!=""){
	    // 날짜가 있으면
	    	$("#result-date").html(day_cnt+result);
	    }else{
	    // 날짜 없으면 DAY만
	    	$("#result-date").html(day_cnt);
	    }
	    
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


// 검색창에 검색어 입력되는 순간 ajax
$("#searchPlace").on("keyup", function(){
	let findStr = $(this).val();
	let str = "";
	let parseJson;
	
	
	var xhr = new XMLHttpRequest();
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword'; /*URL*/
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'RGRZ7ZbtIrL2U4P0qfnA3puuV5UrzrqEFmf0aLwaZitXLcUQrOTbyRoZHRCpdViHuU1cTZ7jXX4GDbOMb%2Fc1gg%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('ServiceKey') + '=' + encodeURIComponent('인증키 (URL- Encode)'); /**/
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
	queryParams += '&' + encodeURIComponent('listYN') + '=' + encodeURIComponent('Y'); /**/
	queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('A'); /**/
	queryParams += '&' + encodeURIComponent('contentTypeId') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('areaCode') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('sigunguCode') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('cat1') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('cat2') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('cat3') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('keyword') + '=' + encodeURIComponent(findStr)
	queryParams += '&_type=json';

	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	    	// 결과값을 json타입으로 담고
	    	parseJson = JSON.parse(this.responseText).response.body.items.item;
	    	console.log(parseJson[0]);
	    	for(d of parseJson){
	    		str += `<div
		            class='day-spot-item ui-draggable'
		                data-serial='${d.contentid}'
		                data-long='${d.mapy}'
		                data-lat='${d.mapx}'
		                data-pl_type='0'
		                data-no='0'
		                data-pl_cat='301'
		                data-ci='10907'
		              >
		                <div class='img-box fl'>
		                  <img src='${d.firstimage}' />
		                </div>
		                <div class='info-box'>
		                  <div class='info-title'>${d.title}</div>
		                  <div class='small info-small'>공원/정원</div>
		                  <div class='like-cnt-info'>
		                    <i class='fab fa-gratipay' style='color: rgb(253, 123, 145);'></i> 
		                  </div>
		                </div>
		                <div class='spot-to-inspot'>
		                  <img class='add-icon' src='./images/myPage/interface.png'/>
		                </div>
		              </div>`;
	    	}
	    	$("#place-here").html(str);
	    	}
	};
	xhr.send('');
	
	
	/*
	$.getJSON("selectAll.mp", {"findStr":findStr}, function(json){
		
		if(json.length>0){
			
			
			for(d of json){
				if(d.place_code == 2){ // 호텔이면 경로수정
					d.photo_name = "./images/hotel/"+d.photo_name;
				}
				str += `<div
	            class='day-spot-item ui-draggable'
	                data-serial='${d.place_serial}'
	                data-long='${d.longitude}'
	                data-lat='${d.latitude}'
	                data-pl_type='0'
	                data-no='0'
	                data-pl_cat='301'
	                data-ci='10907'
	              >
	                <div class='img-box fl'>
	                  <img src='${d.photo_name}' />
	                </div>
	                <div class='info-box'>
	                  <div class='info-title'>${d.place_name}</div>
	                  <div class='small info-small'>공원/정원</div>
	                  <div class='like-cnt-info'>
	                    <i class='fab fa-gratipay' style='color: rgb(253, 123, 145);'></i> ${d.like_cnt}
	                  </div>
	                </div>
	                <div class='spot-to-inspot'>
	                  <img class='add-icon' src='./images/myPage/interface.png'/>
	                </div>
	              </div>`;
			}
		}else{
			
		}

		
		
	});
	 */
	
})


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

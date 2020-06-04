let cnt;
let addDate;
let contentTypeId;
let dayCnt=1;
let image;
let coords;

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
	
	
	$.getJSON("selectAll.mp", {"findStr":findStr}, function(json){
		
		if(json.length>0){
			
			for(d of json){
				
				let json = JSON.stringify(d);
				
				if(d.place_code == 2){ // 호텔이면 경로수정
					if(d.photo_name == 'undefined' || d.photo_name == null){
						d.photo_name = './images/myPage/korea.png';
					}else{
						d.photo_name = "./images/hotel/"+d.photo_name;
					}
				}
				
				str += `<div
	            class='day-spot-item ui-draggable'
	                data-serial='${d.place_serial}'
	                data-long='${d.longitude}'
	                data-lat='${d.latitude}'
	                data-cid='32'
	                data-area='${d.local_code}'
	              >
	                <div class='img-box fl'>
	                  <img src='${d.photo_name}' />
	                </div>
	                <div class='info-box'>
	                  <div class='info-title'>${d.place_name}</div>
	                  <div class='small info-small'>숙박</div>
	                </div>
	                <div class='spot-to-inspot pl-2' data-all='${d}' onclick='addPlan(${json});'>
	                  <img class='add-icon' src='./images/myPage/interface.png'/>
	                </div>
	              </div>`;
			}
		}else{
			str='';
		}
	
	var xhr = new XMLHttpRequest();
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword'; /*URL*/
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'1Dz1bR5MAy4n67kjDRt13zzTSNAaW7oNAcVIjOVXV6Dvh48PW8I4jVKIhaULA9oyhQXCfGmWceVxx3Psb%2B7Tyw%3D%3D'; /*Service Key*/
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
	    	if(parseJson !=undefined){
	    		for(d of parseJson){
	    			contentTypeId = setType(d.contenttypeid);
	    			image = setImage(d.firstimage);
	    			let json = JSON.stringify(d);
	    			
	    			
	    			str += `<div
	    				class='day-spot-item ui-draggable'
	    				data-serial='${d.contentid}'
	    				data-long='${d.mapy}'
	    				data-lat='${d.mapx}'
	    				data-cid='${d.contenttypeid}'
	    				data-area = '${d.areacode}'
	    				>
	    				<div class='img-box fl'>
	    				<img src='${image}' />
	    				</div>
	    				<div class='info-box'>
	    				<div class='info-title'>${d.title}</div>
	    				<div class='small info-small'>${contentTypeId}</div>
	    				</div>
	    				<div class='spot-to-inspot pl-2' data-all = '${d}' onclick='addPlan(${json});'>
	    				<img class='add-icon' src='./images/myPage/interface.png'/>
	    				</div>
	    				</div>`;
	    		}
	    	}
	    	$("#place-here").html(str);
	    	}
	};
	xhr.send('');
	});
	
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

$(".list-cat-item").on("click", function(){
	let index = $(this).data("cat");
	// 인덱스 = contentid
	$(".list-box .day-spot-item[data-cid!="+index+"]").addClass("d-none");
	$(".list-box .day-spot-item[data-cid="+index+"]").removeClass("d-none");
	// contentid가 index와 같지 않은 요소들 다 숨기기
})

$("#chooseCity").on("change", function(){
	let index = $("#chooseCity option:selected").val();
	console.log(index);
	$(".list-box .day-spot-item[data-area!="+index+"]").addClass("d-none");
	$(".list-box .day-spot-item[data-area="+index+"]").removeClass("d-none");
})


// 관광지를 일정에 추가했을 때 이벤트 발생
function addPlan(d){
	let ele = "";
	let distance = "";
	
	// 호텔, api 요소 변수명이 다르기때문에 undefined일 경우 새로운 변수에 담아서 처리
	const place_serial = (d.contentid == undefined)? d.place_serial : d.contentid;
	const longitude = (d.mapy == undefined)? d.longitude : d.mapy;
	const latitude = (d.mapx == undefined)? d.latitude : d.mapx; 
	const place_name = (d.title == undefined)? d.place_name : d.title;
	let image = (d.firstimage == undefined)? d.photo_name : d.firstimage;
	let place_code = (d.contenttypeid == undefined)? 32 : d.contenttypeid;

	// place 코드 => 분류명으로 switch
	place_code = setType(place_code);
	
	// 이미지 없는 경우 default 이미지 설정
	image = setImage(image);
	
	
		//let tempNum = dayCnt-1;
		
		//let elem = document.getElementById("order"+tempNum);
		
	/*
		coords2 = {
			latitude : elem.dataset.lat,
			longitude : elem.dataset.long
		}
		*/

		coordsNow = {
			latitude : latitude,
			longitude : longitude
		}
		
		console.log(coords);
		
		if(coords != null){
			distance = computeDistance(coords, coordsNow);
		}
		
		
//현재 cnt - 1한 요소의 경도 위도를 가져오면 되는디	
	
	
	console.log("coords", coords);
	//console.log(computeDistance(coords1, coords2));
	
	ele = `<div
    class='day-spot-item'
    id='order${dayCnt}'
    data-index='${dayCnt}'
    data-set_day='1'
    data-rel_srl='6725'
    data-contentid='${place_serial}'
    data-lat='${longitude}'
    data-long='${latitude}'>
    
     <div class='item-ctrl-box' style='display: none;'>
        <div class='btn-del' title='삭제'>
		<img class='add-icon' src='./images/myPage/sign.png'></img>
        </div>
      </div>

    <div class='spot-distance-box'>${distance}</div>

    <div class='img-box'>
      <div class='spot-order-box'>${dayCnt}</div>
      <img src='${image}' />
    </div>
    <div class='info-box'>
      <div class='info-title'>${place_name}</div>
      <div class='small info-small'>${place_code}</div>
    </div>
  </div>`;
		
	
	coords = {
			latitude : latitude,
			longitude : longitude
	};
	
	// 1번, 2번, 3번 ...
	$("#schedule-here").append(ele);
	dayCnt++;
}


// 이미지파일 세팅, contenttypeid 세팅작업
function setType(cid){
	
	switch(cid){
	case 12:
		return '관광지';
	case 14:
		return '문화시설';
	case 15:
		return '축제/공연/행사';
	case 25:
		return '여행코스';
		break;
	case 32:
		return '숙박';
		break;
	case 38:
		return '쇼핑';
		break;
	case 39:
		return '음식';
		break;
		
}
}
function setImage(image){
	// 이미지 파일이 없으면 정해진 이미지로 대체
	if(image == undefined || image == null){
		image = './images/myPage/korea.png';
	}
	return image;
}


let ourCoords = { //서울 시청 좌표
	    latitude : 37.5666263,  //위도
	    longitude : 126.9783924  //경도
	};

let startCoords = {
		latitude : 37.566535,
		longitude : 126.977969199999
};

console.log(computeDistance(ourCoords, startCoords));

/* 위도, 경도로 거리 계산 */
function computeDistance(startCoords, destCoords) {
    var startLatRads = degreesToRadians(startCoords.latitude);
    var startLongRads = degreesToRadians(startCoords.longitude);
    var destLatRads = degreesToRadians(destCoords.latitude);
    var destLongRads = degreesToRadians(destCoords.longitude);

    var Radius = 6371; //지구의 반경(km)
    var distance = Math.acos(Math.sin(startLatRads) * Math.sin(destLatRads) + 
                    Math.cos(startLatRads) * Math.cos(destLatRads) *
                    Math.cos(startLongRads - destLongRads)) * Radius;

    return distance;
}

function degreesToRadians(degrees) {
    radians = (degrees * Math.PI)/180;
    return radians;
}
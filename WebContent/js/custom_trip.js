let cnt;
let addDate;
let contentTypeId;
let dayCnt=1;
let image;
let coords;
let db = [];
// 현재 작업하고 있는 일자
let trip_date;
const trip_list_serial = $("#trip_list_serial").val();
let index = "";
let end = "";

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
     dayCnt = 1;
     let day_cnt = $this.find(".cat-left-day").html();
     trip_date = $this.find(".trip-date").html();
     // 전역변수에도 저장
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
       
       coords = [];
       // 거리정보 초기화
       
       $.getJSON("selectOnePlace.mp", {"serial" : trip_list_serial, "trip_day" : trip_date}, function(data){
    	   console.log(data);
    	   if(data.length>0){
    		   
    		   $("#schedule-here").empty();
    		   for(d of data){
    			   addPlan(d.p);
    		   }
    	   }else{
    		   let temp = `<div id='temp-div' class='text-center pt-5'>
    		        <h4 style='color:#707070;'>여행일정을 추가해주세요!</h4>
    		        <img style='opacity:0.6; width:70%;'src='./images/myPage/car.png'/>
    		        </div>`;
    		   $("#schedule-here").html(temp);
    	   }
    	   
       })
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

  // 시작날짜
  let start = $("#start_hidden").val();
  // 일수
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

let search = document.getElementById("searchPlace");

search.addEventListener("keyup", getElements);

function add_plan_day() {
   let end_value = $(".cat-left-date-"+cnt).html();
   // yyyy-mm-dd 형태를 Date 형태로
   end = getInitDate(end_value);
   
   // cnt에 1, date에 2 더해주고
   let newCnt = Number(cnt)+1;
   addDate = end.getDate()+2;
   end.setDate(addDate);
   end = getFormatDate(end);
   
   // 리스트의 마지막 항목 on 클래스 제거한 뒤 append
  // $(".plan-category
	// li:last-child").removeClass("on").clone().appendTo(".plan-category");
  $(".plan-category").append("<li>"+
            "<div class='cat-date-left-box'>"+
              "<div class='cat-left-day'>DAY "+newCnt+"</div>"+
            "</div>"+
            "<div class='cat-date-right-box'>"+
              "<div class='cat-left-date-"+newCnt+" pr-2 trip-date' style='color: #49b2e9;'>"+
              end+"</div>"+
              "<div class='cat-right-weekday-"+newCnt+" trip-day'>"+getDay(end)+"</div>"+
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
    var year = date.getFullYear();              // yyyy
    var month = (1 + date.getMonth());          // M
    month = month >= 10 ? month : '0' + month;  // month 두자리로 저장
    var day = date.getDate();                   // d
    day = day >= 10 ? day : '0' + day;          // day 두자리로 저장
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
   index = $("#chooseCity option:selected").val();
   console.log(index);
   getElements();
   $(".list-box .day-spot-item[data-area!="+index+"]").addClass("d-none");
   $(".list-box .day-spot-item[data-area="+index+"]").removeClass("d-none");
})


// 관광지를 일정에 추가했을 때 이벤트 발생
function addPlan(d){
	// 누르는 순간 일정추가 안내 div 사라짐
	$("#temp-div").hide();
	
   let ele = "";
   let distance = "";
   
   // 해당 요소를 안 보이게 하기 위한 클래스
   let tempClass = "";
   
   // 호텔, api 요소 변수명이 다르기때문에 undefined일 경우 새로운 변수에 담아서 처리
   const place_serial = (d.contentid == undefined)? d.place_serial : d.contentid;
   const longitude = (d.mapx == undefined)? d.longitude : d.mapx;
   const latitude = (d.mapy == undefined)? d.latitude : d.mapy; 
   const place_name = (d.title == undefined)? d.place_name : d.title;
   let image = (d.firstimage == undefined)? d.photo_name : d.firstimage;
   let place_code = (d.contenttypeid == undefined)? d.place_code : d.contenttypeid;

   // place 코드 => 분류명으로 switch
   place_code = setType(place_code);
   
   // 이미지 없는 경우 default 이미지 설정
   image = setImage(image);
      
   	  // 현재 넣을 element의 위도 경도
      coordsNow = {
         latitude : latitude,
         longitude : longitude
      }
      
      if(coords == null || coords.length==0){
    	  // 첫번째 값이 없으면 거리출력 안 되게
    	  tempClass="d-none";
      }else{
    	  // 들어와있는 위치정보가 있으면 전에 저장해놓았던 coords와 계산, 소수점 반올림
          distance = computeDistance(coords, coordsNow).toFixed(2); 
      }
      
      
   ele = `<div
    class='day-spot-item'
    id='order${dayCnt}'
    data-index='${dayCnt}'
    data-set_day='1'
    data-rel_srl='6725'
    data-contentid='${place_serial}'
    data-lat='${latitude}'
    data-long='${longitude}'
    data-contenttype='${place_code}'
    >
    
     <div class='item-ctrl-box' style='display: none;'>
        <div class='btn-del' title='삭제'>
      <img class='add-icon' src='./images/myPage/sign.png'></img>
        </div>
      </div>

    <div class='spot-distance-box ${tempClass}'>${distance} km</div>

    <div class='img-box'>
      <div class='spot-order-box'>${dayCnt}</div>
      <img src='${image}' />
    </div>
    <div class='info-box'>
      <div class='info-title'>${place_name}</div>
      <div class='small info-small'>${place_code}</div>
    </div>
  </div>`;
      
   
   // 다음 장소 거리 계산을 위해 coords 세팅
   coords = {
         latitude : latitude,
         longitude : longitude
   };
   
   
   // ex) 2020-06-04자의 n번째 여행요소
   let plan = new Plan(0, trip_list_serial, place_serial, dayCnt, trip_date, end);
   db.push(plan);
   
   console.log(db);
   
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
   case 32:
      return '숙박';
   case 38:
      return '쇼핑';
   case 39:
      return '음식';
   default:
	   return '기타';
      
   }
}

function setImage(image){
   // 이미지 파일이 없으면 정해진 이미지로 대체
   if(image == undefined || image == null){
      image = './images/myPage/korea.png';
   }
   return image;
}


// 위도, 경도로 거리 계산
function computeDistance(startCoords, destCoords) {
    var startLatRads = degreesToRadians(startCoords.latitude);
    var startLongRads = degreesToRadians(startCoords.longitude);
    var destLatRads = degreesToRadians(destCoords.latitude);
    var destLongRads = degreesToRadians(destCoords.longitude);

    var Radius = 6371; // 지구의 반경(km)
    var distance = Math.acos(Math.sin(startLatRads) * Math.sin(destLatRads) + 
                    Math.cos(startLatRads) * Math.cos(destLatRads) *
                    Math.cos(startLongRads - destLongRads)) * Radius;

    return distance;
}

function degreesToRadians(degrees) {
    radians = (degrees * Math.PI)/180;
    return radians;
}
$("#trip-save-btn").on("click", function(){
	let param = JSON.stringify(db);
	console.log(param);
		$.ajax({
			url:'insertPlan.mp',
		    type:'post',
		    contentType:'application/json;charset=UTF-8',
		    dataType:'json',
		    data:param,
		    success:function(message){
		    	alert("왜 여긴 들어오지도 않아");
		    	alert(message);
		    	
		    	/*
				  // 시도 세팅
				  data.objCity.forEach(function(item, idx, arr){
					  $('#select_locate').append("<option value='"+item.detailCode+"'>"+item.codeNm+"</option>");
				  });
		
				  // 상품종류 세팅
				  data.objGoodsType.forEach(function(item, idx, arr){
					  $('#selectGoodsType').append("<option value='"+item.detailCode+"'>"+item.codeNm+"</option>");
				  });
				  */
		    },
		    error:function(error){
		    	alert("성공적으로 저장되었습니다.");
		    }
		});
})


function Plan(days_serial, trip_list_serial, place_serial, trip_order, trip_day, end_date){
	this.days_serial = days_serial;
	this.trip_list_serial = trip_list_serial;
	this.place_serial = place_serial;
	this.trip_order = trip_order;
	this.trip_day = trip_day;
	this.end_date = end_date;
}

function getElements(){
	console.log(index);
	
	let findStr = $("#searchPlace").val();
	
	if(findStr==null || findStr==""){
		findStr = "%20";
	}else{
		findStr = encodeURIComponent(findStr);
	}
	
	   let str = "";
	   let parseJson;
	   
	   
	   //호텔 정보 뿌리기
	   $.getJSON("selectAll.mp", {"findStr":findStr}, function(json){
	      
	      if(json.length>0){
	         
	         for(d of json){
	            
	            let json = JSON.stringify(d);
	            
	            if(d.place_code == 32){ // 이미지없으면 경로수정
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
	   
	      
	      
	    /* api에서 가져온 정보 */
	   var xhr = new XMLHttpRequest();
	   var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword'; /* URL */
	   var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'1Dz1bR5MAy4n67kjDRt13zzTSNAaW7oNAcVIjOVXV6Dvh48PW8I4jVKIhaULA9oyhQXCfGmWceVxx3Psb%2B7Tyw%3D%3D'; /*
																																										 * Service
																																										 * Key
																																										 */
	   queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
	   queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
	   queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	   queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('500'); /**/
	   queryParams += '&' + encodeURIComponent('listYN') + '=' + encodeURIComponent('Y'); /**/
	   queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('A'); /**/
	   queryParams += '&' + encodeURIComponent('contentTypeId') + '=' + encodeURIComponent(''); /**/
	   queryParams += '&' + encodeURIComponent('areaCode') + '=' + encodeURIComponent(index); /**/
	   queryParams += '&' + encodeURIComponent('sigunguCode') + '=' + encodeURIComponent(''); /**/
	   queryParams += '&' + encodeURIComponent('cat1') + '=' + encodeURIComponent(''); /**/
	   queryParams += '&' + encodeURIComponent('cat2') + '=' + encodeURIComponent(''); /**/
	   queryParams += '&' + encodeURIComponent('cat3') + '=' + encodeURIComponent(''); /**/
	   queryParams += '&' + encodeURIComponent('keyword') + '=' + findStr;
	   queryParams += '&_type=json';

	   console.log(findStr);
	   console.log(url + queryParams);
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
	                   data-long='${d.mapx}'
	                   data-lat='${d.mapy}'
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
	          }else{
	        	  str = '';
	          }
	          $("#place-here").html(str);
	          }
	   };
	   xhr.send('');
	   });
}



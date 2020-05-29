/**
 * 자동 완성 및 검색 기능 구현
 */


/* top에서 사용되는 search----------------------------- */
// 지역으로 검색 - 자동 완성된 select에서 선택된 경우
// 자동 완성 기능
var area = [{"areaName":"서울", "areaCode":1}, {"areaName":"인천", "areaCode":2}, {"areaName":"대전", "areaCode":3}, {"areaName":"대구", "areaCode":4},
			{"areaName":"광주", "areaCode":5}, {"areaName":"부산", "areaCode":6}, {"areaName":"울산", "areaCode":7}, {"areaName":"세종특별자치시", "areaCode":8},
			{"areaName":"경기도", "areaCode":31}, {"areaName":"강원도", "areaCode":32}, {"areaName":"충청북도", "areaCode":33},
			{"areaName":"충청남도", "areaCode":34}, {"areaName":"경상북도", "areaCode":35}, {"areaName":"경상남도", "areaCode":36},
			{"areaName":"전라북도", "areaCode":37}, {"areaName":"전라남도", "areaCode":38}, {"areaName":"제주도", "areaCode":39}];

//이부분이 초성 검색이 가능하게 만들어 주는 부분
let source = $.map(area, function(item) { //json[i] 번째 에 있는게 item 임.
	console.log(item);
	chosung = "";
	//Hangul.d(item, true) 을 하게 되면 item이 분해가 되어서 
	//["ㄱ", "ㅣ", "ㅁ"],["ㅊ", "ㅣ"],[" "],["ㅂ", "ㅗ", "ㄲ"],["ㅇ", "ㅡ", "ㅁ"],["ㅂ", "ㅏ", "ㅂ"]
	//으로 나오는데 이중 0번째 인덱스만 가지고 오면 초성이다.
	let name = item['areaName'];
	console.log(name);
	let local = item['areaCode'];
	
	full = Hangul.disassemble(name).join("").replace(/ /gi, "") ;	//공백제거된 ㄱㅣㅁㅊㅣㅂㅗㄲㅇㅡㅁㅂㅏㅂ
	
	Hangul.d(name, true).forEach(function(strItem, index) {
		
		if(strItem[0] != " "){	//띄어 쓰기가 아니면
			chosung += strItem[0];//초성 추가
			
		}
	});
	
	
	return {
		label : chosung + "|" + (name).replace(/ /gi, "") +"|" + full, //실제 검색어랑 비교 대상 ㄱㅊㅂㅇㅂ|김치볶음밥|ㄱㅣㅁㅊㅣㅂㅗㄲㅇㅡㅁㅂㅏㅂ 이 저장된다.
		value : name,
		chosung : chosung,
		full : full,
		areaCode : local
	}
});

$(function() {
			
	// 지역 자동완성 기능
    $("#topFindStr").autocomplete({
        source: source,
        select: function(event, ui) {
        	console.log(ui.item);
        	console.log(ui.item.areaCode)
        	let local = ui.item.areaCode;
        	location.href = "?inc=mainMore.sb&menu=12&local=" + local;
        },
        focus: function(event, ui) {
        	return false;
        },
        open: function() { // 자동완성 리스트가 요소 아래에 위치해 마우스 오버가 안되는 현상을 해결하기 위해 사용
        	$('.ui-autocomplete').css('z-index', 9999);
        }
    }).autocomplete( "instance" )._renderItem = function( ul, item ) { //원하는 UI로 검색 결과 띄우기
	      return $( "<li>" ) //기본 tag가 li로 되어 있음 
	        .append( "<div>" + item.value + "</div>" )
	        .appendTo( ul );
	    };;
});

// 한글 초중종성으로 검색
$("#topFindStr").on("keyup",function(){	//검색창에 검색어가 입력될 때마다
	// 방향키 입력은 무시
	if(event.keyCode == 37 || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40) return;
	input = $("#topFindStr").val();	//입력된 값 저장
	$( "#topFindStr" ).autocomplete( "search", Hangul.disassemble(input).join("").replace(/ /gi, "") );	//자모 분리후 띄어쓰기 삭제
})
// 검색 결과 띄우기
$('#topFindStr').on("click", function() {
	input = $("#topFindStr").val();	//입력된 값 저장
	$( "#topFindStr" ).autocomplete( "search", Hangul.disassemble(input).join("").replace(/ /gi, "") );
})

// 키워드로 검색 - 검색 키워드 입력하고 버튼을 클릭했을 경우
$('#topSearch').on("click", function() {
	let findStr = document.getElementById("topFindStr").value;
	location.href = "?inc=mainMore.sb&menu=12&findStr=" + findStr;	
});


/* main, menuMain에서 사용되는 search----------------------------- */
// submit 처리
$(function() {
	// 지역 자동완성 기능
    $("#mainFindStr").autocomplete({
        source: source,
        select: function(event, ui) {
        	console.log(ui.item);
        },
        focus: function(event, ui) {
        	return false;
        },
        open: function() {
        	$('.ui-autocomplete').css('z-index', 9999);
        }
    });
});
$('#mainSearch').on("click", function() {
	let findStr = document.getElementById("mainFindStr").value;
	location.href = "?inc=mainMore.sb&menu=12&findStr=" + findStr;	
});

/* filter에서 사용되는 search----------------------------- 
// 키워드로 검색
$('#filterSearch').on("click", function() {
	filter.ajax();
});*/
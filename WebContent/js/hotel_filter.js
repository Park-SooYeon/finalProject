//detailView로 이동
detailMove = function(code) {
	location.href = './?inc=detailView.dv&code=' + code;
}



var cnt = 0; // 나타난 검색 요소 개수
let scrollCnt = 12; // 무한 스크롤 한번에 추가되는 요소의 개수
 

// filter 조건에 따라 작동하는 method를 저장하는 모듈
let htfilter = {}


htfilter.local = [] // 지역 코드를 담을 변수
htfilter.filter = [] // filter 요소를 담을 변수
htfilter.allItems = [] // 모든 검색된 요소들을 담을 변수
htfilter.tot_cnt = 0; // 검색된 모든 요소들의 개수

// parameter 값에 따라 초기 검색 조건 세팅
htfilter.init = function(local) {
	switch(local) {
	case 1:
		$('#check_seoul').click();
		break;
	case 3:
		$('#check_jeju').click();
		break;
	case 6:
		$('#check_busan').click();
		break;
	case 4:
		$('#check_daegu').click();
		break;
	case 31:
		$('#check_gyeonggi').click();
		break;
	case 2:
		$('#check_incheon').click();
		break;
	}
	
	
	

	
	

}

htfilter.check = function(ele) {
	let eleId = ele.getAttribute("id"); // 요소의 id 값
	let eleName = ele.getAttribute("name"); // 요소의 name 값
	let check_val = ele.value; // 요소의 value 값
	let val = $("label[for='" + eleId + "']").text(); // for로 연결된 라벨의 text 값을 가져옴
	
	// 체크박스 체크 여부에 따라 view 필터 요소 추가 및 제거
	// 체크박스 체크 여부에 따라 검색요소 추가 및 제거
	if(ele.checked == true) { // 체크박스가 체크 되어있으면
		// view에 필터 요소 추가
		$('#filter').append('<button onclick="filter.remove(this)" id="' + eleId + '" class="genric-btn info-border radius">'+val+'<i class="fa fa-times pl-2"></i></button>');

		// local 타입인지 filter 타입인지 구분하여 각 검색 요소에 추가
		filter.searchAdd(eleName, check_val);
		
	} else {
		// view에 필터 요소 제거
		let btnId = $("button[id='" + eleId + "']"); // id가 같은 필터 요소 가져오기
		btnId.remove();
		
		// local, filter 배열에서 체크 해제된 검색 요소 제거
		filter.searchRemove(eleName, check_val);
		
	}
	
	// 기존에 그려진 요소들 제거 및 초기화
	filter.removeElement();
	
	// ajax로 데이터 가져오기
	filter.ajax();
	
}




htfilter.search = function() {
	// 기존에 그려진 요소들 제거 및 초기화
	filter.removeElement();
	
	filter.ajax();
}

htfilter.remove = function(ele) {
	let eleId = ele.getAttribute("id"); // 현재 요소의 id값
	ele.remove(); // 현재 버튼 요소 제거
	
	// id가 동일한 체크박스가 체크되어 있으면 체크 해제
	let eleCheck = $("input:checkbox[id='" + eleId + "']");
	eleCheck.prop("checked", false);
	
	// 체크가 해제된 체크박스의 name과 value 가져오기
	let check_val = eleCheck.val();
	let eleName = eleCheck.attr("name");
	
	// local, filter 배열에서 체크 해제된 검색 요소 제거
	filter.searchRemove(eleName, check_val);
	
	// 기존에 그려진 요소들 제거 및 초기화
	filter.removeElement();
	
	// ajax로 데이터 가져오기
	filter.ajax();
	
}

htfilter.removeAll = function() {
	// 체크박스의 모든 체크 해제
	let checkArr1 = document.getElementsByName("filter_type");
	for(let i of checkArr1) {
		i.checked = false;
	}
	let checkArr2 = document.getElementsByName("local_type");
	for(let i of checkArr2) {
		i.checked = false;
	}
	
	// view의 모든 필터 요소 지우기
	$('#filter').empty();
	
	// local, filter 배열 비우기
	filter.local = [];
	filter.filter = [];
	
	// 기존에 그려진 요소들 제거 및 초기화
	filter.removeElement();
	
	// ajax로 데이터 가져오기
	filter.ajax();
	
}

// 검색 요소에 따라 데이터 검색하기
filter.ajax = function() {
	let findStr = document.getElementById('filterFindStr').value;

	$.ajax({
		url : "searchList.ht",
		method : "post",
		data : {
		     
			"local" : filter.local,
			"filter" : filter.filter,
			"findStr" : findStr,
		
		},
		dataType : "json",
		success : function(data) {
			//filter.tot_cnt = 0;
			let arr = [];
			let ele_cnt = 0;
			
			for(let i = 0 ; i < data.length ; i++) {
				arr = arr.concat(data[i]['response']['body']['items']['item']); // 검색된 요소들의 정보
				ele_cnt += data[i]['response']['body']['totalCount']; // 검색된 요소들의 개수
			}
			
			// 검색된 요소들 contentID별 정렬
			arr.sort(function(a,b) {
				return a.contentid - b.contentid;
			});
			
			filter.allItems = filter.allItems.concat(arr);
			filter.tot_cnt = ele_cnt;
			
			$('#search_cnt').text(filter.tot_cnt);
			
			// 검색 요소로 검색된 items 다시 그리기
			filter.makeElement();
		}
	});

}


	
	
	
	
	



// 검색 요소를 저장하는 배열에 추가한 검색 요소 추가
htfilter.searchAdd = function(eleName, check_val) {
	switch(eleName) {
	case "filter_type":
		filter.filter.push(check_val);
		break;
	case "local_type":
		filter.local.push(check_val);
		break;
	}
}

// 검색 요소를 저장하는 배열에서 제거한 검색 요소 제거
htfilter.searchRemove = function(eleName, check_val) {
	switch(eleName) {
	case "filter_type":
		let idx = filter.filter.findIndex(a => a === check_val)
		if(idx !== -1) filter.filter.splice(idx, 1);
		break;
	case "local_type":
		let idy = filter.local.findIndex(a => a == check_val)
		if(idy !== -1) filter.local.splice(idy, 1);
		break;
	}
}

// 검색 조건이 변경될 때 기존에 있던 검색 요소 지우기 및 나타난 요소 개수 초기화
htfilter.removeElement = function() {
	positions = [];
	filter.allItems = [];
	cnt = 0;
	widthsort_list_div.empty();
	cardsort_list_div.empty();
	
}



htfilter.makeStar = function() {
	var rating = $(".rating");

	rating.each(function(){
		var targetScore = $(this).attr('data-rate');
		$(this).find('i:nth-child(-n+' + targetScore +')').css({color:'#ffc107'});
	});
}

//스크롤 바닥 감지
window.onscroll = function(e) {
    //추가되는 임시 콘텐츠
    //window height + window scrollY 값이 document height보다 클 경우,
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    	//실행할 로직 (콘텐츠 추가)
    	cnt += scrollCnt;
        
        // 12개 요소 추가로 나타내기
    	filter.makeElement();
        
    }
};
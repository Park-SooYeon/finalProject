//detailView로 이동
detailMove = function(code) {
	location.href = './?inc=detailView.dv&code=' + code;
}

// 카드 형식 or 리스트 형식으로 보이기
$('#cardsort').on("click", function() {
	$('#cardsort_list').css("display", '');
	$('#widthsort_list').css("display", 'none');
});
$('#widthsort').on("click", function() {
	$('#widthsort_list').css("display", '');
	$('#cardsort_list').css("display", 'none');
});

var cnt = 0; // 나타난 검색 요소 개수
let widthsort_list_div = $('#widthsort_list'); // 라인형 검색된 요소를 담을 div
let cardsort_list_div = $('#cardsort_list'); // 카드형 검색된 요소를 담을 div
let scrollCnt = 12; // 무한 스크롤 한번에 추가되는 요소의 개수

// 관광지, 음식점, 축제 중 한가지 filter 조건만 보이기
$('#check_happy').on("click", function() {
	menuSelect(12);
	
	// 다른 필터 조건 숨기기
	$('#happy').css("display", '');
	$('#food').css("display", 'none');
	$('#festival').css("display", 'none');
});
$('#check_culture').on("click", function() {
	menuSelect(14);
	
	// 다른 필터 조건 숨기기
	$('#happy').css("display", 'none');
	$('#food').css("display", 'none');
	$('#festival').css("display", 'none');
});
$('#check_food').on("click", function() {
	menuSelect(39);
	
	// 다른 필터 조건 숨기기
	$('#food').css("display", '');
	$('#happy').css("display", 'none');
	$('#festival').css("display", 'none');
});
$('#check_festival').on("click", function() {
	menuSelect(15);
	
	// 다른 필터 조건 숨기기
	$('#festival').css("display", '');
	$('#happy').css("display", 'none');
	$('#food').css("display", 'none');
});

// 관광 타입 radio 버튼 클릭시 작동하는 함수
menuSelect = function(menu) {
	
	// 관광 타입 설정 및 filter 검색 조건 초기화
	// local 검색 조건은 유지
	filter.menu = menu;
	filter.filter = [];
	// 기존에 그려진 요소들 제거 및 초기화
	filter.removeElement();
	
	// filter 검색 조건 제거
	let chk_arr = document.getElementsByName("filter_type");
	for(let i of chk_arr) {
		if(i.checked == true) {
			// 체크 해제
			i.checked = false;
			
			// view의 필터 요소 제거
			let eleId = i.id;
			let btnId = $("button[id='" + eleId + "']"); // id가 같은 필터 요소 가져오기
			btnId.remove();
		}
	}
	
	// ajax로 데이터 가져오기
	filter.ajax();
	
}

// filter 조건에 따라 작동하는 method를 저장하는 모듈
let filter = {}

filter.menu // 관광 타입을 담을 변수
filter.local = [] // 지역 코드를 담을 변수
filter.filter = [] // filter 요소를 담을 변수
filter.allItems = [] // 모든 검색된 요소들을 담을 변수
filter.tot_cnt = 0; // 검색된 모든 요소들의 개수

// parameter 값에 따라 초기 검색 조건 세팅
filter.init = function(menu, local) {
	if(local != undefined) {
		let chk_obj = document.getElementsByName("local_type");
		
		// 지역 검색 조건 추가
		for(i of chk_obj) {
			if(local == i.value) {
				i.checked = true;
				filter.local.push(i.value);
				let val = $("label[for='" + i.id + "']").text();
				
				// 필터 요소 추가
				$('#filter').append('<button onclick="filter.remove(this)" id="' + i.id + '" class="genric-btn info-border radius">'+ val +'<i class="fa fa-times pl-2"></i></button>');
				break;
			}
		}
	}

	// 관광 타입별 선택
	switch(menu) {
	case 12:
		$('#check_happy').click();
		break;
	case 14:
		$('#check_culture').click();
		break;
	case 39:
		$('#check_food').click();
		break;
	case 15:
		$('#check_festival').click();
		break;
	}
}

filter.check = function(ele) {
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

filter.search = function() {
	// 기존에 그려진 요소들 제거 및 초기화
	filter.removeElement();
	
	filter.ajax();
}

filter.remove = function(ele) {
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

filter.removeAll = function() {
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
filter.ajax = function(pageNum = 1) {
	let findStr = document.getElementById('filterFindStr').value;

	$.ajax({
		url : "searchList.sb",
		method : "post",
		data : {
			"menu" : filter.menu,
			"local" : filter.local,
			"filter" : filter.filter,
			"findStr" : findStr,
			"pageNum" : pageNum
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
filter.searchAdd = function(eleName, check_val) {
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
filter.searchRemove = function(eleName, check_val) {
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
filter.removeElement = function() {
	positions = [];
	filter.allItems = [];
	cnt = 0;
	widthsort_list_div.empty();
	cardsort_list_div.empty();
	
}

// 검색 조건에 추가된 요소 만들기
filter.makeElement = function() {
	
	// 검색된 요소들 만들고 추가하기
	for(let i = cnt ; i < cnt + scrollCnt ; i++) {
		// 더 나타낼 요소가 없으면 ajax로 데이터를 더 불러올지 아닐지 판단
		if(i >= filter.allItems.length) {
			if(filter.tot_cnt > filter.allItems.length) {
				let pageNum = (filter.allItems.length / scrollCnt) + 1;
				
				filter.ajax(pageNum);
			}
			break; // 더 나타낼 요소가 없으면 break;				
		}
		let item = filter.allItems[i];
		let widthsort_ele
			= `<div class="row col-0">`
			+ `<div class="col-md-12 widthsort_list" onclick="detailMove(${item['contentid']})">`
			+ `<div class="row mb-10">`
			+ `<div class="col-md-3 nopadding">`
			+ `<img src="${item['firstimage']}" alt="no-image" class="img-fluid">`
			+ `</div>`
			+ `<div class="col-md-9 mt-sm-20 left-align-p pt-3" style="background-color:white;">`
			+ `<h3>${item['title']}</h3>`
			+ `<div class="rating" data-rate="${item['reputation'] === undefined? 0:item['reputation']}" style="float: left;">`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<span>  ${item['review_cnt'] === undefined? 0:item['review_cnt']} 건의 리뷰</span>`
			+ `</div>`
			+ `<br/>`
			+ `<span>${item['addr1'] }</span>`
			+ `</div>`
			+ `</div>`
			+ `</div>`
			+ `</div>`;
		let cardsort_ele 
			= `<div class="col-md-3 col-6 p-1 cardsort_list" onclick="detailMove(${item['contentid']})">`
			+ `<div class="row">`
			+ `<div class="col-md-12">`
			+ `<img src="${item['firstimage']}" alt="no-image" class="img-fluid">`
			+ `</div>`
			+ `<div class="col-md-12 mt-sm-20 left-align-p">`
			+ `<div style="background-color: white; padding: 10px;">`
			+ `<h5>${item['title'] }</h5>`
			+ `<div class="rating" data-rate="${item['reputation'] === undefined? 0:item['reputation']}">`
			+ `<i class="fa fa-star checked"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<span>  ${item['review_cnt'] === undefined? 0:item['review_cnt']} 건의 리뷰</span>`
			+ `</div>`
			+ `<span>${item['addr1'] }</span>`
			+ `</div>`
			+ `</div>`
			+ `</div>`
			+ `</div>`;
		widthsort_list_div.append(widthsort_ele);
		cardsort_list_div.append(cardsort_ele);	
		
		// 지도에 마커 그리기
		makePosition(item);
	}
	
	// 별 그리기
	filter.makeStar();
	
}

filter.makeStar = function() {
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
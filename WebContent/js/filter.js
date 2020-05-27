// 카드 형식 or 리스트 형식으로 보이기
$('#cardsort').on("click", function() {
	$('#cardsort_list').css("display", '');
	$('#widthsort_list').css("display", 'none');
});
$('#widthsort').on("click", function() {
	$('#widthsort_list').css("display", '');
	$('#cardsort_list').css("display", 'none');
});


// 관광지, 음식점, 축제 중 한가지 filter 조건만 보이기
$('#check_happy').on("click", function() {
	filter.menu = 12;
	$('#happy').css("display", '');
	$('#food').css("display", 'none');
	$('#festival').css("display", 'none');
});
$('#check_culture').on("click", function() {
	filter.menu = 14;
	$('#happy').css("display", 'none');
	$('#food').css("display", 'none');
	$('#festival').css("display", 'none');
});
$('#check_food').on("click", function() {
	filter.menu = 39;
	$('#food').css("display", '');
	$('#happy').css("display", 'none');
	$('#festival').css("display", 'none');
});
$('#check_festival').on("click", function() {
	filter.menu = 15;
	$('#festival').css("display", '');
	$('#happy').css("display", 'none');
	$('#food').css("display", 'none');
});



// check 박스 클릭시, 필터 요소 추가
let filter = {}

filter.local = [] // 지역 코드를 담을 변수
filter.menu // 관광 타입을 담을 변수
filter.filter = [] // filter 요소를 담을 변수
filter.allItems = [] // 모든 검색된 요소들을 담을 변수

filter.check = function(ele) {
	let eleId = ele.getAttribute("id"); // 요소의 id 값
	let eleName = ele.getAttribute("name"); // 요소의 name 값
	let val = $("label[for='" + eleId + "']").text(); // for로 연결된 라벨의 text 값을 가져옴
	let check_val = ele.value;
	alert("?? : " + check_val);
	alert(eleName);
	
	if(ele.checked == true) {
		switch(eleName) {
		case "filter_type":
			filter.filter.push(check_val);
			break;
		case "local_type":
			filter.local.push(check_val);
			break;
		}
		
		// 필터 요소 추가
		$('#filter').append('<button onclick="filter.remove(this)" id="' + eleId + '" class="genric-btn info-border radius">'+val+'<i class="fa fa-times pl-2"></i></button>');
		console.log(filter.menu);
		console.log(filter.filter);
		console.log(filter.local);
		$.ajax({
			url : "searchList.sb",
			method : "post",
			data : {
				"menu" : filter.menu + "",
				"local" : filter.local,
				"filter" : filter.filter
			},
			//traditional : true, // 배열을 data로 전달하기 위하여 사용
			dataType : "json",
			success : function(data) {
				alert("성공!");
				//let items = (data['response'])['body']['items']['item'];
				items = data;
				filter.allItems = data;
				//filter.allItems = filter.allItems.concat(items); // 모든 검색 조건 더하기
				// 검색 조건 contentID별 정렬
				filter.allItems.sort(function(a,b) {
					return a.contentid - b.contentid;
				})
				console.log(filter.allItems);
				
				filter.makeElement();
			},
			error : function(err) {
				alert("실패!");
			}
		});
	} else {
		// 검색된 조건에서 제거된 필터에 의해 검색된 요소만 제거
		let size = filter.allItems.length;
/*		let removeIndex = []; // 지워야할 contentid를 저장
		for(let i = 0 ; i < size ; i++) {
			let item = filter.allItems[i];
			console.log(filter.allItems[i]['cat1']);
			if(item['cat1'] === check_val || item['cat2'] === check_val || item['cat3'] === check_val) {
				removeIndex.push(item['contentid']);
			}		
		}*/
		
		// 제거된 필터에 포함되어 있는 검색 정보들 제거
		for(let i = 0 ; i < size ; i++) {
			let index = filter.allItems.findIndex(a => a.areacode == check_val || a.cat1 === check_val || a.cat2 === check_val || a.cat3 === check_val);
			console.log(index);
			if(index !== -1) { // 일치하는 요소가 있을 때에만 배열에서 제거
				filter.allItems.splice(index, 1);				
			}
		}
		
		// local, filter 배열에서 제거
		switch(eleName) {
		case "filter_type":
			let idx = filter.filter.findIndex(a => a === check_val)
			if(idx !== -1) filter.filter.splice(idx, 1);
			console.log(filter.filter);
			console.log("idx : " + idx);
			break;
		case "local_type":
			let idy = filter.local.findIndex(a => a == check_val)
			if(idy !== -1) filter.local.splice(idx, 1);
			break;
		}
		
		console.log(filter.allItems);
		// 필터 요소 제거
		let btnId = $("button[id='" + eleId + "']"); // id가 같은 필터 요소 가져오기
		btnId.remove();
		// 검색된 요소가 제거된 items만 다시 그리기
		filter.makeElement();
	}
}

filter.remove = function(ele) {
	let eleId = ele.getAttribute("id"); // 현재 요소의 id값
	ele.remove(); // 현재 버튼 요소 제거
	
	// id가 동일한 체크박스가 체크되어 있으면 체크 해제
	let eleCheck = $("input:checkbox[id='" + eleId + "']");
	eleCheck.prop("checked", false);
	
	
	// 검색된 조건에서 제거된 필터에 의해 검색된 요소만 제거
	let check_val = eleCheck.val();
	alert(check_val);
	let eleName = eleCheck.attr("name");
	alert(eleName);
	
	let size = filter.allItems.length;
	
	// 제거된 필터에 포함되어 있는 검색 정보들 제거
	for(let i = 0 ; i < size ; i++) {
		let index = filter.allItems.findIndex(a => a.areacode == check_val || a.cat1 === check_val || a.cat2 === check_val || a.cat3 === check_val);
		console.log(index);
		if(index !== -1) { // 일치하는 요소가 있을 때에만 배열에서 제거 index == -1 일때도 제거하면 제일 마지막 요소가 제거됨
			filter.allItems.splice(index, 1);				
		}
	}
	console.log(filter.allItems);
	
	// local, filter 배열에서 제거
	switch(eleName) {
	case "filter_type":
		let idx = filter.filter.findIndex(a => a === check_val)
		if(idx !== -1) filter.filter.splice(idx, 1);
		console.log(filter.filter);
		console.log("idx : " + idx);
		break;
	case "local_type":
		let idy = filter.local.findIndex(a => a == check_val)
		if(idy !== -1) filter.local.splice(idx, 1);
		break;
	}
	
	// 검색된 요소가 제거된 items만 다시 그리기
	filter.makeElement();
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
	
	// 모든 필터 요소 지우기
	$('#filter').empty();
	
	// local, filter 배열 제거
	filter.local = [];
	filter.filter = [];
	
	// 검색된 요소 전체 그리기
	filter.allItems = [];
	filter.makeElement();
}

filter.makeElement = function() {
	let widthsort_list_div = $('#widthsort_list');
	let cardsort_list_div = $('#cardsort_list');
	
	// filter.allItems가 비어있으면 모든 요소를 불러와 채워주기
	
	// 이전에 검색된 요소들 지우기
	widthsort_list_div.empty();
	cardsort_list_div.empty();
	
	// 검색된 요소들 만들고 추가하기
	for(let i of filter.allItems) {
		let widthsort_ele
			= `<div class="row col-0">`
			+ `<div class="col-md-12 widthsort_list" onclick="detailMove(${i['contentid']})">`
			+ `<div class="row mb-10">`
			+ `<div class="col-md-3 nopadding">`
			+ `<img src="${i['firstimage']}" alt="no-image" class="img-fluid">`
			+ `</div>`
			+ `<div class="col-md-9 mt-sm-20 left-align-p" style="background-color:white;">`
			+ `<span>${i['title']}</span></br>`
			+ `<div style="width: 30px; float: left;">별점</div>`
			+ `<div class="rating" data-rate="${i['reputation']}" style="float: left;">`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<span>  ${i['review_cnt']} 건의 리뷰</span>`
			+ `</div>`
			+ `<br/>`
			+ `<span>${i['addr1'] }</span>`
			+ `<hr/>`
			+ `<span>간단설명 (타입 , 세계 , 메뉴 , 지역 가격)</span></br>`
			+ `<span>한줄평</span></br>	   ` 
			+ `</div>`
			+ `</div>`
			+ `</div>`
			+ `</div>`;
		let cardsort_ele 
			= `<div class="col-md-3 col-6 p-1 cardsort_list" onclick="detailMove(${i['contentid']})">`
			+ `<div class="row">`
			+ `<div class="col-md-12">`
			+ `<img src="${i['firstimage'] === undefined? "images/food/map.png":i['firstimage']}" alt="no-image" class="img-fluid">`
			+ `</div>`
			+ `<div class="col-md-12 mt-sm-20 left-align-p">`
			+ `<div style="background-color: white; padding: 10px;">`
			+ `<div style="height: 10px;">&nbsp</div>`
			+ `<span>${i['title'] }</span>`
			+ `<div class="rating" data-rate="${i['reputation'] === undefined? 1:i['reputation']}">`
			+ `<i class="fa fa-star checked"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<i class="fa fa-star"></i>`
			+ `<span>  ${i['review_cnt'] === undefined? 0:i['review_cnt']} 건의 리뷰</span>`
			+ `</div>`
			+ `<span>${i['addr1'] }</span>`
			+ `</div>`
			+ `</div>`
			+ `</div>`
			+ `</div>`;
		widthsort_list_div.append(widthsort_ele);
		cardsort_list_div.append(cardsort_ele);	

	}
	
	// 별 그리기
	filter.makeStar();
}

filter.detailMove = function(code) {
	
}

filter.makeStar = function() {
	var rating = $(".rating");

	rating.each(function () {
	  var targetScore = $(this).attr("data-rate");
	  $(this)
	    .find("i:nth-child(-n+" + targetScore + ")")
	    .css({ color: "#ffc107" });
	});
}
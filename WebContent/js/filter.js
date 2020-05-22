// 카드 형식 or 리스트 형식으로 보이기
$('#cardsort').on("click", function() {
	$('#cardsort_list').css("display", '');
	$('#widthsort_list').css("display", 'none');
});
$('#widthsort').on("click", function() {
	$('#widthsort_list').css("display", '');
	$('#cardsort_list').css("display", 'none');
});



// check 박스 클릭시, 필터 요소 추가
let filter = {}

filter.check = function(ele) {
	let eleId = ele.getAttribute("id");
	let val = $("label[for='" + eleId + "']").text(); // for로 연결된 라벨의 text 값을 가져옴

	if(ele.checked == true) {
		// 필터 요소 추가
		$('#filter').append('<button onclick="filter.remove(this)" id="' + eleId + '" class="genric-btn info-border radius">'+val+'<i class="fa fa-times pl-2"></i></button>');
		
		$.ajax({
			url : "restApiTest.sb",
			method : "post",
			dataType : "json",
			success : function(data) {
				alert("성공!");
				console.log(data);
			},
			error : function(err) {
				alert("실패!");
			}
		});
	} else {
		// 필터 요소 제거
		let btnId = $("button[id='" + eleId + "']"); // id가 같은 필터 요소 가져오기
		btnId.remove();
	}
}

filter.remove = function(ele) {
	let eleId = ele.getAttribute("id"); // 현재 요소의 id값
	
	ele.remove(); // 현재 요소 제거
	// id가 동일한 체크박스가 체크되어 있으면 체크 해제
	let eleCheck = $("input:checkbox[id='" + eleId + "']");
	eleCheck.prop("checked", false);
}

filter.removeAll = function() {
	// 체크박스의 모든 체크 해제
	let checkArr = document.getElementsByName("check_type");
	for(let i of checkArr) {
		i.checked = false;
	}
	
	// 모든 필터 요소 지우기
	$('#filter').empty();
}
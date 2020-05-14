
//받은 별점 표시
var rating = $('.rating');
	
rating.each(function(){
	var targetScore = $(this).attr('data-rate');
	$(this).find('i:nth-child(-n' + targetScore +')').css({color:'#ffc107'});
});


//상세보기 이동
let detailMove = function() {
	location.href = './?inc=commonPage/detailView.jsp';
}

/* 별점 선택시에 사용되는 함수 */
//초기 별점
var foodServiceStars = 9;
//선택된 별점 유지 시켜주기
let foodServiceStar = function(foodServiceStarNum) {
	let starArea = document.getElementById('service_review_star');

	for (var i = 9; i >= 1; i -= 2) {
		let ele = starArea.childNodes[i];

		foodServiceStars = foodServiceStarNum;
		if (i >= foodServiceStarNum)
			ele.classList.add("checked");
		else
			ele.classList.remove("checked");
	}
}

var foodGustoStars = 9;
//선택된 별점 유지 시켜주기
let gustoStar = function(foodGustoStarNum) {
	let starArea = document.getElementById('gusto_review_star');

	for (var i = 9; i >= 1; i -= 2) {
		let ele = starArea.childNodes[i];

		foodGustoStars = foodGustoStarNum;
		if (i >= foodGustoStarNum)
			ele.classList.add("checked");
		else
			ele.classList.remove("checked");
	}
}



var foodPriceStars = 9;
//선택된 별점 유지 시켜주기
let priceStar = function(foodPriceStarNum) {
	let starArea = document.getElementById('price_review_star');

	for (var i = 9; i >= 1; i -= 2) {
		let ele = starArea.childNodes[i];

		foodPriceStars = foodPriceStarNum;
		if (i >= foodPriceStarNum)
			ele.classList.add("checked");
		else
			ele.classList.remove("checked");
	}
}

//별점 hover시 클릭될 별점으로 보이는 이벤트 처리
/*$('#service_review_star').hover(function() {
	let starArea = document.getElementById('service_review_star');
	for(var i = 7 ; i >= 1 ; i -= 2) {
		let ele = starArea.childNodes[i];

		ele.classList.remove("checked");
	}
}, function() {
	let starArea = document.getElementById('service_review_star');

	for(var i = 9 ; i >= 1 ; i -= 2) {
		let ele = starArea.childNodes[i];


	 	if(i >= stars) ele.classList.add("checked");
		else ele.classList.remove("checked");
	}
});*/
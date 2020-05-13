
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
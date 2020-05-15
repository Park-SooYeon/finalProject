let $li = $(".mp-side-li");
let commonPage = "my_page_common.jsp";

let url = "";

function init(){
	
	//body 영역에 페이지 로드시키기
	$(".mp-body-wrapper").load("mypage/"+commonPage);
	
	$li.click(function(){
		
		$(this).addClass("on");
		$li.not(this).removeClass("on");
		
		//commonPage로 내용만 el로 변경
		$(".mp-body-wrapper").load("mypage/"+commonPage);
	})
}

init();



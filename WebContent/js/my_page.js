let $li = $(".mp-side-li");
let commonPage = "my_page_common.jsp";
let hotel = "my_page_hotel.jsp";
let cancel = "my_page_cancel.jsp";

let url = "";

function init(){

	$(".mp-body-wrapper").load("mypage/"+commonPage);
	
	$li.click(function(){
		let $this = $(this).data("li");
		
		$(this).addClass("on");
		$li.not(this).removeClass("on");
		
		$(".mp-body-wrapper").load("mypage/"+commonPage);
	})
}

init();



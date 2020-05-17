let $li = $(".mp-side-li");
let commonPage = "my_page_common.jsp";

/* 추후 el 사용해서 값 넣어줄거라면 필요없는 변수
let tripName = $("#mp-tripName").text();
let authorName = $("#mp-authorName").text();
*/

function init(){
	
	//body 영역에 페이지 로드시키기
	$(".mp-body-wrapper").load("mypage/"+commonPage);
	
	$li.click(function(){
		
		$(this).addClass("on");
		$li.not(this).removeClass("on");
		
		//commonPage로 내용만 el로 변경
		$(".mp-body-wrapper").load("mypage/"+commonPage);
	})

	  //show modal
	  $("#mp-modifyTripModal").on("show.bs.modal", function (event) {
	    const ADD_BTN = $(event.relatedTarget); // Button that triggered the modal
	    const TRIP_NAME = ADD_BTN.find("#mp-tripName").text(); // Extract info from data-* attributes
	    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.

	    //TODO
	    // submit -> profile modify
	  });

}

init();



function init(){
	$(".mp-side-li").click(function(){
		$(this).addClass("on");
		$(".mp-side-li").not(this).removeClass("on");
	})
}

init();



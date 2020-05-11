var festival_filter={}

festival_filter.func = function(){
//필터옵션 전체해제
	$('#check_release').click(function(){
		$("#spring").prop("checked", false);
		$("#summer").prop("checked", false);
		$("#autumn").prop("checked", false);
		$("#winter").prop("checked", false);
		$("#seoul").prop("checked", false);
		$("#busan").prop("checked", false);
		$("#gyeongju").prop("checked", false);
		$("#gangleung").prop("checked", false);
		$("#jeju").prop("checked", false);
		$("#yeosu").prop("checked", false);
		
		
		
		
		$('#filter').empty();
	});	

//체크박스 체크여부시 필터버튼 추가 삭제
	$('#spring').click(function(){
		var val = $('#spring').val();
		if($('#spring').prop("checked")==true){
			$('#filter').append('<button onclick="func_spring(this)" id="spring_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#spring').prop("checked")==false){
			$('#spring_filter').remove();
		}		
	});	
	
	$('#summer').click(function(){
		var val = $('#summer').val();
		if($('#summer').prop("checked")==true){
			$('#filter').append('<button onclick="func_summer(this)" id="summer_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#summer').prop("checked")==false){
			$('#summer_filter').remove();
		}		
	});	
	
	$('#autumn').click(function(){
		var val = $('#autumn').val();
		if($('#autumn').prop("checked")==true){
			$('#filter').append('<button onclick="func_autumn(this)" id="autumn_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#autumn').prop("checked")==false){
			$('#autumn_filter').remove();
		}		
	});	
	$('#winter').click(function(){
		var val = $('#winter').val();
		if($('#winter').prop("checked")==true){
			$('#filter').append('<button onclick="func_winter(this)" id="winter_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#winter').prop("checked")==false){
			$('#winter_filter').remove();
		}		
	});	
	$('#seoul').click(function(){
		var val = $('#seoul').val();
		if($('#seoul').prop("checked")==true){
			$('#filter').append('<button onclick="func_seoul(this)" id="seoul_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#seoul').prop("checked")==false){
			$('#seoul_filter').remove();
		}		
	});	
	$('#busan').click(function(){
		var val = $('#busan').val();
		if($('#busan').prop("checked")==true){
			$('#filter').append('<button onclick="func_busan(this)" id="busan_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#busan').prop("checked")==false){
			$('#busan_filter').remove();
		}		
	});	
	$('#gyeongju').click(function(){
		var val = $('#gyeongju').val();
		if($('#gyeongju').prop("checked")==true){
			$('#filter').append('<button onclick="func_gyeongju(this)" id="gyeongju_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#gyeongju').prop("checked")==false){
			$('#gyeongju_filter').remove();
		}		
	});	
	$('#gangleung').click(function(){
		var val = $('#gangleung').val();
		if($('#gangleung').prop("checked")==true){
			$('#filter').append('<button onclick="func_gangleung(this)" id="gangleung_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#seoul').prop("checked")==false){
			$('#gangleung_filter').remove();
		}		
	});	
	$('#jeju').click(function(){
		var val = $('#jeju').val();
		if($('#jeju').prop("checked")==true){
			$('#filter').append('<button onclick="func_jeju(this)" id="jeju_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#jeju').prop("checked")==false){
			$('#jeju_filter').remove();
		}		
	});
	$('#yeosu').click(function(){
		var val = $('#yeosu').val();
		if($('#yeosu').prop("checked")==true){
			$('#filter').append('<button onclick="func_yeosu(this)" id="yeosu_filter" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#yeosu').prop("checked")==false){
			$('#yeosu_filter').remove();
		}		
	});
	
	$('#cardsort').click(function(){
		$('#')
	});
}


//필터버튼 클릭시 버튼삭제, 박스 체크해제
var func_spring = function(spring){	
	$("#spring").prop("checked", false);
	spring.remove();
}
var func_summer = function(summer){	
	$("#summer").prop("checked", false);
	summer.remove();
}
var func_autumn = function(autumn){	
	$("#autumn").prop("checked", false);
	autumn.remove();
}
var func_winter = function(winter){	
	$("#winter").prop("checked", false);
	winter.remove();
}
var func_seoul = function(seoul){	
	$("#seoul").prop("checked", false);
	seoul.remove();	
}
var func_busan = function(busan){	
	$("#busan").prop("checked", false);
	busan.remove();	
}
var func_gyeongju = function(gyeongju){	
	$("#gyeongju").prop("checked", false);
	gyeongju.remove();	
}
var func_gangleung = function(gangleung){	
	$("#gangleung").prop("checked", false);
	gangleung.remove();	
}
var func_jeju = function(jeju){	
	$("#jeju").prop("checked", false);
	jeju.remove();	
}
var func_yeosu = function(yeosu){	
	$("#yeosu").prop("checked", false);
	yeosu.remove();	
}




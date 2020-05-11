var food_filter={}

food_filter.func = function(){
//필터옵션 전체해제
	$('#check_release').click(function(){
		$("#check_cafe").prop("checked", false);
		$("#check_bar").prop("checked", false);
		$("#check_rest").prop("checked", false);
		$("#check_dining").prop("checked", false);
		$("#check_kor").prop("checked", false);
		$("#check_west").prop("checked", false);
		$("#check_jap").prop("checked", false);
		$("#check_chin").prop("checked", false);
		$("#check_w_etc").prop("checked", false);
		$("#check_pork").prop("checked", false);
		$("#check_beef").prop("checked", false);
		$("#check_salad").prop("checked", false);
		$("#check_sea").prop("checked", false);
		$("#check_noodles").prop("checked", false);
		$("#check_m_etc").prop("checked", false);
		$("#check_cheap").prop("checked", false);
		$("#check_middle").prop("checked", false);
		$("#check_dinner").prop("checked", false);
		$('#filter').empty();
	});	

//체크박스 체크여부시 필터버튼 추가 삭제
	$('#check_cafe').click(function(){
		var val = $('#check_cafe').val();
		if($('#check_cafe').prop("checked")==true){
			$('#filter').append('<button onclick="func_cafe(this)" id="food_filter_cafe" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_cafe').prop("checked")==false){
			$('#food_filter_cafe').remove();
		}		
	});	
	
	$('#check_bar').click(function(){
		var val = $('#check_bar').val();
		if($('#check_bar').prop("checked")==true){
			$('#filter').append('<button onclick="func_bar(this)" id="food_filter_bar" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_bar').prop("checked")==false){
			$('#food_filter_bar').remove();
		}		
	});	
	$('#check_rest').click(function(){
		var val = $('#check_rest').val();
		if($('#check_rest').prop("checked")==true){
			$('#filter').append('<button onclick="func_rest(this)" id="food_filter_rest" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_rest').prop("checked")==false){
			$('#food_filter_rest').remove();
		}		
	});
	$('#check_dining').click(function(){
		var val = $('#check_dining').val();
		if($('#check_dining').prop("checked")==true){
			$('#filter').append('<button onclick="func_dining(this)" id="food_filter_dining" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_dining').prop("checked")==false){
			$('#food_filter_dining').remove();
		}		
	});
	$('#check_kor').click(function(){
		var val = $('#check_kor').val();
		if($('#check_kor').prop("checked")==true){
			$('#filter').append('<button onclick="func_kor(this)" id="food_filter_kor" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_kor').prop("checked")==false){
			$('#food_filter_kor').remove();
		}		
	});
	$('#check_west').click(function(){
		var val = $('#check_west').val();
		if($('#check_west').prop("checked")==true){
			$('#filter').append('<button onclick="func_west(this)" id="food_filter_west" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_west').prop("checked")==false){
			$('#food_filter_west').remove();
		}		
	});
	$('#check_jap').click(function(){
		var val = $('#check_jap').val();
		if($('#check_jap').prop("checked")==true){
			$('#filter').append('<button onclick="func_jap(this)" id="food_filter_jap" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_jap').prop("checked")==false){
			$('#food_filter_jap').remove();
		}		
	});
	$('#check_chin').click(function(){
		var val = $('#check_chin').val();
		if($('#check_chin').prop("checked")==true){
			$('#filter').append('<button onclick="func_chin(this)" id="food_filter_chin" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_chin').prop("checked")==false){
			$('#food_filter_chin').remove();
		}		
	});
	$('#check_w_etc').click(function(){
		var val = $('#check_w_etc').val();
		if($('#check_w_etc').prop("checked")==true){
			$('#filter').append('<button onclick="func_w_etc(this)" id="food_filter_w_etc" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_w_etc').prop("checked")==false){
			$('#food_filter_w_etc').remove();
		}		
	});
	$('#check_pork').click(function(){
		var val = $('#check_pork').val();
		if($('#check_pork').prop("checked")==true){
			$('#filter').append('<button onclick="func_pork(this)" id="food_filter_pork" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_pork').prop("checked")==false){
			$('#food_filter_pork').remove();
		}		
	});
	$('#check_beef').click(function(){
		var val = $('#check_beef').val();
		if($('#check_beef').prop("checked")==true){
			$('#filter').append('<button onclick="func_beef(this)" id="food_filter_beef" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_beef').prop("checked")==false){
			$('#food_filter_beef').remove();
		}		
	});
	$('#check_salad').click(function(){
		var val = $('#check_salad').val();
		if($('#check_salad').prop("checked")==true){
			$('#filter').append('<button onclick="func_salad(this)" id="food_filter_salad" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_salad').prop("checked")==false){
			$('#food_filter_salad').remove();
		}		
	});
	$('#check_sea').click(function(){
		var val = $('#check_sea').val();
		if($('#check_sea').prop("checked")==true){
			$('#filter').append('<button onclick="func_sea(this)" id="food_filter_sea" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_sea').prop("checked")==false){
			$('#food_filter_sea').remove();
		}		
	});
	$('#check_noodles').click(function(){
		var val = $('#check_noodles').val();
		if($('#check_noodles').prop("checked")==true){
			$('#filter').append('<button onclick="func_noodles(this)" id="food_filter_noodles" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_noodles').prop("checked")==false){
			$('#food_filter_noodles').remove();
		}		
	});
	$('#check_m_etc').click(function(){
		var val = $('#check_m_etc').val();
		if($('#check_m_etc').prop("checked")==true){
			$('#filter').append('<button onclick="func_m_etc(this)" id="food_filter_m_etc" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_m_etc').prop("checked")==false){
			$('#food_filter_m_etc').remove();
		}		
	});
	$('#check_cheap').click(function(){
		var val = $('#check_cheap').val();
		if($('#check_cheap').prop("checked")==true){
			$('#filter').append('<button onclick="func_cheap(this)" id="food_filter_cheap" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_cheap').prop("checked")==false){
			$('#food_filter_cheap').remove();
		}		
	});
	$('#check_middle').click(function(){
		var val = $('#check_middle').val();
		if($('#check_middle').prop("checked")==true){
			$('#filter').append('<button onclick="func_middle(this)" id="food_filter_middle" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_middle').prop("checked")==false){
			$('#food_filter_middle').remove();
		}		
	});
	$('#check_dinner').click(function(){
		var val = $('#check_dinner').val();
		if($('#check_dinner').prop("checked")==true){
			$('#filter').append('<button onclick="func_dinner(this)" id="food_filter_dinner" class="genric-btn info-border radius">'+val+'&nbsp&nbsp'+'<i class="fa fa-times"></i></button>');
		}
		if($('#check_dinner').prop("checked")==false){
			$('#food_filter_dinner').remove();
		}
	});
	
	//카드형, 리스트형 정렬방법 버튼
	$('#cardsort').click(function(){
		$('#widthsort_list').hide();
		$('#cardsort_list').show();
	});
	$('#widthsort').click(function(){
		$('#widthsort_list').show();
		$('#cardsort_list').hide();
	});
	
}


//필터버튼 클릭시 버튼삭제, 박스 체크해제
var func_cafe = function(cafe){	
	$("#check_cafe").prop("checked", false);
	cafe.remove();
}
var func_bar = function(bar){	
	$("#check_bar").prop("checked", false);
	bar.remove();	
}
var func_rest = function(rest){	
	$("#check_rest").prop("checked", false);
	rest.remove();	
}
var func_dining = function(dining){	
	$("#check_dining").prop("checked", false);
	dining.remove();	
}
var func_kor = function(kor){	
	$("#check_kor").prop("checked", false);
	kor.remove();	
}
var func_west = function(west){	
	$("#check_west").prop("checked", false);
	west.remove();	
}
var func_jap = function(jap){	
	$("#check_jap").prop("checked", false);
	jap.remove();	
}
var func_chin = function(chin){	
	$("#check_chin").prop("checked", false);
	chin.remove();	
}
var func_w_etc = function(w_etc){	
	$("#check_w_etc").prop("checked", false);
	w_etc.remove();	
}
var func_pork = function(pork){	
	$("#check_pork").prop("checked", false);
	pork.remove();	
}
var func_beef = function(beef){	
	$("#check_beef").prop("checked", false);
	beef.remove();	
}
var func_salad = function(salad){	
	$("#check_salad").prop("checked", false);
	salad.remove();	
}
var func_sea = function(sea){	
	$("#check_sea").prop("checked", false);
	sea.remove();	
}
var func_noodles = function(noodles){	
	$("#check_noodles").prop("checked", false);
	noodles.remove();	
}
var func_m_etc = function(m_etc){	
	$("#check_m_etc").prop("checked", false);
	m_etc.remove();	
}
var func_cheap = function(cheap){	
	$("#check_cheap").prop("checked", false);
	cheap.remove();	
}
var func_middle = function(middle){	
	$("#check_middle").prop("checked", false);
	middle.remove();	
}
var func_dinner = function(dinner){	
	$("#check_dinner").prop("checked", false);
	dinner.remove();	
}



/**
 * 
 */

let rent ={}

rent.func = function(){
	
	//rent_Main >> rentSearch(rentSearchSub1) 
	if($('#btnCompanySearch')!=null){
		$('#btnCompanySearch').click(function(){		
			
				$('#rent_frm').attr('action','./companySearch.rent');
				
			
		});
		
	}
	//renstSearch(rentViewSub1) >> rentSearch(rentViewSub2)
	if($('#btnCar')!=null){
		$('#btnCar').click(function(){
			//onclick 으로 변경
		});
	}
	
	//rentSearch(rentViewSub2) >> rentView(rentViewSub1)
	if($('#btnView')!=null){
		$('#btnView').click(function(){
			//onclick
		});
	}
	
	
	if($('#btnReserveResult')!=null){
		$('#btnReserveResult').click(function(){
			$('#rent_frm').attr('action','./reserveResult.rent').submit();
		});
	}
	
	
	
	
	//렌트 kind radio값 변경
	$('#carPhoto_1').click(function(){
		$('#kind_s').val('소형 차량'); 
		if($('#content_check').val()=='com'){
			$('#rent_frm').attr('action','./fillter.rent').submit();
		}else if($('#content_check').val()=='car'){
			$('#rent_frm').attr('action','./carSearch.rent').submit();
		}
	});
	$('#carPhoto_2').click(function(){
		$('#kind_s').val('중형 차량'); 
		if($('#content_check').val()=='com'){
			$('#rent_frm').attr('action','./fillter.rent').submit();
		}else if($('#content_check').val()=='car'){
			$('#rent_frm').attr('action','./carSearch.rent').submit();
		}
		
	});
	$('#carPhoto_3').click(function(){
		$('#kind_s').val('대형 차량'); 
		if($('#content_check').val()=='com'){
			$('#rent_frm').attr('action','./fillter.rent').submit();
		}else if($('#content_check').val()=='car'){
			$('#rent_frm').attr('action','./carSearch.rent').submit();
		}
		
	});
	$('#carPhoto_4').click(function(){
		$('#kind_s').val('프리미엄 차량'); 
		if($('#content_check').val()=='com'){
			$('#rent_frm').attr('action','./fillter.rent').submit();
		}else if($('#content_check').val()=='car'){
			$('#rent_frm').attr('action','./carSearch.rent').submit();
		}
		
	});
	$('#carPhoto_5').click(function(){
		$('#kind_s').val('미니벤'); 
		if($('#content_check').val()=='com'){
			$('#rent_frm').attr('action','./fillter.rent').submit();
		}else if($('#content_check').val()=='car'){
			$('#rent_frm').attr('action','./carSearch.rent').submit();
		}
		
	});
	$('#carPhoto_6').click(function(){
		$('#kind_s').val('SUV'); 
		if($('#content_check').val()=='com'){
			$('#rent_frm').attr('action','./fillter.rent').submit();
		}else if($('#content_check').val()=='car'){
			$('#rent_frm').attr('action','./carSearch.rent').submit();
		}
		
	});
	
	
	
	
	
	
}
rent.goMain = function(){
	$('#rent_frm').attr('action','./rentMain.rent').submit();
}
rent.goReserveSearch =function(){
	$('#rentTop_frm').attr('action','./reserveSearch.rent').submit();

}


rent.carInfo = function(car_serial){
	$('#car_serial').val(car_serial);
	$('#rent_frm').attr('action','./carView.rent').submit();
}
rent.review = function(car_serial){
	$('#car_serial').val(car_serial);
	$('#rent_frm').attr('action','./carView2.rent').submit();
}

rent.importantInfo = function(car_serial){
	$('#car_serial').val(car_serial);
	$('#rent_frm').attr('action','./carView3.rent').submit();
}
//renstSearch(rentViewSub1) >> rentSearch(rentViewSub2)
rent.carSearch = function(companySerial){
	$('#company_serial').val(companySerial);
	$('#rent_frm').attr('action','./carSearch.rent').submit();
}
//rentSearch(rentViewSub2) >> rentView(rentViewSub1)
rent.carView = function(carSerial){
	$('#car_serial').val(carSerial);
	$('#rent_frm').attr('action','./carView.rent').submit();
}
rent.fillter = function(){
	if($('#content_check').val()=='com'){
		$('#rent_frm').attr('action','./fillter.rent').submit();
	}else if($('#content_check').val()=='car'){
		$('#rent_frm').attr('action','./carSearch.rent').submit();
	}
	
}
rent.back = function(){
	$('#rent_frm').attr('action','./fillter.rent').submit();
}
rent.fullcover = function(a){
	if($('#pr2').val() < 1){
		$('#pr2').val('1'); 
	}
	if(a=='y'){
		$('#car_serial').val($('#pppp1').val());
		$('#price').val(Number($('#pr1').val()) + (Number($('#pr2').val()))*30000);
		$('#fullcover').val(a);		
	}else if(a=='n'){
		$('#car_serial').val($('#pppp1').val());
		$('#price').val($('#pr1').val());
		$('#fullcover').val(a);	
	}
}

rent.reserveCancle= function(reserve_serial){
	$('#reserve_serial').val(reserve_serial);
	$('#rent_frm').attr('action','./reserveCancle.rent').submit();
}
rent.reviewInsert = function(reserve_serial,car_serial){
	$('#car_serial').val(car_serial);
	$('#reserve_serial').val(reserve_serial);
	$('#rent_frm').attr('action','./reviewInsert.rent').submit();
}

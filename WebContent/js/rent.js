/**
 * 
 */

let rent ={}

rent.func = function(){
	//rent_Main >> rentReserveSearch
	if($('#btnGoReserveSearch')!=null){
	$('#btnGoReserveSearch').click(function(){
		/*let fd = new FormData($('#frm_brd')[0]);*/
		$.ajax({
	         url : 'rentReserveSearch.jsp',
	         type : 'post',
	         /*data : fd,*/
	         contentType: false,
	         processData : false,
	         error : function(xhr, status, error){
	            console.log(error);
	         },
	         success : function(data, xhr, status) {
	            $('#mid').html(data);
	         }
	      
	      })
	});
	}
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
	
}
rent.goMain = function(){
	$('#rent_frm').attr('action','./rentMain.rent').submit();
}


rent.carInfo = function(){
	$('#rent_frm').attr('action','./carView.rent').submit();
}
rent.review = function(){
	$('#rent_frm').attr('action','./carView2.rent').submit();
}
rent.importantInfo = function(){
	$('#rent_frm').attr('action','./carView3.rent').submit();
}
//renstSearch(rentViewSub1) >> rentSearch(rentViewSub2)
rent.carSearch = function(companySerial){
	$('#rent_frm').attr('action','./carSearch.rent').submit();
}
//rentSearch(rentViewSub2) >> rentView(rentViewSub1)
rent.carView = function(carSerial){
	$('#rent_frm').attr('action','./carView.rent').submit();
}

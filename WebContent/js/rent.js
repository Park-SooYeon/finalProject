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
//			/*let fd = new FormData($('#frm_brd')[0]);*/
//			$.ajax({
//		         url : 'rentSearch.jsp',
//		         type : 'post',
//		         /*data : fd,*/
//		         contentType: false,
//		         processData : false,
//		         error : function(xhr, status, error){
//		            console.log(error);
//		         },
//		         success : function(data, xhr, status) {
//		            $('#mid').html(data);
//		         }
//		      
//		      })
		      $('#mid').load('rentSearch.jsp');
		      
		});
		
	}
	
	//rentSearch(rentViewSub2) >> rentView(rentViewSub1)
	if($('#btnView')!=null){
		$('#btnView').click(function(){
			$('#mid').load('rentView.jsp');
		});
	}
	//renstSearch(rentViewSub1) >> rentSearch(rentViewSub2)
	if($('#btnCar')!=null){
		$('#btnCar').click(function(){
			$('#SerachResult').load('rentSearchSub2.jsp');
		});
	}
	
	if($('#btnReserveResult')!=null){
		$('#btnReserveResult').click(function(){
			$('#mid').load('rentReserveResult.jsp');
		});
	}
	
}
rent.goMain = function(){
	$('#mid').load('rentMain.jsp');
}


rent.carInfo = function(){
	$('#viewRightMid').load('rentViewSub1.jsp');
}
rent.review = function(){
	$('#viewRightMid').load('rentViewSub2.jsp');
}
rent.importantInfo = function(){
	$('#viewRightMid').load('rentViewSub3.jsp');
}


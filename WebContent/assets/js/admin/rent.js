/**
 * travelista 파트너 페이지 - 렌트관리 관련 js
 * 작성자 : lje
 * 작성일자 : 2020.05
 */
let rt = {}

rt.func = function(){
	
}
rentCompDtView = function(serial){
	
	// modal id값 세팅
	$("#ModalRentCompView").attr("id", "ModalRentCompView_"+serial);
	$('#ModalRentCompView_'+serial).modal();
	
	
	
	console.log($("#compNm_"+serial).html());
	$("#rtCompNm").val($("#compNm_"+serial).html());
	$("#compPhone").val($("#compPhone_"+serial).val());
	$("#compAddr").val($("#compAddr_"+serial).text());
	$("#latitude").val($("#latitude_"+serial).val());
	$("#longitude").val($("#longitude_"+serial).val());
	$("#latitude").html($("#latitude_"+serial).val());
	$("#longitude").html($("#longitude_"+serial).val());
	
	 
	// kakaoMap 호출
	getKakaoMap($("#compAddr").val());
	
	// 판매상태 세팅 
	var state = $("#state_"+serial).html();
	let stateSel = document.getElementById("compState");
	
	switch (state) {
		case '활성화':
			stateSel.options[1].selected = true;
			break;
		case '비활성화':
			stateSel.options[2].selected = true;
			break;
	}
	
	
	// id에서 serial 삭제 
	$('#ModalRentCompView_'+serial).on('hidden.bs.modal', function (e) {
		$('#ModalRentCompView_'+serial).attr("id", "ModalRentCompView");
	})
	
}

getKakaoMap = function(addr){
	var rtCompNm = document.getElementById('rtCompNm');
	var latitude = document.getElementById('latitude');
	var longitude = document.getElementById('longitude');
	// kakao Map

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	   center: new kakao.maps.LatLng(latitude.innerHTML, longitude.innerHTML), // 지도의 중심좌표
	   level: 4 // 지도의 확대 레벨
	};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
	
	   // 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {
	
	       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	       
	       // 위도, 경도 값 세팅
	       longitude.innerHTML = result[0].x;
	       latitude.innerHTML = result[0].y;
	      
		    // 커스텀 오버레이에 표시할 내용입니다
		    // HTML 문자열 또는 Dom Element 입니다
		    var content = '<div class="overlay_info">';
		    content += '    <a href="#" target="_blank"><strong>'+rtCompNm.value+'</strong></a>';
		    content += '    <div class="desc">';
		    //content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
		    content += '        <span class="address">'+addr+'</span>';
		    content += '    </div>';
		    content += '</div>';
	
		    // 커스텀 오버레이가 표시될 위치입니다 
		   // var position = new kakao.maps.LatLng(33.55635, 126.795841);
	
		    // 커스텀 오버레이를 생성합니다
		    var mapCustomOverlay = new kakao.maps.CustomOverlay({
		        position: coords,
		        content: content,
		        xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
		        yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
		    });
	
		    // 커스텀 오버레이를 지도에 표시합니다
		    mapCustomOverlay.setMap(map);
		    
	       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	       map.setCenter(coords);
	   } 
	});    	 
	
	
	

		
}
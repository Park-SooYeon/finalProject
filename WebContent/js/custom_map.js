
function getLatLang(ele){
	let lat = ele.data("lat");
	let long = ele.data("long");
	
	return new kakao.maps.LatLng(lat, long);
}


var mapContainer = document.getElementById('mp-map'), // 지도를 표시할 div
    mapOption = { 
        center: new kakao.maps.LatLng(37.5692681185, 126.9952249747), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 마커를 표시할 위치와 title 객체 배열입니다 
let positions = [];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
function makeMarker(){
	for (var i = 0; i < positions.length; i ++) {
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
}

$(document).on("click", ".day-spot-item", function(){
	let move = getLatLang($(this));
	map.panTo(move);
	let position = {"title" : "test", "latlng" : move};
	positions.push(position);
	makeMarker();
})




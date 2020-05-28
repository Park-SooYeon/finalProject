var MARKER_WIDTH = 24, // 기본, 클릭 마커의 너비
MARKER_HEIGHT = 35, // 기본, 클릭 마커의 높이
OVER_MARKER_WIDTH = 31, // 오버 마커의 너비
OVER_MARKER_HEIGHT = 41; // 오버 마커의 높이

var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT); // 오버 마커의 크기

//마커 이미지의 이미지 주소입니다
var normalImageSrc = "http://t1.daumcdn.net/mapjsapi/images/marker.png";
var starImageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
var normalImage = new kakao.maps.MarkerImage(normalImageSrc, markerSize),
overImage = new kakao.maps.MarkerImage(normalImageSrc, overMarkerSize),
clickImage = new kakao.maps.MarkerImage(starImageSrc, markerSize);

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [];

selectedMarker = null; // 클릭한 마커를 담을 변수
openinfowindow = null; // 이전에 열린 infowindow를 저장하는 변수

var map; // 지도 객체 저장하는 변수

$("#mapModal").on('shown.bs.modal', function() { // modal 이벤트 발생 시 지도 그리기
	var mapContainer = document.getElementById('food_map'); //지도를 담을 영역의 DOM 레퍼런스
	
	var mapOption = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(36.02020878873484, 127.53214360271285), //지도의 중심좌표.
			level: 14 //지도의 레벨(확대, 축소 정도)
	};
	
	map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리턴
	
	//지도 클릭 이벤트를 등록
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		// 열린 infowindow가 있으면 닫기
		if(openinfowindow) {
			openinfowindow.close();
		}
		
		// 선택되 있는 마커가 있으면 마커 이미지 변경 후, selectedMarker 지우기
		if(selectedMarker) {
			selectedMarker.setImage(normalImage);
			selectedMarker = null;
		}
	});
	
	//지도 위에 마커를 표시합니다
	for (var i = 0; i < positions.length; i++) {
	 	// 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
		
	    console.log(positions[i].latlng);
	    console.log(positions[i].content);
	    
		// 마커를 생성하고 지도위에 표시합니다
		addMarker(positions[i].latlng, infowindow);
	}
});

//마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
function addMarker(position, infowindow) {
	
	// 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
	var marker = new kakao.maps.Marker({
	    map: map,
	    position: position,
	    image: normalImage 
	});
	
	// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
	marker.normalImage = normalImage;
	
	// 마커에 mouseover 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseover', function() {
		
	    // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
	    // 마커의 이미지를 오버 이미지로 변경합니다
	    if (!selectedMarker || selectedMarker !== marker) {
	        marker.setImage(overImage);
	    }
	});
	
	// 마커에 mouseout 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseout', function() {
	
	    // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
	    // 마커의 이미지를 기본 이미지로 변경합니다
	    if (!selectedMarker || selectedMarker !== marker) {
	        marker.setImage(normalImage);
	    }
	});
	
	// 마커에 click 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		
	    // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
	    // 마커의 이미지를 클릭 이미지로 변경합니다
	    if (!selectedMarker || selectedMarker !== marker) {

			// 이전에 열린 infowindow가 있으면 닫기
			if(openinfowindow) {
				openinfowindow.close();
			}
			
	        // 클릭된 마커 객체가 null이 아니면
	        // 클릭된 마커의 이미지를 기본 이미지로 변경하고
	        !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
			
	        // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
	        marker.setImage(clickImage);
	        
	        // 인포 윈도우 열기
	        infowindow.open(map, marker);
	    }
	    
	    // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
	    selectedMarker = marker;
	    
	    // 현재 열린 인포 윈도우를 저장
	    openinfowindow = infowindow;
	});
}

/* 마커 정보를 만드는 함수들------------------------ */
// content를 만들어 반환하는 함수
function makeContent(title, mapy, mapx) {
	let makeContent = '<div style="padding:5px;">' + title + ' <br>'
				+ '<a href="https://map.kakao.com/link/map/' + title + ',' + mapy + ',' + mapx + '" style="color:blue" target="_blank">큰지도보기</a>'
				+ '<a href="https://map.kakao.com/link/to/' + title + ',' + mapy + ',' + mapx + '" style="color:blue" target="_blank">길찾기</a>';
				+ '</div>';
				
	return makeContent;
}

// position 배열을 만드는 함수
function makePosition(item) {
	let pos = {
		content: makeContent(item['title'], item['mapy'], item['mapx']),
		latlng: new kakao.maps.LatLng(item['mapy'], item['mapx'])
	}
	
	positions.push(pos);
}
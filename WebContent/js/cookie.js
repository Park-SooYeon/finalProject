/**
 * detailview의 place_serial 번호를 배열로 저장
 */
//새로운 쿠키 생성
//setCookie(변수이름, 변수값, 기간);
// 쿠키의 사용 범위를 지정해주지 않으면 쿠키를 보낸 서블릿의 경로에 한정됨
function setCookie(cName, code, exp){
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = cName + '=' + code + ';expires=' + date.toUTCString() + ';path=/finalProject';
};


//쿠키에 값 추가
function addCookie(cName, code){
	var items = getCookie(cName); //이미 저장된 값을 쿠키에서 가져오기
	var maxItemNum = 10; //최대 저장 가능한 아이템 개수
	var expire = 7; //쿠키값을 저장할 기간
	
	if(items){
		var itemArray = items.split('|');
		if(itemArray.indexOf(code) != -1){
			//이미 존재하는 경우 종료
			console.log('Already exists.');
		}
		else{
			// serial 번호가 존재할 경우에는 기존에 있던 serial 번호 제거
			//새로운 값 저장 및 최대 개수 유지하기
			itemArray.unshift(code);
			if(itemArray.length > maxItemNum)itemArray.length=10;
			items=itemArray.join('|');
			setCookie(cName, items, expire);
		}
	}else{
		//신규 id 가진 쿠키 생성
		setCookie(cName, code, expire);
	}
	
	
}

//저장되어 있는 쿠키 가져오기
var getCookie = function(cName){
	var value = document.cookie.match('(^|;) ?' + cName + '=([^;]*)(;|$)');
	return value? value[2] : null;
}

//쿠키(Cookie) 삭제하기
var deleteCookie = function(cName){
	document.cookie = cName + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
}


// 쿠키에 place_serial 값 추가하기
let code = document.getElementById("place_serial").value;
addCookie("place_serial", code);
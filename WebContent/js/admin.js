/**
 * 
 */
let  brd ={ }

//member view의 js (모달) 
function member_view(mId,mName,phone,email,state,mDate,mPhoto){
		let path = '../../images/myPage/'+mPhoto;
		let path1 ='../../images/myPage/queen.png';
	$('#member_id').html(mId);
	$('#member_date').html(mDate);
	$('.member_name').html(mName);
	$('.member_phone').html(phone);
	$('.member_email').html(email);
	
	console.log(mPhoto!=null); //true
	console.log(mPhoto!=""); //false
	console.log(mPhoto==null); //false
	console.log(mPhoto==""); //true
	
	if(mPhoto!=""){
		$('.member_photo').attr('src',path);
	}else{
		$('.member_photo').attr('src',path1);
	}
	
	$('#usrInfoState').val(state);
	
	$('#hidden_id').val(mId);
}
//partner승인요청 
function a_partner_view(mId,p_name,b_number,phone,location,state,email,mphoto){
	
	let path = '../../images/myPage/'+mphoto;
	let path1 ='../../images/myPage/queen.png';
	if(mphoto!=""){
		$('.member_photo').attr('src',path);
	}else{
		$('.member_photo').attr('src',path1);
	}
	
	$('#member_id').html(mId);
	$('.partner_name').html(p_name);
	$('.business_number').html(b_number);
	$('.partner_phone').html(phone);
	$('.partner_location').html(location);
	$('.eamil').html(email);

	$('#p_id').val(mId);
	$('#p_save').val(state);
	
	if(state==888){
		$('#state2').html("렌트요청");
	}else{
		$('#state2').html("호텔요청");
	}
}



//회원탈퇴요청 
function member_out_view(m_name,m_phone,m_email,m_state,m_date,m_id,mphoto){
	let path = '../../images/myPage/'+mphoto;
	let path1 ='../../images/myPage/queen.png';
	if(mphoto!=""){
		$('.member_photo').attr('src',path);
	}else{
		$('.member_photo').attr('src',path1);
	}
	
	$('#idid').html(m_id);
	$('#datedate').html(m_date);
	$('.naname').html(m_name);
	$('.phonephone').html(m_phone);
	$('.emailemail').html(m_email);
	//$('#statestate').html(m_state);
	
	$('#out_id').val(m_id);
	$('#out_state').val(m_state);
	
}



//member view 수정
let mm = {}
mm.func =function(){
$('#member_save').click(function(){ //jquery는 널인지  아닌지 표시를 안해줘도 되는 편리함이 이씅ㅁ
	let param = $('#hidden_form').serialize();
	//이렇게 유알엘을 넘기면 boardCotroller가 받음 ./board/insert.jsp를 넘기면 data로 받고 main에 뿌림. 
	$.post("status_save.os" ,param, function(data, stat){ //post를가지고 페이지를 넘길것이다.	 //insert가 data로 들어와서 메인으로 가서 뿌린다
		alert(data);
		location.reload();
}); 
});
//partner승인요청수락 저장
$('#partner_save').click(function(){ //jquery는 널인지  아닌지 표시를 안해줘도 되는 편리함이 이씅ㅁ
	let param = $('#p_form').serialize();
	console.log(param);
	$.post("partner_save.os" ,param, function(data, stat){ //post를가지고 페이지를 넘길것이다.	 //insert가 data로 들어와서 메인으로 가서 뿌린다
		alert(data);
		location.reload();
}); 
});
//partner승인요청거절 저장
$('#partner_reject').click(function(){ //jquery는 널인지  아닌지 표시를 안해줘도 되는 편리함이 이씅ㅁ
	let param = $('#p_form').serialize();
	$.post("partner_reject.os" ,param, function(data, stat){ //post를가지고 페이지를 넘길것이다.	 //insert가 data로 들어와서 메인으로 가서 뿌린다
		alert(data);
		location.reload();
}); 
});


//partner권한박탈
$('#btnAdmStateCh').click(function(){ //jquery는 널인지  아닌지 표시를 안해줘도 되는 편리함이 이씅ㅁ
	let param = $('#p_view').serialize();
	console.log(param);
	$.post("partner_deprive.os" ,param, function(data, stat){ //post를가지고 페이지를 넘길것이다.	 //insert가 data로 들어와서 메인으로 가서 뿌린다
		alert(data);
		location.href="./?inc=partner_list.os"
}); 
});


//멤버탈퇴승인요청 수정
$('#out_save').click(function(){ //jquery는 널인지  아닌지 표시를 안해줘도 되는 편리함이 이씅ㅁ
	let param = $('#out_form').serialize();
	$.post("out_save.os" ,param, function(data, stat){ //post를가지고 페이지를 넘길것이다.	 //insert가 data로 들어와서 메인으로 가서 뿌린다
		alert(data);
		location.reload();
}); 
});


}

mm.func();
// 리뷰........
$('#contain').load("review_all.os");  //ajax 콘테인안에 리뷰올을 넣음.





brd.go = function(nowPage){
	frm_list.nowPage.value = nowPage;
	let param = $('#frm_list').serialize();
	console.log(param);
	$.post("review_all.os" ,param, function(data, stat){ //view.brd하면 컨트롤러가 view.brd가 받는다 
	$('#contain').html(data)	
});
}
brd.func = function(){
	$('#btnFind').click(function(){ //jquery는 널인지  아닌지 표시를 안해줘도 되는 편리함이 이씅ㅁ
		frm_list.nowPage.value = 1;
		let param = $('#frm_list').serialize(); //frm_brd라는 폼 을 가지고~
		$.post("review_all.os" ,param, function(data, stat){ //post를가지고 페이지를 넘길것이다.	 //insert가 data로 들어와서 메인으로 가서 뿌린다
			$('#contain').html(data)	
		}); 
	})
}

$(document).ready(function(){
    brd.func();
    })
    
$('#frm_list').submit(function(){
	$('#btnFind').click();
	return false;
	
});

//review상세보기
function review_view(review_serial,mphoto){
		let path = '../../images/myPage/'+mphoto;
		let path1 ='../../images/myPage/queen.png';
		if(mphoto!=""){
			$('.member_photo').attr('src',path);
		}else{
			$('.member_photo').attr('src',path1);
		}
		
		
		//getjson하면 스트링말고 타입으로 변환이 됌 그냥겟은 스트링만 
	$.getJSON("review_view.os", {"serial" : review_serial}, function(data, state) {
		console.log(data);
		
		
		for(i=1; i<=4; i++){
			console.log(data.r_photo[i] == undefined);
			console.log(data.r_photo[i] == null);
			console.log(data.r_photo[i] == "");
			
			if(data.r_photo[i-1] == undefined){
				$('.sysfile'+i).attr('src', '../../images/myPage/wow.png');
			}else{
				$('.sysfile'+i).attr('src', '../../images/food/'+data.r_photo[i-1].sysfile);
			}
			
			
		}
		
		
		
//      alert("s리뷰erial"+review_serial);
        $('#m_id').html(data.member_id);
        $('.r_title').html(data.review_title);
    	$('.r_content').html(data.review_content);
        $('#r_date').html(data.review_date);
    	$('.report_content').html(data.report.report_content);
 //   	$('.report_serial').html(data.report.report_serial);
    	//$('#').html(data.report.report_code);
//    	$('#').html(data.report.report_date);
    	$('.report_id').html(data.report.report_id);
//    	$('#').html(data.report.report_serial);
 //   	$('.review_serial').html(data.review_serial);
    	
    	
    	
//    	$('#').html();
		});
	
	}
	




//brd.go();
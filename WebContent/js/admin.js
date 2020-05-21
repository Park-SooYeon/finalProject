/**
 * 
 */

//member view의 js
function member_view(mId,mName,phone,email,state,mDate){
	
	$('#member_id').html(mId);
	$('#member_date').html(mDate);
	$('.member_name').html(mName);
	$('.member_phone').html(phone);
	$('.member_email').html(email);
	$('#usrInfoState').val(state);
	
	$('#hidden_id').val(mId);
}


//member view 수정
let mm = {}
mm.func =function(){
$('#member_save').click(function(){ //jquery는 널인지  아닌지 표시를 안해줘도 되는 편리함이 이씅ㅁ
	let param = $('#hidden_form').serialize();
	console.log(param);
	//이렇게 유알엘을 넘기면 boardCotroller가 받음 ./board/insert.jsp를 넘기면 data로 받고 main에 뿌림. 
	$.post("status_save.os" ,param, function(data, stat){ //post를가지고 페이지를 넘길것이다.	 //insert가 data로 들어와서 메인으로 가서 뿌린다
		alert(data);
		location.reload();
}); 
});
}
mm.func();

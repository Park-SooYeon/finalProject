/**
 * 
 */

function member_view(mId,mName,phone,email,state,mDate){
	
	$('#member_id').html(mId);
	$('#member_date').html(mDate);
	$('.member_name').text(mName);
	$('.member_phone').html(phone);
	$('.member_email').html(email);
	$('.member_state').html(state);
	
	
}
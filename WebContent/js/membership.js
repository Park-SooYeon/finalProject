/**
 * http://usejsdoc.org/
 */
let ms = {}

$(document).ready(function(){
		
		
		$('#btnLogin').click(function(){
	
		var member_id=$("#member_id").val();
		var pwd = $("#pwd").val();
		
		
		if(member_id==""){
			
			alert("아이디 입력하세요.");
			$("#member_id").focus();
			return;
			
		}
		
		if(pwd == ""){
			alert("비밀번호를 입력해주세요");
			$("#pwd").focus();
			return;
			
			
		}
		
		 document.frm_ms.action="?inc=login.ms"
		 document.frm_ms.submit();
		
		});
	
	});

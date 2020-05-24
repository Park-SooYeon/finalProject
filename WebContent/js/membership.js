/**
 * http://usejsdoc.org/
 */
let ms = {}

ms.func = function(){

		$('#btnLogin').click(function(){
	
			alert('성공');
			
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
	
		

		$('#btnMemberInsert').click(function(){ //회원가입
			
			var member_id=$("#member_id").val();
			var pwd = $("#pwd").val();
			var pwd_check = $("#pwd_check").val();
			var member_name = $("#member_name").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var emailCodeCheck = $("#emailCodeCheck").val(); 
		
			
		
			
			if(member_id==""){
				
				alert("아이디 입력하세요.");
				$("#member_id").focus();
				
				return;
				
			}
			
			if(pwd == "" ){
				alert("비밀번호를 입력해주세요!");
				$("#pwd").focus();
				return;
				
				
			}
			
			if(pwd_check != pwd || pwd_check == ""){
				alert("비밀번호 재확인이 공백이거나 일치하지 않습니다.");
				$("#pwd_check").focus();
				return;
				
			}
			
			
			
			if(member_name == "" ){
				alert("휴대전화번호를 입력해주세요");
				$("#member_name").focus();
				return;
				
				
			}
			
			
			
			if(phone == "" ){
				alert("휴대전화번호를 입력해주세요");
				$("#phone").focus();
				return;
				
				
			}
			
			
			if(email == "" ){
				alert("이메일을 입력세요");
				$("#phone").focus();
				return;
				
				
			}
			
			if(emailCodeCheck == "" ){
				alert("비밀번호를 입력해주세요");
				$("#emailCodeCheck").focus();
				return;
				
				
			}
			
			
		     
			
			 document.frm_ms.action="?inc=memberJoin.ms"
			 document.frm_ms.submit();
			
			});

		
		
		
		
		
		$("#member_id").blur(function(){
		
			var member_id = $("#member_id").val()
		
				$.ajax({
					type :"post",
					url : "idCheck.ms",
					data : {"member_id":member_id},

					success : function(data){
						
				 
						if($.trim(data) == "no"){
						     alert("아이디가 중복입니다 ! 다시 확인해주세요");
							$("#id_check").text("아이디가 중복입니다!");
							$("#id_check").css("color","red");
							$("#btnMemberInsert").attr("disabled",true);
							
						}else{
							 alert("사용가능한 아이디입니다!");
							$("#id_check").text("사용가능합니다!");
							$("#id_check").css("color","green");
							$("#btnMemberInsert").attr("abled",true);
							
							
						}
						
						
					}
				})
			
		})
		
		
		
		
		
		
		
		
		
		
		
		
	}




/**
 * http://usejsdoc.org/
 */
let ms = {}

ms.func = function(){

		$('#btnLogin').click(function(){
	
			
			
		var member_id=$("#mId").val();
		var pwd = $("#pwd").val();
		
		
		if(member_id==""){
			
			alert("아이디 입력하세요.");
			$("#mId").focus();
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
							$("#btnMemberInsert").prop("disabled",true);
							
						}else{
							 alert("사용가능한 아이디입니다!");
							$("#id_check").text("사용가능합니다!");
							$("#id_check").css("color","green");
							$("#btnMemberInsert").prop("disabled",false);
							
							
						}
						
						
					}
				})
			
		})
		
		
		
		
		$("#btnFindPwd").click(function(){
		
			
			if(email == "" ){
				alert("이메일을 입력하세요");
				$("#email").focus();
				return;
				
				
			}
			
			
			     document.frm_ms.action="?inc=findPwd.ms"
				 document.frm_ms.submit();
		
		
		})
		
       $('#btnRegPartner').click(function(){ //회원가입
			
			var type =$("#type option:selected").val();
			var pName = $("#pName").val();
			var pNumber = $("#pNumber").val();
			var pPhone = $("#pPhone").val();
			var address = $("#addr1").val()+$("#addr2").val()+$("#addr3").val()+$("#addr4").val();
            var addr1 =$("#addr1").val(); 
			
			
		
			
			if(pName==""){
				
				alert("회사명을 입력하세요.");
				$("#pName").focus();
				
				return;
				
			}
			
			
			if(pPhone == ""){
				alert("회사 연락망을 입력해주세요!");
				$("#pPhone").focus();
				return;
				
			}
			
			if(pNumber == "" ){
				alert("사업자 등록번호를 입력해주세요!");
				$("#pNumber").focus();
				return;
				
				
			}
			
			
			
			
			
			if(pPhone == "" ){
				alert("휴대전화번호를 입력해주세요");
				$("#pPhone").focus();
				return;
				
				
			}
			
			
			if(addr1 == "" ){
				alert("본사 주소를 입력해주세요!!");
				$("#addr1").focus();
				return;
				
				
			}
		
		     
			if(type == 1){
			
						
				     document.frm_ms.action="partnerHotelJoin.ms"
					 document.frm_ms.submit();

			}else {

				  document.frm_ms.action="partnerRentJoin.ms"
						 document.frm_ms.submit();
						
				
				
			}
			
			
			});

		
		
		
	}




/**
 * 계정 정보 변환에 사용되는 js
 */

let emailState = 0; // 이메일 인증 상태를 나타내는 변수
let pwdState = 0; // 비밀번호 인증 상태를 나타내는 변수

// 비밀번호 확인
$("#alert-success").hide();
$("#alert-danger").hide();
$("#pwd_check").keyup(function() {
	var pwd1 = $("#pwd").val();
	var pwd2 = $("#pwd_check").val();
	if (pwd1 != "" || pwd2 != "") {
		if (pwd1 == pwd2) {
			pwdState = 1;
			$("#alert-success").show();
			$("#alert-danger").hide();
		} else {
			pwdState = 0;
			$("#alert-success").hide();
			$("#alert-danger").show();
		}
	}
});

// 인증받기 버튼 클릭
$('#btnSendMail').click(function(){
	$('#btnSendMail').prop("disabled", true);
	let param = $('#frm_ms').serialize();
	console.log(param);
	$.ajax({
		url: "sendMail.ms",
		data: param,
		method: "post",
		success: function(data) {
			let str = data;
			let msg = "";
			let form = "";
			if(data === "yes") { // 이메일이 정상 전송되면 인증 번호 입력란 띄움
				msg = "이메일이 전송되었습니다.";
				form = "success";
				$('#codeCheck').fadeIn();
				$('#btnSendMail').prop("disabled", true); // 버튼 비활성화
			} else if(data === "no") { // 이메일 전송 실패하면 다시 요청
				msg = "이메일 전송 중 오류가 발생하였습니다. 이메일 확인 후, 다시 시도해주세요.";
				form = "error";
				$('#btnSendMail').prop("disabled", false);
			} else if(data === "same"){
				msg = "등록된 이메일입니다. 다른 이메일을 사용해주세요.";
				form = "warning";
				$('#btnSendMail').prop("disabled", false);
			}
			swal(msg, "", form);
		},
		error: function() {
		}
	});
});


// 인증 번호 확인 버튼 클릭
$('#btnChkMail').on("click", function() {
 	$.ajax({
		url: "chkMail.ms",
		data: {
			"number" : $('#emailCodeCheck').val()
		},
		method: "post",
		success: function(data) {
			let msg = "";
			let form = "";
			if(data === "yes") {
				emailState = 1;
				msg = "인증 완료되었습니다.";
				form = "success";
			} else if(data === "no"){
				emailState = 0;
				msg = "인증 번호가 틀렸습니다. 인증 번호를 확인해주세요.";
				form = "error";
			}
			swal(msg, "", form);
		},
		error: function() {
		}
	});
})

// 회원 탈퇴 버튼 클릭
$('#btnLeaveMember').on("click", function() {
	$('#frm_ms').attr("action", "deleteUser.ms");
	$('#frm_ms').submit();a
});

// 회원정보 수정 버튼 클릭
$('#btnUpdate').on("click", function() {
	let msg = "";
	form = "info";
	if(pwdState !== 1) {
		msg = "비밀번호를 확인해주세요.";
		swal(msg, "", form);
	} else if(emailState !== 1) {
		msg = "이메일 인증을 해주세요.";
		swal(msg, "", form);
	} else if(emailState === 1 && pwdState === 1) {
		$('#frm_ms').submit();
	}
});
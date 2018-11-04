// * 주소찾기 API *
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('address_num').value = data.zonecode; // 5자리
			// 새우편번호
			// 사용
			document.getElementById('address_main').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('address_detail').focus();
		}
	}).open();
}

$("#address_detail").focus(function() {
	$("#address_detail").val("");
});

var passwordcheck = "false";

function phoneCheck() {
	var phoneRule = /^\d{3}-\d{3,4}-\d{4}$/;
	var phoneNum = $("#bf_phone").val();
	
	if(!phoneRule.test(phoneNum)){
		$("#phoneCK").val("*예시 ) 000-0000-0000").css("color", "red");
		$("#phone").val("");
		return false;
	}else{
		$("#phoneCK").val("*올바른 전화번호입니다.").css("color", "green");
		$("#phone").val(phoneNum);
		return false;
	}
}

function nickCheck() {
	var nicknameRule = /^[가-힣a-zA-Z]+$/;
	var bf_nickname = $("#bf_nickname").val();

	if (bf_nickname.trim().length < 1) {
		return;
	} else if (!nicknameRule.test(bf_nickname)) {
		$("#nicknameCK").val("*숫자,공백,특수문자 사용불가").css("color", "red");
		return;
	}

	$
			.ajax({
				url : "nickCheck.do",
				type : "POST",
				data : "nickname=" + bf_nickname,
				success : function(data) {
					if (data.cnt > 0) {
						$("#nicknameCK").val("*이미 존재하는 닉네임입니다").css("color",
								"red");
					} else {
						$("#nicknameCK").val("*사용 할 수 있는 닉네임입니다").css("color",
								"green");
					}
				},
				error : function(xhr, status) {
					alert(xhr + " : " + status)
				}
			});
}

function regiAf() {
	if ($("#address_detail").val() != "" && $("#address_num").val() != "") {
		var address = "";
		address = $("#address_num").val() + "-" + $("#address_main").val()
				+ "-" + $("#address_detail").val();
		$("#address").val(address);
	}

	if (passwordcheck == "false") {
		alert("비밀번호 체크를 하세요");
		return;
	}

	if ($("#pwd1").val() != "" && $("#pwd1").val() != $("#pwd").val()) {
		$("#pwd").val($("#pwd1").val());
	}

	if ($("#bf_name").val() != "" && $("#bf_name").val() != null
			&& $("#bf_name").val() != $("#name").val()) {
		$("#name").val($("#bf_name").val());
	}

	if ($("#bf_nickname").val() != ""
			&& $("#bf_nickname").val() != $("#nickname").val()) {
		$("#nickname").val($("#bf_nickname").val());
	}

	if ($("#bf_email").val() != "" && $("#bf_email").val() != $("#email").val()) {
		$("#email").val($("#bf_email").val());
	}

	if ($("#bf_phone").val() != "" && $("#bf_phone").val() != $("#phone").val()) {
		$("#phone").val($("#bf_phone").val());
	}

	var data = {
		id : $("#id").val().trim(),
		pwd : $("#pwd").val().trim(),
		nickname : $("#nickname").val().trim(),
		email : $("#email").val().trim(),
		phone : $("#phone").val().trim(),
		address : $("#address").val().trim(),
		name : $("#name").val().trim(),
		auth : 0,
	};

	$.ajax({
		dataType : 'json',
		url : "userUpdateAf.do",
		type : "POST",
		data : data,
		async : true,
		success : function(data) {
			if (data.cnt > 0) {
				alert("회원정보 수정에 성공하였습니다");
				location.href = 'mypage.do';
			} else {
				alert("regi : error");
				location.href = 'mypage.do';
			}
		},
		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

}

function pwcheck() {
	var pwRule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
	var pw1 = $("#pwd1").val();
	var pw2 = $("#pwd2").val();

	if (pw1 == pw2 && pw1 != "") {
		if (!pwRule.test(pw1)) {
			$("#pwdResult").val("*비밀번호 (영어,숫자를 포함한 8~15자)").css("color", "red");
			passwordcheck = "false";
			return;
		}
		$("#pwdResult").val("*비밀번호가 일치합니다").css("color", "green");
		passwordcheck = "true";
	} else {
		$("#pwdResult").val("*비밀번호가 불일치합니다").css("color", "red");
		passwordcheck = "false";
		return;
	}
}

function emailCheck() {
	var emailRule = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var bf_email = $("#bf_email").val();

	if (bf_email == "" || null) {
		return;
	} else if (!emailRule.test(bf_email)) {
		$("#emailCK").val("*예시 ) abc@abc.com").css("color", "red");
		return;
	}

	$.ajax({
		url : "emailCheck.do",
		type : "POST",
		data : "email=" + bf_email,
		success : function(data) {
			if (data.cnt > 0) {
				$("#emailCK").val("*이미 존재하는 이메일입니다").css("color", "red");
			} else {
				$("#emailCK").val("*사용 할 수 있는 이메일입니다").css("color", "green");
			}
		},
		error : function(xhr, status) {
			alert(xhr + " : " + status)
		}
	})
}
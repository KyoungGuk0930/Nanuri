var idok = 0;
var passwordcheck = "false";
var emailcheck = "false";

function idcheck() {

	var id = $("#id").val();

	if (id == "" || null) {
		alert("아이디를 입력하세요");
		return false;
	}

	$.ajax({
		url : "idCheck.do",
		type : "GET",
		data : "id=" + id,
		success : function(data) {
			if (data.cnt > 0) {
				alert("중복된 아이디입니다.");
			} else {
				alert("사용가능한 아이디입니다.");
				idok = 1;
			}
		},
		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	})
}

function joincheck() {
	if (idok == "false") {
		alert("ID를 확인하세요");
		return false;
	}

	if (passwordcheck == "false") {
		alert("PWD를 확인하세요");
		return false;
	}

	if (emailcheck == "false") {
		alert("EMAIL를 확인하세요");
		return false;
	}

	return true;
}

function pwcheck() {
	var pw1 = "";
	var pw2 = "";

	pw1 = $("#pwd").val();
	pw2 = $("#pwd2").val();

	if (pw1 == pw2 && pw1 != "") {
		$("#pwdname").val("비밀번호가 일치합니다").css("color", "blue");
		passwordcheck = "true";
	} else {
		$("#pwdname").val("비밀번호가 불일치합니다").css("color", "red");
		passwordcheck = "false";
	}
}

function emailCheck() {

	var email = $("#email").val();

	if (email == "" || null) {
		$("#emailname").val("빈칸은 허용하지 않습니다").css("color", "red");
		return false;
	}
	$.ajax({
		url : "emailCheck.do",
		type : "get",
		data : "email=" + email,
		success : function(data) {
			if (data.cnt > 0) {
				$("#emailname").val("중복된 이메일입니다").css("color", "red");
				emailcheck = "false";
			} else {
				$("#emailname").val("사용가능한 이메일입니다").css("color", "blue");
				emailcheck = "true";
			}
		},
		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	})
}

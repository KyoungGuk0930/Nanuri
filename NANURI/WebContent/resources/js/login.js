function searchId() {
	alert("아이디를 왜 까먹고그래..시간이없어서 못 했어");
}

function searchPwd() {
	alert("비밀번호를 왜 까먹고그래..시간이없어서 못 했어");
}

function loginAf() {

	var id = $("#id").val();
	var pwd = $("#pwd").val();

	if (id == null || id == "") {
		alert("아이디를 입력하세요");
		return;
	} else if (pwd == null || pwd == "") {
		alert("패스워를 입력하세요");
		return;
	}

	var data = {
		id : id.trim(),
		pwd : pwd.trim(),
	};

	$.ajax({
		dataType : 'json',
		url : "loginAf.do",
		type : "POST",
		data : data,
		async : true,
		success : function(data) {
			if (data.cnt == 0) {
				alert("존재하지 않는 아이디입니다");
				return;
			} else if(data.cnt == 1){
				alert("비밀번호를 다시 확인해 주십시오");
				return;
			} else if(data.cnt == 2){
				location.href = 'main.do';
			} else if(data.cnt == 3){
				alert("탈퇴승인 대기 중인 아이디입니다");
				return;
			}
		},
		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}
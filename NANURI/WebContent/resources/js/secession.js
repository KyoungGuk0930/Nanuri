function afterAction() {
	location.href = 'main.do';
}

function secessionAf() {

	var del_id = $("#del_id").val().trim();
	var del_reason = $("#del_reason").val().trim();

	if (del_reason.length < 20) {
		alert("20자 이상의 사유를 입력하세요");
		return;
	}

	if (del_reason == null || del_reason == "") {
		alert("탈퇴사유를 입력하세요");
		return;
	}

	var data = {
		del_id : del_id.trim(),
		del_reason : del_reason.trim(),
	};

	$.ajax({
		dataType : 'json',
		url : "secessionAf.do",
		type : "POST",
		data : data,
		async : true,
		success : function(data) {
			if (data.cnt > 0) {
				$("#msg").text("탈퇴처리가 완료되었습니다.");
				$("#btn_Y").hide();
				$("#btn_N").hide();
				$("#btn_C").show();
			} else {
				alert("regi : error");
				return;
			}
		},
		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}
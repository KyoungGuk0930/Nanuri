$("document").ready(function() {
	$("#copy").click(function (event) {
		if(event.target.checked){
			$("#recipient").val($("#buyer").val());
			$("#phone_f").val($("#buyer_phone_f").val());
			$("#phone_m").val($("#buyer_phone_m").val());
			$("#phone_b").val($("#buyer_phone_b").val());
			$("#address_num").val($("#buyer_address_n").val());
			$("#address_main").val($("#buyer_address_m").val());
			$("#address_detail").val($("#buyer_address_d").val());
		}else{
			$("#recipient").val("");
			$("#phone_f").val('010');
			$("#phone_m").val('');
			$("#phone_b").val('');
			$("#address_num").val('');
			$("#address_main").val('');
			$("#address_detail").val('');
		}
	});
	
	$("#test_btn").click(function () {
		var data = $("#data").val();
		alert(data);
		location.href="orderAf.do?data="+data;
		alert("DB 저장 완료");
	});
	
	$("#iamport_module").click(function () {
		
		if(checkInput()){
	      var IMP = window.IMP; // 생략가능
	      IMP.init('iamport'); 
	      IMP.request_pay({
	        pg: 'inicis', // version 1.1.0부터 지원.
	        pay_method: 'card',
	        merchant_uid: $("#merchant_uid").val(),
	        //   https://docs.iamport.kr/implementation/payment
	        name: '주문명:결제테스트',
	        //결제창에서 보여질 이름
	        amount:$('#total_price').val() , 
	        //가격  
	        buyer_name: $('#buyer').val(),
	        buyer_email: $('#buyer_email').val(),
	        buyer_tel: $('#buyer_phone_f').val()+"-"+$('#buyer_phone_m').val()+"-"+$('#buyer_phone_b').val(),
	        buyer_addr: $('#buyer_address_m').val()+$('#buyer_address_d').val(),
	        buyer_postcode: $('#buyer_address_n').val(),
	      }, function (rsp) {
	        console.log(rsp);
	        if (rsp.success) {
	            var msg = '결제가 완료되었습니다.';
	            msg += '고유ID : ' + rsp.imp_uid;
	            msg += '상점 거래ID : ' + rsp.merchant_uid;
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            msg += '카드 승인번호 : ' + rsp.apply_num;
	           
	            var data = $("#data").val();
	            location.href="orderAf.do?data="+data;
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	        }
	        alert(msg);
	      });
		}
	});
});

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
			document.getElementById('address_detail').value='';
			document.getElementById('address_detail').focus();
		}
	}).open();
}

function checkInput() {
	var name = $("#recipient").val().trim();
	
	var phone_m = $("#phone_m").val().trim();
	var phone_b = $("#phone_b").val().trim();
	
	var address_n = $("#address_num").val();
	var address_m = $("#address_main").val();
	var address_d = $("#address_detail").val().trim();
	
	if(name==''){
		alert("수령인 이름을 입력하세요");
		return false;
	}
	if(phone_m=='' || phone_b==''){
		alert("수령인 전화번호를 입력하세요");
		return false;
	}else if(!(phone_m.length==4 || phone_m.length==3 ) ||phone_b.length!=4 ){
		alert("수령인 전화번호 확인해 주세요");
		return false;
	}
	
	if(address_n=='' || address_m==''|| address_d==''){
		alert("수령하실 주소를 입력하세요");
		return false;
	}
	
	return true;
}



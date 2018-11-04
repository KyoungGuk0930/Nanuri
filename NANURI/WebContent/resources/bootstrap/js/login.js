/*Login Check*/
function login_nor() {
	var data = {
		id : $("#id").val(),
		pwd : $("#pwd").val(),
	};

	if ($("#id").val() == "" || null) {
		alert("아이디를 입력하세요");
		return false;
	} else if ($("#pwd").val() == "" || null) {
		alert("패스워드를 입력하세요");
		return false;
	}

	$.ajax({
		dataType:'json',
		url : "loginAf.do",
		type : "POST",
		data : data,
		async:true,
		success : function(data) {
			if (data.cnt > 0) {
				alert($("#id").val() + "님이 로그인하였습니다.");
				location.href = 'main.do';
			} else {
				alert("로그인 실패");
				location.href = 'login.do';
			}
		},
		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}

/*Google Login*/
function init() {
	console.log('init');
  gapi.load('auth2', function() {
	  console.log('auth2');
	 window.gauth = gapi.auth2.init({ // gapi.auth2.GoogleAuth 반환
		  client_id:'409625888327-jrr1vc8hdtpd54alerh46jr08rorsirj.apps.googleusercontent.com'
	  })
	  gauth.then(function () {
		  console.log('googleAuth success');
		  window.loginStatusCheck = document.querySelector('#loginStatusCheck');
		  if(gauth.isSignedIn.get()){
			  console.log('logined');
			  loginStatusCheck.value = 'true';
			  console.log(loginStatusCheck.value);
		  }else{
			  console.log('logouted');
			  loginStatusCheck.value = 'false';
			  console.log(loginStatusCheck.value);
		  }
	}, function () {
		console.log('googleAuth fail');
	});
  });
}

function login() {
	console.log('로그인 준비 '+loginStatusCheck.value);
		gauth.signIn().then(function() {
	          var profile = gauth.currentUser.get().getBasicProfile();
	          location.href = "MemberController?command=gooleLogin&id="+profile.getId()+"&email="+profile.getEmail()+
				"&name="+profile.getName()+"&img="+profile.getImageUrl();
	        })
		console.log('로그인 성공');
}

function logout() {
	console.log('로그아웃 준비 '+loginStatusCheck.value);
	if(loginStatusCheck.value == 'true'){
		loginStatusCheck.value = 'false';
		gauth.signOut();
	}
	location.href='MemberController?command=logout';
	console.log('로그아웃 성공');
}
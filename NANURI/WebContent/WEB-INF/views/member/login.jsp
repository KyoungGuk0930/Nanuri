<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANURI</title>
</head>
<body>
	<!-- startdiv -->
	<div class="startdiv">
		<div class="row">
			<div class="col-md-6"
				style="margin-left: 25%; margin-right: 25%; margin-top: 5%; border: solid 1px #CCCCCC; padding-left: 15px; padding-right: 15px; margin-bottom: 10%">
				<!-- login view header -->
				<div style="border-bottom: solid 1px #CCCCCC">
					<div>
						<span><font style="font-weight: blod; font-size: 70px;">Login
						</font><font style="font-weight: bold; font-size: 1.5em;" color="gray">로그인</font></span>
					</div>
					<div>
						<p style="font-size: 0.8em; color: gray;">로그인 하시면 더욱 다양한 나누리의
							서비스를 즐기실 수 있습니다.</p>
					</div>
				</div>
				<!-- / login view header -->
				<!-- login view method main -->
				<div style="padding-top: 5%; width: 100%" align="center">
					<table style="text-align: center;">
						<colgroup>
							<col style="width: 25%">
							<col style="width: 50%">
							<col style="width: 25%">
						</colgroup>
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="text" id="id" name="id"
									onkeydown="javascript:onTabKey()"></td>
								<td rowspan="2"><a id="login" href="javascript:loginAf()"><img
										style="height: 75px" alt=""
										src="https://user-images.githubusercontent.com/38531104/47544998-e216df80-d924-11e8-828b-4bfa34b9bfd3.png"></a></td>
							</tr>
							<tr>
								<th>패스워드</th>
								<td><input type="password" id="pwd" name="pwd"
									onkeydown="javascript:onEnterSubmit()"></td>
							</tr>
							<tr>
								<td colspan="3">
									<p style="padding-top: 5px">
										<a href="javascript:searchId()">아이디 찾기</a> > <a
											href="javascript:searchPwd()">비밀번호 찾기</a> > <a href="regi.do">회원가입</a>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- / login view method main -->
			</div>
		</div>
	</div>
	<!-- / startdiv -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#id").focus();
		});

		function onTabKey() {
			var keyCode = window.event.keyCode;
			if (keyCode == 9) {
				$("#login").focus();
			}
		}

		function onEnterSubmit() {
			var keyCode = window.event.keyCode;
			if (keyCode == 13) {
				loginAf();
			}
		}
	</script>
	<script type="text/javascript" src="resources/js/login.js"></script>
</body>
</html>
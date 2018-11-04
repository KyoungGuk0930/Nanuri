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

			<!-- left bar -->
			<div style="width: 220px;">
				<div
					style="margin-top: 70px; border: 1px solid #CCCCCC; margin-right: 30px;">
					<jsp:include page="mypage_leftbar.jsp" />
				</div>
			</div>

			<!-- main content -->
			<div style="width: 880px;">

				<!-- main head -->
				<div class="row"
					style="border-bottom: 1px solid #CCCCCC; padding-bottom: 10px; margin-bottom: 10px">
					<div class="col-md-8"></div>
					<div class="col-md-4" style="text-align: right; padding-top: 15px">
						<a href="main.do">메인</a> > <a href="mypage.do">마이페이지</a> > <a
							href="userUpdate.do">회원정보 수정</a>
					</div>
				</div>

				<!-- main view -->
				<!-- Login_Box -->
				<div class="card" style="margin-left: 10%; margin-right: 10%">

					<!-- Card body -->
					<div class="card-body"
						style="padding: 15%; padding-top: 5%; padding-bottom: 5%">

						<!-- id -->
						<div class="md-form row" style="margin-bottom: 0px">
							<div class="col-md-6">
								<i class="fa fa-user prefix grey-text"></i> <input type="text"
									name="id" id="id" value="${login.id} " class="form-control"
									required disabled> <label for="id"
									class="font-weight-light" style="margin-left: 3.5rem;">Your
									id</label>
							</div>
						</div>

						<!-- Password -->
						<div class="md-form row"
							style="margin-bottom: 0px; margin-top: 0px">
							<input type="hidden" name="pwd" id="pwd" value="${login.pwd}">
							<div class="col-md-6">
								<i class="fa fa-lock prefix grey-text"></i> <input
									type="password" name="pwd1" id="pwd1" class="form-control"
									onkeyup="pwcheck()" required> <label for="pwd1"
									class="font-weight-light" style="margin-left: 3.5rem;">
									Your password</label>
							</div>
							<div class="col-md-6">
								<i class="fa fa-lock prefix grey-text"></i> <input
									type="password" id="pwd2" class="form-control"
									onkeyup="pwcheck()" required> <label for="pwd2"
									class="font-weight-light" style="margin-left: 3.5rem;">
									Your password confirm</label>
							</div>
						</div>

						<!-- password message -->
						<div class="md-form row" style="margin-top: 0px;">
							<input type="text" id="pwdResult" class="form-control" value=""
								placeholder="*비밀번호 (영어,특수문자,숫자를 포함한 8~15자)" disabled
								style="border-bottom: none">
						</div>

						<!-- Material input name -->
						<div class="md-form">
							<input type="hidden" name="name" id="name" value="${login.name}">
							<i class="fa fa-user prefix grey-text"></i> <input type="text"
								name="bf_name" id="bf_name" value="${login.name}"
								class="form-control" required> <label for="bf_name"
								class="font-weight-light">Name</label>
						</div>

						<!-- Material input nickname -->
						<div class="md-form row" style="margin-bottom: 0px">
							<input type="hidden" name="nickname" id="nickname"
								value="${login.nickname}">
							<div class="col-md-6">
								<i class="fa fa-user prefix grey-text"></i> <input type="text"
									name="bf_nickname" id="bf_nickname" value="${login.nickname}"
									class="form-control" onkeyup="nickCheck()" required> <label
									for="bf_nickname" class="font-weight-light"
									style="margin-left: 4rem;">Nickname</label>
							</div>
							<!-- Material input nickname confirm -->
							<div class="col-md-6">
								<input type="text" id="nicknameCK" class="form-control" value=""
									disabled style="border-bottom: none">
							</div>
						</div>

						<!-- Material input email -->
						<div class="md-form row" style="margin-bottom: 0px">
							<input type="hidden" name="email" id="email"
								value="${login.email}">
							<div class="col-md-8">
								<i class="fa fa-envelope prefix grey-text"></i> <input
									type="text" name="bf_email" id="bf_email"
									value="${login.email}" class="form-control"
									onkeyup="emailCheck()" required> <label for="bf_email"
									class="font-weight-light" style="margin-left: 4rem;">Email</label>
							</div>
							<!-- Material input email confirm -->
							<div class="col-md-4" style="padding: 0px">
								<input type="text" id="emailCK" class="form-control" value=""
									placeholder="*예시 ) abc@abc.com" disabled
									style="border-bottom: none; font-size: 13px">
							</div>
						</div>

						<!-- Material input phone -->
						<div class="md-form row" style="margin-bottom: 0px">
							<input type="hidden" name="phone" id="phone"
								value="${login.phone}">
							<div class="col-md-6">
								<i class="fa fa-phone-square prefix grey-text"></i> <input
									type="text" onkeyup="phoneCheck()" name="bf_phone"
									id="bf_phone" class="form-control" value="${login.phone}" required> <label
									for="bf_phone" class="font-weight-light"
									style="margin-left: 4em">Phone</label>
							</div>
							<div class="col-md-6">
								<input type="text" id="phoneCK" class="form-control" value=""
									placeholder="예시 ) 000-0000-0000" disabled
									style="border-bottom: none">
							</div>
						</div>

						<!-- Material input address -->
						<div class="md-form row">
							<input type="hidden" name="address" id="address"
								value="${login.address}">
							<div class="col-md-8">
								<i class="fa fa-address-book prefix grey-text"></i> <input
									class="form-control" type="text" id="address_num"
									name="address_num" placeholder="Address Number"
									readonly="readonly" required style="border-bottom: none">
							</div>
							<div class="col-md-4">
								<button type="button"
									class="btn btn-outline-secondary waves-effect px-3"
									onclick="sample6_execDaumPostcode()">
									<i class="fa fa-search" aria-hidden="true"></i> 주소찾기
								</button>
							</div>
						</div>

						<!-- address search button -->
						<div class="md-form">
							<input class="form-control" type="text" id="address_main"
								name="address_main" placeholder="Confirm your address"
								readonly="readonly" required>
						</div>
						<div class="md-form">
							<input class="form-control" type="text" id="address_detail"
								name="address_detail" value="${login.address}"
								placeholder="Address Detail" required>
						</div>

						<!-- Sign up -->
						<div class="text-center py-4 mt-3">
							<button type="button"
								class="btn btn-outline-secondary waves-effect px-3"
								onclick="regiAf()">수정하기</button>
						</div>

					</div>
					<!-- / Card body -->

				</div>
				<!-- / Login_Box -->
			</div>

		</div>
	</div>
	<!-- / startdiv -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="resources/js/userUpdate.js"></script>
</body>
</html>
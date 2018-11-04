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

		<!-- Login_Box -->
		<div class="card" style="margin-left: 10%; margin-right: 10%">

			<!-- Card body -->
			<div class="card-body "
				style="padding: 15%; padding-top: 5%; padding-bottom: 5%">
				<!-- Material input text -->
				<div class="md-form row" style="margin-bottom: 0px">
					<input type="hidden" name="id" id="id" value="">
					<div class="col-md-8">
						<i class="fa fa-user prefix grey-text"></i> <input type="text"
							name="bf_id" id="bf_id" class="form-control" required> <label
							for="bf_id" class="font-weight-light"
							style="margin-left: 3.5rem;">Your id</label>
					</div>
					<div class="col-md-4">
						<button type="button"
							class="btn btn-outline-secondary waves-effect px-3"
							onclick="idcheck()">
							<i class="fa fa-check-square-o" aria-hidden="true"></i> 중복확인
						</button>
					</div>
				</div>

				<div class="md-form row" style="margin-top: 0px">
					<div class="col-md-6">
						<input type="text" id="idCK" name="idCK" class="form-control"
							value="" disabled style="border-bottom: none">
					</div>
				</div>

				<!-- Password confirm -->
				<div class="md-form row" style="margin-bottom: 0px; margin-top: 0px">
					<!-- Material input password -->
					<div class="col-md-6">
						<i class="fa fa-lock prefix grey-text"></i> <input type="password"
							name="pwd" id="pwd" class="form-control" onkeyup="pwcheck()"
							required> <label for="pwd" class="font-weight-light"
							style="margin-left: 3.5rem;"> Your password</label>
					</div>
					<!-- Material input password confirm -->
					<div class="col-md-6">
						<i class="fa fa-lock prefix grey-text"></i> <input type="password"
							id="pwd2" class="form-control" onkeyup="pwcheck()" required>
						<label for="pwd2" class="font-weight-light"
							style="margin-left: 3.5rem;"> Your password confirm</label>
					</div>
				</div>

				<!-- Material input password confirm message -->
				<div class="md-form row" style="margin-top: 0px;">
					<input type="text" id="pwdResult" class="form-control" value=""
						placeholder="*비밀번호 (영어,숫자를 포함한 8~15자)" disabled
						style="border-bottom: none">
				</div>

				<!-- Material input name -->
				<div class="md-form">
					<i class="fa fa-user prefix grey-text"></i> <input type="text"
						name="name" id="name" class="form-control" required> <label
						for="name" style="margin-left: 3em" class="font-weight-light">Name</label>
				</div>

				<!-- Material input nickname -->
				<div class="md-form row" style="margin-bottom: 0px">
					<input type="hidden" name="nickname" id="nickname" value="">
					<div class="col-md-6">
						<i class="fa fa-user prefix grey-text"></i> <input type="text"
							name="bf_nickname" id="bf_nickname" class="form-control"
							onkeyup="nickCheck()" required> <label for="bf_nickname"
							class="font-weight-light" style="margin-left: 4rem;">Nickname</label>
					</div>
					<!-- Material input nickname confirm -->
					<div class="col-md-6">
						<input type="text" id="nicknameCK" class="form-control" value=""
							disabled style="border-bottom: none">
					</div>
				</div>

				<!-- Material input email -->
				<div class="md-form row" style="margin-bottom: 0px">
					<input type="hidden" name="email" id="email" value="">
					<div class="col-md-6">
						<i class="fa fa-envelope prefix grey-text"></i> <input type="text"
							name="bf_email" id="bf_email" class="form-control"
							onkeyup="emailCheck()" required> <label for="bf_email"
							class="font-weight-light" style="margin-left: 4rem;">Email</label>
					</div>
					<!-- Material input email confirm -->
					<div class="col-md-6">
						<input type="text" id="emailCK" class="form-control" value=""
							placeholder="*예시 ) abc@abc.com" disabled
							style="border-bottom: none">
					</div>
				</div>

				<!-- Material input phone -->
				<div class="md-form row" style="margin-bottom: 0px">
					<input type="hidden" name="phone" id="phone" value="">
					<div class="col-md-6">
						<i class="fa fa-phone-square prefix grey-text"></i> <input
							type="text" onkeyup="phoneCheck()" name="bf_phone" id="bf_phone"
							class="form-control" required> <label for="bf_phone"
							class="font-weight-light" style="margin-left: 4em">Phone</label>
					</div>
					<div class="col-md-6">
						<input type="text" id="phoneCK" class="form-control" value=""
							placeholder="예시 ) 000-0000-0000" disabled
							style="border-bottom: none">
					</div>
				</div>

				<!-- Material input address -->
				<div class="md-form row">
					<input type="hidden" name="address" id="address" value="">
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
						name="address_detail" placeholder="Address Detail" required>
				</div>

				<p style="font-size: 0.8em; color: gray">-아동(만 14세 미만)은 본인인증 후
					부모님(법정대리인)동의가 필요합니다.</p>

				<!-- Sign up -->
				<div class="text-center py-4 mt-3">
					<button type="button"
						class="btn btn-outline-secondary waves-effect px-3"
						onclick="regiAf()">Sign Up</button>
				</div>

			</div>
			<!-- / Card body -->
		</div>
		<!-- / Login_Box -->
	</div>
	<!-- / startdiv -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="resources/js/regist.js"></script>
</body>
</html>
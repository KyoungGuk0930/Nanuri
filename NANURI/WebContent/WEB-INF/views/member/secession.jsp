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
		<!-- layout_border -->
		<div class="row">

			<!-- left bar -->
			<div style="width: 220px;">
				<div
					style="margin-top: 70px; border: 1px solid #CCCCCC; margin-right: 30px;">
					<jsp:include page="mypage_leftbar.jsp" />
				</div>
			</div>
			<!-- / left bar -->

			<!-- main content -->
			<div style="width: 880px;">

				<!-- main head -->
				<div class="row"
					style="border-bottom: 1px solid #CCCCCC; padding-bottom: 10px">
					<div class="col-md-8"></div>
					<div class="col-md-4" style="text-align: right; padding-top: 15px">
						<a href="main.do">메인</a> > <a href="mypage.do">마이페이지</a> > <a
							href="secession.do">회원탈퇴</a>
					</div>
				</div>
				<jsp:include page="mypage_header.jsp" />
				<!-- main view -->
				<form action="secessionAf.do" method="post">
					<input type="hidden" id="del_id" name="del_id" value="${login.id} ">
					<div class="form-group" style="margin-top: 10px">
						<div
							style="border: solid 2px #542f82; padding: 15px; margin-bottom: 10px">
							<p style="font-size: 0.9em">
								- 대여중인 물품이나 배송중 상태에서는 회원탈퇴를 신중하게 진행해 주시기 바랍니다.<br> - 회원탈퇴시
								물품 상황을 고려하여 <b style="color: red;">7일간의 사용자의 데이터를 보관</b>합니다. <br>
								- 회원탈퇴 진행 후 7일 사이에 복원의뢰를 통한 계정복구가 가능합니다. <br> - 회원탈퇴시 <b
									style="color: red;">탈퇴사유를 필수입력란</b>입니다. <br> - 탈퇴사유는 보다 나은
								서비스를 위한 자료로 사용하게 됩니다.
							</p>
						</div>
						<textarea class="form-control" name="del_reason" id="del_reason"
							rows="7"></textarea>
					</div>
					<div align="center">
						<button type="button" data-toggle="modal" data-target="#modalPush">회원탈퇴</button>
					</div>
				</form>

			</div>
			<!-- / main content -->
		</div>
		<!-- / layout_border -->
	</div>
	<!-- / startdiv -->
	<jsp:include page="secession_modal.jsp" />
	<script type="text/javascript" src="resources/js/secession.js"></script>
</body>
</html>
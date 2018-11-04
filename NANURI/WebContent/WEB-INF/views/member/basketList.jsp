<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<!-- Main Header -->
				<div class="row"
					style="border-bottom: 1px solid #CCCCCC; padding-bottom: 10px">
					<div class="col-md-8"></div>
					<div class="col-md-4" style="text-align: right; padding-top: 15px">
						<a href="main.do">메인</a> > <a href="mypage.do">마이페이지</a> > <a
							href="basketList.do">장바구니 목록</a>
					</div>
				</div>
				<jsp:include page="mypage_header.jsp" />
				<!-- / Main Header -->
				<div>
				<input type="hidden" id="loginId" value="${login.id }"/>
					<span style="float: left; padding: 10px"><font
						style="font-weight: bold;">${fn:length(list)}</font>개의 상품이
						조회되었습니다.</span>
					<table
						style="width: 100%; text-align: center; margin-top: 10px; border: solid 1px">
						<colgroup>
							<col width="3%">
							<col width="15%">
							<col width="30%">
							<col width="10%">
							<col width="10%">
							<col width="12%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<tr style="background-color: #E6E6E6">
							<th><input type="checkbox" id="alldel" name="delck"
								onclick="deletechecks(this.checked)"></th>
							<th colspan="2">이미지 / 상품설명</th>
							<th>구매수량</th>
							<th>대여기간</th>
							<th>상품금액</th>
							<th>주문</th>
						</tr>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="7" style="text-align: center; padding: 100px">장바구니에
										담긴 상품이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list" varStatus="status">
									<tr>
										<td><input type="checkbox" name="delck"
											onclick="totalPrice()" value="${list.seq }"></td>
										<td colspan="2"><a
											href="memToGoods_Detail.do?g_code=${list.g_code }"> <c:choose>
													<c:when test="${list.g_img eq null}">
														<img alt=""
															src="http://k-startup.go.kr/images/homepage/prototype/noimage.gif"
															style="width: 80; height: 80">
													</c:when>
													<c:otherwise>
														<img alt="" src="resources/img/main_img/${list.g_img}"
															style="width: 80; height: 80">
													</c:otherwise>
												</c:choose></a> <a href="memToGoods_Detail.do?g_code=${list.g_code }">/
												${list.g_name }</a></td>
										<td>${list.amount}개</td>
										<td>${list.month}개월</td>
										<td><fmt:formatNumber value="${list.sum_price }"
												pattern="#,###" />원</td>
										<td><input type="button"
											onclick="basketListDel(${list.seq})" value="삭제"></td>
									</tr>
									<input type="hidden" name="data" value="${list.g_code},${list.amount},${list.month},${list.sum_price}/"/>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="row" style="margin: 10px; float: right;">
						<input type="button" onclick="basketListDel(-1)" value="선택모두삭제">
					</div>

					<!-- Total Cost Info -->
					<div class="number_box_baskit">
						<div class="number_node">
							<h3>주문금액</h3>
							<span id="g_price">0원</span>
						</div>
						<div class="number_node">
							<h3>배송비</h3>
							<span id="d_cost">0원</span>
						</div>
						<div class="number_node" style="width: 34%;">
							<h3>결제금액</h3>
							<span id="total_price">0원</span>
						</div>
					</div>
					<div class="row" style="float: right; margin: 10px">
						<input type="button" onclick="selectOrder()" value="선택상품주문"> <input
							type="button" onclick="integralOrder()" value="전체주문">
					</div>
				</div>
				<!-- / main view -->
			</div>
			<!-- / main content -->
		</div>
		<!-- / layout_border -->
	</div>
	<!-- / startdiv -->
	<script type="text/javascript" src="resources/js/basketList.js"></script>
</body>
</html>
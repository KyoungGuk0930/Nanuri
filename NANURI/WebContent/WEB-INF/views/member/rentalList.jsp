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
							href="rentalList.do">구매 목록</a>
					</div>
				</div>
				<jsp:include page="mypage_header.jsp" />
				<!-- / Main Header -->
				<div>
					<span style="float: left; padding: 10px"><font
						style="font-weight: bold;">${fn:length(list)}</font>개의 결제내역이
						조회되었습니다.</span>
					<table
						style="width: 100%; text-align: center; margin-top: 10px; border: solid 1px">
						<colgroup>
							<col width="3%">
							<col width="10%">
							<col width="17%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<tr style="background-color: #E6E6E6">
							<th><input type="checkbox" id="alldel" name="delck"
								onclick="deletechecks(this.checked)"></th>
							<th>상품번호</th>
							<th colspan="2">이미지 / 상품설명</th>
							<th>구매수량</th>
							<th>대여일</th>
							<th>반납일</th>
							<th>결제금액</th>
							<th>상태</th>
							<th>리뷰</th>
						</tr>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="10" style="text-align: center; padding: 100px">구매내역이
										없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list" varStatus="status">
									<c:set var="now" value="<%=new java.util.Date()%>" />
									<fmt:parseDate var="e_date" value="${list.e_date}"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
									<fmt:formatDate var="e_date" value="${e_date}"
										pattern="yyyy-MM-dd" />
									<tr>
										<td><c:if test="${today > e_date}">
												<input type="checkbox" name="delck" value="${list.seq }">
											</c:if></td>
										<td>${list.order_num}</td>
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
										<td>${list.amount}</td>
										<td>${list.s_date.toString().substring(0,10)}</td>
										<td>${list.e_date.toString().substring(0,10)}</td>
										<td><fmt:formatNumber value="${list.total_price }"
												pattern="#,###" />원</td>
										<td><c:choose>
												<c:when test="${today > e_date}">
													<span style="font-weight: bold">대여만료</span>
													<br>
													<a href="javascript:basketListDel(${list.seq})">[ <i
														class="fa fa-trash" aria-hidden="true"></i> ]
													</a>
												</c:when>
												<c:otherwise>
													<span style="font-weight: bold"> 대여중 </span>
												</c:otherwise>
											</c:choose></td>
										<td><a href="reviewwrite.do?g_code=${list.g_code}"><i
												class="fa fa-hand-o-right" aria-hidden="true"></i>리뷰작성</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="row" style="margin: 10px; float: right;">
						<input type="button" onclick="rentalListDel(-1)" value="선택 모두 삭제">
					</div>
				</div>

			</div>
			<!-- / main content -->
		</div>
		<!-- / layout_border -->
	</div>
	<!-- / startdiv -->
	<script type="text/javascript" src="resources/js/rentalList.js"></script>
</body>
</html>
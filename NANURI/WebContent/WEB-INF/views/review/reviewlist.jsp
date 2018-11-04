<%@page import="com.kh.finalPJ.goods.goodsBbsDto"%>
<%@page import="com.kh.finalPJ.review.reviewDao"%>
<%@page import="com.kh.finalPJ.review.reviewDaoImpl"%>
<%@page import="com.kh.finalPJ.review.reviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String category = (String) request.getAttribute("s_category");
		if (category == null) {
			category = "";
		}
		
	%>
	<script type="text/javascript">
	function goPage(pageNumber) {
		$("#_pageNumber").val(pageNumber);
		$("#_frmFormSearch").attr("target", "_self").attr("action",	"reviewlist.do").submit();
	}
	</script>
	<input type="hidden" id="loginId" value="${login.id }">
	<div class="startdiv">
		<form id="_frmFormSearch" method="get" action="">
			<!-- 페이징 -->
			<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}" />
			<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"	value="${(empty recordCountPerPage)?5:recordCountPerPage}" />

			<!--검색부분 -->
			<div align="center">
				<select id="_s_category" name="s_category" class="browser-default custom-select" style="width: 95px">
					<option value="" selected="selected">선택</option>
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="userid">작성자</option>
				</select>
				<input type="text" class="form-control" style="width: 200px; display: inline;" id="_s_keyword" name="s_keyword" value="${s_keyword}" />

				<button type="button" id="_btnSearch" class="btn btn-purple">검색</button>
			</div>
		</form>
		<br>
		<c:choose>
			<c:when test="${empty reviewlist}">
				<div align="center">등록된 상품 리뷰가 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${reviewlist}" var="list" varStatus="status">
					<fmt:parseNumber value="${list.rating}" type="number" var="rating" />
					<ul class="review">
						<li>
							<!-- 상품이미지 -->
							<div class="img" id="">
								<c:choose>
									<c:when test="${list.g_img eq null}">
										<img alt=""	src="http://k-startup.go.kr/images/homepage/prototype/noimage.gif"
											style="width: 80; height: 80">
									</c:when>
									<c:otherwise>
										<img alt="" src="resources/img/main_img/${list.g_img }"	style="width: 80; height: 80">
									</c:otherwise>
								</c:choose>
							</div>
							 <!-- / 상품이미지 -->
							 <!-- 상품디테일 -->
							 <a data-toggle="modal" data-target="#viewModal" onclick="modal_view('${list.seq}','${list.g_img}','${list.id}','${list.wdate}','${list.title}','${list.rating}' ,'<c:out value="${list.content }" escapeXml="true" />','${list.g_code }');">
								<div class="text_view" style="cursor: pointer;">
									<div class="title">${list.title }</div>

									<!-- 별점 점수 -->
									<div class="star" style="font-size: 14px">별점수:${list.rating }&nbsp;점</div>
									<div class="starRev">
										<c:forEach var="j" begin="1" end="10" step="1">
											<c:choose>
												<c:when test="${j%2 eq 1}">
													<c:choose>
														<c:when test="${j <= rating}">
															<span class="starR1 on"></span>
														</c:when>
														<c:otherwise>
															<span class="starR1"></span>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:when test="${j%2 eq 0}">
													<c:choose>
														<c:when test="${j <= rating}">
															<span class="starR2 on"></span>
														</c:when>
														<c:otherwise>
															<span class="starR2"></span>
														</c:otherwise>
													</c:choose>
												</c:when>
											</c:choose>
										</c:forEach>
									</div>
									<input type="hidden" name="rating" id="rating" value="${rating }">
									<!-- 별점 끝 -->
								</div>
						</a>
							<div class="idbox">
								<p class="id">${list.id}</p>
								<fmt:parseDate var="wdate" value="${list.wdate}" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${wdate}" pattern="yyyy-MM-dd" />
							</div>
						</li>
					</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<br>
	<!-- 페이징 처리 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/review/paging.jsp" flush="false">
			<jsp:param value="${pageNumber }" name="pageNumber"/>
			<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen" />
			<jsp:param value="${recordCountPerPage }" name="recordCountPerPage" />
			<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
		</jsp:include>
	</div>
	<c:choose>
		<c:when test="${goToDto ne null}">
			<input type="hidden" id="goto_seq" value="${goToDto.seq}">
			<input type="hidden" id="goto_g_img" value="${goToDto.g_img}">
			<input type="hidden" id="goto_id" value="${goToDto.id}">
			<input type="hidden" id="goto_wdate" value="${goToDto.wdate}">
			<input type="hidden" id="goto_title" value="${goToDto.title}">
			<input type="hidden" id="goto_rating" value="${goToDto.rating}">
			<input type="hidden" id="goto_content" value="<c:out value="${goToDto.content}" escapeXml="true" />">
			<input type="hidden" id="goto_g_code" value="${goToDto.g_code}">
		</c:when>
	</c:choose>
	<script>
		$(document).ready(function() {
			if ($("#goto_seq").val() > 0) {
				modal_view($("#goto_seq").val(),$("#goto_g_img").val(),
						$("#goto_id").val(),$("#goto_wdate").val(),
						$("#goto_title").val(),$("#goto_rating").val(),
						$("#goto_content").val(),$("#goto_g_code").val());
				$('#viewModal').modal();
			}
		});

function modal_view(seq, g_img, id, wdate, title, rating, content,g_code) {
	$('#viewModal').on('show.bs.modal',function(event) {
	$("#starRev").empty();
	$("#modal_id").empty();
	$("#modal_title").empty();
	$("#modal_footer").empty();

	if (g_img == null || g_img == "") {
		$(".modal-body #g_img").attr('src',"http://k-startup.go.kr/images/homepage/prototype/noimage.gif");
	} else {
		$(".modal-body #g_img").attr('src',"resources/img/main_img/" + g_img);
	}
	$("#_seq").val(seq);
	$(".modal-body #modal_id").append("<font style='font-weight: bold;'>ㅣ</font>작성자 : "+ id);
	$(".modal-body #modal_wdate").text(wdate.toString().substring(0, 16));
	$(".modal-body #modal_title").append("<p style='font-size: 1.3em; font-weight: bold'>"+ title + "</p>");
	$(".modal-body #_rating").val(rating);
	$(".modal-body #content").html(content);
	$("#_g_code").val(g_code);

	for (var i = 1; i <= 10; i++) {
		if (i % 2 == 1) {
			if (i <= rating) {
				$("#starRev").append("<span class='starR1 on'></span>");
			} else {
				$("#starRev").append("<span class='starR1'></span>");
			}
		} else if (i % 2 == 0) {
			if (i <= rating) {
				$("#starRev").append("<span class='starR2 on'></span>");
			} else {
				$("#starRev").append("<span class='starR2'></span>");
			}
		}
	}

	$("#modal_footer").append("<input type='button' class='btn btn-outline-secondary waves-effect px-3' value='해당 상품으로' onclick='goodsdetail()'>");
	if (id == $("#loginId").val()) {
		$("#modal_footer").append("<input type='button' class='btn btn-outline-secondary waves-effect px-3' value='수정' onclick='updateview()'>");
		$("#modal_footer").append("<input type='button' class='btn btn-outline-secondary waves-effect px-3' value='삭제' onclick='deletereview()'>");
	}
	//$("#modal_footer").append("<button type='button' class='btn btn-outline-secondary waves-effect px-3' data-dismiss='modal'>닫기</button>");
});
		}
	</script>
	<script type="text/javascript">


		$("#_btnSearch").click(function() {
			//alert('search');						
			$("#_frmFormSearch").attr({
				"target" : "_self",
				"action" : "reviewlist.do"
			}).submit();

		});

		/* 검색 카테고리를 유지 start */
		var str = ${category};

		$(document).ready(function() {
			//document.frmForm1.s_category.value = str;
			$("#_s_category").val(str);

			// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
			if ($("#_s_keyword").val().trim() == "") {
				//document.frmForm1.s_category.value = "";
				$("#_s_category").val("");
			}
		})
	</script>
	<jsp:include page="reviewDetail_Modal.jsp" />
</body>
</html>
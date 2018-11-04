<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row"
	style="border-bottom: 1px solid #CCCCCC; padding-bottom: 20px; padding-top: 10px;">
	<div class="col-md-4"
		style="background: url('https://user-images.githubusercontent.com/38531104/47497903-89990100-d896-11e8-9240-f9e028b6a85a.png');">
		<div class="row" style="margin-top: 10%">
			<div class="col-md-4">
				<img style="width: 100%" alt=""
					src="https://user-images.githubusercontent.com/38531104/47561767-2fac4000-d957-11e8-9c2b-41240c2e20ec.png">
			</div>
			<div class="col-md-8">
				<div>
					<p style="margin-bottom: 0px">
						<font style="font-weight: bold; font-size: 30px" color="#542f82">'${login.name }'</font><br>
						님 환영합니다!
					</p>
				</div>
				<div style="border: solid 1px; text-align: center; padding: 2px">
					<a href="rental_category.do?division=BC"><i
						class="fa fa-shopping-cart" aria-hidden="true"></i> 쇼핑하러 가기 >></a>
				</div>
			</div>
		</div>
		<div class="row" align="center">
			<div class="col-md-6" style="padding-right: 0px">
				<p style="font-size: 40px; margin-bottom: 0px">${orderCnt}</p>
				<p style="margin-bottom: 0px">주문내역</p>
			</div>
			<div class="col-md-6" style="padding-left: 0px">
				<p style="font-size: 40px; margin-bottom: 0px">${wishCnt}</p>
				<p style="margin-bottom: 0px">장바구니</p>
			</div>
		</div>
	</div>
	<div class="col-md-4" align="center"
		style="background: url('https://user-images.githubusercontent.com/38531104/47497903-89990100-d896-11e8-9240-f9e028b6a85a.png');">
		<a href="reviewlist.do"> <img
			style="width: 100%; padding-top: 10%; border-bottom: 1px solid #CCCCCC; padding-bottom: 5px; margin-bottom: 5px"
			alt=""
			src="https://user-images.githubusercontent.com/38531104/47624703-88035d80-db62-11e8-9300-3ad9341a12d2.PNG"></a>
		<table style="text-align: left; width: 100%;">
			<colgroup>
				<col width="30px%">
				<col width="250px">
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${empty reviewList}">
						<tr>
							<td colspan="2" style="text-align: center; padding: 10%">등록한
								리뷰가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${reviewList}" var="reviewList"
							varStatus="status">
							<tr style="border-bottom: 1px solid #CCCCCC">
								<th><c:choose>
										<c:when test="${reviewList.g_img eq null}">
											<img alt=""
												src="http://k-startup.go.kr/images/homepage/prototype/noimage.gif"
												style="width: 50px; height: 50px">
										</c:when>
										<c:otherwise>
											<img alt="" src="resources/img/main_img/${reviewList.g_img}"
												style="width: 50px; height: 50px">
										</c:otherwise>
									</c:choose></th>
								<th><a href="reviewlist.do?seq=${reviewList.seq}"><span
										style=" text-overflow: ellipsis; overflow: hidden; White-space: norwap">${reviewList.title}</span></a></th>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

	</div>
	<div class="col-md-4">
		<a href="qnalist.do"> <img style="width: 100%; height: auto"
			alt=""
			src="https://user-images.githubusercontent.com/38531104/47474722-40738d80-d853-11e8-9c64-ce6c3475b328.PNG">
		</a>
		<div style="padding-top: 10px; border-top: solid 1px #CCCCCC;">
			<table style="text-align: left; width: 100%;">
				
				<tbody>
					<c:choose>
						<c:when test="${empty qaList}">
							<tr>
								<td colspan="2" style="text-align: center; padding: 10%">등록된
									공지글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${qaList}" var="qaList" varStatus="status">
								<tr>
									<th>
									<p style="width: 40px;margin: 0;">[공지]</p>
									</th>
									<th>
									<div style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 240px;">
									<a href="qnalist.do">
									<span>${qaList.title}</span></a>
									</div>
									</th>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
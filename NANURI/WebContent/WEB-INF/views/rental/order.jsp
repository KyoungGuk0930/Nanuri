<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.kh.finalPJ.member.RStatusDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8" />

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="resources/js/order.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">

.tit {
	font-size: 16px;
	font-weight: bold;
	color: #222222;
	line-height: normal;
	
	border-bottom: 1px solid #999;
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.buyerInfoContainer, .goodsInfoContainer, .receiptContainer, .priceInfoContainer{
	margin-bottom: 25px;

}

.buyerInfoContainer ul{
	height: 70px; 
	border: 1px solid #dddddd; 
	background: #f8f8f8; 
	padding: 20px; 
}
.buyerInfoContainer li{
	float:left; 
	width: 345px; 
	border-left: 1px solid #dddddd;
	padding-left: 10px;
}

.goodsInfoContainer table{
	border: none;
	text-align: center;
	border-top: 1px solid #ddd;
}
.goodsInfoContainer th{
	padding: 10px 10px 10px 10px;
	border-bottom: 1px solid #ddd;
}
.goodsInfoContainer td{
	padding:20px 20px 20px 20px; 
	heigth: 120px;
	border-bottom: 1px solid #ddd;
}
.goodsInfoContainer img{
	width: 90px;
	height: 90px;
}

#copy{
	margin-left: 45px;
}
#copylabel{
	font-size: 15px;
	font-weight: normal;
	color: #222222;
}

.receiptContainer li{
	margin-bottom: 10px;
}
.receiptContainer label{
	margin: 0px;
	width: 130px;
	height: 36px;
}
.receiptContainer input{
	height:36px;
}
.receiptContainer #phone_f{
	margin-right:5px;
	padding-left:8px;
	height:36px;
	width: 60px;
}
.receiptContainer #phone_m{
	margin-left:5px;
	margin-right:5px;
	padding: 4px 15px 5px 15px;
	width: 95px;
}
.receiptContainer #phone_b{
	margin-left:5px;
	margin-right:5px;
	padding: 4px 15px 5px 15px;
	width: 95px;
}
.receiptContainer #recipient{
	padding: 4px 15px 5px 15px;
	width: 174px;
}
.receiptContainer #address_num{
	padding: 4px 15px 5px 15px;
	width: 174px;
}
.receiptContainer #address_main{
	margin-left: 133px;
	padding: 4px 15px 5px 15px;
	width: 380px;
}
.receiptContainer #address_detail{
	margin-left: 10px;
	padding: 4px 15px 5px 15px;
	width: 260px;
}

.priceInfoContainer{
	display: table;
}
.priceInfoContainer table{
	float:left;
	border: none;
	text-align: center;
	border-top: 1px solid #ddd;
}
.priceInfoContainer th{
	padding: 10px 10px 10px 10px;
	border-bottom: 1px solid #ddd;
}
.priceInfoContainer td{
	padding:20px 20px 20px 20px; 
	heigth: 120px;
	border-bottom: 1px solid #ddd;
}
#iamport_module{
	float: left;
	margin-top: 93px;
	margin-left: 10px;
}
#test_btn{
	float: left;
	margin-top: 93px;
	margin-left: 10px;
}
</style>

</head>
<body>

<!-- 주문 코드 생성 -->
<sql:setDataSource
    url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
    driver="oracle.jdbc.driver.OracleDriver"
    user="final"
    password="final"
    var= "conn"/>
    
<c:set var="now" value="<%=new Date()%>" />
<c:set var="today"><fmt:formatDate value="${now}" pattern="yyMMdd" /></c:set>

<sql:query sql="select SEQ_R_STATUS.nextval from dual" var="getseq" dataSource="${conn}" />
<c:forEach var="seqobj" items="${getseq.rowsByIndex}">
	<c:set var="seq" value="${seqobj[0]}"/>
</c:forEach>
   
<c:set var="merchant_uid" value="S${today}${seq}"/>
<input id="merchant_uid" type="hidden" value="${merchant_uid}">

<!-- 주문 정보 -->
<div class="startdiv">
	<div class="tit">주문자 정보</div>
	<div class=buyerInfoContainer>
		<div>
	  	<ul>
	    	<li style="border-left: none;"><b>주문자</b> ${member.name}</li>
	    	<li><b>연락처</b> ${member.phone}</li>
	    	<li><b>이메일</b> ${member.email}</li>
	  	</ul>
		</div>
	    <input id="buyer" type="hidden" value="${member.name}">
	    <input id="buyer_email" type="hidden" value="${member.email}">
	    <input id="buyer_phone_f" type="hidden" value="${fn:split(member.phone,'-')[0]}">
	    <input id="buyer_phone_m" type="hidden" value="${fn:split(member.phone,'-')[1]}">
	    <input id="buyer_phone_b" type="hidden" value="${fn:split(member.phone,'-')[2]}">
	    <input id="buyer_address_n" type="hidden" value="${fn:split(member.address,'-')[0]}">
	    <input id="buyer_address_m" type="hidden" value="${fn:split(member.address,'-')[1]}">
	    <input id="buyer_address_d" type="hidden" value="${fn:split(member.address,'-')[2]}">
	</div>
	<br>

	
	<div class="tit">주문상품 <span class="num">(${fn:length(goodsList)}개)</span></div>
	<div class="goodsInfoContainer">	
		<table cellspacing="0" >
			<colgroup>
			<!-- 임시 -->
				<col width="130px">
				<col width="450px">
				<col width="80px">
				<col width="270px">
				<col width="150px">
			</colgroup>
			<thead>
				<tr>
					<th>상품 이미지</th>					
					<th>상품정보</th>					
					<th>수량</th>
					<th>기간</th>
					<th>금액</th>					
				</tr>
			</thead>			
			<tbody>	
			<c:forEach var="item" items="${goodsList}" varStatus="status">
				<c:set var="month" value="${orderList[status.index].month}" />
				<%
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
				Date today = new Date();
				Calendar c = Calendar.getInstance();
				c.setTime(today);
				c.add(Calendar.MONTH, Integer.parseInt(pageContext.getAttribute("month").toString()));
				String e_day = format.format(c.getTime());
				%>

				<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
				<c:set var="e_day" value="<%=e_day%>"/>
				<c:set var="price_one" value="${item.g_price*orderList[status.index].amount*orderList[status.index].month }"/>
				<c:set var="total" value="${total+price_one}"/>
				
				<tr>
					<td><img src="resources/img/main_img/${item.g_img }"></td>
					<td>${item.g_name}</td>
					<td>${orderList[status.index].amount}개</td>
					<td>${today}~${e_day }</td>
					<td><fmt:formatNumber value="${price_one}" pattern="￦#,###" ></fmt:formatNumber></td>
				</tr>
				<c:set var="data" value="${data}${item.g_code},${member.id},${orderList[status.index].amount},${orderList[status.index].month},${price_one},${merchant_uid}/"/>
			</c:forEach>
			</tbody>
		</table>
		<input id="data" type="hidden" value='${data}' >
		<input id="total_price" type="hidden" value='${total}' >
	</div>
	<br>
	
	
	<div class="tit">배송지 정보 <input id="copy" type="checkbox"><label id="copylabel" for="copy">주문자와 동일</label><br></div>
	<div class="receiptContainer">
		<ul>
			<li>
				<label for="recipient">수령인</label>
				<input id="recipient" type="text"> <br>		
			</li>
			<li>
				<label for="phone_container">전화번호</label>
				<div id="phone_container" style="display: inline-block;">
					<select id="phone_f">
						<option selected="selected">010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>-
					<input id="phone_m" type="text" value="">-<input id="phone_b" type="text" value="">
				</div>
				</li>
				<li>
				<div id="address_container">
					<input type="hidden" name="address" id="address" value="">					
					<label>주소</label>	
					<input type="text" id="address_num" name="address_num" placeholder="Address Number"	readonly="readonly" >					
					<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
					<br>
					<input type="text" id="address_main" name="address_main" placeholder="Confirm your address" readonly="readonly" >
					<input type="text" id="address_detail" name="address_detail" placeholder="Address Detail" >
				</div>
				</li>
		</ul>
	</div>
	
	<div class="tit">결제 정보</div>
	<div class="priceInfoContainer">
		<table cellspacing="0">			
			<tbody>
				<colgroup>
					<col width="150px">
					<col width="150px">
					<col width="150px">
				</colgroup>
				<tr>
					<td>상품금액</td>
					<td>배송비</td>
					<td>최종결제금액</td>
				</tr>					
				<tr>
					<td><fmt:formatNumber value="${total}" pattern="￦#,###" ></fmt:formatNumber></td>
					<td><fmt:formatNumber value="4500" pattern="￦#,###" ></fmt:formatNumber></td>
					<td><fmt:formatNumber value="${total+4500}" pattern="￦#,###" ></fmt:formatNumber></td>
				</tr>
			</tbody>
		</table>
	<button id="test_btn" type="button">결제 안하고 저장하기</button>
	<button id="iamport_module" type="button" >결제하기</button>
	</div>

</div>
</body>
</html>


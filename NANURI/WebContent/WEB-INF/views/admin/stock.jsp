<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<div class="admin_box">


<fieldset><legend><h1>Stock</h1></legend>

<div>
    <table>
    <colgroup>
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
    </colgroup>
	<tr>
	  <td>상품코드</td>
  	  <td>상품명</td>
  	  <td>렌트 가격</td>
  	  <td>이미지</td>
  	  <td>총 갯수</td>
  	  <td>대여 중인 갯수</td>
	</tr>
    <c:forEach var="goods" items="${goodsList}" varStatus="goodsS">
	  <tr class="stock_col">
	  	<td id="g_code">${goods.g_code}</td>
	  	<td id="g_name" contenteditable="true">${goods.g_name}</td>
	  	<td id="g_price" contenteditable="true">${goods.g_price}</td>
	  	<c:choose>
	  	  <c:when test="${goods.g_img eq null}">
        	<td><form style="display: inline"><input name="change_imgF" type="file" style="width: 0px"></form></td>
	  	  </c:when>
	  	  <c:otherwise>
    		<td id="g_img">${goods.g_img}</td>
	  	  </c:otherwise>
	  	</c:choose>
	  	<td id="g_quantity" contenteditable="true">${goods.g_quantity}</td>
	  	<td contenteditable="false"></td>
	  </tr>
    </c:forEach>
  </table>
  <br>
  
  <form action="goodsRegist.do" enctype="multipart/form-data" method="post">
  <table>
    <colgroup>
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
    </colgroup>
    <tr>
	  <td><input name="g_code" type="text" placeholder="상품코드" style="width: 150px"></td>
	  <td><input name="g_name" type="text" placeholder="상품명" style="width: 150px"></td>
	  <td><input name="g_price" type="text" placeholder="가격" style="width: 150px"></td>
  	  <td><input name="g_imgF" type="file" accept="image/gif,image/jpeg,image/png" style="width: 76px"></td>
  	  <td></td>
  	  <td><input type="submit" value="상품 추가"></td>
		</tr>
  </table>
  </form>
  
<p>검색 결과 : ${fn:length(goodsList)} </p>
</div>
<script type="text/javascript" src="resources/js/stock.js"></script>

</fieldset>

</div>

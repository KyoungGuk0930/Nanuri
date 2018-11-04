<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<div class="admin_box">
    
<div>
  <h1>GoodsApply</h1>
  <form action="goodsApplyAf.do" enctype="multipart/form-data" method="post">
    <table>
      <tr>
        <td>goods:</td> 
        <td>
          <select name="g_code">
            <c:forEach var="code" items="${codeList}">
	            <option>${code}</option>
            </c:forEach>
          </select>
        </td>
	  </tr>

      <tr>
        <td>제목:</td> 
        <td>
          <input name="title" type="text">
        </td>
	  </tr>
	  
	  <tr>
	    <td>img:</td>
        <td><input name="sub_imgs" multiple="multiple" type="file"></td>
      <tr>
      
      <tr>
	    <td>내용:</td>
        <td><input name="content_img" type="file"></td>
      <tr>
    </table>
	  <fieldset style="width: 500px;"><legend>내용 미리보기</legend>
 	  <img id="preview" src=""/ style="width: 100%; ">
	  </fieldset>
    <input type="submit">
  </form>
</div>
<script type="text/javascript" src="resources/js/goodsApply.js"></script>
</div>
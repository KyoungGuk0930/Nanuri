<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<div class="admin_box">

<div>

<h1>회원정보</h1>
<div>
  <table>
    <colgroup>
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="200px">
      <col width="200px">
      <col width="400px">
    </colgroup>
	<tr>
	  <td>ID</td>
  	  <td>NAME</td>
  	  <td>NICKNAME</td>
  	  <td>EMAIL</td>
  	  <td>PHONE</td>
  	  <td>ADDRESS</td>
	</tr>
    <c:forEach var="member" items="${memberlist}" varStatus="memberS">
	  <tr>
	  	<td>${member.id}</td>
	  	<td>${member.name}</td>
	  	<td>${member.nickname}</td>
	  	<td>${member.email}</td>
	  	<td>${member.phone}</td>
	  	<td>${member.address}</td>
	  </tr>
    </c:forEach>
  </table>
  
  <p>검색 결과 : ${fn:length(memberlist)} </p>
</div>
</div>	
</div>
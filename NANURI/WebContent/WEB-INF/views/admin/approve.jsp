<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<div class="admin_box">

<h1>탈퇴승인</h1>
<div>
  <table>
    <colgroup>
      <col width="150px">
      <col width="150px">
      <col width="200px">
      <col width="200px">
      <col width="250px">
      <col width="100px">
      <col width="100px">
    </colgroup>
	<tr>
	  <td>ID</td>
  	<td>REASON</td>
  	<td>탈퇴 신청</td>
  	<td>탈퇴 수행 가능</td>
  	<td>상태</td>
  	<td>탈퇴 승인</td>
  	<td>복구</td>
  	  
	</tr>
    <c:forEach var="secession" items="${secessionList}" varStatus="secessionS">
	  <tr>
	  	<td>${secession.del_id}</td>
	  	<td>${secession.del_reason}</td>
	  	<td>${secession.del_sdate.toString().substring(0,10)}</td>
	  	<td>${secession.del_edate.toString().substring(0,10)}</td>

	  	<c:if test="${secession.status==0 }">
	  	  <td>삭제 대기중</td>
			
		  <!-- 삭제 신청 후 7일이 지났을 경우 삭제 버튼 활성화 -->
	  	  <c:set var="now" value="<%=new java.util.Date()%>"/>
		  <fmt:parseDate var="e_date" value="${secession.del_edate}" pattern="yyyy-MM-dd" />
		
		  <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />  
		  <fmt:formatDate var="e_date" value="${e_date}" pattern="yyyy-MM-dd" />
		
		  <c:if test="${today <= e_date}">
  		    <td><button name="approve" disabled>승인</button></td>
		  </c:if>
		  <c:if test="${today > e_date}">
		    <td><button name="approve" onclick="dateCk('${secession.del_id}')">승인</button></td>
		  </c:if>
		  
		  <td><button onclick="restore('${secession.del_id}')">복구</button></td>
	   	</c:if>
	  	
	  	<c:if test="${secession.status==1 }">
	  	  <td>삭제 완료</td>
	  	  <td>삭제 완료</td>
	  	</c:if>

	  </tr>
    </c:forEach>
  </table>
  
  <p>검색 결과 : ${fn:length(secessionList)} </p>
  
<script type="text/javascript">
  function dateCk(id){
	var ck = confirm("정말 승인 하시겠습니까?");
	if(ck){
	  location.href="finalSecession.do?id="+id;
	}
  } 
  
  function restore(id) {
	var ck = confirm("정말 복구 하시겠습니까?");
	if(ck){
	  location.href="restoreMember.do?id="+id;
	}
  }

</script>   
</div>
</div>
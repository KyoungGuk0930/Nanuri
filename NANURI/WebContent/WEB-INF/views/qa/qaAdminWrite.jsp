<%@page import="com.kh.finalPJ.member.memberDto"%>
<%@page import="com.kh.finalPJ.qa.qaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%memberDto mem = (memberDto)session.getAttribute("login"); %>
<div class="startdiv">
	<div style="font-style: italic; padding-left: 0px; font-size: 35; padding-bottom: 12px; font-size: 42px;">
		Q&A 공지사항
	</div>

	<div style="width: 1080;; margin: 0px auto;">
		<form action="qaAdminWriteAf.do" id="_frmForm" method="post">
			<div style="padding-left: 30px; border-top: 1px solid #e1e1e1; padding-top: 8px;">
				<label style="margin-left: -16;">아이디</label>
				<input type="text" name="id" value="<%=mem.getId()%>" style="margin-left: 15; width: 189px; border-radius: 3px; border: 1px solid #ccc;" readonly="readonly"><br>
			</div>
			<div style="padding-left: 30px; border-top: 1px solid #e1e1e1; border-bottom: 1px solid #e1e1e1; padding-top: 8px;
	   					padding-bottom: 5px; margin-top: 5px; margin-bottom: 5px;">
				<label style="margin-left: -16;">제목</label>
				<input type="text" name="title" style="margin-left: 31px; width: 348px; border-left: none; border-radius: 3px; border: 1px solid #ccc;" required><br>								
			</div>	
			<label style="padding-left: 30px; margin-left: -16;" >내용</label>
			<div style="padding-left: 30px;">
				<textarea rows="10" cols="50" name="content" style="width: 1080px; text-decoration: none; outline: none; resize: none; border-radius: 3px; border: 1px solid #ccc; height: 404px;"  required ></textarea><br>
			</div>
			<div align="center" style="padding-top: 13px;">
			<input type="submit"  value="등록">
			&nbsp;&nbsp;
			<input type="button" onclick="cancel()" value="취소">	
			</div>
		</form>	
	</div>
</div>

<script type="text/javascript">
function cancel() {
	location.href="qnalist.do";
}
</script>


</body>
</html>
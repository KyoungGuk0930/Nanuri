<%@page import="com.kh.finalPJ.member.memberDto"%>
<%@page import="com.kh.finalPJ.qa.qaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		memberDto mem = (memberDto) session.getAttribute("login");
	%>
	<%
		String g_code = null;
		int g_seq = -1;
	%>
	<%
		if (request.getAttribute("g_code") != null) {
			g_code = (String) request.getAttribute("g_code");
			g_seq = (int) request.getAttribute("g_seq");
			System.out.println("g_code = " + g_code);
		}
	%>


	<div class="startdiv">
		<div
			style="font-style: italic; width: 1080px; margin: 0px auto; font-size: 47px;">
			Q&A 글쓰기</div>
		<div style="width: 1080px; margin: 0px auto;">
			<form action="qaWriteAf.do" id="_frmForm" method="post">
				<div style="border-top: 1px solid #e1e1e1; padding-top: 8px;">
					<label style="margin-left: 14px; width: 80;">아이디</label> <input
						type="text" name="id" value="<%=mem.getId()%>"
						style="margin-left: 15; width: 189px; border-radius: 3px; border: 1px solid #ccc;"
						readonly="readonly"> <label style="margin-left: 12px;">비공개</label>
					<input type="checkbox" id="check" name="check"
						style="margin-left: 5;"> <br>
				</div>
				<div
					style="border-top: 1px solid #e1e1e1; border-bottom: 1px solid #e1e1e1; padding-top: 8px; padding-bottom: 5px; margin-top: 5px; margin-bottom: 5px;">
					<label style="margin-left: 14px; width: 80;">제 목</label> <input
						type="text" name="title"
						style="margin-left: 15px; width: 348px; border-left: none; border-radius: 3px; border: 1px solid #ccc;"
						required><br>
				</div>
				<label style="margin-left: 14px;">내용</label>
				<div>
					<textarea rows="10" cols="50" name="content"
						style="width: 1080px; text-decoration: none; outline: none; resize: none; border-radius: 3px; border: 1px solid #ccc; height: 404px;"
						required></textarea>
					<br>
				</div>
				<div align="center" style="padding-top: 12px;">
					<input type="submit" value="완료">
					<%
						if (g_code != null) {
					%>
					<input type="hidden" name="g_code" value="<%=g_code%>"> <input
						type="hidden" name="g_seq" value="<%=g_seq%>">
					<%
						} else {
					%>
					<input type="hidden" name="g_seq" value="<%=g_seq%>">
					<%
						}
					%>
					&nbsp;&nbsp; <input type="button" onclick="cancel()" value="취소">
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
function cancel() {
	<%if (g_code != null) {%>
		location.href="goodsdetail.do?seq=<%=g_seq%>&g_code=<%=g_code%>";		
	<%} else {%>
		location.href = "qnalist.do";
	<%}%>
		}
	</script>


</body>
</html>












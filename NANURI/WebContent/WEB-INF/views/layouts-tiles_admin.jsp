<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--	request.setCharacterEncoding("utf-8"); --%>

<fmt:requestEncoding value="utf-8" />

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript"
	src="resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="resources/bootstrap/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="resources/bootstrap/js/mdb.min.js"></script>

<!-- <!DOCTYPE html> 이게 들어가 있어서 작게 나옴 이거 없으면 꽉 찬 화면으로 나옴-->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 상속 -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<link rel="shortcut icon" href="resources/img/icon_title.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">

</head>
<body>
	
<%-- 	<table style="width: 100%" >
		<tr align="center">
			<td height="10%" colspan="2">
				<!-- 위쪽의 위치설정 (header).. (name에따라서 동작시키게 만듬)-->
				<tiles:insertAttribute name="header"/>
			</td>
		</tr>
		<tr> <!-- menu , content  -->
			<td height="10%" width="20%" align="left" valign="top">
				<!-- menu -->
				<tiles:insertAttribute name="menu"/>
			</td>
			<td>
				<!-- 70%에 해당하는 content -->
				<tiles:insertAttribute name="content"/>
			</td>
		</tr>
		<tr align="center">
			<td height="10%" colspan="2">
				<!-- footer -->
				<tiles:insertAttribute name="footer"/>
			</td>
		</tr>
	
	</table>
 --%>
	<div class="admin_header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="admin_content">
		<tiles:insertAttribute name="menu"/>
		<tiles:insertAttribute name="content" />
	</div>
	<div class="admin_footer">
		<tiles:insertAttribute name="footer" />
	</div>


</body>
</html>
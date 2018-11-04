<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--	request.setCharacterEncoding("utf-8"); --%>

<fmt:requestEncoding value="utf-8" />


<!-- <!DOCTYPE html> 이게 들어가 있어서 작게 나옴 이거 없으면 꽉 찬 화면으로 나옴-->
<html>
<head>
<meta charset="UTF-8">
<title>NANURI</title>
<link rel="shortcut icon" href="resources/img/icon_title.png">
<!-- meta -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge"> -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">

<!-- 슬라이더배너 -->
<link rel="stylesheet" href="resources/swiper/swiper.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/bootstrap/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="resources/bootstrap/css/style.css" rel="stylesheet">

<!-- css 상속 -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />


</head>
<body>

	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="content">
		<tiles:insertAttribute name="leftmenu" />
		<tiles:insertAttribute name="content" />
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>

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

</body>
</html>
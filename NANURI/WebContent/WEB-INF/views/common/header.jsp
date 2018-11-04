<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="heder_top">
	<div style="margin:  0 auto; width: 980px;display: table;">
		<div class="heder_top_login" >
			<ul>
				<li><a href="main.do"><i class="fas fa-home mr-5"></i>HOME</a></li>
				<c:choose>
					<c:when test="${login.auth eq 0}">
						<li class="my"><a href="mypage.do"><i class="fas fa-user mr-5"></i></i>마이페이지</a></li>
						<li><a href="logout.do"><i class="fas fa-sign-out-alt mr-5"></i>로그아웃</a></li>
					</c:when>
					<c:when test="${login.auth eq 2}">
						<li class="my"><a href="admin.do"><i class="fas fa-hammer mr-5"></i>관리자</a></li>
						<li><a href="logout.do"><i class="fas fa-sign-out-alt mr-5"></i>로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="login.do"><i class="fas fa-sign-in-alt mr-5"></i>로그인</a></li>
						<li><a href="regi.do"><i class="fas fa-user-plus mr-5"></i>회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			
			
		
			</div>
		</div>
</div>
<div style="border-bottom: 1px solid #eee;">
	<div class="h_logo_box">
		<h1 style="float: left;margin: 0;font-size: 22px;">
		<a href="main.do" class="logo"></a>
		</h1>
		
	 	<div class="nav_box" style="text-align: right;">
			
			<!-- 검색 -->
			<div style="position: relative;">
			<form action="headselect.do" method="post">
			<input type="text" autocomplete="off" value="" name="title" placeholder="원하시는 상품을 검색해보세요" class="head_select" onkeyup="headtitle_btn()">
			<input type="submit" class="head_select_btn">
			</form>
			
			<div class="head_ajaxbox">
				<ul class="ajaxboxul"></ul>
			</div>
			</div>
			
			
			<!-- <ul>
				
				<li><a href="qnalist.do">Q&A게시판</a></li>
				<li><a href="reviewlist.do">후기게시판</a></li>
				
			</ul> -->
			
			
		
			
		</div> 
	</div>
</div>
<div style="width: 100%;border-bottom: #ddd 1px solid;">
<div class="head">
		
		<div class="h_category_box">
			<ul class="headul">
				
						<li><a href="rental_category.do?division=BC">유아</a></li>
						<li><a href="rental_category.do?division=LSC">레저</a></li>
						<li><a href="rental_category.do?division=FC">패션</a></li>
						<li><a href="rental_category.do?division=LVC">리빙</a></li>

			</ul>
			</div>
</div>
		
	
		
<div class="topbtn">
	
</div>
		
	
	<script type="text/javascript">
	
	
	$( window ).scroll( function() {
		if ( $( this ).scrollTop() > 80 ) {
			$( ".topbtn" ).fadeIn();
		} else {
			$( ".topbtn" ).fadeOut();
		}
	} );
	
	//topbtn
	$(".topbtn").click(function(){
		 $('html, body').animate({
	         scrollTop : 0
	     }, 400);
	});	

		
	function headtitle_btn(){
		
		var title = $(".head_select").val();	
		
			
		var list = {
				"title" : title,
				};
		
		// 박스 show
		$(".head_ajaxbox").show();
		
	$.ajax({
		url : "headselectajax.do",
		type : "POST",
		data : list,
		async: true,
		success : function(data) {
			
			$(".ajaxboxul").children().remove();
			
			/* 검색 결과 없을시 */
			if(data.list.length == 0){
	 			$(".ajaxboxul").append('<li class="none_title">검색 결과가 없습니다.</li>');
				//$(".ajaxboxul").append('<li>검색 결과가 없습니다.');
	 		}
			
			/* 검색 결과 있을시 */
			if(title != ""){
		 	 $.each(data.list, function(key, value){ 
		 		$(".ajaxboxul").children('.none_title').remove();
		 		$(".ajaxboxul").append('<li class="li_click">'+value.title+'</li>');
				 }); 
		 	 
		 	 // 클릭시 val 삽입
		 	$(".li_click").click(function(){
				var date = $(this).html();
				$(".head_select").val(date);
				
			});
		 	 
			}
			else{
				$(".head_ajaxbox").hide();
			}
			
		},
		error : function(xhr, status) {
			alert("ㅋㅋ넌못해");
		}
	})



	}
	 // 다른영역 클릭시 박스 hide
	$("html").click(function(){
		$(".head_ajaxbox").hide();
	});

	
	 
	
		
	</script>
	
</div>
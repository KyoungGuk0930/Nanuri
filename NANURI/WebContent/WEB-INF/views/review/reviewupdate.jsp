<%@page import="com.kh.finalPJ.review.reviewDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!-- smarteditor -->
<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<%
reviewDto dto = (reviewDto)request.getAttribute("reviewupdate");
%>

<div class="startdiv">
<form name="frmForm" id="_frmForm" action="reviewupdateAf.do" method="post">
<input type="hidden" name="seq"  value="<%=dto.getSeq() %>"/>

<table class="_table" style="width: 1080px">

<th colspan="2" width="900px"></th>
<tr height="50px" class="md-form">
	<td>아이디</td>
	<td>
		<input type="text" id="inputIconEx2" class="form-control" name="id" readonly="readonly" value="<%=dto.getId() %>" size="35">
	</td>
</tr>
<tr height="50px" class="md-form">
	<td>제목</td>
	<td>
		<input type="text" id="inputIconEx2" class="form-control" name='title' value="<%=dto.getTitle() %>" size="35"/>
	</td>
</tr>

<!-- =======별이다======= -->
<tr height="40px" class="md-form">
	<th>별점</th>
	<td class="starRev">
 		 <span class="starR1">1</span>
 		 <span class="starR2">2</span>
 		 <span class="starR1">3</span>
 		 <span class="starR2">4</span>
 		 <span class="starR1">5</span>
 		 <span class="starR2">6</span>
 		 <span class="starR1">7</span>
		 <span class="starR2">8</span>
 		 <span class="starR1">9</span>
 		 <span class="starR2">10</span>
 		 <h5 id="grade">&nbsp;&nbsp;0</h5>
	</td> 
<tr>
<tr>
	<td colspan="2" height="2" bgcolor="#e7e7e7">
</tr>
<input type="hidden" name="rating" id="rating" value="0">
</table>

<!-- 스마트에디터 & 확인 취소버튼 -->
<table style="width: 1080px">
<col style="width: 100px"><col style="width: 1080px">  
<tr>
	<td>
		<textarea style="height: 500px; width: 1075px" name="content" id="content"><%=dto.getContent() %></textarea>      
	</td>        
</tr>
<tr>
	<td height="2" bgcolor="#e7e7e7">
</tr>

<tr>
	<td align="right"  style="width: 908px">
    	<input type="button" class="btn btn-outline-secondary waves-effect px-3" value="완료" id="savebutton">   
        <input type="button" class="btn btn-outline-secondary waves-effect px-3" value="취소" onclick="location.href='reviewlist.do'">
    </td>
</tr>
</table>
</form>
</div>

<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
   	oAppRef : oEditors,
   	elPlaceHolder : "content",
   	sSkinURI : "smarteditor/SmartEditor2Skin.html",
   	htParams : {
    	bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
    	bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
     	bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
    	//bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
    	//aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
    fOnBeforeUnload : function() {
    	//alert("완료!");
    	}
    }, 
    //boolean
    fOnAppLoad : function() {
    	//예제 코드
    	//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
    	//아래는 선생님코드
    	//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
		oEditors.getById["content"].exec("PASTE_HTML", [""]);
   },
   	fCreator : "createSEditor2"
	});
});

$(document).ready(function () {
	$("#savebutton").click(function(){ 
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
	$("#_frmForm").submit();
	})	
})

/* 별점작동 */
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  
	  grade = $(this).text();
	  $("#grade").html("&nbsp;&nbsp;" + $(this).text());
	  
	  $("#rating").val(grade);
	  //alert(grade);
	  
	  return false;
});
</script>

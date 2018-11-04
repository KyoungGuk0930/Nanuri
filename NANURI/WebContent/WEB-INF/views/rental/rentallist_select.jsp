<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.finalPJ.goods.goodsBbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
/* 요기로 끌고온건디여 */


 
	List<goodsBbsDto> bbslist = (List<goodsBbsDto>)request.getAttribute("bbslist");

	 
	 String title = (String)request.getAttribute("title");
	 
	// 단위변환
	 DecimalFormat dc = new DecimalFormat("###,###,###,###");   
	 String price = null;
%>
 
<div class="startdiv">

<div class="page-h">

<h1 style="font-size: 30px;font-weight: bold;"><%=title %></h1>
<!-- 카테고리 분류 값 -->
<input type="hidden" value="<%=title %>" id="category_val">
<hr>
</div>

<div class="page-b" >

	

<div class="goodsbox_h">

 <p class="goods_countbox" style="    margin-bottom: 20px;">총  <span id="goods_count"><%=bbslist.size() %></span> 개 의 상품이 있습니다.</p> 

</div>
<hr style="height: 1px;background: #333;margin: 0;">

	<div class="goodsbox" id="goodsbox">
	
	 	
		<%
			for(int i=0; i < bbslist.size(); i++){
				// 단위변환
				price = dc.format(bbslist.get(i).getG_price());
		%>
		<a href="goodsdetail.do?seq=<%=bbslist.get(i).getSeq() %>&g_code=<%=bbslist.get(i).getG_code() %>" class="goods goods<%=bbslist.get(i).getSeq() %>" >
			<div class="goods_img">
				<img alt="" src="resources/img/main_img/<%=bbslist.get(i).getG_img()%>" width="100%">
			</div>
			<p class="goods_title"><%=bbslist.get(i).getTitle() %></p>
			<p class="goods_price">₩ <%=price %></p>
		</a>
	<% 
			}
	%>
	
	 
	</div>



</div>







</div>




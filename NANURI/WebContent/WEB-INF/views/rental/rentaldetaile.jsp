<%@page import="com.kh.finalPJ.qa.qaDto"%>
<%@page import="com.kh.finalPJ.member.memberDto"%>
<%@page import="com.kh.finalPJ.review.reviewDto"%>
<%@page import="com.kh.finalPJ.common.orderedDto"%>
<%@page import="com.kh.finalPJ.goods.goodsBbsDto"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
/* 요기로 끌고온건디여 */



	goodsBbsDto bbslist = (goodsBbsDto)request.getAttribute("detail");
	String title = (String)request.getAttribute("title");
	List<reviewDto> list = (List<reviewDto>)request.getAttribute("reviewDto");
	
	String content = null;
	for(int i = 0 ; i < list.size(); i++){
		content = list.get(i).getContent(); 
	}
	
	
	List<Integer> allref = (List<Integer>) request.getAttribute("allref");   
	List<Integer> reflist = (List<Integer>) request.getAttribute("reflist");
	List<qaDto> qalist = (List<qaDto>) request.getAttribute("g_qalist");
	
	
	memberDto id = (memberDto)request.getSession().getAttribute("login");
	
	 if(id == null){
		id = new memberDto();
		id.setId("null");
	} 
	
%>

<style>    

#report {
	border-collapse: collapse;
	width:100%;
}

#report h4 {
	margin: 0px;
	padding: 0px;
}

#report th {
	text-align: center !important;
	background: url(header_bkg.png) repeat-x scroll center left;
	color: #fff;
	padding: 7px 15px;
	text-align: left;
	border-left: none;
	border-right: none;
	border-top: 2px solid #542f82;
	border-bottom: 2px solid #542f82;
	color: black;
}

#report td {
	text-align: center;
	background: #fff none repeat-x scroll center left;
	color: #000;
	padding: 7px 15px;
	font-size: 12px;
	padding: 20px;
}

#report tr.odd td {
	background: #fff url(row_bkg.png) repeat-x scroll center left;
	cursor: pointer;
	border-bottom: 1px solid #e1e1e1;
}

#report div.arrow {
	background: transparent url(arrows.png) no-repeat scroll 0px -16px;
	width: 16px;
	height: 16px;
	display: block;
}

#report div.up {
	background-position: 0px 0px;
}

.writebtn{background-color: #9d87b8;
    color: #fff;
    padding: 10px 15px;
    border-radius: 5px;
    font-size: 13px;
    display: block;
    width: 70px;
    float: right;}
</style>

<div class="startdiv">


<div class="detail_wrap">
	
	<div class="detail_head">
	
		<p class="category">
		[ <%=title %> ]
		</p>
		
		<p class="goods_title">
		<%=bbslist.getTitle() %>
		</p>
		
	</div>
	
	<div class="detail_body">
		
		<div class="top_box">
			<div class="goods_img">
				<img alt="" src="resources/img/main_img/<%=bbslist.getG_img()%>" width="100%">
			</div>
		
			<div class="goods_priceinfo">
				<div class="price_box">
					<ul>
						<li>
							<div class="title"  style="color: #cd1965;margin-top: 6px;">렌탈</div>
							<div  style="color: #cd1965;">₩ <span id="price_top"><%=bbslist.getG_price() %></span> / 월</div>
						</li>
						<li>
						<div class="title">예상배송일</div>
						<div>업체 배송(평균 2영업일 소요)</div>
						</li>
						<li>
							<div class="title"style="margin-top: 4px;">배송비</div>
							<div>₩ <b style="font-size: 16px;" class="shipping">4500</b></div>
						</li>
						<li>
							<div class="title">제휴카드</div>
							<div>MY RENTAL LOTTE CARD</div>
						</li>
					</ul>
				</div>
			
			</div>
		
		</div>
		
		<div class="goods_info">
			
			<%
			if(bbslist.getContent() != null){
			%>
			
			<img alt="" src="resources/img/rental_content/<%=bbslist.getContent()%>" width="100%">
			 
			<%
			}
			else{
			%>
			<p style="    text-align: center;  padding: 50px;">등록된 내용이 없습니다.</p>
		
		<%
			}
		%>
		</div>
	
	
	
	
	<div class="detail_footer">
		
		<div class="tab_box">
		
		<ul class="tab_title">
			<li id="tab01" class="active">기본정보</li>
			<li id="tab02">상품후기 (<%= list.size()%>)</li>
			<li id="tab03">Q & A (<%=qalist.size() %>)</li>
		</ul>
		
		<ul class="tab_contant">
			<li id="tab01">
				<table width="720" style="width: 540pt; border-collapse: collapse;" border="0" cellspacing="0" cellpadding="0"><colgroup><col width="720" style="width: 540pt; mso-width-source: userset; mso-width-alt: 23040;"></colgroup><tbody><tr height="22" style="height: 16.5pt;"><td width="720" height="22" style="border: 0px black; border-image: none; width: 540pt; height: 16.5pt; background-color: white;"></td></tr><tr height="30" style="height: 22.5pt;"><td width="720" height="30" style="border: 0px black; border-image: none; width: 540pt; height: 22.5pt; background-color: white;"><strong><span style="font-size: 18pt;">계약 안내사항</span></strong></td></tr><tr height="22" style="height: 16.5pt;"><td width="720" height="22" style="border: 0px black; border-image: none; width: 540pt; height: 16.5pt; background-color: white;"><strong></strong></td></tr><tr height="22" style="height: 16.5pt;"><td width="720" height="22" style="border: 0px black; border-image: none; width: 540pt; height: 16.5pt; background-color: white;"><span style="font-size: 10pt;">▷ 본 상품은 약정된 분납금 상환 이후 소유권이 고객님께 이전되는 '스마트장기' 상품입니다.</span></td></tr><tr height="22" style="height: 16.5pt;"><td width="720" height="22" style="border: 0px black; border-image: none; width: 540pt; height: 16.5pt; background-color: white;"><span style="font-size: 10pt;">▷ 계약물품의
중도 반납은 불가능 하며 잔여 금액 중도 상환 후 소유권 이전은 가능합니다.</span></td></tr><tr height="22" style="height: 16.5pt;"><td width="720" height="22" style="border: 0px black; border-image: none; width: 540pt; height: 16.5pt; background-color: white;"><p><span style="font-size: 10pt;">▷ 계약기간
동안 무상 A/S를 진행합니다.(단, 고객과실 및 자연적 환경에 의한 훼손의 경우는 제외됩니다.)</span></p><p><br></p></td></tr><tr height="58" style="height: 43.5pt; mso-height-source: userset;"><td width="720" height="58" style="border: 0px black; border-image: none; width: 540pt; height: 43.5pt; background-color: white;"><strong><span style="font-size: 18pt;">유의사항</span></strong></td></tr><tr height="32" style="height: 24pt;"><td width="720" height="32" style="border: 0px black; border-image: none; width: 540pt; height: 24pt; background-color: white;"><span style="font-size: 10pt;">▷ 고객의 단순
변심에 의한 교환/반품은 어렵우니 신중한 구매결정 부탁드립니다.<br>▷ '스마트장기'는 신용거래이므로 신용등급 등에 따라 주문,
렌탈요청이 취소되거나 추가 증빙이 필요할 수 있습니다.</span></td></tr><tr height="22" style="height: 16.5pt;"><td width="720" height="22" style="border: 0px black; border-image: none; width: 540pt; height: 16.5pt; background-color: white;"></td></tr><tr height="30" style="height: 22.5pt;">
<td width="720" height="30" style="border: 0px black; border-image: none; width: 540pt; height: 22.5pt; background-color: white;"></td></tr><tr height="22" style="height: 16.5pt;"><td height="22" style="border: 0px black; border-image: none; height: 16.5pt; background-color: white;"></td></tr></tbody></table>

			</li>
			
			
		
			<!-- review -->
			<li id="tab02">
				
				

<ul class="review">
<%
	if(list.size() != 0 ){
	
	for(int i = 0; i < list.size(); i++){
%>
   <li data-toggle="modal" data-target="#viewModal"  onclick='modal_view("<%= list.get(i).getSeq()%>","<%= list.get(i).getG_img()%>",
   "<%= list.get(i).getId()%>","<%= list.get(i).getWdate()%>","<%= list.get(i).getTitle()%>",
   "<%= list.get(i).getRating()%>","<%=list.get(i).getG_code() %>")'>
   
   <!-- 상품 컨텐츠 -->
   	<input type="hidden"  value='<%=list.get(i).getContent() %>' id="content">
   
  	<!--상품사진넣기  ////////////-->
       <div class="img">
          <img alt="" src="resources/img/main_img/<%=list.get(i).getG_img() %>" width="100%"> 
       </div>
    <!--/////////////////  -->
    
       <div class="text_view" style="cursor: pointer;width: 520px;">
       	<div>
             <a class="title"><%=list.get(i).getTitle() %></a>
             	
             	<!-- 별점 -->
             	<div class="star">별점수: <%=list.get(i).getRating() %></div>
<!-- =======별이다======= -->
<%
for (int j = 1; j <= 10; j++) {
		if (j % 2 == 1) {
			if (j <= list.get(i).getRating()) {
				%>
				<span class='starR1 on'></span>
				<% 
			} else {
				%>
				<span class='starR1'></span>
				<%
			}
		} else if (j % 2 == 0) {
			if (j <= list.get(i).getRating()) {
				 %>
				<span class='starR2 on'></span>
				<% 
			} else {
				%>
				<span class='starR2'></span>
				<%
			}
		}
	}
%>
<input type="hidden" name="rating" id="rating" value="<%=list.get(i).getRating() %>">
      			
      			</div>
      			<!-- 별점 끝 -->
    	</div>
       <div class="idbox" style="padding-top: 10px;">
          <p class="id" style="margin-bottom: 5px;margin-top: 20px;"><%=list.get(i).getId() %></p>
          <p class="wdate" style="    font-size: 12px;"><%=list.get(i).getWdate().substring(0,16) %></p>
       </div>
   </li>
<%
		}
	}
	else{
		%>
		
		<div class="review_null" style="text-align: center;">
		
			<p>등록된 리뷰가 없습니다.</p>
			
		</div>
		
		
		<% 
	}
%>
</ul>


			</li>
			 
			
			
			
			
			<li id="tab03">
				<table id="report">
					<tr>
						<th>구분</th>
						<th>제목</th>
						<th>작성자</th>
						<th>게시일</th>
					</tr>
					<%if(qalist.size() >0){
						for (int i = 0; i < qalist.size(); i++) {
							List<Integer> allref2 = allref; // 답변버튼 중복생성안되게 만들기위해 필요한 변수
							if((qalist.get(i).getSecret() == 0 && qalist.get(i).getDel() == 0) ||
								(reflist.contains(qalist.get(i).getRef())  && (qalist.get(i).getDel() == 0)) ||
								(id.getAuth() == 2)) {%><!-- 공개글  --> 							
								<tr class="odd">
									<%if(qalist.get(i).getTitle().equals("관리자 답변입니다.")){ %>				         
						            	<td><span style="margin-right: 26px;"></span>└ A</td>
						            	<td class="title_td" ><span style="margin-right: 8px;"></span>└ <%=qalist.get(i).getTitle()%></td>
						            <%}else{ %>
						            	<td>Q</td>
						            	<td class="title_td" ><%=qalist.get(i).getTitle()%></td>
						            <%} %>	
							            <td><%=qalist.get(i).getId()%></td>	
						            	<td><%=qalist.get(i).getWdate().substring(0, 16) %></td>						           
						        </tr>
						        <tr style="display: none">					  
						            <td colspan="4">   
							            <div style="border-bottom: 1px solid gray;">	          
							            	<h4 align="center"><%=qalist.get(i).getTitle()%></h4>
							            </div>
							            <div style="border-bottom: 1px solid gray; text-align: left !important; padding: 10px;">
							            	게시일:<%=qalist.get(i).getWdate().substring(0, 16) %><br>
							            	작성자:<%=qalist.get(i).getId()%>
							            </div>
							            <div style="text-align: left !important; padding: 30px;">
											<label>내용:</label><%=qalist.get(i).getContent() %>
										</div>
											<div align="right">
											<%if((!qalist.get(i).getTitle().equals("관리자 답변입니다.")) && (id.getAuth() == 2)){%>
												<%
												allref2.set(i,-2);
												if(!allref2.contains(qalist.get(i).getRef())){ %>					
									 				<a href="ansWrite.do?ref=<%=qalist.get(i).getRef()%>&g_code=<%=qalist.get(i).getG_code()%>&secret=<%=qalist.get(i).getSecret()%>">답변 <span style="margin-right: 7px"></span> </a>
							               		<%} %>
							               <%} %>
							               	<%if(!qalist.get(i).getTitle().equals("관리자 답변입니다.") && (id.getId().equals(qalist.get(i).getId()) || id.getAuth() == 2)) {%>
							            		<a href="delete.do?ref=<%=qalist.get(i).getRef()%>">삭제</a>
							            	<%} %>
							            	</div>
							            	<%if(qalist.get(i).getTitle().equals("관리자 답변입니다.") && id.getAuth() == 2){ %>
							            		<div align="right"><a href="ansDelete.do?seq=<%=qalist.get(i).getSeq()%>">삭제</a></div>
							            	<%} %>   
						            </td>					           
						        </tr>
								
							<%}else if(qalist.get(i).getSecret() == 1){ %><!-- 비공개글  --> 
								<tr class="odd">						
								<%if(qalist.get(i).getTitle().equals("관리자 답변입니다.")){ %>
									<td><span style="margin-right: 26px;"></span> └ A</td>
									<td class="title_td" ><span style="margin-right: 8px;"></span>└ 비공개글 답변입니다.</td>
								<%}else{ %>
									<td>Q</td>
									<td class="title_td" >비공개 글입니다.</td>
									<%} %>						
									<td><%=qalist.get(i).getId() %></td>
									<td><%=qalist.get(i).getWdate().substring(0, 16) %></td>
								</tr>
								<tr>
								</tr>
							<%} %>
						<%
							}
						%>		
					<%}else{ %>
							<tr>
								<td colspan="4">작성된 글이 없습니다.</td>
							</tr>
					<%} %>
					
				</table>
				<%if(!id.getId().equals("null") && id.getAuth() == 0){ %>
				<div style="    display: block; margin-top: 20px;">
					<a class="writebtn" href="qaWrite.do?g_seq=<%=bbslist.getSeq() %>&g_code=<%=bbslist.getG_code()%>">글쓰기</a>
					</div>
				<%}%>
			</li>
			</ul>
		</div>
		
	
	</div>
	
	
	</div>
	
	<div class="option_box">
			<div class="option">
				<div class="top">
					주문하기
				</div>
				<div class="middle">
				
					<div style="display: table; padding: 10px;">
					<p class="option_title">갯수</p>
					<button class="monthbtn minusbtn" title="수량줄이기">-</button>
					<input class="number_box" type="number" value="1" disabled="disabled" >
					<button class="monthbtn plusbtn" title="수량늘이기">+</button>
					</div>
					
					<div style="display: table; padding: 10px;">
					<p class="option_title">기간</p>
					<button class="monthbtn minusbtn" title="수량줄이기">-</button>
					<input class="month_box" type="number" value="1" disabled="disabled" >
					<button class="monthbtn plusbtn" title="수량늘이기">+</button>
					</div>
					
				</div>
				<div class="bottom">
					<div class="priceview">
						<div>
						<input id="pricehidden" type="hidden" value="<%=bbslist.getG_price() %>" disabled="disabled" >
						<span class="pr_title">상품가격 :</span>
						<input class="price inputresult" type="number" value="<%=bbslist.getG_price() %>" disabled="disabled" >
						<span style="font-size: 12px;">원</span>
						</div>
						
						<!-- insert date -->
					 	<input type="hidden" id="loginid" value="<%=id.getId() %>">
						<input type="hidden" id="g_code" value="<%=bbslist.getG_code() %>">
						
						<div>
						<span class="pr_title">개월수 :</span>
						<input type="number" class="inputresult" id="monthnum"value="1" disabled="disabled">
						<span style="font-size: 12px;">개월</span>
						</div>
						
						<div style="padding-top: 10px;border-top: 1px solid #ddd; margin-top: 10px;">
							<span style="    font-size: 13px;font-weight: bold;">총 금액</span>
							
						<input id="resultnum" class="inputresult" style="width:155px;font-size: 19px; color: #cd1965; font-weight: bold;    padding-right: 25px;" value="<%=bbslist.getG_price() %>" disabled="disabled">
						<span>원</span>
						</div>
					</div>
					<div class="btnbox">
						<a class="pricebtn bas_btn" id="basketbtn">장바구니</a>
						<a class="pricebtn result_btn" id="orderbtn">구매하기</a>
					</div>	
				</div>
			</div>	
	
		</div>
	
	

</div>




</div>




<!-- Modal -->
<div class="modal fade" id="basketModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-body">
        	성공적으로 장바구니에 담겼습니다
      </div>
      <div class="modal-footer" style="text-align: center;">
        <a type="button" class="btn btn-default" data-dismiss="modal">쇼핑계속하기</a>
        <a type="button" class="btn btn-primary" href="basketList.do">장바구니이동</a>
      </div>
    </div>
  </div>
</div>




<script type="text/javascript">



// 옵션박스
$(window).scroll(function(){
	
	var scrollPosition = ($(".option_box").offset().top - 50);
    if ($(window).scrollTop() >= scrollPosition) {
       $(".option").addClass("scrollfixed");
    }
    else {
       $(".option").removeClass("scrollfixed");
    }
});


$(window).scroll(function(){
	
	var scrollPosition = ($(".footer").offset().top - 600);
    if ($(window).scrollTop() >= scrollPosition) {
    	 $(".option").addClass("scrollfixed2");
    }
    else {
    	 $(".option").removeClass("scrollfixed2");
    }
});


// 하단 탭메뉴
$(".tab_title li").click(function(){
	$(".tab_title li").removeClass('active');
	$(this).addClass('active');
	
	var scrollPosition = $(".tab_title").offset().top;
	$( 'body' ).animate( { scrollTop: scrollPosition	}, 500);
	
	
	$(".tab_contant > li").hide();
	var data_show = $(this).attr('id');
	$(".tab_contant #"+data_show).show();
	
	
});



// 타이틀 가격 ,처리
var price_top = $("#price_top").html();
$("#price_top").html(numberWithCommas(price_top));

var shipping = $(".shipping").html();
$(".shipping").html(numberWithCommas(shipping));

// 디폴트 가격 , 처리
var inresult = $("#resultnum").val();
$("#resultnum").attr('value',numberWithCommas(inresult));

// 플러스 버튼
$(".plusbtn").click(function(){
	var number = parseInt($(this).prev().attr('value'));
	var numberplus = number + 1;
	$(this).prev().attr('value',numberplus);
	
	var price = parseInt($("#pricehidden").attr('value'));
	
	var amount = parseInt($(".number_box").attr('value'));
	
	var result = price * amount;
	$(".price").attr('value',result);
	
	var month_box = parseInt($(".month_box").attr('value'));
	$("#monthnum").attr('value',month_box);
	
	$("#resultnum").attr('value',numberWithCommas(month_box * result));
	/* <fmt:formatNumber value="month_box * result"
		pattern="#,###" /> */
});

// 마이너스버튼
$(".minusbtn").click(function(){
	
	var number = parseInt($(this).next().attr('value'));
	
	if(number != 1){
	
	var numberplus = number - 1;
	$(this).next().attr('value',numberplus);

	var price = parseInt($("#pricehidden").attr('value'));
	var amount = parseInt($(".number_box").attr('value'));
	
	var result = price * amount;
	$(".price").attr('value',result);
	
	var month_box = parseInt($(".month_box").attr('value'));
	$("#monthnum").attr('value',month_box);
	
	$("#resultnum").attr('value',numberWithCommas(month_box * result));
	}
	
	
	
});

// 장바구니 insert
$("#basketbtn").click(function(){
	
	// 갯수
	var amount = $(".number_box").attr('value');
	// 개월
	var month = $(".month_box").attr('value');
	// 총합가격
	var resultnumstring = $("#resultnum").attr('value');
	var resultnum = resultnumstring.replace(',', '');
	 // 로그인 id
	var id = $("#loginid").attr('value'); 
	// g_code
	var gcode = $("#g_code").attr('value');
	
	
	
	if(id == "null"){
		alert("로그인을 해주세요");
	}else{
		
		var list = {
				"id" : id,
				"gcode" : gcode,
				"month" : month,
				"amount" : amount,
				"resultnum" : resultnum
				};
		
	$.ajax({
		url : "basketinsert.do",
		type : "POST",
		data : list,
		async: true,
		success : function(data) {
			
			if(data){
				
				$("#basketModal").modal();
				
			}else{
				alert("다시시도해주세요");
			}
		},
		error : function(xhr, status) {
			alert("ㅋㅋ넌못해");
		}
	})

		
		
		
	//location.href = "basketinsert.do?id="+id+"&g_code="+gcode+"&month="+month+"&amount="+amount;
	}
	
	
});
$("#orderbtn").click(function(){
	
	
	 // 로그인 id
	var id = $("#loginid").attr('value'); 
	// g_code
	var gcode = $("#g_code").attr('value');
	// 갯수
	var amount = $(".number_box").attr('value');
	// 개월
	var month = $(".month_box").attr('value');
	// 총합가격
	var resultnumstring = $("#resultnum").attr('value');
	var resultnum = resultnumstring.replace(',', '');

	var data = gcode+","+amount+","+month+","+resultnum;
	
	if(id == "null"){
		alert("로그인을 해주세요");
	}else{
		location.href = "order.do?id=" + id + "&data=" + data;
	}      
});

$(function(){

    $("#report tr:odd").addClass("odd");      
    /* $("#report tr:first-child").show(); */ //열머리글 보여주기 
    
    $("#report tr.odd").click(function(){
    	
        $(this).next("tr").toggle();
        $(this).find(".arrow").toggleClass("up");

    });
});

// 가격 변환
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//리뷰모달


function modal_view(seq, g_img, id, wdate, title, rating,g_code) {
	
	var content = $("#content").val();
	
	$('#viewModal').on('show.bs.modal',function(event) {
	$("#starRev").empty();
	$("#modal_id").empty();
	$("#modal_title").empty();
	$("#modal_footer").empty();

	if (g_img == null || g_img == "") {
		$(".modal-body #g_img").attr('src',"http://k-startup.go.kr/images/homepage/prototype/noimage.gif");
	} else {
		$(".modal-body #g_img").attr('src',"resources/img/main_img/" + g_img);
	}
	$("#_seq").val(seq);
	$(".modal-body #modal_id").append("<font style='font-weight: bold;'>ㅣ</font>작성자 : "+ id);
	$(".modal-body #modal_wdate").text(wdate.toString().substring(0, 16));
	$(".modal-body #modal_title").append("<p style='font-size: 1.3em; font-weight: bold'>"+ title + "</p>");
	$(".modal-body #_rating").val(rating);
	$(".modal-body #content").html(content);
	$("#_g_code").val(g_code);

	for (var i = 1; i <= 10; i++) {
		if (i % 2 == 1) {
			if (i <= rating) {
				$("#starRev").append("<span class='starR1 on'></span>");
			} else {
				$("#starRev").append("<span class='starR1'></span>");
			}
		} else if (i % 2 == 0) {
			if (i <= rating) {
				$("#starRev").append("<span class='starR2 on'></span>");
			} else {
				$("#starRev").append("<span class='starR2'></span>");
			}
		}
	}

	
	$("#modal_footer").append("<button type='button' class='btn btn-outline-secondary waves-effect px-3' data-dismiss='modal'>닫기</button>");
});
		}



</script>
<jsp:include page="../review/reviewDetail_Modal.jsp" />

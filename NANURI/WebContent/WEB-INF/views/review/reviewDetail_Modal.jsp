<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<style>
.modal_imgbox img{
	max-width: 100%;
}
.content p{word-break: break-all;}
#modal_title p{word-break: break-all;}
</style>
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog"  style="max-width: 600px;">
		<div class="modal-content" style="width: 500px; height: 740px;">
			<!-- modal header -->
			<div class="modal-header" style="display: table; height: 58px; background: #542f82;">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" style="color:#fff">&times;</span>
					
				</button>
			</div>
			<!-- / modal header -->
			<!-- modal body -->
			<input type="hidden" id="_g_code" name="_g_code" />
			<form name="frmForm" class="_frmForm" id="_frmForm" method="post" action="reviewdetail.do">
				<input type="hidden" id="_seq" name="_seq" />
				<div class="modal-body modal_imgbox" >
					<div style="padding: 0 20px;">
								<div id="modal_title"></div>
								<hr style="background-color: #eee;    margin-top: 6px;">
							</div>
					<div class="row">
						<div class="col-md-4">
							<img id="g_img" alt="" src="" style="max-width: 100%">
						</div>
						<div class="col-md-8" style="    padding-top: 40px;">
							<input type="hidden" name="_rating" id="_rating" />
							<div id="starRev" class="starRev"></div>
							<div style="text-overflow: ellipsis; overflow: hidden; padding-top: 7px; margin-bottom: 5px">
								<nobr id="modal_id" style="font-size: 0.9em; color: #CCCCCC;">
								</nobr>
							</div>
							<div id="modal_wdate" style="width: 100%;padding-right: 35px;text-align: right;"></div>
						</div>
					</div>

					<div id="content" style="height: 410px; padding: 5%; border: 2px solid #542f82; margin-top: 10px; overflow: scroll; overflow-x: hidden"></div>
				</div>
				<!-- / modal body -->
				<!-- modal footer -->
				<div id="modal_footer" class="modal-footer" style="    background: #fff;"></div>
				<!-- / modal footer -->
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

	function goodsdetail() {
		var g_code = $("#_g_code").val().trim();
		
		$.ajax({
			url : "getGoodsSeq.do",
			type : "POST",
			data : "g_code="+g_code,
			success : function(data) {
				if (data.g_seq > 0) {
					//alert("성공");
						location.href = "goodsdetail.do?seq="+data.g_seq+"&g_code="+g_code;
				}else{
					alert("오류");
				}
			},
			error : function(xhr, status) {
				alert("멍청이");
			}
		});
	}
	function deletereview() {
		//alert($("#_seq").val());
		location.href = 'deleterev.do?seq=' + $("#_seq").val();
	}
	function updateview() {

		location.href = 'reviewupdate.do?seq=' + $("#_seq").val();
	}
</script>
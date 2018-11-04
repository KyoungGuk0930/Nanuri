$(function() {
	var rowPerpage = 3;	// 테이블에 보여주는 데이터의 갯수
	
	$('#nav').remove();
	var $products = $('#products');

	$products.after('<div id="nav">');	// 테이블생성 후 번호리스트 만들어주기
	
	var $tr = $($products).find('tbody tr');
	var rowTotals = $tr.length;	// 리스트로 뿌려진 데이터(tr)의 갯수를 rowTotals에 저장
	
	var pageTotal = Math.ceil(rowTotals/ rowPerPage);	// 쪽수를 저장
	
	// 페이지 번호에 맞는 링크를 nav안에 번호를 생성한다.
	for(i = 0; i < pageTotal; i++){
		$('<a href="#"></a>').attr('rel', i).html(i + 1).appendTo('#nav');
	}
	
	// 리스트 페이지 전환시 CSS효과
	$tr.addClass('off-screen').slice(0, rowPerPage).removeClass('off-screen');
	
	// 페이지 이동시 처리작업
	var $pagingLink = $('#nav a');
	$pagingLink.on('click', function (evt) {
		evt.preventDefault();
		var $this = $(this);
		if ($this.hasClass('active')) {
			return;
		}
		$pagingLink.removeClass('active');
		$this.addClass('active');
		
		var currPage = $this.attr('rel');
		var startItem = currPage * rowPerPage;
		var endItem = startItem + rowPerPage;

		$tr.css('opacity', '0.0')
				.addClass('off-screen')
				.slice(startItem, endItem)
				.removeClass('off-screen')
				.animate({opacity: 1}, 300);

	});
	
	$pagingLink.filter(':first').addClass('active');
});
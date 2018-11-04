$("document").ready(function() {
	$("input[name=content_img]").change(function(event) {
		var filesArr = Array.prototype.slice.call(event.target.files);
		
		filesArr.forEach(function(f){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#preview").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	});
});
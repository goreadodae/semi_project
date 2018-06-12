// load header footer
$(document).ready(function() {
	$("#header").load("/views/header/main-Header.jsp");
	$("#footer").load("/views/footer/main-Footer.jsp");
});

// delete message
function delete_info(obj) {
	// 삭제할 ID 정보 찾기
	var target = obj.parentNode.getAttribute('div');
	console.log(target);
	// 삭제할 element 찾기
	var field = document.getElementById(target);
	// #field 에서 삭제할 element 제거하기
	document.getElementById('top-message').remove();
}


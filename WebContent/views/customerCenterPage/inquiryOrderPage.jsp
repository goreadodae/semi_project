<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function() { /*주문번호 테이블  jquery  */
	var stat = true;
	$('#orderInquiry').click(function() {
		if (stat == true) {
			$('#hidingInquiry').css("display", "block");
			stat = false;
		} else {
			$('#hidingInquiry').css("display", "none");
			stat = true;
		}
	});

});
$(document).ready(function() {
	$('.selectRdo').click(function() {
		$('.selectRdo').prop("checked", false);
		$(this).prop("checked", true);

	});
});

function check(form){
	return true;
	
}
$(document).ready(function() {
	$('#close').click(function() {
		$('#hidingInquiry').hide();
	});
});




</script>
<style>
#hidingInquiry {
	display: none;
}
</style>
</head>
<body>
	<form action="in">
	<input type="text" style="width: 25%" readonly />
	<button type="submit" class="btn btn-info" id="orderInquiry"
		style="height: 2em">주문조회</button>
		<input type="hidden" value=""></form>
	<div class="col-md-8" style="border: 1px solid; height: 300px"
		id="hidingInquiry">
		문의하실 주문번호를 선택하세요<br>

			<table class="table table-bordered"
				style="width: 100%; height: 8; text-align: center;">
				<tr style="background-color: gray;">
					<th height="8">주문번호</th>
					<th>주문일자</th>
					<th>상품명</th>
					<th>수량</th>
					<th>주문금액</th>
					<th>선택</th>

				</tr>
				<tr>
					<td>1</td>
					<td>2017-08-09</td>
					<td>토게피</td>
					<td>1</td>
					<td>2000</td>
					<td><input type="radio" name="inquiry" class="selectRdo"></td>
				</tr>

				
			</table>
		
		<p id="close">close</p>

	</div>

</body>
</html>
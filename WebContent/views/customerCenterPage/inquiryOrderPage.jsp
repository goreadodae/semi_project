<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="member.model.vo.*"%>
<%
	Member m = (Member) session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() { /*주문번호 테이블  jquery  */
		stat = true;
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

	function inquiry() {
		$('#hidingInquiry').html("");
		$
				.ajax({
					url : "/inquiryOrder",
					type : "post",
					data : {
						memberNo :
<%=m.getMemberNo()%>
	},
					success : function(data) {

						$('#hidingInquiry')
								.append(
										"<table class='table table-bordered' "
												+ "style='width: 100%; height: 8; text-align: center;' id='inquiry-row'>"
												+ "<tr style='background-color: gray;' id='trow'> "
												+ "<th height='8'>주문번호</th>"
												+ "	<th>주문일자</th> "
												+ " <th>상품명</th> "
												+ "	<th>수량</th> "
												+ "	<th>주문금액</th>"
												+ "	<th>선택</th> " + "	</tr> ")

						for (var i = 0; i < data.length; i++) {
							$('#inquiry-row').append('<tr>')
							$('#inquiry-row').append(
									'<td>' + data[i].buyingNo + '</td>');
							$('#inquiry-row').append(
									'<td>' + data[i].orderDate + '</td>');
							$('#inquiry-row').append(
									'<td>' + data[i].productName + '</td>');
							$('#inquiry-row').append(
									'<td>' + data[i].buyingQuantity + '</td>');
							$('#inquiry-row').append(
									'<td>' + data[i].productPrice + '</td>');
							$('#inquiry-row')
									.append(
											'<td> <input type="radio" onclick="radio_('+data[i].buyingNo+');" value="'+data[i].buyingNo+'" name="inquiry" class="selectRdo"/> </td>');
							$('#inquiry-row').append('</tr>')
						}
						$('#hidingInquiry').append("</table>");
						$('#hidingInquiry').append(
								"<p id='close' style='float:right'>close</p>");
					},
					error : function() {
						console.log("error");

					}
				});

		
		
	}

	$(document).ready(function() {
		$(document).on("click", '#close', function(event) {
			console.log("안뇽");
			$('#hidingInquiry').hide();

		});
	});
	
	function radio_(no)
	{
		
	$('#orderNum').val(no);
		
		
		
		
		
	}
	
</script>
<style>
#hidingInquiry {
	display: none;
}

#click {
	cursor: pointer;
}
</style>
</head>
<body>

	<input type="text" style="width: 25%" id="orderNum" readonly />
	<button type="button" onclick="inquiry();" class="btn btn-info"
		id="orderInquiry" style="height: 2em">주문조회</button>
	<%-- <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}"> --%>

	<div class="col-md-8"
		style="border: 1px solid; padding: 20px; height: 300px"
		id="hidingInquiry">
		문의하실 주문번호를 선택하세요<br>




		<p id="close">close</p>

	</div>

</body>
</html>
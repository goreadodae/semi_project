<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="member.model.vo.*"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<%
	Member m = (Member) session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1문의 작성</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {

		$("#footer").load("/views/footer/main-Footer.jsp");
	});

	$(document).ready(function() {
		$('#close').click(function() {
			$('#hidingInquiry').hide();
		});
	});

	/* 1:1문의 이미지 추가  jQuery  */
	$(document)
			.ready(
					function() {
						cnt2 = 1;
						cnt = $('#rowCount').length + 1;
						cnt3 = 5;

						$('#addImg')
								.click(
										function() {
											if (cnt <= 5) {
												$('#addRow')
														.append(
																'<tr class="rowTr" id="rowTr_'+cnt2+'"><td><span>'
																		+ cnt
																		+ ' '
																		+ '<button>파일 선택</button>'
																		+ ' '
																		+ '<label>선택된 파일 없음</label>'
																		+ ' '
																		+ '<img src="/imgs/manager-img/minus.png" class="minus-cursor"'
																		+ 'onclick="removeRow('
																		+ cnt2
																		+ ');"/></span></td></tr>');
												cnt++;
												cnt2++;
												console.log(cnt2);
											} else {
												alert("이미지는 최대 5개까지 업로드가 가능합니다.");
											}
										});

					});

	function removeRow(cnt2) {/* 이미지추가 행 삭제   */
		if ($('#rowTr_' + cnt2).remove()) {
			cnt--; /* 삭제할때마다 감소 */
			cnt2--; /* 삭제할때마다 감소 */
			console.log(cnt);
			console.log(cnt2);
		}
	}

	/*해당 페이지 표시 스크립트  */
	$(document).ready(function() {
		$('#list-color tr').eq(2).addClass('on');

	});

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
							$('#inquiry-row')
									.append(
											'<tr>'
													+ '<td>'
													+ data[i].buyingNo
													+ '</td>'
													+ '<td>'
													+ data[i].orderDate
													+ '</td>'
													+ '<td>'
													+ data[i].productName
													+ '</td>'
													+ '<td>'
													+ data[i].buyingQuantity
													+ '</td>'
													+ '<td>'
													+ data[i].productPrice
													+ '</td>'
													+ '<td> <input type="radio" onclick="radio_('
													+ data[i].buyingNo
													+ ');"'
													+ 'value="'
													+ data[i].buyingNo
													+ '" name="inquiry " class="selectRdo"/> </td> </tr>')
						}
						$('#hidingInquiry')
								.append(
										"</table><p id='close' style='float:right'>close</p>");
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

	function radio_(no) {

		$('#orderNum').val(no);

	}
	
 	$(document).ready(function(){
		
		$("form").submit(function(){
			if($("#qnaTitle").val()=="")
				{
					alert("제목을 입력해주세요");
					$("#qnaTitle").focus();
					return false;
				}
			if($("#contents").text()=="")
				{
					alert("내용을 입력해주세요");
					$("#contents").focus();
					return false;
				}
		
		})
		
		
		
		
	}); 
	
	
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

.list-arrow {
	float: right;
}

#notice_sub_tit {
	font-size: 15px;
}

#notice-color {
	background-color: #dcdbde;
}

#qnaWriteSpace {
	width: "200px";
}

#close {
	cursor: pointer;
	float: right;
}

#prInfoPolicy {
	text-size: 1px;
}

#qnaSubmit {
	float: right;
}

#writeQNAFormTbl tr>td:first-child {
	vertical-align: middle;
	text-align: center;
}

#addRow tr td {
	text-align: left !important;
}

#addRow img {
	cursor: pointer;
}

#hidingInquiry {
	display: none;
}

#click {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 0px">
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row" style="padding: 0;">
				<div class="col-md-2" style="padding: 0;">
					<!--고객센터 목록  -->
					<br>
					<h2>고객센터</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h4>1:1문의사항&nbsp;</h4>
				</div>
			</div>
			<br>


			<form action="/insertQna" method="post">
				<div class="row" style="padding: 0;">
					<div id="customCenter" class="col-md-2" style="padding: 0;">
						<!-- 고객센터 목록 테이블 -->
						<jsp:include page="/views/customerCenterPage/contentsLeft.jsp"
							flush="false" />
					</div>
					<div class="col-md-10">
						<table class="table table-bordered" id="writeQNAFormTbl">
							<tr height="70px">
								<td width="100px" style="background-color: #dcdbde;">제목</td>


								<td><br> <input type="text" id="qnaTitle" name="qnaTitle"
									size="100%" /></td>
							</tr>
							<tr height="70px">

								<td style="background-color: #dcdbde">주문번호</td>

								<td><input type="text" name="inquiryNo" style="width: 25%"
									id="orderNum" readonly />
									<button type="button" onclick="inquiry();" class="btn btn-info"
										id="orderInquiry" style="height: 2em">주문조회</button>

									<div class="col-md-8"
										style="border: 1px solid; padding: 20px; height: 300px"
										id="hidingInquiry">
										문의하실 주문번호를 선택하세요<br>

										<p id="close">close</p>

									</div></td>
							</tr>


							<tr>
								<td style="background-color: #dcdbde;">내용</td>
								<td>

									<p>
										<b>1:1 문의 작성 전 확인해주세요!</b>
									</p> <br> <b style="font-size: 15px">반품 / 환불</b><br> -제품
									하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.<br> <br>
									<b style="font-size: 15px">주문취소</b><br> -주문취소 신청은 배송일 전날
									오후 6시까지 가능합니다. 오후 6시 이후에는 생산이 시작되어 취소가 불가능합니다.<br> -주문상품의
									부분 취소는 불가능합니다. 전체 주문취소 후 재구매 해주세요. <br> <br> <b
									style="font-size: 15px">배송</b><br> -주문 완료 후 배송 방법(택배)은 변경이
									불가능합니다.<br> -배송일 및 배송시간 지정은 불가능합니다.(예약배송 포함)<br> <br>
									*주문취소 외 평일 오후 5시(주말 공휴일 12시)까지 접수된 문의는 당일 답변드립니다. 이후 문의는 다음날 오전
									8시 부터 순차적으로 답변해드립니다. <br> <br> <!-- 1:1문의 내용  --> <textarea
										name="contents" id="contents"
										style="width: 100%; height: 300px; resize: none;">
						 </textarea>
								</td>
							</tr>
							<tr>
								<td style="background-color: #dcdbde">이미지</td>
								<td>

									<div id="refImage">
										<table class="table" id="addRow">
											<tr id="rowCount">
												<td><span><span id="num">1</span>
														<button>파일 선택</button> <label>선택된 파일 없음</label> <img
														src="/imgs/manager-img/add.png" id="addImg" /> </span></td>
											</tr>

										</table>
									</div>
								</td>
							</tr>

						</table>

						<div class="col-md-8" id="prInfoPolicy">

							<b>개인정보 수집 및 이용에 대한 안내</b> <br> <b>수집항목:</b> 이름, 전화번호, 이메일주소<br>
							<b>수집목적:</b> 상품문의 접수 및 결과 주소<br> <b>이용기간:</b> 원칙적으로 개인정보 수집
							및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.<br> 단, 관계법령의 규정에 의하여 보전할
							필요가 있는 경우<br> 일정기간 동안 개인정보를 보관할 수 있습니다. <br>그 밖의 사항은
							수상한 레시피 개인정보취급방침을 준수합니다.<br>

							<div class="row">
								<div class="col-md-10 row" style="border: 1px soild">
									<div class="col-md-10" style="text-align: center">
										<br> <input type="radio" id="agreeRdo"
											name="whetherAgree" value="agree"><label>동의</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" id="disAgreeRdo" name="whetherAgree"
											value="disAgree" /><label>동의하지 않습니다</label>

									</div>
								</div>
							</div>

						</div>
						<div class="row">

							<div class="offset-md-11 col-md-1">
							
							
								<button type="submit" class="btn btn-success" id="qnaSubmit">저장</button>

							</div>
						</div>
					</div>
				</div>

			</form>
		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
			
		</div>


	</div>
</body>
</html>
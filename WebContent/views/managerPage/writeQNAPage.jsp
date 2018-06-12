<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1:1문의 작성</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		/* $("#header").load("/views/header/main-Header.jsp"); */
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
	
	$(document).ready(function(){	/*주문번호 테이블  jquery  */
		var stat = true;
		
		$('#orderInquiry').click(function(){
			
			if(stat==true)
				{
					$('#hidingInquiry').css("display","block");
					stat = false;
				}
			else
				{
					$('#hidingInquiry').css("display","none");
					stat = true;
				}
		});

	});
	
	$(document).ready(function(){ /*주문번호 테이블  닫기  */
		$('#close').click(function(){
			$('#hidingInquiry').css("display","none");
		});
		
		
	});
	

	$(document).ready(function(){
				
		$('#qnaSubmit').click(function(){
			
			if(!$('#agreeRdo').checked && !$('#disAgreeRdo').checked)
				{
					console.log("앙");
					alert("개인정보 수집에 대해 동의해주세요 ");
				}
		});
	});
	
	$(document).ready(function(){
		var addRow = $('#tblRow').val();
		var addRow = $('#tblRow').text();
		""
		console.log(addRow);
		console.log()
		
		$('#addImg').click(function(){
			
			
			
			
		});
	});
	
	
	
	
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

.list-arrow{
	float:right;
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

#hidingInquiry {
	display: none;
}

#close {
	float: right;
}

#prInfoPolicy {
	text-size: 1px;
}

#qnaSubmit {
	float: right;
}

td {
	vertical-align: middle;
}
</style>


</head>
<body>
	<div class="container-fluid">
		<div id="header"></div>

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
			<div class="row" style="padding: 0;">
				<div id="customCenter" class="col-md-2" style="padding: 0;">
					<!-- 고객센터 목록 테이블 -->

					<table class="table table-bordered table-hover" id="forWriting">
						<tr>
							<td><a href="/views/managerPage/noticePage.jsp"
								style="color: black">공지사항<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="/views/managerPage/faqPage.jsp"
								style="color: black">FAQ<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr id="notice-color">
							<td><a href="/views/managerPage/oneToOneQNAPage.jsp"
								style="color: black">1:1문의<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">상품구매문의<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
					</table>

				</div>
				<div class="col-md-10">
					<table class="table table-bordered" id="writeQNAFormTbl">
						<tr height="70px">
							<td width="100px" style="background-color: #dcdbde;">제목</td>
							<td><br> <input type="text" size="100%" /></td>


						</tr>
						<tr height="70px">

							<td style="background-color: #dcdbde">주문번호</td>

							<td><input type="text" style="width: 25%" readonly />
								<button id="orderInquiry">주문조회</button>
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
											<td><input type="radio"></td>
										</tr>


									</table>
									<p id="close">close</p>

								</div></td>
						</tr>
						<tr>
							<td height="70px" style="background-color: #dcdbde">이메일</td>
							<td><input type="text" /> <!-- 타입은 이메일로 바꿔  --></td>

						</tr>
						<tr>
							<td height="70px" style="background-color: #dcdbde">문자메시지</td>
							<td><input type="text" size="10" maxLength="4" />&nbsp;- <input
								type="text" size="10" maxLength="4" />&nbsp;- <input
								type="text" size="10" maxLength="4" /></td>
						</tr>


						<tr>
							<td style="background-color: #dcdbde">내용</td>
							<td>

								<p>1:1 문의 작성 전 확인해주세요!.</p> <br>
								<h6>반품 / 환불</h6> -제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을
								남겨주세요.<br> <br>
								<h6>주문취소</h6> -주문취소 신청은 배송일 전날 오후 6시까지 가능합니다. 오후 6시 이후에는 생산이
								시작되어 취소가 불가능합니다.<br> -주문상품의 부분 취소는 불가능합니다. 전체 주문취소 후 재구매
								해주세요. <br> <br>
								<h6>배송</h6> -주문 완료 후 배송 방법(택배)은 변경이 불가능합니다.<br> -배송일 및 배송시간
								지정은 불가능합니다.(예약배송 포함)<br> <br> *주문취소 외 평일 오후 5시(주말 공휴일
								12시)까지 접수된 문의는 당일 답변드립니다. 이후 문의는 다음날 오전 8시 부터 순차적으로 답변해드립니다. <br>
							<br> <!-- 1:1문의 내용  --> <textarea
									style="width: 100%; height: 300px; resize: none;">
						 
						 
						 
						 </textarea>
							</td>
						</tr>



						<tr>
							<td style="background-color: #dcdbde">이미지</td>
							<td>



								<div id="refImage">
									<table class="table">
										<tr id="tblRow">
											<td><span><span id="num">1</span>
													<button>파일 선택</button>
													<label>선택된 파일 없음</label>
													<img src="/imgs/manager-img/add.png" id="addImg"/>
											</span></td>
										</tr>

									</table>



								</div>






							</td>
						</tr>

					</table>

					<div class="col-md-8" style="padding: 15px" id="prInfoPolicy">

						개인정보 수집 및 이용에 대한 안내 <br> 수집항목: 이름,전화번호,이메일주소<br> 수집목적:
						상품문의 접수 및 결과 주소<br> 이용기간: 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당
						정보를 지체 없이 파기합니다.<br> 단, 관계법령의 규정에 의하여 보전할 필요가 있는 경우<br>
						일정기간 동안 개인정보를 보관할 수 있습니다. <br>그 밖의 사항은 마켓컬리 개인정보취급방침을 준수합니다.<br>


					</div>
					<div class="col-md-10 row" style="border: 1px soild">
						<div class="col-md-10" style="text-align: center">
							<input type="radio" id="agreeRdo" name="agree" value="agree"><label>동의</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" id="disAgreeRdo" name="disAgree"
								value="disAgree" /><label>동의하지 않습니다</label>

						</div>

					</div>
					<div class="row">

						<div class="offset-md-11 col-md-1">

							<button type="button" class="btn btn-success" id="qnaSubmit">저장</button>

						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
			>
		</div>


	</div>
</body>
</html>
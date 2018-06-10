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
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

#notice_sub_tit {
	font-size: 15px;
}

#notice-color {
	background-color: #dcdbde;
}
</style>


</head>
<body>
	<div class="container-fluid">
		<div id="header"></div>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row">
				<div class="col-md-2">
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
			<div class="row">
				<div id="customCenter" class="col-md-2">
					<!-- 고객센터 목록 테이블 -->



					<table class="table table-bordered table-hover">
						<tr>
							<td><a href="/views/managerPage/noticePage.jsp"
								style="color: black">공지사항<img
									src="/imgs/notice-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="/views/managerPage/faqPage.jsp"
								style="color: black">FAQ<img
									src="/imgs/notice-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr id="notice-color">
							<td><a href="/views/managerPage/oneToOneQNAPage.jsp"
								style="color: black">1:1문의<img
									src="/imgs/notice-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">상품구매문의<img
									src="/imgs/notice-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
					</table>

				</div>
				<div class="col-md-10" >
					<table class="table table-bordered">
						<tr height="70px">
						<th width="100px">제목</th>
						<td>
						<br>
						<input type="text" size="100%"/>
						
						
						</td>
						
						


						</tr>
						<tr  height="70px">
						<th>주문번호</th>
						<td></td>
						</tr>
						<tr>
						<th height="70px">이메일</th>
						<td>
						<input type="email" value="ee">
						
						
						</td>						

						</tr>
						<tr>
						<th height="70px">문자메시지</th>
						<td>
						<input type="text"/>-<input type="text"/>-<input type="text"/>
						
						</td>						
						</tr>
						<tr>
						<th>이메일</th>
						<td>3</td>
						</tr>
						<tr>
						<th>문제메시지</th>
						<td>4</td>						
						</tr>
						<tr>
						<th>내용</th>
						<td>5</td>
						</tr>
						<tr>
						<th>이미지</th>
						<td>6</td>						
						</tr>








					</table>

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
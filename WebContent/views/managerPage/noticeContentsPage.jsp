<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 내용</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/noticePage_css/noticeContents.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
</script>

</head>
<body>
	<div class="container-fluid">

		<div id="header"></div>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;"contents">
			<div class="row">
				<div class="col-md-2">
					<!--고객센터 목록  -->
					<br>
					<h2>고객센터</h2>
					<br>
				</div>
				<div class="col-md-10">
					<br>
					<h5>
						공지사항&nbsp;<span id="notice_sub_tit">새로운 소식과 유용한 정보들을 한곳에서
							확인하세요.</span>
					</h5>
					<hr>
				</div>


			</div>
			<br>
			<div class="row">
				<div id="customCenter" class="col-md-2">
					<!-- 고객센터 목록 테이블 -->

					<table class="table table-bordered table-hover" id="custom_listTlb">
						<tr>
							<td><a href="#" style="color: black">공지사항</a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">FAQ</a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">상품구매문의</a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">개선방안</a></td>
						</tr>
					</table>
				</div>

				<div class="col-md-10">
					<table class="table table-bordered" id="notice_infoTbl">
						<thead>
							<tr>
								<th style="width:100px; background-color:lightgray;" >제목</th>
								<td colspan="4">귤이 단가요 신가요....</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th style="background-color:lightgray">작성자</th>
								<td colspan="4">토게피</td>

								
							
							</tr>
							<tr>
								<th style="background-color:lightgray">작성일</th>
								<td colspan="4">2018-06-08</td>
					
								

								
							</tr>
							<tr>
								<td  style="background-color:lightgray">3</td>
								<td>Larry</td>
								<td>First</td>
								<td>First</td>
								<td>First</td>
								
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="row">
					<div style="height:200px; boder:1px solid black;">
					
					
					</div>
				
				</div>
				



			</div>



			<div id="footer"
				class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
				style="border: 1px solid black; padding: 10px;">
				<!-- footer -->
			</div>

		</div>
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
		<script src="/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Notice Page</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/noticePage_css/notice.css">

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


<style>
/* #noticeTable>a{

color:black;

} */
#notice-color{

background-color:#dcdbde;

}
.list-arrow{
float:right;

}
#noticePage{
	position:relative;
	left:43%;


}


</style>


</head>
<body>

	<div class="container-fluid" style="padding:0px">

		<div id="header"></div>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row">
				<div class="col-md-2" style="padding:0;">
					<!--고객센터 목록  -->
					<br>
					<h2>고객센터</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h2>
						공지사항&nbsp;<span id="notice_sub_tit">새로운 소식과 유용한 정보들을 한곳에서 확인하세요</span>
					</h2>
				</div>
			</div>
			<br>
			<div class="row">
				<div id="customCenter" class="col-md-2" style="padding:0;">
					<!-- 고객센터 목록 테이블 -->
					
					

					<table class="table table-bordered table-hover">
						<tr id="notice-color">
							<td><a href="/views/managerPage/noticePage.jsp" style="color:black">공지사항<img src="/imgs/manager-img/right-arrow.png" height="9px" class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="/views/managerPage/faqPage.jsp" style="color:black">FAQ<img src="/imgs/manager-img/right-arrow.png" height="9px" class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="/views/managerPage/oneToOneQNAPage.jsp" style="color:black">1:1문의<img src="/imgs/manager-img/right-arrow.png" height="9px" class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="#" style="color:black">상품구매문의<img src="/imgs/manager-img/right-arrow.png" height="9px" class="list-arrow"></a></td>
						</tr>
					</table>
					
				</div>

				<div class="col-md-10" id="test-div">
					<!--공지사항 테이블 -->
					<!--공지사항 테이블 -->
					<table class="table" id="noticeTable">
						<caption>List of notice</caption>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td><a href="/views/managerPage/noticeContentsPage.jsp">
								귤이신가요 단가요</a>
								</td>
								<td>토게피</td>
								<td>2018-06-04</td>
								<td>15</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>미국산척아이롤을 이용한 요리</td>
								<td>마자용</td>
								<td>2018-06-04</td>
								<td>11</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>배송중지 안내</td>
								<td>관리자</td>
								<td>2018-06-04</td>
								<td>12</td>
							</tr>
						</tbody>
					</table>


				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"  id="noticePage" >
					<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item"><a class="page-link" href="#">Next</a></li>
						  </ul>
					</nav>
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
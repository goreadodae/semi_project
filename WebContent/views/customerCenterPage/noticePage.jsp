<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Notice Page</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/noticePage_css/notice.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
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

	$(document).ready(function() {
		$('#list-color tr').eq(0).addClass('on');
	});
</script>


<style>
.list-arrow {
	float: right;
}

#noticePage {
	position: relative;
	left: 43%;
}
body
{
font-family: 'Nanum Gothic', sans-serif;

}
</style>


</head>
<body>

	<div class="container-fluid" style="padding: 0px">

		<div id="header"></div>

		<div style="background-color: #f8faff; padding: 0px">
			<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
				style="border: 1px solid black; padding: 10px;" id="contents">
				<div class="row">
					<div class="col-md-2" style="padding: 0;">
						<!--고객센터 목록  -->
						<br>
						<h2>고객센터</h2>
						<br>
					</div>
					<div class="col-md-8">
						<br>
						<h2>
							공지사항&nbsp;<span id="notice_sub_tit">새로운 소식과 유용한 정보들을 한곳에서
								확인하세요</span>
						</h2>
					</div>
				</div>
				<br>
				<div class="row">
					<div id="customCenter" class="col-md-2" style="padding: 0;">
						<jsp:include page="/views/customerCenterPage/contentsLeft.jsp"
							flush="false" />
					</div>
					<div class="col-md-10" id="test-div">

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

								<c:forEach items="${requestScope.pageData.noticeList}" var="nl"
									varStatus="i">
									<c:url var="url" value="/noticeDetail">
										<c:param name="noticeNo" value="${nl.noticeNo}"></c:param>
									</c:url>
									<tr>

										<th scope="row">${nl.noticeNo}</th>
										<td style="text-align: left; width: 50%"><a href="${url}">
												${nl.noticeTitle} </a></td>
										<td>${nl.noticeWriter}</td>
										<td>${nl.reportingDate}</td>
										<td>${nl.noticeViews}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>


					</div>
				</div>

				<div class="row">
					<div class="col-md-3" id="noticePage">
						<nav aria-label="Page navigation example">
							<ul class="pagination">${requestScope.pageData.pageNavi}</ul>
						</nav>
					</div>
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
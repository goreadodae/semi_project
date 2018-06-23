<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice Page</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/noticePage_css/notice.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<script>


	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		
		$("#footer").load("/views/footer/main-Footer.jsp");

	});

	
	
	$(document).ready(function() {
		$('#list-color tr').eq(0).addClass('on');
	});
	
	
	/* 중복체크 방지   */
  	function onlyOneCheck(a){
		var checkedBox = document.getElementsByName("searchBy");
		for(var i=0; i<checkedBox.length; i++)
			{
				if(checkedBox[i] != a)
					{
						console.log(a);
						checkedBox[i].checked=false;
					}
			}
		
	}  

	
	
</script>


<style>
.list-arrow {
	float: right;
}

body {
	font-family: 'Nanum Gothic', sans-serif;
}

#pagination {
	position: relative;
	left: 45%;
}

#searchTable td {
	padding-top: 20px;
	padding-bottom: 100px;
}

#searchTable tr td input {
	vertical-align: middle;
}
.page-item.active>.page-link{
   background-color: #512772 !important;
   border-color: #512772 !important;
   color: white !important;
}
.page-item>.page-link{
   color: #512772 !important;
}
</style>


</head>
<body style="overflow-x: hidden; overflow-y: auto;">

	<div class="container-fluid" style="padding: 0px">

		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>


		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="padding: 10px;" id="contents">
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

					<div class="row">
						<div class="col-md-12">
							<div>
								<nav aria-label="Page navigation example" id="pagination">
									<ul class="pagination">${requestScope.pageData.pageNavi}</ul>
								</nav>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
							<form action="/searchNotice" method="get">
								<table style="border-top: 2px solid #795b8f; width: 100%;"
									id="searchTable">
									<tr>
										<td>검색어</td>
										<td style="width: 40%">
										<input type="checkbox"	name="searchBy" value="searchName" onclick="onlyOneCheck(this);"/>
										 이름 &nbsp;&nbsp; 
										 <input	type="checkbox" checked name="searchBy" value="searchTitle" onclick="onlyOneCheck(this);" />
										  제목&nbsp;&nbsp; 
										  <input type="checkbox" name="searchBy" value="searchContents" onclick="onlyOneCheck(this);"/> 
										  내용&nbsp;</td>
										  <td style="width: 50%; text-align: right;">
										  <input type="text" style="width: 200px; height: 33px" id="inputWord" name="inputWord"/>
											<button type="submit" class="btn btn-outline-primary" >검색</button>

										</td>
									</tr>
								</table>
							</form>
						</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	
	function listBack()
	{
		history.go(-1);
	}
	
	
</script>
<style>

#noti-contents{
	border-bottom-style:solid;
	border-bottom-color:#56297a;
}

hr{
	display:block;
	border-style: solid;
	border-color:#56297a;

}
#test{
	border-right-color:white;
}
#listBtn{
	float:right;
	
}

</style>

</head>
<body>
	<div class="container-fluid">

		<div id="header"></div><!--메인헤더 가지고 옴   -->

<!--여기서부터 컨텐츠 영역(공지사항 내용)  -->
		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black;padding: 10px;" id="contents">
			<div class="row" style="padding:0;"><!--공지사항 타이틀  -->
				<div class="col-md-12" style="padding:0;">
					<br>
					<h5>
						공지사항&nbsp;<span id="notice_sub_tit">새로운 소식과 유용한 정보들을 한곳에서
							확인하세요.</span>
					</h5>
					<hr>
				</div>


			</div>
			<br>
			<div class="row" style="padding:0;"><!--공지사항 정보와 상세내용   -->

				<div class="col-md-12" style="padding:0;">
					<table class="table table-bordered" style="text-align:left;" cellpadding="0" cellspacing="0">	
						<thead>
							<tr>
								<th style="width:100px; background-color: lightgray;">제목</th>
								<td colspan="4">${requestScope.notice.noticeTitle}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th style="background-color: lightgray">작성자</th>
								<td colspan="4">${requestScope.notice.noticeWriter}</td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">작성일</th>
								<td width="150px">${requestScope.notice.reportingDate}</td>
								<th style="background-color: lightgray;" width="100px">조회수</th>
								<td><span id="viewCount">${requestScope.notice.noticeViews}</span></td>
								<!-- 카운트 해야함  -->
							</tr>

							<tr>
							
							
							
							</tr>
						</tbody>
					</table>
				</div>
			</div>
 			<div class="row" style="padding:0;">
					<div class="col-md-12" style="height:300px; padding:0;">
							${requestScope.notice.noticeContents}			
					</div>
					
					<hr>
			</div> 

			<hr style="padding:0;">
			<div class="row" style="padding:0;">
				<div class="col-md-12">
					<button type="button" onclick="listBack();" class="btn btn-outline-primary" id="listBtn">목록</button>
				</div>
			
			
			</div>
			

			
			
			</div>

<!--풋터임  -->
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
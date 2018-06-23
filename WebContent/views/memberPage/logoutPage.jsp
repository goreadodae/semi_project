<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<title>수상한 레시피</title>

<!-- 모바일 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- 초기화 -->
<link rel="stylesheet" href="/css/reset.css">

<!-- 부트스트랩  -->
<link rel="stylesheet" href="/js/bootstrap.js">
<link rel="stylesheet" href="/css/bootstrap.css">

<!-- 메인 스타일 -->
<link rel="stylesheet" href="/css/mainPage_css/main.css">

<!-- 해더 불러오는 제이쿼리  -->
<script src="/js/main/necessary.js"></script>

</head>
<body style="overflow-x: hidden; overflow-y: auto;">
	<% String beforeURI = request.getHeader("referer"); %>
	<script>
		<%if(beforeURI.substring(1, 6).equals("myHome")){%>
			location.href=beforeURI;
		<%}else{%>
			location.href="/index.jsp";
		<%}%>
	</script>
</body>
</html>
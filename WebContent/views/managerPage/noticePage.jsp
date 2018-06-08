<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
/* 해더 불러오는 제이쿼리 */
$(document).ready(function() {
	$("#header").load("/views/header/Main-Header.html");
	$("#footer").load("/views/footer/Main-Footer.html");
});
</script>

<style>
*{
	margin 0;
	padding 0;
}

#contents{

background-color:white;
}

#customCenter{


}
#cclist{


}

#cclist>li{
	border: 1px solid black;
	height:50px;
	

}


</style>

</head>
<body>

<div id="header">
</div>

<div class="container-fluid" id= "contents">
<br><h2>고객센터</h2><br>
<br>
<div id="customCenter" class="col-md-2">

	<table class="table table-bordered table-hover" >
		<tr><td><a href="#">공지사항</a></td></tr>
		<tr><td><a href="#">FAQ</a></td></tr>
		<tr><td><a href="#">상품구매문의</a></td></tr>
		<tr><td><a href="#">개선방안</a></td></tr>
	</table>


</div>

</div>









<div id="footer"></div>


    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>
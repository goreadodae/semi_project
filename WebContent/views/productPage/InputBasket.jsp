<!-- 장바구니에 담김메시지 페이지 -->

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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>


<body>
<script>
$(document).ready(function(){
    
    $('#close').click(function(){
    	self.close();
    });
    
    
});

function pageChange(){
	window.opener.location.href="/basketSelect";
	window.close();
}
</script>

<br><br>
<center>
<img src="/imgs/product_img/basket.jpg" alt="장바구니.jpg"><br><br>
<button type="button" class="btn btn-default" onclick="pageChange();">장바구니 보기</button> &nbsp;
<button type="button" class="btn btn-primary" id="close">계속 쇼핑하기</button>
</center>

</body>
</html>
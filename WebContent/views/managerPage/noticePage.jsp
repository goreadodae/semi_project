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
/* �ش� �ҷ����� �������� */
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
<br><h2>������</h2><br>
<br>
<div id="customCenter" class="col-md-2">

	<table class="table table-bordered table-hover" >
		<tr><td><a href="#">��������</a></td></tr>
		<tr><td><a href="#">FAQ</a></td></tr>
		<tr><td><a href="#">��ǰ���Ź���</a></td></tr>
		<tr><td><a href="#">�������</a></td></tr>
	</table>


</div>

</div>









<div id="footer"></div>


    <!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>
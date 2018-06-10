<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1:1 ���� ������ �Դϴ�.</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	/* �ش� �ҷ����� �������� */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
</script>

<style>
* {
	margin: 0;
	padding: 0;
}
#notice-color{
	background-color:#dcdbde;

}

</style>

</head>
<body>

		<!--  1:1 ���� ������ ���鶧 �����ؾ� �� ��!!
			1. �α����������� 1:1���ǰ� �����ϴ�....
			(�α����� ���� �ʾ��� ��� �α��� â���� ������!!)
			2. ȸ���� 1:1 ���Ǹ� �ۼ����� �� ������ db�� ���..
			3. ������ ���������� ���ǻ����� �� �� �ְ� �����Ѵ�..�Ф�
			4. ����ڴ� ������ �ߴ� ���ǵ� �� �� �ְ� �ؾ� �Ѵ�.
			5. ���ǳ����� ���ٸ�!! �÷��� ����� ���� �������������� ���ǳ����� �������� �ʴ´ٴ� ������ �־�� ��!!
			6. �۾��� ��ư Ŭ���� �� �������� �ۼ� �������� ����
			7. ������
		  -->
	<div class="container-fluid">
		<div id="header"></div>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row">
				<div class="col-md-2">
					<!--������ ���  -->
					<br>
					<h2>������</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h4 style="line-height:35px">
						1:1���ǻ���&nbsp;
					</h4>
				</div>
			</div>
			<br>
			<div class="row">
				<div id="customCenter" class="col-md-2">
					<!-- ������ ��� ���̺� -->



					<table class="table table-bordered table-hover">
						<tr>
							<td><a href="/views/managerPage/noticePage.jsp"
								style="color: black">��������<img
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
								style="color: black">1:1����<img
									src="/imgs/notice-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">��ǰ���Ź���<img
									src="/imgs/notice-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
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
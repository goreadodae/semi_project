<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
#list-color tr.on {
	background-color: #f7f5f8;
}

#list-color tr:hover {
	background-color: #f7f5f8;
	cursor: pointer;
}

#list-color tr {
	
}
</style>
</head>
<body>
	<div id="customCenter">
		<!-- ������ ��� ���̺� -->

		<table class="table table-bordered" id="list-color">
			<tr onclick="location.href='/noticeList'">
				<td>��������<img src="/imgs/manager-img/right-arrow.png"
					height="9px" class="list-arrow"></td>
			</tr>
			<tr onclick="location.href='/faqList'">
				<td>FAQ<img src="/imgs/manager-img/right-arrow.png"
					height="9px" class="list-arrow"></td>
			</tr>
			<tr
				onclick="location.href='/views/customerCenterPage/oneToOneQNAPage.jsp'">
				<td>1:1����<img src="/imgs/manager-img/right-arrow.png"
					height="9px" class="list-arrow"></td>
			</tr>

		</table>

	</div>

</body>
</html>
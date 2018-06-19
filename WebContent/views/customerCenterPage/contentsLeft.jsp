<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
#list-color tr.on{
background-color:#f7f5f8;

}

</style>
</head>
<body>
				<div id="customCenter">
					<!-- 고객센터 목록 테이블 -->

					<table class="table table-bordered table-hover"  id="list-color">
						<tr>
							<td><a href="/noticeList" style="color: black">공지사항<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a
								href="/faqList"
								style="color: black">FAQ<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="/views/customerCenterPage/oneToOneQNAPage.jsp"
								style="color: black">1:1문의<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>

					</table>

				</div>

</body>
</html>
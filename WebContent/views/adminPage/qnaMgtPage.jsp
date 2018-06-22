<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#qnaTbl tr {
text-align:center;


}


</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row" style="padding: 0px">
			<jsp:include page="/views/adminPage/layoutPageLeft.jsp"></jsp:include>

			<div class="container" style="padding: 0px">
				<div class="col-md-12">
					<div class="col-md-12" style="text-align: center">
						<br>
						

					</div>
				</div>

				<br> <br> <br>
				<div class="col-md-12" style="height: 800px">
					<br> <br>
					<h2>문의사항</h2><br>
					<table class="table" id="qnaTbl"
						style="border-top: 2px solid #795b8f !important; border-bottom: 2px solid #795b8f !important;">
						<tr>
							<th>문의번호</th>
							<th>문의내용</th>
							<th>문의시간</th>
							<th>회원번호</th>
							<th>회원아이디</th>
							<th>구매번호</th>
							<th>답변여부</th>
						</tr>
						<c:forEach items="${requestScope.adminQData.dataList}" var="ql">
							<tr>
								<td>${ql.queNo}</td>
								<td>${ql.queTitle}</td>
								<td>${ql.queTime}</td>
								<td>${ql.memberNo}</td>
								<td>${ql.memberId}</td>
								<td>${ql.buyingNo}</td>
								<td>${ql.responseYn}</td>
							</tr>


						</c:forEach>




					</table>


					<div class="row">
						<div class="container">
							<div class="col-md-5">

								<nav aria-label="Page navigation example" id="pagination">
								<ul class="pagination ">${requestScope.adminQData.pageNavi}</ul>
								</nav>


							</div>
						</div>


					</div>


				</div>
			</div>


		</div>



	</div>




</body>
</html>
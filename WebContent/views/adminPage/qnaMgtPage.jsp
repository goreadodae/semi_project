
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#qnaTbl tr {
text-align:center;


}.page-item.active>.page-link {
	background-color: #512772 !important;
	border-color: #512772 !important;
	color: white !important;
}

.page-item>.page-link {
	color: #512772 !important;
}

.btn.btn-primary{
	background-color: #512772 !important;
	border-color: #512772 !important;
	color: white !important;
	margin: 1px;
	
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
							<c:url var="url" value="/answertMgt">
								<c:param name="queNo" value="${ql.queNo}"></c:param>
							</c:url>
						
						
						
							<tr>
								<td>${ql.queNo}</td>
								<td><a href="${url}">${ql.queTitle}</a></td>
								<td>${ql.queTime}</td>
								<td>${ql.memberNo}</td>
								<td>${ql.memberId}</td>
								<td>${ql.buyingNo}</td>
								<td>
								${ql.responseYn}
								
								
								</td>
							</tr>


						</c:forEach>
						<c:if test="${requestScope.adminQData.dataList eq null }">
							<tr>
							<td colspan="7" style="hight:200px">
									<h1>미답변 문의사항이 없습니다.</h1>
							</td>
							
							
							</tr>
						
						</c:if>



					</table>


					
						<div class="container">
							<div class="row offset-md-5 col-md-4">
							
			
								<nav aria-label="Page navigation example" id="pagination">
								<ul class="pagination " style="margin-left:auto; margin-right:auto;">
								${requestScope.adminQData.pageNavi}</ul>
								</nav>


							</div>
						</div>


		


				</div>
			</div>


		</div>



	</div>




</body>
</html>
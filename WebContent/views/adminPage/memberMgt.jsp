
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
					<h2>회원목록</h2><br>
					<table class="table" id="qnaTbl"
						style="border-top: 2px solid #795b8f !important; border-bottom: 2px solid #795b8f !important;">
						<tr>
							<th>회원번호</th>
							<th>회원아이디</th>
							<th>회원이름</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>성별</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>별명</th>
							
						</tr>
						<c:forEach items="${requestScope.mpd.dataList}" var="dl">
			
						
						
						
							<tr>
								<td>${dl.memberNo}</td>
								<td>${dl.memberId }</td>
								<td>${dl.memberName}</td>
								<td>${dl.birthDate}</td>
								<td>${dl.phone}</td>
								<td>${dl.address}</td>
								<td>${dl.gender}</td>
								<td>${dl.email}</td>
								<td>${dl.enrollDate}</td>
								<td>${dl.nickName}</td>
								
							</tr>


						</c:forEach>
						<c:if test="${requestScope.mpd.dataList eq null }">
							<tr>
							<td colspan="7" style="hight:200px">
									<h1>회원목록이없습니다.</h1>
							</td>
							
							
							</tr>
						
						</c:if>



					</table>


					
						<div class="container">
							<div class="row offset-md-5 col-md-4">
							
			
								<nav aria-label="Page navigation example" id="pagination">
								<ul class="pagination " style="margin-left:auto; margin-right:auto;">
								${requestScope.mpd.pageNavi}</ul>
								</nav>


							</div>
						</div>


		


				</div>
			</div>


		</div>



	</div>




</body>
</html>
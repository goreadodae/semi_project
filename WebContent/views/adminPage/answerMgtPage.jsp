<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLineChar","\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#qnaTbl tr {
	text-align: center;
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
					<h2>문의사항</h2>
					<br>
					<table class="table table-bordered"
						style="text-align: left;  border-top: 2px solid #795b8f !important; border-bottom: 2px solid #795b8f !important">
						
							<tr>
								<th style="width:100px; background-color: lightgray;">제목</th>
								<td colspan="4" width="200px">
									${requestScope.qt.queTitle}
								</td>
							</tr>
						
						
							<tr>
								<th style="background-color: lightgray">작성자</th>
								<td colspan="4" width="150px">
								${requestScope.qt.memberId}
								</td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">문의시간</th>
								<td colspan="4" width="150px">
								${requestScope.qt.queTime}
								
								</td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">구매번호</th>
								<td width="150px">
								${requestScope.qt.buyingNo}
								
								
								</td>
								<th style="background-color: lightgray; width:100px">문의번호</th>
								<td>
								${requestScope.qt.queNo}

								</td>
				
									
							</tr>
					</table>

					<div class="row">

						<div class="col-md-12"
							style="text-align: justify; padding: 30px;">
							
							${fn:replace(requestScope.qt.queContents,newLineChar,"<br/>")}
							
							<br> <br>
						</div>


					</div>


				</div>
			</div>


		</div>



	</div>




</body>
</html>
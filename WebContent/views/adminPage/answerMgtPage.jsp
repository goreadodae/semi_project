<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- border-top: 2px solid #795b8f !important; border-bottom: 2px solid #795b8f !important;
 -->
				<br> <br> <br>
				<div class="col-md-12" style="height: 800px">
					<br> <br>
					<h2>문의사항</h2><br>
					 <table class="table table-bordered" style="text-align: left;cellpadding='0'; cellspacing='0';
					 	border-top: 2px solid #795b8f !important; border-bottom: 2px solid #795b8f !important
					  ">
                  <thead>
                     <tr>
                        <th style="width: 100px; background-color: lightgray;">제목</th>
                        <td width="200px"></td>
                        <th style="background-color:lightgray; width=100px;">구매번호</th>
                        <td></td>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <th style="background-color: lightgray">작성자</th>
                        <td width="150px"></td>
                        <th style="background-color:lightgray; width=100px;">문의번호</th>
                        <td></td>
                     </tr>
                     <tr>
                        <th style="background-color: lightgray;">문의시간</th>
                        <td width="150px"></td>
                        <th style="background-color: lightgray;" width="100px">회원아이디</th>
                        <td></td>
                        <!-- 카운트 해야함  -->
                     </tr>

                     <tr>
                     </tr>
                  </tbody>
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
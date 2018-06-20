<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1:1 문의 페이지 입니다.</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
	$(document).ready(function(){
		$('#list-color tr').eq(2).addClass('on');
	});
	
	
	
	
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

#noHasList{
	position:relative;
	text-align:center;
	top:40%;

}
.list-arrow{
	float:right;
}

</style>

</head>
<body>


<c:if test="${sessionScope.user==null}" >
<script language="javascript">
alert("로그인 후 이용해주세요 ^^");
location.href="/views/memberPage/loginPage.jsp";

</script>
	<%-- <c:redirect url="/views/memberPage/loginPage.jsp"/> --%>
</c:if>

	<div class="container-fluid" style="padding:0px">
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row" style="padding:0;">
				<div class="col-md-2" style="padding:0;">
					<!--고객센터 목록  -->
					<br>
					<h2>고객센터</h2>
					<br>
				</div>
				<div class="col-md-8" >
					<br>
					<h4 style="line-height:35px">
						1:1문의사항&nbsp;
					</h4>
				</div>
			</div>
			<br>
			<div class="row" style="padding:0;">
				<div id="customCenter" class="col-md-2" style="padding:0;">
					<!-- 고객센터 목록 테이블  include-->
					<jsp:include page="/views/customerCenterPage/contentsLeft.jsp" flush="false"/>
				</div>

			<div class="col-md-10">
			
			<table class='table'>
			<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			</tr>

			</table>
			<!-- 사용자가 문의 한 내역이 없을때  -->
			<div class="cols-md-10" style=" height:300px">
				
				<div id="noHasList">
					<h6>1:1문의내역이 존재하지 않습니다.</h6>
				
				</div>
			
			</div>
			<div class="offset-md-11 cols-md-1">
			
			
			<button type="button" class="btn btn-success" onclick="location.href='/views/customerCenterPage/writeQNAPage.jsp'">작성하기</button>
			</div>


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
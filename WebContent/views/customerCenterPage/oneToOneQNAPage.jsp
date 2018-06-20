<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	<c:redirect url="/views/memberPage/loginPage.jsp"/>
</c:if>
	
	
		<!--  1:1 문의 페이지 만들때 생각해야 할 것!!
			1. 로그인했을때만 1:1문의가 가능하다....
			(로그인을 하지 않았을 경우 로그인 창으로 가야함!!)
			2. 회원이 1:1 문의를 작성했을 시 관리자 db로 고고..
			3. 관리자 페이지에서 문의사항을 볼 수 있게 구현한다..ㅠㅠ
			4. 사용자는 예전에 했던 문의도 볼 수 있게 해야 한다.
			5. 문의내역이 없다면!! 컬럼명만 남기고 문의 컨텐츠영역에는 문의내역이 존재하지 않는다는 문구가 있어야 함!!
			6. 글쓰기 버튼 클릭시 새 페이지로 작성 공간으로 ㄱㄱ
			7. 흑흑흑
		  -->
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
			<!-- <a href="/views/managerPage/writeQNAPage.jsp">작성하기(임시링크)</a> -->
			
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
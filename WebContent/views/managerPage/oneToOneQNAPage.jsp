<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1:1 문의 페이지 입니다.</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		/* $("#header").load("/views/header/main-Header.jsp"); */
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
	<div class="container-fluid">
		<div id="header"></div>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row">
				<div class="col-md-2">
					<!--고객센터 목록  -->
					<br>
					<h2>고객센터</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h4 style="line-height:35px">
						1:1문의사항&nbsp;
					</h4>
				</div>
			</div>
			<br>
			<div class="row">
				<div id="customCenter" class="col-md-2">
					<!-- 고객센터 목록 테이블 -->



					<table class="table table-bordered table-hover">
						<tr>
							<td><a href="/views/managerPage/noticePage.jsp"
								style="color: black">공지사항<img
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
								style="color: black">1:1문의<img
									src="/imgs/notice-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">상품구매문의<img
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
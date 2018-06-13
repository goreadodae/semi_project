<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FAQ 페이지 입니다.</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});

	$(document).ready(function() {
		var stat = true; /*display상태에 따라.... */
		$("#whenClick").click(function() { /* faq 제목 클릭시 이벤트 발생  */
			if (stat == true) /*when display is none */
			{
				$("#hidingContens").css("display", "block");
				stat = false;

			} else { /*  when display is block */
				console.log("false값일때");
				$("#hidingContens").css("display", "none");
				stat = true;
			}
		});
	});

	$(document).ready(function() {

		var jbOffset = $('#content-main').offset();

		$(window).scroll(function() {
			if ($(document).scrollTop() >= jbOffset.top) {
				$('#fixed_layer').addClass('jbFixed');

				if (matchMedia("screen and (max-width: 767px)").matches) {
					$('#fixed_layer').removeClass('jbFixed');
				}

			} else {
				$('#fixed_layer').removeClass('jbFixed');
			}
		});

	});
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

#notice_sub_tit {
	font-size: 15px;
}

#faq-color {
	background-color: #dcdbde;
}

.list-arrow {
	float: right;
}

#hidingContens {
	display: none;
	text-align: center;
}
#whenClick{
	cursor:pointer;

}
</style>
</head>
<body>

	<div class="container-fluid" style="padding:0px">
		<div id="header"></div>

		<div id="contents"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<div class="row" style="padding: 0;">
				<div class="col-md-2" style="padding: 0;">
					<!--고객센터 목록  -->
					<br>
					<h2>고객센터</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h2>
						FAQ&nbsp;<span id="notice_sub_tit"> 고객님들이 자주 묻는 질문들을 모두
							모았습니다. </span>
					</h2>
				</div>
			</div>
			<br>
			<div class="row" style="padding: 0;">
				<div id="customCenter" class="col-md-2" style="padding: 0;">
					<!-- 고객센터 목록 테이블 -->

					<table class="table table-bordered table-hover">
						<tr id="notice-color">
							<td><a href="/views/managerPage/noticePage.jsp"
								style="color: black">공지사항<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td id="faq-color"><a href="/views/managerPage/faqPage.jsp"
								style="color: black">FAQ<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="/views/managerPage/oneToOneQNAPage.jsp"
								style="color: black">1:1문의<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">상품구매문의<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
					</table>

				</div>
				<div class="col-md-10">
					<!-- for문 사용?????  -->
					<table class="table" id="faqTable" style="text-align: center">
						<tr>
							<th scope="col" width="50px">번호</th>
							<th scope="col" width="100px">카테고리</th>
							<th scope="col">제목</th>
						</tr>
						<tr>
							<td>1</td>
							<td>회원관련</td>
							<td id="whenClick">회원가입시 주어지는 혜택이 무엇이있나요??</td>
						</tr>
					</table>
					<div class="row">
						<div class="col-md-10" id="hidingContens">
							<img src="/imgs/manager-img/faq.png" height="15px">&nbsp;
							아무것도 없습니다 고객님^^
							<!-- faq 이미지, faq답변 내용  -->

						</div>

					</div>

				</div>

			</div>
		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
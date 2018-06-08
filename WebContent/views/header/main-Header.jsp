<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonym6ous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<title>Document</title>
<style>
.jbTitle {
	text-align: center;
}

#fixed_layer {
	z-index: 1000;
	text-align: center;
	background: -webkit-gradient(linear, center bottom, center top, from(#fff),
		to(#fff));
	padding: 0px;
	left: 5px;
	width: 100%;
}

.jbContent {
	height: 2000px;
}

.jbFixed {
	position: fixed;
	left: 0px;
	top: 0px;
}

.nav-category {
	text-decoration: none;
	color: black;
}
</style>

<script>
	$(document).ready(function() {
		var jbOffset = $('#fixed_layer').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('#fixed_layer').addClass('jbFixed');
			} else {
				$('#fixed_layer').removeClass('jbFixed');
			}
		});
	});
</script>

</head>
<body>
	<!-- Header -->
	<div class="header">
		<div class="col-md-8 mx-auto">
			<ul class="nav justify-content-end">

				<li class="nav-item text-center"><a class="nav-link" href="#"
					style="color: black; font-size: 12px;">회원가입</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					style="color: black; font-size: 12px;">로그인</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false"
					style="color: black; font-size: 12px;">고객센터</a>

					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">공지사항</a> <a
							class="dropdown-item" href="#">자주하는 질문</a> <a
							class="dropdown-item" href="#">1:1 문의</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"
					style="color: black; font-size: 12px;">배송지역 검색</a></li>
			</ul>
		</div>

		<!-- header-main-logo -->
		<div class="row">
			<div class="col-8 mx-auto">
				<div class="jumbotron text-center" style="background-color: white;">
					<div></div>
					<div>
						<h1 class="display-3">수상한레시피</h1>
					</div>
				</div>
			</div>
		</div>

		<!-- nav  -->
		<div class="nav-scroller border-right-0 border-left-0"
			id="fixed_layer" style="border: 1px solid #dadada;">
			<div class="col-md-8 mx-auto">
				<div class="row">

					<div class="col-md-2" style="background-color: #512772">
						<a class="nav-category" href="#"
							style="line-height: 50px; color: white;"> <img
							src="/imgs/main-img/ico_gnb_all.jpg" height="14px">&nbsp;&nbsp;&nbsp;카테고리
						</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category" href="/recipeList" style="line-height: 50px;">레시피</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category"
							href="/views/rankingPage/rankingPage.jsp"
							style="line-height: 50px;">랭킹</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category" href="#" style="line-height: 50px;">이벤트</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category" href="#" style="line-height: 50px;">검색</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category" href="#" style="line-height: 50px;">마이홈</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
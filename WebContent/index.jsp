<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- 초기화 -->
<link rel="stylesheet" href="/WebContent/css/reset.css">

<!-- Bootstrap CSS/JS -->
<link rel="stylesheet" href="/WebContent/js/bootstrap.js">
<link rel="stylesheet" href="/WebContent/css/bootstrap.css">
<link rel="stylesheet" href="/WebContent/css/main-style.css">

<!-- Header JS -->
<link rel="stylesheet" href="/WebContent/js/headerpage/header.js">

<title>수상한 레시피</title>

<!-- 해더 불러오는 제이쿼리  -->
<script>
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
</script>

<!-- 영역 설정 -->
<script>
	$(document).ready(function() {

		var $info = $("#info");

		window.onresize = function() {
			$info.html(window.innerWidth);
		}
	});
</script>

<!-- 스타일 값 설정 -->
<style>
.side_menu_text {
	text-decoration: none;
	color: black;
	font-size: 13px;
}

#aside {
	margin-top: 0;
	position: fixed;
	float: left;
	right: 0;
	bottom: -2;
	padding: 3;
	z-index: 100;
}

@media ( max-width :768px) {
	#aside {
		visibility: hidden;
	}
	#navi {
		margin: 0;
		padding: 0;
	}
}
</style>

</head>

<body>
	<!-- <a href="/views/ranking_page/ranking_main.jsp">占쏙옙킹</a> -->
	<div class="container-fluid">

		<!-- 화면 너비 계산 -->
		<div id="info" style="text-align: center;">info</div>


		<!-- 해더 영역 -->
		<div id="header">
			<!-- 로드 -->
		</div>

		<!-- 컨텐츠 영역 -->
		<div id="content-main" class="contents">

			<!-- 컨텐츠 메인 이미지 -->
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel" class="col-md-12 col-sm-12"
				style="padding: 0px;">

				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/74e51d1f685eef277b3f8bcc4f46a6e6.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="//img-cf.kurly.com/shop/data/skin/designgj/img/banner/e7db9680d0d92745b0f93b61c5533927.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="//img-cf.kurly.com/shop/data/skin/designgj/img/banner/17eb40928a7c9247d693e51dbd339553.jpg"
							alt="Third slide">
					</div>
				</div>

				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>



			<br> <br>

			<!-- 사이드 메뉴 -->
			<div id="aside"
				style="height: 135px; display: inline-block; padding-right: 15px;">
				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; background-color: #f5f5f5; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#">배송 안내</a>
				</div>
				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#">레시피</a>
				</div>
				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#">베스트 후기</a>
				</div>
				<div class="col-md-12 col-sm-12 text-center"
					style="height: 48px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#"> <img
						src="/imgs/main-img/ico_page_top.png"
						style="display: block; margin: 0 auto"> TOP
					</a>
				</div>
			</div>
			<!-- Image 5 views  -->
			<!-- 컨텐츠 이미지 5개 뷰  -->
			<div class="col-md-8 mx-auto">
				<div class="row">
					<!-- 이미지 슬라이드 -->
					<div id="carouselExampleControls" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="/imgs/main-img/main_page_1.jpg"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="/imgs/main-img/main_page_1.jpg"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="/imgs/main-img/main_page_1.jpg"
									alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleControls"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleControls"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>



					<div class="col-md-4 col-sm-4" style="padding: 0px;">
						<div>
							<img src="/imgs/main-img/main_page_2.jpg"
								style="width: 100%; border: 1px solid #dadada;" height="213"
								border="1px solid black;">
						</div>

						<div>
							<img src="/imgs/main-img/main_page_2.jpg"
								style="width: 100%; border: 1px solid #dadada;" height="213">
						</div>
					</div>

					<div class="col-md-4 col-sm-4" style="padding: 0px;">
						<div>
							<img src="/imgs/main-img/main_page_2.jpg"
								style="width: 100%; border: 1px solid #dadada;" height="213">
						</div>
						<div>
							<img src="/imgs/main-img/main_page_2.jpg"
								style="width: 100%; border: 1px solid #dadada;" height="213">
						</div>
					</div>

				</div>
			</div>


			<br> <br>

			<!-- 컨텐츠 2 이미지 뷰 -->
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header"
					style="padding: 0px;">
					<h1>레시피</h1>
				</div>

				<div class="col-md-12" style="padding: 0px;">
					<div class="row">
						<div class="col-md-3 col-sm-3">
							<div class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
								<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/피자.jpg" alt="이미지" height="325"
									class="img-thumbnail">
								<div class="col-md-12">
									<p class="lead my-1">오늘 메뉴는 피자</p>
									<p class="display-6">By 정쥐수</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-12">
							<div class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
								<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/피자.jpg" alt="이미지" height="325"
									class="img-thumbnail">
								<div class="col-md-12">
									<p class="lead my-1">오늘 메뉴는 피자</p>
									<p class="display-6">By 정쥐수</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-12">
							<div class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
								<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/피자.jpg" alt="이미지" height="325"
									class="img-thumbnail">
								<div class="col-md-12">
									<p class="lead my-1">오늘 메뉴는 피자</p>
									<p class="display-6">By 정쥐수</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-12">
							<div class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
								<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/피자.jpg" alt="이미지" height="325"
									class="img-thumbnail">
								<div class="col-md-12">
									<p class="lead my-1">오늘 메뉴는 피자</p>
									<p class="display-6">By 정쥐수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br> <br>

			<!-- 컨텐츠 이미지 뷰  -->
			<div class="col-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header"
					style="padding: 0px;">
					<h1>패키지 판매</h1>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-3">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/피자.jpg" alt="이미지" height="325"
								class="img-thumbnail">
							<div class="col-md-12">
								<p class="lead my-1">오늘 메뉴는 피자</p>
								<p class="display-6">By 정쥐수</p>
							</div>
						</div>
					</div>

					<div class="col-md-3 col-sm-12">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/피자.jpg" alt="이미지" height="325"
								class="img-thumbnail">
							<div class="col-md-12">
								<p class="lead my-1">오늘 메뉴는 피자</p>
								<p class="display-6">By 정쥐수</p>
							</div>
						</div>
					</div>

					<div class="col-md-3 col-sm-12">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/피자.jpg" alt="이미지" height="325"
								class="img-thumbnail">
							<div class="col-md-12">
								<p class="lead my-1">오늘 메뉴는 피자</p>
								<p class="display-6">By 정쥐수</p>
							</div>
						</div>
					</div>

					<div class="col-md-3 col-sm-12">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/피자.jpg" alt="이미지" height="325"
								class="img-thumbnail">
							<div class="col-md-12">
								<p class="lead my-1">오늘 메뉴는 피자</p>
								<p class="display-6">By 정쥐수</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br>


		<!-- 푸터 -->
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- 푸터 로드 -->
		</div>
		<br> <br>
	</div>
</body>
</html>
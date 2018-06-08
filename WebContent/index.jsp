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


<link rel="stylesheet" href="/WebContent/js/bootstrap.js">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/WebContent/css/bootstrap.css">
<link rel="stylesheet" href="/WebContent/css/main-style.css">

<title>수상한 레시피</title>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
</script>

<style>
/* @media ( min-width : 768px) {
	.header {
		max-width: 100%;
	}
} */
</style>

</head>
<body>
	<!-- <a href="/views/ranking_page/ranking_main.jsp">占쏙옙킹</a> -->
	<div class="container-fluid">

		<!-- Header -->
		<div id="header">
			<!-- load -->
		</div>

		<!-- Contents -->
		<!-- Image -->
		<div id="" class="contents">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12 col-sm-12" style="padding: 0px;">
						<img
							src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/74e51d1f685eef277b3f8bcc4f46a6e6.jpg"
							alt="이미지" class="col-md-12 col-sm-12" height="350"
							style="padding: 0px;">
					</div>
				</div>
			</div>

			<br> <br>
			<div class="col-md-1"
				style="background-color: red; height: 180px; display: inline-block; position: absolute; right: 140px;">
			</div>
			
			<!-- Image 5 views  -->
			<div class="col-md-8 mx-auto">
				<div class="row">

					<div class="col-md-4 col-sm-4" style="padding: 0px;">
						<img src="/imgs/main-img/main_page_1.jpg" height="426"
							style="width: 100%; border: 1px solid #dadada;">
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
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header"
					style="padding: 0px;">
					<h1>가장 핫 한 레시피</h1>
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

			<div class="col-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header"
					style="padding: 0px;">
					<h1>쉐프들의 레시피</h1>
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


		<!-- Footer -->
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
		<br> <br>
	</div>
</body>
</html>
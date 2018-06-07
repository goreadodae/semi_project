<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- 초기화 -->
<link rel="stylesheet" href="/WebContent/css/reset.css">
<link rel="stylesheet" href="/WebContent/css/main-style.css">

<title>수상한 레시피</title>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/Main-Header.html");
		$("#footer").load("/views/footer/Main-Footer.html");
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
			<!-- 해더 -->
		</div>

		<!-- 컨텐츠 -->
		<div id="" class="contents">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12 col-sm-12" style="padding: 0px;">
						<img
							src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/74e51d1f685eef277b3f8bcc4f46a6e6.jpg"
							alt="이미지" class="col-md-12 col-sm-12" height="350"
							style="padding: 0px;">
					</div>

					<!--      <div class="col-md-3 col-sm-3 text-center text-white bg-primary text-white">
                    <h1>랭킹</h1>
                    <p class="lead my-3">Multiple lines of text that form the lede, informing new readers quickly and efficiently about what's
                        most interesting in this post's contents.</p>
                </div> -->
				</div>
			</div>

			<br>
			<br>

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
									src="/imgs/main-img/피자.jpg" alt="이미지" height="325" class="img-thumbnail">
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
									src="/imgs/main-img/피자.jpg" alt="이미지" height="325" class="img-thumbnail">
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
									src="/imgs/main-img/피자.jpg" alt="이미지" height="325" class="img-thumbnail">
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
				<br>
				<div class="row">
					<div class="col-md-3 col-sm-3">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/피자.jpg" alt="이미지" height="325" class="img-thumbnail">
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
								src="/imgs/main-img/피자.jpg" alt="이미지" height="325" class="img-thumbnail">
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
								src="/imgs/main-img/피자.jpg" alt="이미지" height="325" class="img-thumbnail">
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
								src="/imgs/main-img/피자.jpg" alt="이미지" height="325" class="img-thumbnail">
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
	</div>
</body>
</html>
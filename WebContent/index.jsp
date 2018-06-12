<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>수상한 레시피</title>
</head>

<!-- 모든 스타일 시트 적용 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<!-- 메인 전용 css -->
<link rel="stylesheet" href="/css/mainPage_css/main.css">

<style>
#count_div {
	top: 80px;
	height: 70px;
	background-color: #272727;
	padding: 0px;
	float: left;
}

#count_wrap {
	bottom: 30px;
}

#application_wrap {
	bottom: 180px;
	left: 0px;
	text-align: right;
}
/* 카운트 수 */
strong {
	line-height: 65px;
	color: white;
	font-size: 50px;
}

#title-header {
	display: table;
	text-align: center;
}

#title-header:before, #title-header:after {
	content: '';
	display: table-cell;
	background: #512772;
	width: 50%;
	-webkit-transform: scaleY(0.05);
	transform: scaleY(0.05);
}

#title-header>h1 {
	white-space: pre;
	padding: 0 15px;
}
</style>
<body style="overflow-x: hidden; overflow-y: auto;">

	<!-- 전체 컨테이너  -->
	<div class="container-fluid" style="padding: 0px;">

		<!-- 해더 영역 -->
		<div id="header"></div>

		<!-- 컨텐츠 영역 -->
		<div id="content-main" class="contents">

			<!-- 메인 이미지  -->
			<div class="col-md-12 col-sm-12" style="height: 530px; padding: 0px;">
				<img src="/imgs/main-img/main_img.jpg" width="100%" height="500px">
				<!-- 레시피 카운트 -->
				<div class="col-md-8 mx-auto">
					<div class="col-md-3 mx-auto" style="height: 70px;" id="count_wrap">
						<div class="text-center rounded" id="count_div"
							style="margin-left: 5px; width: 60px;">
							<strong>0</strong>
						</div>
						<div class="text-center rounded" id="count_div"
							style="margin-left: 5px; width: 60px;">
							<strong>5</strong>
						</div>
						<div class="text-center rounded" id="count_div"
							style="margin-left: 5px; width: 60px;">
							<strong>1</strong>
						</div>

						<div class="text-center rounded" id="count_div"
							style="margin-left: 5px; width: 60px;">
							<strong>0</strong>
						</div>
					</div>
				</div>
				<!-- 레시피 카운트 끝 -->
			</div>

			<!-- 어플리케이션 다운로드  -->
			<div class="col-md-12" id="application_wrap">
				<div class="col-md-8 mx-auto" style="padding: 0px;">
					<!-- 구글 -->
					<a href="#"> <img class="rounded"
						src="/imgs/main-img/google.png">
					</a>
					<!-- 이미지 -->
					<a href="#"> <img class="rounded" src="/imgs/main-img/app.png">
					</a>
				</div>
			</div>
			<!-- 어플리케이션 다운로드 끝  -->

			<div class="col-md-12 col-sm-12">
				<div class="col-md-8 mx-auto text-center">
					<h3>상품화된 누적 레시피</h3>
					<h1>수상한 레시피로 레시피올리고 수익올리자</h1>
					<div class="col-md-8 mx-auto" style="border: 2px solid black; height: 200px; padding:0px;">
						<div class="col-md-4" style="border:2px solid black; height:200px; float:left;">
							<div style="border:2px solid black; height:150px;"></div>
							<p style="padding-top:10px;">레시피 등록하고</p>
						</div>
						<div class="col-md-4" style="border:2px solid black; height:200px; float:left;">
							<div style="border:2px solid black; height:150px;"></div>
							<p style="padding-top:10px;">랭킹에 올리고</p>
						</div>
						<div class="col-md-4" style="border:2px solid black; height:200px; float:left;">
							<div style="border:2px solid black; height:150px;"></div>
							<p style="padding-top:10px;">수익 얻자</p>
						</div>
					</div>
					<br><br>
					<button type="button" class="col-md-4 btn btn btn-lg" style="background-color:#512772; color:white;">시작하기</button>
					<br><br>
				</div>
			</div>

			<!-- 사이드 메뉴 -->
			<!-- <div id="aside"
				style="height: 135px; display: inline-block; padding-right: 15px;">
				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; background-color: #f5f5f5; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#" style="line-height: 29px;">배송안내</a>
				</div>

				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#" style="line-height: 29px;">레시피</a>
				</div>

				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#" style="line-height: 29px;">베스트
						후기</a>
				</div>

				<div class="col-md-12 col-sm-12 text-center"
					style="height: 48px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#" onclick="scrollUp();"> <img
						src="/imgs/main-img/ico_page_top.png"
						style="display: block; margin: 0 auto;"> TOP
					</a>
				</div>
			</div> -->
			<!-- 사이드 메뉴 끝 -->

			<!-- 네비  -->
			<div id="point">
				<br> <br> <br>

				<!-- 추천 이벤트 / 신상품  -->
				<div class="col-md-8 mx-auto">
					<div class="row">
						<!-- 이미지 슬라이드 -->
						<div class="col-md-6" style="padding: 6px; padding-left: 0px;">
							<h1>추천 이벤트</h1>
							<div id="carouselExampleControls1" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img class="d-block w-100"
											src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/1725b1124209de547c33afc17d474e65.jpg"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/1725b1124209de547c33afc17d474e65.jpg"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/1725b1124209de547c33afc17d474e65.jpg"
											alt="Third slide">
									</div>
								</div>

								<a class="carousel-control-prev"
									href="#carouselExampleControls1" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleControls1" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>

						<div class="col-md-6" style="padding: 6px; padding-right: 0px;">
							<h1>신상품</h1>
							<div id="carouselExampleControls2" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img class="d-block w-100"
											src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/1725b1124209de547c33afc17d474e65.jpg"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/1725b1124209de547c33afc17d474e65.jpg"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="//img-cf.kurly.com/shop/data/skin/designgj/img/banner/74dcada7e33c67299be3b5a4233bc37d.jpg"
											alt="Third slide">
									</div>
								</div>

								<a class="carousel-control-prev"
									href="#carouselExampleControls2" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleControls2" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 추천 이벤트 끝  -->
				<br> <br> <br> <br> <br>

				<!-- MD 추천 -->
				<div class="col-md-8 mx-auto" style="padding: 0px;">

					<div class="col-md-12" id="main-contents-header"
						style="padding: 0px; padding-bottom: 10px;">
						<div id="title-header">
							<h1>레시피</h1>
						</div>
						<!-- 폰트! -->
					</div>

					<div id="main_div_1" class="col-md-12" style="padding: 0px;">
						<div class="row">

							<!-- 메인 사진 1 DB 사진-->
							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12"
									style="border: 1px solid #dadada; padding: 0px;">

									<img id="main_img_1" class="img col-md-12 col-sm-12"
										style="padding: 0px;" src="/imgs/main-img/main_stake.jpg"
										alt="이미지" height="325" class="img-thumbnail">
									<div class="col-md-12">
										<p class="lead my-1" style="font-weight: 600;">블랙 타이거새우
											(냉동)</p>
										<p class="display-6" style="padding-bottom: 15px;">16,500원</p>
									</div>
								</div>
							</div>


							<!-- 메인 사진 2 DB 사진-->
							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12"
									style="border: 1px solid #dadada; padding: 0px;">

									<img id="main_img_2" class="img col-md-12 col-sm-12"
										style="padding: 0px;" src="/imgs/main-img/main_rice.jpg"
										alt="이미지" height="325" class="img-thumbnail">
									<div class="col-md-12">
										<p class="lead my-1" style="font-weight: 600;">블랙 타이거새우
											(냉동)</p>
										<p class="display-6" style="padding-bottom: 15px;">16,500원</p>
									</div>
								</div>
							</div>

							<!-- 메인 사진 3 DB 사진-->
							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12"
									style="border: 1px solid #dadada; padding: 0px;">

									<img id="main_img_3" class="img col-md-12 col-sm-12"
										style="padding: 0px;" src="/imgs/main-img/main_pancake.jpg"
										alt="이미지" height="325" class="img-thumbnail">
									<div class="col-md-12">
										<p class="lead my-1" style="font-weight: 600;">블랙 타이거새우
											(냉동)</p>
										<p class="display-6" style="padding-bottom: 15px;">16,500원</p>
									</div>
								</div>
							</div>

							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12"
									style="border: 1px solid #dadada; padding: 0px;">

									<!-- 메인 사진 4 DB 사진-->
									<img id="main_img_4" class="img col-md-12 col-sm-12"
										style="padding: 0px;" src="/imgs/main-img/main_cake.jpg"
										alt="이미지" height="325" class="img-thumbnail">
									<div class="col-md-12">
										<p class="lead my-1" style="font-weight: 600;">블랙 타이거새우
											(냉동)</p>
										<p class="display-6" style="padding-bottom: 15px;">16,500원</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- MD 추천 끝  -->
				<br> <br> <br> <br> <br>

				<!-- 수상한 레시피 혜택 -->
				<div id="plus" class="col-md-12"
					style="background-color: #f6f7f7; padding: 0px;">
					<div class="col-md-8 mx-auto" style="padding: 0px;">

						<div class="row" style="padding: 0px; background-color: #f6f7f7;">
							<div class="col-md-6 col-sm-6" id="banner1"
								style="line-height: 260px;">
								<a> <img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/banner.jpg" alt="이미지" height="180"
									class="img-thumbnail">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner2"
								style="line-height: 260px;">
								<a> <img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/banner2.jpg" alt="이미지" height="180"
									class="img-thumbnail">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner3"
								style="line-height: 260px;">
								<a> <img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/banner3.jpg" alt="이미지" height="180"
									class="img-thumbnail">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner3"
								style="line-height: 260px;">
								<a> <img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/banner3.jpg" alt="이미지" height="180"
									class="img-thumbnail">
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 수상한 레시피 혜택 끝 -->
				<br> <br> <br> <br>

				<!-- 컨텐츠 이미지 뷰  -->
				<div id="main_div_2" class="col-md-8 mx-auto" style="padding: 0px;">
					<div class="col-md-12" id="main-contents-header"
						style="padding: 0px;">
						<div id="title-header">
							<h1>레시피</h1>
						</div>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="row">

							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12"
									style="border: 1px solid #dadada; padding: 0px;">
									<img id="main_img_2_1" class="img col-md-12 col-sm-12"
										style="padding: 0px;" src="/imgs/main-img/main_pork.jpg"
										alt="이미지" height="325" class="img-thumbnail">
									<div class="col-md-12">
										<p class="lead my-1">오늘 메뉴는 피자</p>
										<p class="display-6">By 정쥐수</p>
									</div>
								</div>
							</div>

							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12"
									style="border: 1px solid #dadada; padding: 0px;">
									<img id="main_img_2_2" class="img col-md-12 col-sm-12"
										style="padding: 0px;" src="/imgs/main-img/main_noodle.jpg"
										alt="이미지" height="325" class="img-thumbnail">
									<div class="col-md-12">
										<p class="lead my-1">오늘 메뉴는 피자</p>
										<p class="display-6">By 정쥐수</p>
									</div>
								</div>
							</div>

							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12"
									style="border: 1px solid #dadada; padding: 0px;">
									<img id="main_img_2_3" class="img col-md-12 col-sm-12"
										style="padding: 0px;" src="/imgs/main-img/main_strawberry.jpg"
										alt="이미지" height="325" class="img-thumbnail">
									<div class="col-md-12">
										<p class="lead my-1">오늘 메뉴는 피자</p>
										<p class="display-6">By 정쥐수</p>
									</div>
								</div>
							</div>

							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12"
									style="border: 1px solid #dadada; padding: 0px;">
									<img id="main_img_2_4" class="img col-md-12 col-sm-12"
										style="padding: 0px;" src="/imgs/main-img/main_tarte.jpg"
										alt="이미지" height="325" class="img-thumbnail">
									<div class="col-md-12">
										<p class="lead my-1">오늘 메뉴는 피자</p>
										<p class="display-6">By 정쥐수</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 컨텐츠 이미지 뷰  끝 -->
				<br> <br> <br>

				<!-- 레시피 검색 -->
				<div id="search" class="col-md-12"
					style="background-color: #f6f7f7; padding: 0px;">
					<div class="col-md-8 mx-auto text-center">
						<br> <br>
						<h3>냉장고를 부탁해!</h3>
						<h1 style="color: #512772;">내가 가진 재료로 레시피 추천받기</h1>
						<br>
						<form action="/" method="get">
							<fieldset>
								<div class="col-md-8 input-group mb-3 mx-auto">
									<input type="text" class="form-control"
										placeholder="재료명으로 검색하세요."
										aria-label="Recipient's username"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button">
										<img src="/icons/png/magnifying-glass.png"></button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- 레시피 검색 끝 -->
				<br> <br> <br>


				<!-- 푸터 -->
				<div id="footer"
					class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0"
					style="border: 1px solid black; padding: 10px;"></div>
				<!-- 푸터 끝 -->
				<br> <br>
			</div>
		</div>
</body>
</html>
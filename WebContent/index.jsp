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

<!-- 페이지 네비게이션 고정 -->
<script>
	$(document).ready(function() {
		var jbOffset = $('#point').offset();

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

<body style="overflow-x: hidden; overflow-y: auto;">

	<!-- 전체 컨테이너  -->
	<div class="container-fluid" style="padding: 0px;">

		<!-- 해더 영역 -->
		<div id="header"></div>

		<!-- 컨텐츠 영역 -->
		<div id="content-main" class="contents">

			<!-- 컨텐츠 메인 이미지 -->
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel" style="padding: 0px;">

				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouse	lExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/17eb40928a7c9247d693e51dbd339553.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/74e51d1f685eef277b3f8bcc4f46a6e6.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="http:////img-cf.kurly.com/shop/data/skin/designgj/img/banner/e7db9680d0d92745b0f93b61c5533927.jpg"
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
			<!-- 컨텐츠 메인 메뉴 끝 -->

			<!-- 사이드 메뉴 -->
			<div id="aside"
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
			</div>
			<!-- 사이드 메뉴 끝 -->

			<!-- 네비  -->
			<div id="point">
				<br>
				<br>
				<br>
				<br>
				<br>

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
				<br><br><br><br><br>

				<!-- MD 추천 -->
				<div class="col-md-8 mx-auto" style="padding: 0px;">

					<div class="col-md-12" id="main-contents-header"
						style="padding: 0px; padding-bottom: 10px;">
						<h1>MD 추천</h1>
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
				<br><br><br><br><br>

				<!-- 수상한 레시피 혜택 -->
				<div id="plus" class="col-md-12"
					style="background-color: #f6f7f7; padding: 0px;">
					<div class="col-md-8 mx-auto" style="padding: 0px;">

						<div class="row" style="padding: 0px; background-color: #f6f7f7;">
							<div class="col-md-6 col-sm-6" id="banner1" style="line-height: 260px;">
								<a>
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
										src="/imgs/main-img/banner.jpg" alt="이미지" height="180"
										class="img-thumbnail">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner2" style="line-height: 260px;">
								<a>
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
										src="/imgs/main-img/banner2.jpg" alt="이미지" height="180"
										class="img-thumbnail">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner3" style="line-height: 260px;">
								<a>
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
										src="/imgs/main-img/banner3.jpg" alt="이미지" height="180"
										class="img-thumbnail">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner3" style="line-height: 260px;">
								<a>
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
										src="/imgs/main-img/banner3.jpg" alt="이미지" height="180"
										class="img-thumbnail">
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 수상한 레시피 혜택 끝 -->
				<br><br><br><br>

				<!-- 컨텐츠 이미지 뷰  -->
				<div id="main_div_2" class="col-md-8 mx-auto" style="padding: 0px;">
					<div class="col-md-12" id="main-contents-header" style="padding: 0px;">
						<h1>레시피</h1>
					</div>

					<div class="col-md-12" style="padding: 0px;">
						<div class="row">
						
							<div class="col-md-3 col-sm-3 col-6">
								<div class="col-md-12 col-sm-12" style="border: 1px solid #dadada; padding: 0px;">
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
								<div class="col-md-12 col-sm-12" style="border: 1px solid #dadada; padding: 0px;">
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
								<div class="col-md-12 col-sm-12" style="border: 1px solid #dadada; padding: 0px;">
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
								<div class="col-md-12 col-sm-12" style="border: 1px solid #dadada; padding: 0px;">
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
				<br><br><br>

				<!-- 레시피 검색 -->
				<div id="search" class="col-md-12"
					style="background-color: #f6f7f7; padding: 0px;">
					<div class="col-md-8 mx-auto text-center"><br><br>
						<h3>냉장고를 부탁해!</h3>
						<h1 style="color: #512772;">내가 가진 재료로 레시피 추천받기</h1><br>
						<form action="/" method="get">
							<fieldset>
								<div>
									<input type="text" class="col-md-5 form-control mx-auto" 
									placeholder="재료명으로 검색하세요." autocomplete="off">
									
									<div class="col-md-2 list-group">
										<ul>
											<li><a class="data-id-1"></a></li>
										</ul>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- 레시피 검색 끝 -->
				<br><br><br>


				<!-- 푸터 -->
				<div id="footer" class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0"
					style="border: 1px solid black; padding: 10px;">
				</div>
				<!-- 푸터 끝 -->
				<br><br>
			</div>
		</div>
		</div>
</body>
</html>
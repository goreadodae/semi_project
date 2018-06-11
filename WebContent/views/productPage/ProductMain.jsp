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
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"> -->

<!-- 초기화 -->
<link rel="stylesheet" href="/css/reset.css">

<title>재료 패키지 구매</title>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
		$("#banner").load("/views/productPage/test2.jsp");
	});
	
	$(document).ready(function() {

		var jbOffset = $('#start').offset();

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
.price {
	text-align: right;
}

#total {
	background-color: oldlace;
}

#content1 {
	background-color: white;
}

#desc {
	/*padding : 20px;  */
	
}
</style>

</head>
<body>
	<div class="container-fluid">

		<!-- Header -->
		<div id="header"></div>
		
		<!-- <div id="banner"></div> -->

		<!-- 전체 컨텐츠 -->
		<div id="total" class="contents">

			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12 col-sm-12" style="padding: 0px;">
						<img src="/imgs/product_img/banner.PNG" alt="이미지"
							class="col-md-12 col-sm-12" height="400" style="padding: 0px;">
					</div>
				</div>
			</div>

			<br> <br>

			<!-- 내용1. 이달의 패키지 -->
			<div id="start" class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header"
					style="padding: 0px;">
					<img src="/imgs/product_img/title1.JPG" alt="이미지"
						class="col-md-12 col-sm-12" height="200" style="padding: 0px;">
				</div>
				<br> <br>


				<div class="col-md-12" style="padding: 0px;">
					<div class="row">

						<!-- 첫번째 칸 -->
						<div class="col-md-4 col-sm-12">

							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product1.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">오징어볶음 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>

						</div>


						<!-- 두번째 칸 -->
						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product2.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">부대찌개 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>
						</div>

						<!-- 세번째 칸 -->
						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product3.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">순두부찌개 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br> <br>



			<!-- 내용2. 이번달 외의 패키지 -->
			<br> <br>
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header"
					style="padding: 0px;">
					<img src="/imgs/product_img/title1.JPG" alt="이미지"
						class="col-md-12 col-sm-12" height="200" style="padding: 0px;">
				</div>
				<br> <br>

				<!-- 1번째 줄 -->
				<div class="col-md-12" style="padding: 0px;">
					<div class="row">
						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product1.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">오징어볶음 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>
						</div>



						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product2.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">부대찌개 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>
						</div>


						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product3.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">순두부찌개 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>
						</div>
					</div>
				</div>




				<!-- 2번째 줄 -->
				<br>
				<br>
				<div class="col-md-12" style="padding: 0px;">
					<div class="row">
						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product1.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">오징어볶음 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>
						</div>



						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product2.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">부대찌개 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>
						</div>


						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product3.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">순두부찌개 양념</p>
									<hr>
									<p class="price">5000원</p><br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<br>






			<!-- Footer -->
			<div id="footer"
				class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
				style="border: 1px solid black; padding: 10px;">
				<!-- footer -->
			</div>
		</div>
	</div>
</body>
</html>
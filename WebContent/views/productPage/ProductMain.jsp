<!-- 상품 리스트 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- 초기화 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<title>재료 패키지 구매</title>

<script>
	$(document).ready(function() {
		/* 해더 불러오는 제이쿼리 */
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
		
		
		 /* 웹 실행 시 카테고리 숨김 */
		   $('#category_list').css('display', 'none');

		   $('#div-category').hover(function(e) {
		      if ($(e.target).is("#div-category")
		         || $(e.target).is("#a-category")) {
		         $('#category_list').css('display', 'block');
		         inCategory = true; // 카테고리 오픈
		      }

		      // 카테고리 오픈되어 있을 때
		      if (inCategory) {
		         $('#category_list').hover(function(e) {
		            if ($(e.target).is('.category-text')
		               || $(e.target).is('.header')
		               || $(e.target).is('#category_list')) {
		               $('#category_list').css('display', 'block');
		            }
		         });

		         $('#category_list').mouseleave(function(e) {
		            if (!$(e.target).is('.category-text')
		               || !$(e.target).is('.header')
		               || !$(e.target).is('#category_list')) {
		               $('#category_list').css('display', 'none');
		            }
		         });

		         $('#div-category').mouseleave(function(e) {
		            if (!$(e.target).is('.category-text')
		               || !$(e.target).is('.header')
		               || !$(e.target).is('#category_list')) {
		               $('#category_list').css('display', 'none');
		            }
		         });
		      }
		   });
		

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
	background-color: #E7E3D7;
}

#content1 {
	background-color: white;
}

#desc {
	/*padding : 20px;  */
	
}

.container{
	margin : 0px;
	padding : 0px;
	width : 100%;
	height :300px;
	overflow : hidden;
}

.container img{
	top : -40%;
}

</style>

</head>
<body>
	<div class="container-fluid">

		<!-- Header -->
		<div id="header"></div>

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

			<!-- 내용1. 이달의 쿠킹박스 -->
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
									src="/imgs/product_img/product01.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">${productList[0].product_name}</p>
									<hr>
									<p class="price">${productList[0].product_price}</p><br>
								</div>
							</div>

						</div>


						<!-- 두번째 칸 -->
						<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/views/productPage/ProductDetail.jsp">
									<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/product_img/product02.jpg" alt="제품이미지" height="300"
									class="img-thumbnail">
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">소고기 찹스테이크 (2인분)</p>
									<hr>
									<p class="price">15900원</p><br>
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
				</div><br><br>
										
				<!-- db에 있는 상품 다 가져옴 -->
				<c:forEach begin="0" items="${productList}" var="p" varStatus="i">
					<!-- 줄바꿈 -->
					<c:if test="${i.count%3==1}" var="result">
						<div class="col-md-12" style="padding: 0px;">
							<div class="row">
					</c:if>
					
					<div class="col-md-4 col-sm-12">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/productDetail?product_no=${p.product_no}">
									<div class="container">
										<img class="col-md-12 col-sm-12" style="padding: 0px;"
										src="${p.product_1st_pic}" alt="제품이미지" 
										class="img-thumbnail">
									</div>
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">${p.product_name}</p>
									<hr>
									<p class="price">${p.product_price}</p><br>
								</div>
							</div>
					</div>
	
					<!-- 줄바꿈 -->
					<c:if test="${i.count%3==0}" var="result">
							</div>
						</div><br><br>
					</c:if>
						
				</c:forEach>
					
					</div>
				</div>
			</div>
			<br><br><br>


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
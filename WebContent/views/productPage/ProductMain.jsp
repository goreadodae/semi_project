<!-- 상품 리스트 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Nanum+Myeongjo|Poiret+One|Poor+Story|Song+Myung" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>

<!-- 초기화 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<title>재료 패키지 구매</title>

<script>
	$(document).ready(function() {
		/* 해더 불러오는 제이쿼리 */
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

#main-contents-header{
	/* background-color : #FFF5EE; */
	background-color : white;
	color : #454545;
}

.banner_title1{
	font-size : 50px;
	/* font-family: 'Amatic SC', cursive;
font-family: 'Poiret One', cursive;
font-family: 'Song Myung', serif;
font-family: 'Poor Story', cursive; */
font-family: 'Nanum Myeongjo', serif;
}

.banner_title2{
	font-size : 30px;
	font-family: 'Poiret One', cursive;
}

.price {
	text-align: right;
}

#total {
	/* background-color: #E7E3D7; */
	background-color: #F7F5F8;
}

#content1 {
	background-color: white;
	
}

#eachContent{
	padding-left : 20px;
	padding-right : 20px;
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

#soldout{
	background-color : #522075;
	color : white;
	float : right;
	text-align : center;
	border-radius : 0.8em;
	display:inline;
	align : right;
	padding-right : 13px;
	padding-left : 13px;
	margin-right : 5px;
}

.p_title{
	display:inline;
}
</style>

</head>
<body>
	<div class="container-fluid" style="padding: 0px;">

		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>

		<!-- 전체 컨텐츠 -->
		<div id="total" class="contents" style="padding: 0px;">
	

			<br> <br><br>
			<!-- 내용1. 이달의 쿠킹박스 -->
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header" style="padding: 0px;">
						<center>
						<hr style="color : #795B8F;">
						
						<span class="banner_title1"><img src="/imgs/product_img/fork.png" width="40px">&nbsp;&nbsp;이달의 쿠킹박스&nbsp;&nbsp;<img src="/imgs/product_img/fork.png" width="40px"></span>
						<br>
						<hr width="200px">
						<span class="banner_title2">The Best of this Month</span>
						<hr style="color : #795B8F;">
						</center>
				</div><br><br><br>
										
				<!-- db에 있는 상품 다 가져옴 -->
				<c:forEach begin="0" items="${productThisMonthList}" var="p" varStatus="i">
					<!-- 줄바꿈 -->
					<c:if test="${i.count%3==1}" var="result">
						<div class="col-md-12" style="padding: 0px;">
							<div class="row">
					</c:if>
					
					<!-- 각각의 상품 정보 -->
					<div class="col-md-4 col-sm-12" id="eachContent">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/productDetail?productNo=${p.productNo}">
									<div class="container">
										<c:choose>
										<c:when test="${p.productQuantity<1}">
											<img class="col-md-12 col-sm-12" style="padding: 0px; opacity:0.5;" src="${p.product1stPic}" alt="제품이미지" class="img-thumbnail">
										</c:when>
										<c:otherwise>
											<!-- 라벨 -->
     										<div class="position-absolute" style="top:0px; background-color:#ffcd16; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">계절메뉴</h5>
											</div>
											<img class="col-md-12 col-sm-12" style="padding: 0px;" src="${p.product1stPic}" alt="제품이미지" class="img-thumbnail">
											<!-- 라벨 -->
											<c:choose>
												<c:when test="${p.productQuantity<20}">
     												<div class="position-absolute" style="top:0px; background-color:#512772; width:80px; height:80px;">
														<h5 style="color:white; line-height:80px; text-align:center;">매진임박</h5>
													</div>
												</c:when>
												<c:when test="${p.season=='SUMMER'}">
													<div class="position-absolute" style="top:0px; background-color:#ffcd16; width:80px; height:80px;">
														<h5 style="color:white; line-height:80px; text-align:center;">계절메뉴</h5>
													</div>
												</c:when>
												<c:when test="${p.productPrice<8000}">
													<div class="position-absolute" style="top:0px; background-color:#856292; width:80px; height:80px;">
														<h5 style="color:white; line-height:80px; text-align:center;">초특가</h5>
													</div>
												</c:when>
											</c:choose>
										</c:otherwise>
										</c:choose>
									</div>
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">${p.productName}</p>
									<c:choose>
										<c:when test="${p.productQuantity<1}">
											<div id="soldout">sold out</div>
										</c:when>
									</c:choose>
									<hr>
									<p class="price"><fmt:formatNumber value="${p.productPrice}" groupingUsed="true"/>원</p><br>
								</div>
							</div>
					</div>
					<!-- 각각의 상품 정보 끝-->

	
					<!-- 줄바꿈 -->
						<c:if test="${i.count%3==0}" var="result">
							</div>
							</div><br><br><br>
					</c:if>
						
				</c:forEach>	
				
			</div>
			<!-- 내용1. 이달의 쿠킹박스 끝-->

			
			
			
			
			
			<br> <br>
			<!-- 내용2. 모든 상품 리스트 -->
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header" style="padding: 0px;">
					<center>
						<hr style="color : #795B8F;">
						<span class="banner_title1"><img src="/imgs/product_img/strawberry.png" width="40px">&nbsp;&nbsp;쿠킹박스 리스트&nbsp;&nbsp;<img src="/imgs/product_img/strawberry.png" width="40px"></span><br>
						<hr width="200px">
						<span class="banner_title2">ALL of cooking box</span>
						<hr style="color : #795B8F;">
						</center>
				</div><br><br>
										
				<!-- db에 있는 상품 다 가져옴 -->
				<c:forEach begin="0" items="${productList}" var="p" varStatus="i">
					<!-- 줄바꿈 -->
					<c:if test="${i.count%3==1}" var="result">
						<div class="col-md-12" style="padding: 0px;">
							<div class="row">
					</c:if>
					
					<!-- 각각의 상품 정보 -->
					<div class="col-md-4 col-sm-12" id="eachContent">
							<div id="content1" class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
									<a href="/productDetail?productNo=${p.productNo}">
									<div class="container">
										<c:choose>
										<c:when test="${p.productQuantity<1}">
											<!-- 라벨 -->
											<img class="col-md-12 col-sm-12" style="padding: 0px; opacity:0.5;" src="${p.product1stPic}" alt="제품이미지" class="img-thumbnail">
										</c:when>
										<c:otherwise>
											<img class="col-md-12 col-sm-12" style="padding: 0px;" src="${p.product1stPic}" alt="제품이미지" class="img-thumbnail">
											<!-- 라벨 -->
											<c:choose>
												<c:when test="${p.productQuantity<20}">
     												<div class="position-absolute" style="top:0px; background-color:#512772; width:80px; height:80px;">
														<h5 style="color:white; line-height:80px; text-align:center;">매진임박</h5>
													</div>
												</c:when>
												<c:when test="${p.season=='SUMMER'}">
													<div class="position-absolute" style="top:0px; background-color:#ffcd16; width:80px; height:80px;">
														<h5 style="color:white; line-height:80px; text-align:center;">계절메뉴</h5>
													</div>
												</c:when>
												<c:when test="${p.productPrice<8000}">
													<div class="position-absolute" style="top:0px; background-color:#856292; width:80px; height:80px;">
														<h5 style="color:white; line-height:80px; text-align:center;">초특가</h5>
													</div>
												</c:when>
											</c:choose>
										</c:otherwise>
									</c:choose>
										
										
									</div>
									</a>
								<div id="desc" class="col-md-12">
									<br>
									<p class="p_title">${p.productName}</p>
									<c:choose>
										<c:when test="${p.productQuantity<1}">
											<div id="soldout">sold out</div>
										</c:when>
									</c:choose>
									
									<hr>
									<p class="price"><fmt:formatNumber value="${p.productPrice}" groupingUsed="true"/>원</p><br>
								</div>
							</div>
					</div>
					<!-- 각각의 상품 정보 끝-->
	
					<!-- 줄바꿈 -->
						<c:if test="${i.count%3==0}" var="result">
							</div>
							</div><br><br><br>
					</c:if>
						
				</c:forEach>
					
				</div>
				<!-- 내용2. 모든 상품 리스트 끝-->
			</div>
			<br><br><br><br>
			<!-- 전체 컨텐츠 끝-->


			<!-- Footer -->
			<div id="footer"
				class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
				style="border: 1px solid black; padding: 10px;">
			</div>
			<!-- footer 끝-->
	</div>
</body>
</html>
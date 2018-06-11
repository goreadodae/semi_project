<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- 초기화 -->
<link rel="stylesheet" href="/css/reset.css">

<!-- Bootstrap CSS/JS -->
<link rel="stylesheet" href="/js/bootstrap.js">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/main-style.css">
<link rel="stylesheet" href="/css/recipeList_css/recipeList.css">

<!-- Header JS -->
<link rel="stylesheet" href="/js/headerpage/header.js">

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
	<div class="container-fluid">
		<!-- Header -->
		<div id="header">
			<!-- 해더 -->
		</div>
		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="padding: 10px;">
			<div class="row" style="margin-bottom: 30px;">
				<div class="col-md-12" id="category">
					<div class="row" id="cate_class" style="margin-top: 15px;">
						<div class="col-md-12">
							<span class="category">종류별</span>
							<ul id="cate_list" class="nav">

								<c:forEach items="${requestScope.classList}" var="list">
									<c:set var="keyVal" value="${list.key}" />
									<c:choose>
										<c:when test="${list.key==pram.cate1}">
											<li class="nav-item"><a class="nav-link active"
												href="/recipeList?cate1=${pram.cate1}
										&cate2=${pram.cate2}&cate3=${pram.cate3}&cate4=${pram.cate4}">
													${requestScope.classList[keyVal]}</a></li>
										</c:when>
										<c:otherwise>
											<li class="nav-item"><a class="nav-link nonactive"
												href="/recipeList?cate1=${keyVal}
										&cate2=${pram.cate2}&cate3=${pram.cate3}&cate4=${pram.cate4}">${requestScope.classList[keyVal]}</a>
										</c:otherwise>
									</c:choose>


								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="row" id="cate_situation" style="margin-top: 10px;">
						<div class="col-md-12">
							<span class="category">상황별</span>
							<ul id="cate_list" class="nav">
								<c:forEach items="${requestScope.situationList}" var="list">
									<c:set var="keyVal" value="${list.key}" />
									<li class="nav-item"><a class="nav-link active" href="#">
											${requestScope.situationList[keyVal]}</a></li>
								</c:forEach>
								<li class="nav-item"><a class="nav-link nonactive" href="#">Disabled</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="row" id="cate_ingredient" style="margin-top: 10px;">
						<div class="col-md-12">
							<span class="category">재료별</span>
							<ul id="cate_list" class="nav">
								<c:forEach items="${requestScope.ingredientList}" var="list">
									<c:set var="keyVal" value="${list.key}" />
									<li class="nav-item"><a class="nav-link active" href="#">
											${requestScope.ingredientList[keyVal]}</a></li>
								</c:forEach>
								<li class="nav-item"><a class="nav-link nonactive" href="#">Disabled</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="row" id="cate_method"
						style="margin-top: 10px; margin-bottom: 15px">
						<div class="col-md-12">
							<span class="category">방법별</span>
							<ul id="cate_list" class="nav">
								<c:forEach items="${requestScope.methodList}" var="list">
									<c:set var="keyVal" value="${list.key}" />
									<li class="nav-item"><a class="nav-link active" href="#">
											${requestScope.methodList[keyVal]}</a></li>
								</c:forEach>
								<li class="nav-item"><a class="nav-link nonactive" href="#">Disabled</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>





			<div class="row">
				<div class="col-md-4">
					<div class="shadow p-3 mb-5 bg-white rounded">
						<div class="thumbnail">
							<img class="recipe_img" src="/imgs/recipe_img/pi1.jpg"
								height="100%" width="100%">
							<div class="caption">
								<h3>고소한 고등어살 파니니</h3>
								<p>by 이승재</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="shadow p-3 mb-5 bg-white rounded"></div>
				</div>
				<div class="col-md-4">
					<div class="shadow p-3 mb-5 bg-white rounded"></div>
				</div>
			</div>
		</div>


		<!-- Footer -->
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>
</body>
</html>
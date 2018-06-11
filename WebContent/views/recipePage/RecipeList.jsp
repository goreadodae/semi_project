<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/recipeList_css/recipeList.css">
<!-- 모바일  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- 리셋 -->
<link rel="stylesheet" href="/css/reset.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		/*$("#header").load("/views/header/main-Header.jsp");*/
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
</script>

<script>
	var scrollUpDelay = 1;
	var scrollUpSpeed = 30;

	/* 영역 설정 */
	$(document).ready(function() {

		var $info = $("#info");

		window.onresize = function() {
			$info.html(window.innerWidth);
		}
	});

	/* 위로 올라가기 */
	function scrollUp() {
		if (document.body.scrollTop < 1) {
			return;
		}
		document.body.scrollTop = document.body.scrollTop - scrollUpSpeed;
		setTimeout('scrollUp()', scrollUpDelay);
	}
</script>


<title>수상한 레시피</title>

<!-- 스타일 값 설정 -->

</head>

<body style="overflow-x:hidden; overflow-y:auto;">
	<div class="container-fluid">
		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
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
										<c:when test="${keyVal==requestScope.cate1}">
											<li class="nav-item"><a class="nav-link active"
												href="/recipeList?cate1=${keyVal}
										&cate2=${requestScope.cate2}&cate3=${requestScope.cate3}&cate4=${requestScope.cate4}">
													${requestScope.classList[keyVal]}</a></li>
										</c:when>
										<c:otherwise>
											<li class="nav-item"><a class="nav-link nonactive"
												href="/recipeList?cate1=${keyVal}
										&cate2=${requestScope.cate2}&cate3=${requestScope.cate3}&cate4=${requestScope.cate4}">${requestScope.classList[keyVal]}</a>
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
									<c:choose>
										<c:when test="${keyVal==requestScope.cate2}">
											<li class="nav-item"><a class="nav-link active"
												href="/recipeList?cate1=${requestScope.cate1}
										&cate2=${keyVal}&cate3=${requestScope.cate3}&cate4=${requestScope.cate4}">
													${requestScope.situationList[keyVal]}</a></li>
										</c:when>
										<c:otherwise>
											<li class="nav-item"><a class="nav-link nonactive"
												href="/recipeList?cate1=${requestScope.cate1}
										&cate2=${keyVal}&cate3=${requestScope.cate3}&cate4=${requestScope.cate4}">${requestScope.situationList[keyVal]}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="row" id="cate_ingredient" style="margin-top: 10px;">
						<div class="col-md-12">
							<span class="category">재료별</span>
							<ul id="cate_list" class="nav">
								<c:forEach items="${requestScope.ingredientList}" var="list">
									<c:set var="keyVal" value="${list.key}" />
									<c:choose>
										<c:when test="${keyVal==requestScope.cate4}">
											<li class="nav-item"><a class="nav-link active"
												href="/recipeList?cate1=${requestScope.cate1}
										&cate2=${requestScope.cate2}&cate3=${requestScope.cate3}&cate4=${keyVal}">
													${requestScope.ingredientList[keyVal]}</a></li>
										</c:when>
										<c:otherwise>
											<li class="nav-item"><a class="nav-link nonactive"
												href="/recipeList?cate1=${requestScope.cate1}
										&cate2=${requestScope.cate2}&cate3=${requestScope.cate3}&cate4=${keyVal}">${requestScope.ingredientList[keyVal]}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
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
									<c:choose>
										<c:when test="${keyVal==requestScope.cate3}">
											<li class="nav-item"><a class="nav-link active"
												href="/recipeList?cate1=${requestScope.cate1}
										&cate2=${requestScope.cate2}&cate3=${keyVal}&cate4=${requestScope.cate4}">
													${requestScope.methodList[keyVal]}</a></li>
										</c:when>
										<c:otherwise>
											<li class="nav-item"><a class="nav-link nonactive"
												href="/recipeList?cate1=${requestScope.cate1}
										&cate2=${requestScope.cate2}&cate3=${keyVal}&cate4=${requestScope.cate4}">${requestScope.methodList[keyVal]}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
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
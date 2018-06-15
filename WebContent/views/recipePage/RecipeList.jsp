<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/recipePage_css/recipeList.css">

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<style>
* {
	padding: 0;
}
</style>
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
<script>
	function order(sel) {
		location.href = "/recipeList?cate1=${requestScope.cate1}"
				+ "&cate2=${requestScope.cate2}&cate3=${requestScope.cate3}&cate4=${requestScope.cate4}&order="
				+ sel.getAttribute('id') + "&search=";
	}
	function selectRecipe() {
		location.href = "/recipe" + recipeId;
	}
</script>
<title>수상한 레시피</title>

<!-- 스타일 값 설정 -->

</head>

<body style="overflow-x: hidden; overflow-y: auto;">
	<div class="container-fluid">
		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 해더 -->
	</div>
	<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
		style="padding: 10px;" id="point">
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
										&cate2=${requestScope.cate2}&cate3=${requestScope.cate3}&cate4=${requestScope.cate4}&order=&search=">
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

		<div class="row" style="margin-bottom: 2%;">
			<div class="offset-md-10 col-md-1" style="padding: 0px;">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">

					<c:choose>
						<c:when test="${requestScope.order=='recipe_views' }">
							<label class="btn btn-secondary" onclick="order(posted_date);"
								id="posted_date">최신순 </label>
							<label class="btn btn-secondary active"
								onclick="order(recipe_views);" id="recipe_views"> 조회순 </label>
						</c:when>
						<c:otherwise>
							<label class="btn btn-secondary active"
								onclick="order(posted_date);" id="posted_date">최신순 </label>
							<label class="btn btn-secondary" onclick="order(recipe_views);"
								id="recipe_views"> 조회순 </label>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>

		<div class="row">
			<c:forEach begin="0" items="${requestScope.pageData.dataList}"
				var="list" varStatus="i">
				<div class="col-md-4" style="margin-bottom: 3%;">
						<c:url var="url" value="/recipe">
							<c:param name="recipeNo" value="${requestScope.pageData.dataList[i.count-1].recipeNo}" />
						</c:url>
					<div class="recipe-list list1" onclick="location.href='${url}'">
						<div class="recipe-pic">
							<img src="${requestScope.pageData.dataList[i.count-1].recipePic}"
								class="rounded">
						</div>
						<div class="recipe-title">
							${requestScope.pageData.dataList[i.count-1].recipeTitle}<img
								src="/imgs/recipe_img/new-tag.png" class="img-new" />
						</div>
						<div class="recipe-intro">${requestScope.pageData.dataList[i.count-1].recipeIntro}</div>

						<img src="/imgs/recipe_img/view_icon.png" class="views-icon">
						<div class="views">${requestScope.pageData.dataList[i.count-1].recipeViews}</div>
					</div>
				</div>

				<div class="row"></div>
			</c:forEach>
		</div>
		<div class="row">
			<ul id="pageNavi" class="pagination">
				${requestScope.pageData.pageNavi }
			</ul>
		</div>

	</div>


	<!-- Footer -->
	<div id="footer"
		class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
		style="border: 1px solid black; padding: 10px;">
		<!-- footer -->
	</div>
</body>
</html>
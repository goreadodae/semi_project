<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<link rel="stylesheet" href="/css/recipePage_css/recipeSelect.css">
<%
	pageContext.setAttribute("CR", "\r");
	pageContext.setAttribute("LF", "\n");
%>
<!-- 개행제거 -->
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
<title>수상한 레시피</title>
</head>
<body style="overflow-x: hidden; overflow-y: auto;">
	<div class="container-fluid">
		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 해더 -->
	</div>
	<div style="padding: 0%; background-color: #f8faff">
		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="padding: 10px;" id="point">
			<div class="row">
				<!-- 제목,사진,view 수,인트로,요리정보,스크랩,공유,댓글 -->
				<div class="col-md-12" id="recipe-infoes"
					style="background-color: white">
					<div class="row">
						<div class="col-md-6" id="recipe-pic"
							style="background-image: url('${requestScope.recipe.recipePic }');">
						</div>
						<div class="col-md-6">
							<div class="row" id="recipe-title">
								<!-- 제목 -->
								<div class="col-md-12">
									<h4>${requestScope.recipe.recipeTitle }</h4>
								</div>
							</div>
							<div class="row" id="recipe-info">
								<!-- 요리정보 -->
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<div class="row" style="margin-top: 30%;">
										<div id="cook-serving"
											style="margin-left: auto; margin-right: auto;">
											<img src="/imgs/recipe_img/cookServing.png"
												style="margin-left: auto; margin-right: auto; display: block;" /><br>
											<span
												style="margin-left: auto; margin-right: auto; display: block; font-weight: bold">${requestScope.recipe.cookServing }</span>
										</div>
									</div>
								</div>
								<div class="col-md-3" id="cook-time">
									<div class="row" style="margin-top: 30%;">
										<div id="cook-time"
											style="margin-left: auto; margin-right: auto;">
											<img src="/imgs/recipe_img/cookTime.png"
												style="margin-left: auto; margin-right: auto; display: block;" /><br>
											<span
												style="margin-left: auto; margin-right: auto; display: block; font-weight: bold">${requestScope.recipe.cookTime }</span>
										</div>
									</div>
								</div>
								<div class="col-md-3" id="cook-level">
									<div class="row" style="margin-top: 30%;">
										<div id="cook-level"
											style="margin-left: auto; margin-right: auto;">
											<img src="/imgs/recipe_img/cookLevel.png"
												style="margin-left: auto; margin-right: auto; display: block;" /><br>
											<span class="info-text"
												style="margin-left: auto; margin-right: auto; display: block; font-weight: bold">${requestScope.recipe.cookLevel }</span>
										</div>
									</div>
								</div>
								<div class="col-md-1"></div>
							</div>
							<div class="row" id="recipe-intro">
								<!-- 인트로 -->
								<div class="col-md-12" style="color: gray;">
									<img src="/imgs/recipe_img/left-quotes.png" class="quotes">
									${requestScope.recipe.recipeIntro } <img
										src="/imgs/recipe_img/right-quotes.png" class="quotes">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 재료 -->
				<div class="col-md-12">
					<div>
						<img src="/imgs/recipe_img/ingre.png" style="margin-bottom: 10px;">
						<h3
							style="display: inline-block; margin-top: 10px; margin-bottom: 0">재료</h3>
						<br>
					</div>
				</div>
				<div class="col-md-12" style="margin-bottom: 4%;">
					<c:set var="string">
						<c:forTokens var="ingredient"
							items="[재료]${requestScope.recipe.ingredient }" delims="[]">
				${ingredient},
			</c:forTokens>
					</c:set>
					<c:forEach begin="0" items="${string}" var="list" varStatus="i">
						<c:choose>
							<c:when test="${i.count%2!=0 }">
								<h5>[${list}]</h5>
							</c:when>
							<c:otherwise>
								<c:forTokens var="ingre" items="${list}" delims="-">
							${ingre},
						</c:forTokens>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			<div class="row">
				<!-- 요리순서, 완성사진, 팁, 태그, 등록일 -->
				<c:forEach begin="0" items="${requestScope.processList}" var="list"
					varStatus="i">
					<div  class="col-md-5" style="margin-top: 5%; margin-left: auto; margin-right: auto; background-color: #f8faff; border-radius: 20px;	" >
						<div class="row" style="background-color: #f8faff; border-bottom: 1px solid black; border-width: 90%;">
							<div class="col-md-12" style="margin-bottom: 5%; margin-top: 5%; background-color: #f8faff">
								<div style="text-align: center">
								<img src="${list.processPic }" style="width: 80%; height: auto;" />
							</div>
							</div>
						</div>
						<div class="row" style="background-color: #f8faff">
							<div class="col-md-1" style="background-color: #f8faff"></div>	
							<div class="col-md-1">
								<h2 style="display: inline-block; margin-top: 5%; margin-left: 10%; width: 10px">${list.processOrder }</h2>
							</div>
							<div class="col-md-10" style="padding-right: 12%;">
								${list.processExplain }
							</div>
						</div>
						<div >
							
						</div>
					</div>
				</c:forEach>
				<div class="col-md-12">	
					완성사진
					<c:set var="picList">
					<c:forTokens var="list" items="${requestScope.recipe.completePic }" delims="">
						${list},
					</c:forTokens>
					</c:set>
					<div id="complete-pic-div">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<c:forEach begin="0" items="${picList }" varStatus="i" var="picListNavi">
									<li data-target="#carouselExampleIndicators" data-slide-to="0"
										class="active"></li>
								</c:forEach>
							</ol>
							<div class="carousel-inner">
								<c:forEach begin="0" items="${picList }" varStatus="i" var="picListNavi">
									<div class="carousel-item active">
									<img class="d-block w-100"
										src="${picListNavi }" alt="First slide">
									</div>
								</c:forEach>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<!-- 팁 -->
					<div class="row">
						${requestScope.recipe.tip }<br>
					</div>
				</div>

				<div class="col-md-12">
					<!-- 태그 -->
					<div class="row">
						<c:forTokens var="recipeTag"
							items="${requestScope.recipe.recipeTag }" delims="#">
							<a href="#">#${recipeTag} </a>
						</c:forTokens>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 댓글 -->
			</div>
		</div>
	</div>
	<div id="footer"
		class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
		style="border: 1px solid black; padding: 10px;">
		<!-- footer -->
	</div>
</body>
</html>
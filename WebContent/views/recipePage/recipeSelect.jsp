<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	Member m = (Member) session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<link rel="stylesheet" href="/css/recipePage_css/recipeSelect.css">
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
	<div class="container-fluid" style="padding: 0;">
		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 해더 -->
	</div>
	<div style="padding: 0%; background-color: #f8faff">
		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="padding: 10px;" id="point">
			<div class="row">
				<div class="col-md-12">
					<button class="btn btn-primary" onclick=""
			style="float: right; background-color: #512772 !important; color: white !important; margin-top: 3%; margin-bottom: 3%;">레시피 수정</button>
				</div>
			</div>
			<div class="row" id="recipe-body">
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
			<div class="row" id="recipe-body">
				<!-- 재료 -->
				<div class="col-md-12" style="padding-left: 3%; padding-top: 2%;">
					<img src="/imgs/recipe_img/ingre.png" style="margin-bottom: 10px;">
					<h3
						style="display: inline-block; margin-top: 10px; margin-bottom: 0">재료</h3>
					<br>
				</div>
				<div class="col-md-12" style="margin-bottom: 4%;">
					<c:set var="string">
						<c:forTokens var="ingredient"
							items="${requestScope.recipe.ingredient }" delims="[]">
				${ingredient},
			</c:forTokens>
					</c:set>
					<c:forEach begin="0" items="${string}" var="list" varStatus="i">
						<c:choose>
							<c:when test="${i.count%2!=0 }">
								<h5 style="font-weight: bold;">[${list}]</h5>
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
			<c:if test="${requestScope.recipe.video!='undefined'&& requestScope.recipe.video!=null}">
			<div class="row" id="recipe-body" style="padding-bottom: 5%;">
				<div class="col-md-12" style="padding-left: 3%; padding-top: 2%;">
					<img src="/imgs/recipe_img/video-camera.png"
						style="margin-bottom: 10px;">
					<h3
						style="display: inline-block; margin-top: 10px; margin-bottom: 0">동영상</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="embed-responsive embed-responsive-16by9">
						<c:set var="videoSrc" value = "${fn:replace(requestScope.recipe.video,'watch?v=','embed/')}"/>
						<iframe src="${videoSrc}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
			</c:if>
			<div class="row" id="recipe-body">
				<div class="col-md-12" style="padding-left: 3%; padding-top: 2%;">
					<img src="/imgs/recipe_img/step.png" style="margin-bottom: 10px;">
					<h3
						style="display: inline-block; margin-top: 10px; margin-bottom: 0">조리순서</h3>
				</div>
				<!-- 요리순서, 완성사진, 팁, 태그, 등록일 -->
				<c:forEach begin="0" items="${requestScope.processList}" var="list"
					varStatus="i">
					<div class="col-md-1"></div>
					<div class="col-md-10"
						style="margin-bottom: 5%; background-color: #f8faff; border-radius: 20px;">
						<div class="row" style="padding-top: 2%; padding-bottom: 2%;">
							<div class="col-md-5">
								<div style="text-align: center">
									<c:choose>
										<c:when test="${list.processPic=='undefined' }">
											<img src="/imgs/recipe_img/noRecipeImage.png"
												style="width: 80%; height: auto;" />
										</c:when>
										<c:otherwise>
											<img src="${list.processPic }"
												style="width: 80%; height: auto;" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="col-md-7">
								<div class="row">
									<div class="col-md-1">
										<h2
											style="display: inline-block; margin-top: 5%; margin-left: 10%; width: 10px; color: #512772;"">
											${list.processOrder }</h2>
									</div>
									<div class="col-md-11" style="font-size: 25px;">
										<div class="row">
											<div class="col-md-12" style="margin-bottom: 8%;">
												${list.processExplain }</div>
											<div class="row" style="font-size: 15px; color: gray;">
												<c:if test="${list.ingre!=null }">
													<div class="col-md-12">
														<img src="/imgs/recipe_img/pro_ingre.png" /> ${list.ingre }
													</div>
												</c:if>
												<c:if test="${list.tools!=null }">
													<div class="col-md-12">
														<img src="/imgs/recipe_img/pro_tool.png" /> ${list.tools }
													</div>
												</c:if>
												<c:if test="${list.fireLevel!=null }">
													<div class="col-md-12">
														<img src="/imgs/recipe_img/pro_fire.png" />
														${list.fireLevel }
													</div>
												</c:if>
												<c:if test="${list.tip!=null }">
													<div class="col-md-12">
														<img src="/imgs/recipe_img/pro_tip.png" /> ${list.tip }
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</c:forEach>
				<c:if
					test="${requestScope.recipe.completePic!='undefined' && requestScope.recipe.completePic!=null}">
					<div class="col-md-12" style="padding-left: 3%; padding-top: 2%;">
						<img src="/imgs/recipe_img/complete_pic.png"
							style="margin-bottom: 10px;">
						<h3
							style="display: inline-block; margin-top: 10px; margin-bottom: 0">완성사진</h3>
					</div>
					<div class="col-md-12" style="margin-bottom: 3%;">
						<c:set var="picList">
							<c:forTokens var="list"
								items="${requestScope.recipe.completePic }" delims="@">
						${list},
					</c:forTokens>
						</c:set>
						<div id="complete-pic-div">
							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<c:forEach begin="0" items="${picList }" varStatus="i"
										var="picListNavi">
										<li data-target="#carouselExampleIndicators" data-slide-to="0"
											class="active"></li>
									</c:forEach>
								</ol>
								<div class="carousel-inner">
									<c:forEach begin="0" items="${picList }" varStatus="i"
										var="picListNavi">
										<c:choose>
											<c:when test="${i.count==1 }">
												<div class="carousel-item active">
													<img class="d-block w-100" src="${picListNavi }"
														alt="First slide">
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item">
													<img class="d-block w-100" src="${picListNavi }"
														alt="First slide">
												</div>
											</c:otherwise>
										</c:choose>
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
				</c:if>

				<c:if test="${requestScope.recipe.tip!=null }">

					<div class="col-md-12" style="padding-left: 3%; padding-top: 2%;">
						<img src="/imgs/recipe_img/tip&warning.png"
							style="margin-bottom: 10px;">
						<h3
							style="display: inline-block; margin-top: 10px; margin-bottom: 0">팁/주의사항</h3>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-9" style="margin-bottom: 5%;">
						<!-- 팁 -->
						<span style="font-size: 20px;">${requestScope.recipe.tip }</span><br>
					</div>
					<div class="col-md-2"></div>
				</c:if>

				<c:if test="${requestScope.recipe.recipeTag!=null }">
					<div class="col-md-12">
						<!-- 태그 -->
						<div class="row"
							style="border-top: 1px solid black; padding-top: 2%; margin-bottom: 3%;">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<img src="/imgs/recipe_img/tag.png" />
								<c:forTokens var="recipeTag"
									items="${requestScope.recipe.recipeTag }" delims="#">
									<span style="display: inline-block;"> <a
										href="searchRecipeList?searchVal=${recipeTag }"
										style="color: #512772; background-color: #f8faff;">#${recipeTag}</a>
									</span>&nbsp;&nbsp;
						</c:forTokens>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</c:if>
			</div>
			<div class="row" id="recipe-body">
				<!-- 댓글 -->
				<jsp:include page="/views/recipePage/recipeComment.jsp"></jsp:include>
			</div>
		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<jsp:include page="/views/footer/main-Footer.jsp"></jsp:include>
		</div>
</body>
</html>
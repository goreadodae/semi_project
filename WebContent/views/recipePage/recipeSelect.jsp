<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<div class="container-fluid">
		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 해더 -->
	</div>
	<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
		style="padding: 10px;" id="point">
		<div class="row"><!-- 제목,사진,view 수,인트로,요리정보,스크랩,공유,댓글 -->
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-6" id="recipe-pic" style="background-image: url('${requestScope.recipe.recipePic }');">
					</div>
					<div class="col-md-6">
						<div class="row" id="recipe-title"><!-- 제목 -->
							<div class="col-md-12">
								<h4>${requestScope.recipe.recipeTitle }</h4>
							</div>
						</div>
						<div class="row" id="recipe-info"><!-- 요리정보 -->
							${requestScope.recipe.cookServing }
							${requestScope.recipe.cookTime }
							${requestScope.recipe.cookLevel }
						</div>
						<div class="row" id="recipe-intro"><!-- 인트로 -->
							<div class="col-md-12">
								${requestScope.recipe.recipeIntro }
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row"><!-- 재료 -->
		</div>
		<div class="row"><!-- 요리순서, 완성사진, 팁, 태그, 등록일 -->
		</div>
		<div class="row"><!-- 댓글 -->
		</div>
	</div>
	<div id="footer"
		class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
		style="border: 1px solid black; padding: 10px;">
		<!-- footer -->
	</div>
</body>
</html>
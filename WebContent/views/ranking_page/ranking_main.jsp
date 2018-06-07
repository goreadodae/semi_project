<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>세미_랭킹 페이지</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss.css">
<link rel="stylesheet" href="/css/bootstrap.css">
</head>

<body>

	<!-- 
	☆ 디자인 참고 홈페이지
	https://www.ovzect.kr/shop?productListFilter=117035 -->

	<!-- header -->
	<jsp:include page="/views/mainpage-header/main-header.html" />

	<!-- 랭킹 상단 부분 url -->
	<!-- <div id="line">
	<a id="rankingURL" href="#"><h2 id="rankingTopName">Ranking</h2></a>
	</div>
	<br><br><br><br>
 	-->
 	
	<br>
	<br>
	<div id="line">
		<a id="rankingURL" href="#"><h2 id="rankingTopName">Ranking</h2></a>
	</div>
	<div class="row">
		<div class="col-md-5" id="ranking_Top_Division_Line"></div>
	</div>
	<!-- 오늘의 레시피, 이달의 레시피, 이달의 회원 상단 -->
	<div id="wrap" class="container">

		<div class="row">

			<!-- 오늘의 레시피 -->

			<div class="col-md-4" id="todayRecipe">
				<br>
				<br>
				<div id="rankingLine">
					<!-- 오늘의 레시피 텍스트 url -->
					<a id="rankingURL" href="#"><h3 id="rankingTitle">Today's
							Recipes</h3></a>
					<!-- <h5 style="margin:0;">오늘의 레시피</h5> -->
					<br>
					<br>
					<div class="media-image">
						<a href="#"> <img class="media-object"
							src="/imgs/ranking_img/recipe.jpg" alt="오늘의 레시피"
							style="width: 100%; height: 100%">
						</a>
					</div>
					<br>
					<h5 style="margin: 0;">오늘의 레시피</h5>
				</div>
			</div>

			<div class="clearfix visible-xs-block"></div>
			<!-- 이달의 레시피 -->
			<div class="col-md-4" id="monthRecipe">
				<br>
				<br>
				<div id="rankingLine">
					<!-- 이달의 레시피 텍스트 url -->
					<a id="rankingURL" href="#"><h3 id="rankingTitle">Monthly
							Recipes</h3></a>
					<!-- <h5 style="margin:0;">이달의 레시피</h5> -->
					<br>
					<br>
					<div class="media-image">
						<a href="#"> <img class="media-object"
							src="/imgs/ranking_img/ingredient.jpg" alt="이달의 레시피"
							style="width: 100%; height: 100%">
						</a>
					</div>
					<br>
					<h5 style="margin: 0;">이달의 레시피</h5>
				</div>
			</div>

			<!-- Optional: clear the XS cols if their content doesn't match in height -->
			<div class="clearfix visible-xs-block"></div>
			<!-- 이달의 회원 -->
			<div class="col-md-4" id="monthUserRecipe">
				<br>
				<br>
				<div id="rankingLine">
					<!-- 이달의 회원 텍스트 url -->
					<a id="rankingURL" href="#"><h3 id="rankingTitle">Member
							of the Month</h3></a>
					<!-- <h5 style="margin:0;">이달의 회원</h5> -->
					<br>
					<br>
					<div class="media-image">
						<a href="#"> <img class="media-object"
							src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="이달의 회원"
							style="width: 100%; height: 100%">
						</a>
					</div>
					<br>
					<h5 style="margin: 0;">이달의 회원</h5>
				</div>
			</div>

		</div>
	</div>


	<!-- ranking 중간 구분 선 -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container" id="middle_Division_Line">
		<div class="row">
			<div id="ranking_Division_Line"></div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<!-- raingking 선택 바  : 따로 만들어서 불러오기!-->
	<div class="container">
		<div class="row">
			<pre style="text-align: center; margin: 0;">
		<a href=""><label>오늘의 레시피</label></a>     <a href=""><label>이달의 레시피</label></a>     <a
					href=""><label>이달의 회원</label></a>     
		</pre>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- footer -->
	<jsp:include page="/views/mainpage-footer/main-footer.html" />

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>
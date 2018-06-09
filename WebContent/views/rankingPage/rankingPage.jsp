<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>세미_랭킹 페이지</title>

<!-- 스타일시트 초기화 -->
<link rel="stylesheet" href="/css/reset.css">

<!-- 랭킹페이지에 필요한 스타일시트 : 지현 작성 -->
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss.css">

<!-- 부트스트랩 css -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">



<!-- js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</head>

<body>

	<!-- ☆ 디자인 참고 홈페이지
	https://www.ovzect.kr/shop?productListFilter=117035 -->

	<!-- header -->
 	<jsp:include page="/views/header/main-Header.jsp" />


	<!-- 랭킹 상단 부분 url -->
	<br><br>
	<div class="center-block" id="line">
		<a id="rankingURL" href="#"><h2 id="rankingTopName">Ranking</h2></a>
	</div>
	<!-- 상단 구분선 -->
	<hr style="width: 500px; border: 2px solid #EAEAEA;">




<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/imgs/ranking_img/recipe.jpg" alt="First slide" id="Firstslide" style="height: 700px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/imgs/ranking_img/recipe.jpg" alt="Second slide" id="Secondslide" style="height: 700px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/imgs/ranking_img/recipe.jpg" alt="Third slide" id="Thirdslide" style="height: 700px;">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>







<br><br><br>
	<!-- 오늘의 레시피, 이달의 레시피, 이달의 회원 상단 -->
	<div id="wrap" class="container">

		<div class="row">

			<!-- 오늘의 레시피 -->

			<div class="col-md" id="todayRecipe">
				<br> <br>
				<div id="rankingLine">
					<!-- 오늘의 레시피 텍스트 url -->
					<a id="rankingURL" href="#"><h3 id="rankingTitle">Today's
							Recipes</h3></a>
					<!-- <h5 style="margin:0;">오늘의 레시피</h5> -->
					<br> <br>
					<div class="media-image">
						<a href="#"> <img class="media-object"
							src="/imgs/ranking_img/recipe.jpg" alt="오늘의 레시피" id="todayRecipeImage" 
							style="width: 349px; height: 223px">
						</a>
					</div>
					<br>
					<h5 style="margin: 0;">오늘의 레시피</h5>
				</div>
			</div>

			<!-- <div class="clearfix visible-xs-block"></div> -->
			<!-- 이달의 레시피 -->
			<div class="col-md" id="monthRecipe">
				<br> <br>
				<div id="rankingLine">
					<!-- 이달의 레시피 텍스트 url -->
					<a id="rankingURL" href="#"><h3 id="rankingTitle">Monthly
							Recipes</h3></a>
					<!-- <h5 style="margin:0;">이달의 레시피</h5> -->
					<br> <br>
					<div class="media-image">
						<a href="#"> <img class="media-object"
							src="/imgs/ranking_img/ingredient.jpg" alt="이달의 레시피" id="montylyRecipeImage" 
							style="width: 349px; height: 223px">
						</a>
					</div>
					<br>
					<h5 style="margin: 0;">이달의 레시피</h5>
				</div>
			</div>

			<!-- Optional: clear the XS cols if their content doesn't match in height -->
			<div class="clearfix visible-xs-block"></div>
			<!-- 이달의 회원 -->
			<div class="col-md" id="monthUserRecipe">
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
							src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="이달의 회원" id="monthlyUserImage" 
							style="width: 349px; height: 223px">
						</a>
					</div>
					<br>
					<h5 style="margin: 0;">이달의 회원</h5>
				</div>
			</div>

		</div>
	</div>



	<br><br><br><br><br>



	<!-- 하단 메뉴 -->

	<br><br><br><br><br>

	<!-- 하단 그레이 색들어간 부분! -->
	<!--<div style="background-color: #F6F6F6;"> -->
	<div style="background-color: #F8FAFF;">
		<!-- ranking 중간 구분 선 -->
		<br><br><br><br>
		<hr style="width: 400px; border: 2px solid #353866;">
		<!-- 	<div class="container" id="middle_Division_Line">
		<div class="row  mx-auto">
			<div id="ranking_Division_Line"></div>
		</div>
	</div> -->


<!-- 하단 메뉴 -->


		<div class="container" id="aTextDiv">

			<a href="rankingPage3.jsp" id="aText">오늘의 레시피</a> &emsp;&emsp; 
			<a href="#" id="aText">이달의 레시피</a> &emsp;&emsp; 
			<a href="#" id="aText">이달의 회원</a>

		</div>

		<br><br><br><br>

<!-- 리스트 만들기 -->

<h1>날짜 선택이 들어가야 하는 ㅂ부분 </h1><br>

<!-- 오늘의 레시피 랭킹 불러오기 -->
	<jsp:include page="rankingPage2.jsp" />

	<br><br><br><br><br><br><br><br>	
	</div>



	<!-- 아래 알림 바  -->
	<div class="alert alert-info alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>랭킹에 도전하세요!</strong> 오늘의 레시피, 이달의 레시피, 이달의 회원을 뽑아 레시피를 상품화 시켜
		드립니다!
	</div>

	<!-- footer -->
	<jsp:include page="/views/footer/main-Footer.jsp" />

</body>
</html>
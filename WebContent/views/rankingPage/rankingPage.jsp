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
<!-- <link rel="stylesheet" href="/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"> 
<!-- bootstrap js -->
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
<hr style="width:500px; border:2px solid #EAEAEA;">	
	


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
						<a href="#"> 
						<img class="media-object"
							src="/imgs/ranking_img/recipe.jpg" alt="오늘의 레시피"
							style="width: 349px; height: 223px">
						</a>
					</div>
					<br>
					<h5 style="margin: 0;">오늘의 레시피</h5>
				</div>
			</div>

			<!-- <div class="clearfix visible-xs-block"></div> -->
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
						<a href="#"> 
						<img class="media-object"
							src="/imgs/ranking_img/ingredient.jpg" alt="이달의 레시피"
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
			<div class="col-md-4" id="monthUserRecipe">
				<br><br>
				<div id="rankingLine">
					<!-- 이달의 회원 텍스트 url -->
					<a id="rankingURL" href="#"><h3 id="rankingTitle">Member of the Month</h3></a>
					<!-- <h5 style="margin:0;">이달의 회원</h5> -->
					<br><br>
					<div class="media-image">
						<a href="#"> <img class="media-object"
							src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="이달의 회원"
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

<!-- 하단 그레이 색들어간 부분! -->
<div style="background-color: #F6F6F6;;">
	<!-- ranking 중간 구분 선 -->
	<br><br><br><br>
	<hr style="width:400px; border:2px solid #353866;">	
<!-- 	<div class="container" id="middle_Division_Line">
		<div class="row  mx-auto">
			<div id="ranking_Division_Line"></div>
		</div>
	</div> -->
	
	
	<!-- 하단 메뉴 -->

	<div class="container" id="aTextDiv">

	<a href="#" id="aText">오늘의 레시피</a> &emsp;&emsp;
	<a href="#" id="aText">이달의 레시피</a> &emsp;&emsp;
	<a href="#" id="aText">이달의 회원</a>

	</div>

<br><br><br><br>
<!-- 랭킹 슬라이드 -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">

    <!-- 랭킹 슬라이드 첫번째 -->
    <div class="carousel-item active">


<div class="container">

<a href="#" id="cardA">

   <div class="card first">
  <img class="card-img-top first" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="carousel-caption" style="width: 1200px;">
                        <h3>제목 </h3>
                        <h4>닉네임이나 아이디 적는 곳</h4>
                        <p>캡션 내부에는 HTML 태그 사용 가능합니다.</p>
  </div>
</div>
  </a>

</div>
      <!-- <img class="d-block w-100" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="First slide" style="width:1200px; height:800px;"> -->
    </div>

<!-- 랭킹 슬라이드 두번째 -->
    <div class="carousel-item">


 <div class="container">
  <div class="row">

<a href="#" id="cardA">
   <div class="card" style="margin-right: 20px; margin-left: 20px;">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
  </a>

<a href="#" id="cardA">
   <div class="card" style="margin-right: 20px;">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
</a>

<a href="#" id="cardA">
      <div class="card">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
</a>

</div>
</div>
      <!-- <img class="d-block w-100" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="First slide" style="width:1200px; height:800px;"> -->
    </div>

<!-- 랭킹 슬라이드 세번째 -->
    <div class="carousel-item">
      
<div class="container">
  <div class="row">

<a href="#" id="cardA">
   <div class="card" style="margin-right: 20px; margin-left: 20px;">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
  </a>

<a href="#" id="cardA">
   <div class="card" style="margin-right: 20px;">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
</a>

<a href="#" id="cardA">
      <div class="card">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
</a>

</div>
</div>
      <!-- <img class="d-block w-100" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="First slide" style="width:1200px; height:800px;"> -->
    </div>

<!-- 랭킹 슬라이드 네번째 -->
    <div class="carousel-item">


 <div class="container">
  <div class="row">

<a href="#" id="cardA">
   <div class="card" style="margin-right: 20px; margin-left: 20px;">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">444Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
  </a>

<a href="#" id="cardA">
   <div class="card" style="margin-right: 20px;">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
</a>

<a href="#" id="cardA">
      <div class="card">
  <img class="card-img-top" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
</a>

</div>
</div>
      <!-- <img class="d-block w-100" src="/imgs/ranking_img/chef-1245676_1920.jpg" alt="First slide" style="width:1200px; height:800px;"> -->
    </div>

  </div>



 <!-- 랭킹바 좌우 선택 화살표 '<' ,'>' -->

  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" >
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" >
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<br><br><br><br>
</div>

<!-- 랭킹 선택바 끝! -->



	
	
<!-- 아래 알림 바  -->
<div class="alert alert-info alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>랭킹에 도전하세요!</strong> 오늘의 레시피, 이달의 레시피, 이달의 회원을 뽑아 레시피를 상품화 시켜 드립니다!
</div>

	<!-- footer -->
	<jsp:include page="/views/footer/main-Footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>세미_랭킹 페이지</title>

<!-- 스타일시트 초기화 -->
<link rel="stylesheet" href="/css/reset.css">

<!-- 랭킹페이지에 필요한 스타일시트 : 지현 작성 -->
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss.css">
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss_common.css">


<!-- 부트스트랩 css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">


<!-- js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<!-- jquery -->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>



<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
		$("#ranking2_TRecipe").load("rankingPage2_TRecipe.jsp");
		$("#ranking2_MRecipe").load("rankingPage2_MRecipe.jsp");
		$("#ranking2_MChef").load("rankingPage2_MChef.jsp");
		
	});





		/* 내비게이션 고정 */
	$(document).ready(function() {

		var jbOffset = $('#bodyWrap').offset();

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


</head>

<body>

	<!-- ☆ 디자인 참고 홈페이지
	https://www.ovzect.kr/shop?productListFilter=117035 -->

	<!-- header -->
	<div id="headWrap">
 	<div id="header">
 	</div>

	<!-- 랭킹 상단 부분 url -->
	<br><br>
	<div id="bodyWrap">
	<div class="center-block" id="line">
		<a id="rankingURL" href="#gray_line"><h2 id="rankingTopName">Ranking</h2></a>
	</div>
	<!-- 상단 구분선 -->
	<hr style="width: 500px; border: 2px solid #EAEAEA;">


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
					<h5 style="margin: 0;">오늘의 1위 레시피</h5>
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
					<h5 style="margin: 0;">이달의 1위 레시피</h5>
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
					<h5 style="margin: 0;">이달의 1위 회원</h5>
				</div>
			</div>

		</div>
	</div>

<br><br>

<!-- 동영상 div -->
	<div class="container">
	<div class="embed-responsive embed-responsive-16by9" style="width: 100%; height: 40%;">
    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/F5ESmoCh77k" allowfullscreen></iframe>
	</div>
	</div>
	<br><br><br><br>



	<!-- 하단 메뉴 -->

	

	<!-- 하단 그레이 색들어간 부분! -->
	<!--<div style="background-color: #F6F6F6;"> -->
	<div style="background-color: #F8FAFF;" id="gray">
		<!-- ranking 중간 구분 선 -->
		<br><br><br><br><br><br>
		<hr style="width: 400px; border: 2px solid #353866;" id="gray_line">
		<!-- 	<div class="container" id="middle_Division_Line">
		<div class="row  mx-auto">
			<div id="ranking_Division_Line"></div>
		</div>
	</div> -->


<!-- 하단 메뉴 -->



		<div class="container" id="aTextDiv">

			<a data-url="rankingPage2_TRecipe.jsp" id="aText">오늘의 레시피</a> &emsp;&emsp; 
			<a data-url="rankingPage2_MRecipe.jsp" id="aText">이달의 레시피</a> &emsp;&emsp; 
			<a data-url="rankingPage2_MChef.jsp" id="aText">이달의 회원</a>

		</div>

		<br><br><br><br>

<!-- 랭킹 리스트 만들기(1-5) -->
<script>
$(document).ready(function(e) {
/* a요소를 클릭 했을 시 */
    $('#aTextDiv>#aText').click(function(){
/* iframe 요소의 src 속성값을 a 요소의 data-url 속성값으로 변경 */ 
        $('#iframe').attr('src',$(this).attr('data-url'));
        })
});
</script>



<div class="container-fluid" id="rankingListDownWrap">
	<div class="row justify-content-center">
  <div id="borderWrap" class="rounded">

  	<div class="container">

<!-- 오늘의 레시피 랭킹 리스트 불러오기 -->
	<div id="ranking2Wrap">
		<div class="container" style="width: 1100px; height: 2800px;" id="iframeWrap">
			<!-- iframe으로 페이지 내에서 바꾸기! -->
		<iframe id="iframe" width="100%" height="100%" src="rankingPage2_TRecipe.jsp" frameborder="0"></iframe>
		<!-- frameborder="0" -->
		<!-- <div id="ranking2_TRecipe"></div> -->
		</div>
	</div>

	</div>

  <br><br><br>
  </div>
  </div>
</div>
	<br><br><br><br><br><br><br><br>

	<!-- 회색 바탕 끝! -->	
	</div>
	
<!-- 바디 랩 끝! -->
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
	<div id="footerWrap">
	<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- 푸터 로드 -->
	</div>
	</div>

</body>
</html>
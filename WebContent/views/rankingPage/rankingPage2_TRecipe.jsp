<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>세미_랭킹 페이지 - 중간</title>


<!-- 랭킹페이지에 필요한 스타일시트 : 지현 작성 -->
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss2.css">
<link rel="stylesheet"
	href="/css/ranking_css/semi_rankingCss_common.css">


<!-- 부트스트랩 css -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">


<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

<!-- jquery ui 불러오는 css -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>



<script>
	/*datepicker script*/
	$(document)
			.ready(
					function() {

						$("#datepicker")
								.datepicker(
										{
											dateFormat : 'y/mm/dd',
											prevText : '이전달',
											nextText : '다음달',
											monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
											monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
											dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
											dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
											dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
											showMonthAfterYear : true,
											yearSuffix : '년',
											changeMonth : true,
											changeYear : true,
											defaultDate : new Date(),
											maxDate : new Date(),
											onSelect : function(dateText, inst) {

												/* location.href='rankingPage2_TRecipe.jsp?type=hot&ymd='+dateText; */
												/*data-url="rankingPage2_TRecipe.jsp"*/
												console.log(dateText);
												var datepicker = document
														.getElementById("datepicker").value; //입력값

												$
														.ajax({
															url : "/rankingToday",
															data : {
																datepicker : datepicker
															},
															type : "post",
                              success : function(data) {
                              console.log("성공");
                              console.log(data);

																for (var i = 0; i < data.length; i++) {
                                   console.log(data[i]);
																	/* $('#cardImgs').attr("src","data"); */
	                                console.log("  " + i + "번째 " + data[i]);
                                   $('#rankNum' + (i + 1)).html((i + 1) + "위");
                                   $('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
                                   $('#rankingTodayTitle' + (i + 1)).html(data[i].recipeTitle);
                                  $('#rankingViews' + (i + 1)).html(data[i].recipeTodayViews);
                                  $('#rankingTag' + (i + 1)).html(data[i].recipeTag);
                                  $('#rankingContents' + (i + 1)).html(data[i].recipeIntro);
                                  $('#rankinListIMG'+(i+1)).attr('href','http://localhost/recipe?recipeNo='+data[i].recipeNo);
																}

															},
															error : function() {
																 console.log("실패");
															}

														});

											}

										});

					});

	window.onload = function() {
		var datepicker = document.getElementById("datepicker").value; //입력값

		$
				.ajax({
					url : "/rankingToday",
					data : {
						datepicker : datepicker
					},
					type : "post",
					success : function(data) {
						console.log("성공");
						console.log(data);

						for (var i = 0; i < data.length; i++) {
							/* $('#cardImgs').attr("src","data"); */
              console.log(data[i].recipeNo);
							console.log("  " + i + "번째 " + data[i]);
							$('#rankNum' + (i + 1)).html((i + 1) + "위");
							$('#cardImgs' + (i + 1)).attr('src',
									data[i].recipePic);
							$('#rankingTodayTitle' + (i + 1)).html(
									data[i].recipeTitle);
							$('#rankingViews' + (i + 1)).html(
									data[i].recipeTodayViews);
							$('#rankingTag' + (i + 1)).html(data[i].recipeTag);
							$('#rankingContents' + (i + 1)).html(
									data[i].recipeIntro);
            $('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");
            /*window.top.location.href =$('#rankinListIMG'+(i+1)).attr('href','http://localhost/recipe?recipeNo='+data[i].recipeNo);*/
           /* window.top.location.href ="http://localhost/recipe?recipeNo="+data[i].recipeNo;*/

						}

					},
					error : function() {
						console.log("실패");
					}

				});
	}

	$(function() {
		$('#datepicker').on('change', function() {
			$('#rankingDateToday').html($('#datepicker').val());
		});

		$('.date').on('click', function() {
			$('#datepicker').datepicker("show");

		});

		/*yyyy-mm-dd 형태 단일 코드*/
		var d = new Date().toISOString().slice(0, 10);

		var x = new Date();
		var Tyear = x.getFullYear().toString();
		var Tmonth = (x.getMonth() + 1).toString();
		var Tday = x.getDate().toString();
		(Tday.length == 1) && (Tday = '0' + Tday);
		(Tmonth.length == 1) && (Tmonth = '0' + Tmonth);
		var today = Tyear + "/" + Tmonth + "/" + Tday;

		/*오늘 날짜 가져오기*/
		document.getElementById("rankingDateToday").innerHTML = today;

		/* 
		 $('#preBtn').click(function(){
		 $('#rankingDateToday').html(d-=1);
		 }); */

	});

	/*datepicker script end*/
</script>


</head>
<body>
	<br>

	<!-- datepicker 날짜 불러오기-->
	<!-- <div id="dateTop"> -->
	<div class="container" id="dateWrap">
		<div class="row justify-content-center" id="rankingPage2_1Wrap">

			<a href="javascript:void(0)" type="submit"
				class="btn btn-secondary btn-lg active" role="button"
				aria-pressed="true" id="preBtn" class="dateButton">이전날</a>

			<div class="date">

				<input type="hidden" id="datepicker" name="datepicker"
					style="visibility: hidden" onclick="datepic();"> <a
					href="javascript:void(0)" id="rankingDateToday"></a>

			</div>

			<a href="javascript:void(0)" type="submit"
				class="btn btn-secondary btn-lg active" role="button"
				aria-pressed="true" id="nextBtn" class="dateButton">다음날</a>

		</div>
	</div>
	<!--   </div> -->
	<br>
	<br>
	<br>

<div id="wholeWrap">
	<div class="container" id="tableContainer">
		  <div class="col-lg-12">
          <h2 class="my-4">오늘의 레시피</h2>
        </div>

		<!-- 1위 -->

		<div id="tableWrap">
			<table class="table table-hover" id="tableHover">
				<tbody>
					<tr>
						<th class='row'>
							<h3 class="pull-left" id="rankNum1" style="margin-left: 20px;">1위</h3>
							<div class="float-right" id="viewDiv">
								<img src="/imgs/recipe_img/view_icon.png" class="views-icon"
									id="viewIcon">
								<div id="rankingViews1">views 수</div>
							</div>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- a태그로 해당 레시피 이동 -->
		<a href="#" id="rankinListIMG1" onclick="window.top.location.href ='/recipe?recipeNo=2'">
			<div class="card rounded shadow-sm" id="rankingList">
				<!-- 레시피 이미지 -->
				<div id="imgWrap">
					<img class="card-img rounded"
						src="/imgs/ranking_img/ingredient.jpg" alt="Card image"
						id="cardImgs1">
				</div>
				<div class="container">
					<div class="card-img-overlay" id="cardOverlay">
						<div id="cardContents">
							<!-- 랭킹 등록 관련 레시피 내용 -->
							<h3 class="card-title" id="rankingTodayTitle1">레시피의 제목이 들어가는
								곳!</h3>
							<p class="card-text" id="rankingTag1">레시피 태그</p>
							<p class="card-text" id="rankingContents1">This is a wider
								card with supporting text below as a natural lead-in to
								additional content. This content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">Last updated 3 mins ago</p>
							<p class="card-text">Last updated 3 mins ago</p>
						</div>
					</div>
				</div>
			</div>
		</a> <br>
		<br>
		<br>



		<!-- 2위 -->

		<div id="tableWrap">
			<table class="table table-hover" id="tableHover">
				<tbody>
					<tr>
						<th class='row'>
							<h3 class="pull-left" id="rankNum2" style="margin-left: 20px;">2위</h3>
							<div class="float-right" id="viewDiv">
								<img src="/imgs/recipe_img/view_icon.png" class="views-icon"
									id="viewIcon">
								<div id="rankingViews2">views 수</div>
							</div>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- a태그로 해당 레시피 이동 -->
		<a href="#" id="rankinListIMG2">
			<div class="card rounded shadow-sm" id="rankingList">
				<!-- 레시피 이미지 -->
				<div id="imgWrap">
					<img class="card-img rounded"
						src="/imgs/ranking_img/ingredient.jpg" alt="Card image"
						id="cardImgs2">
				</div>
				<div class="container">
					<div class="card-img-overlay" id="cardOverlay">
						<div id="cardContents">
							<!-- 랭킹 등록 관련 레시피 내용 -->
							<h3 class="card-title" id="rankingTodayTitle2">레시피의 제목이 들어가는
								곳!</h3>
							<p class="card-text" id="rankingTag2">레시피 태그</p>
							<p class="card-text" id="rankingContents2">This is a wider
								card with supporting text below as a natural lead-in to
								additional content. This content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">Last updated 3 mins ago</p>
							<p class="card-text">Last updated 3 mins ago</p>
						</div>
					</div>
				</div>
			</div>
		</a> 
    <br>
		<br>
		<br>

		<!-- 3위 -->

		<div id="tableWrap">
			<table class="table table-hover" id="tableHover">
				<tbody>
					<tr>
						<th class='row'>
							<h3 class="pull-left" id="rankNum3" style="margin-left: 20px;">3위</h3>
							<div class="float-right" id="viewDiv">
								<img src="/imgs/recipe_img/view_icon.png" class="views-icon"
									id="viewIcon">
								<div id="rankingViews3">views 수</div>
							</div>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- a태그로 해당 레시피 이동 -->
		<a href="#" id="rankinListIMG3">
			<div class="card rounded shadow-sm" id="rankingList">
				<!-- 레시피 이미지 -->
				<div id="imgWrap">
					<img class="card-img rounded"
						src="/imgs/ranking_img/ingredient.jpg" alt="Card image"
						id="cardImgs3">
				</div>
				<div class="container">
					<div class="card-img-overlay" id="cardOverlay">
						<div id="cardContents">
							<!-- 랭킹 등록 관련 레시피 내용 -->
							<h3 class="card-title" id="rankingTodayTitle3">레시피의 제목이 들어가는
								곳!</h3>
							<p class="card-text" id="rankingTag3">레시피 태그</p>
							<p class="card-text" id="rankingContents3">This is a wider
								card with supporting text below as a natural lead-in to
								additional content. This content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">Last updated 3 mins ago</p>
							<p class="card-text">Last updated 3 mins ago</p>
						</div>
					</div>
				</div>
			</div>
		</a> <br>
		<br>
		<br>


		<!-- 4위 -->

		<div id="tableWrap">
			<table class="table table-hover" id="tableHover">
				<tbody>
					<tr>
						<th class='row'>
							<h3 class="pull-left" id="rankNum4" style="margin-left: 20px;">4위</h3>
							<div class="float-right" id="viewDiv">
								<img src="/imgs/recipe_img/view_icon.png" class="views-icon"
									id="viewIcon">
								<div id="rankingViews4">views 수</div>
							</div>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- a태그로 해당 레시피 이동 -->
		<a href="#" id="rankinListIMG4">
			<div class="card rounded shadow-sm" id="rankingList">
				<!-- 레시피 이미지 -->
				<div id="imgWrap">
					<img class="card-img rounded"
						src="/imgs/ranking_img/ingredient.jpg" alt="Card image"
						id="cardImgs4">
				</div>
				<div class="container">
					<div class="card-img-overlay" id="cardOverlay">
						<div id="cardContents">
							<!-- 랭킹 등록 관련 레시피 내용 -->
							<h3 class="card-title" id="rankingTodayTitle4">레시피의 제목이 들어가는
								곳!</h3>
							<p class="card-text" id="rankingTag4">레시피 태그</p>
							<p class="card-text" id="rankingContents4">This is a wider
								card with supporting text below as a natural lead-in to
								additional content. This content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">Last updated 3 mins ago</p>
							<p class="card-text">Last updated 3 mins ago</p>
						</div>
					</div>
				</div>
			</div>
		</a> <br>
		<br>
		<br>


		<!-- 5위 -->

		<div id="tableWrap">
			<table class="table table-hover" id="tableHover">
				<tbody>
					<tr>
						<th class='row'>
							<h3 class="pull-left" id="rankNum1" style="margin-left: 20px;">5위</h3>
							<div class="float-right" id="viewDiv">
								<img src="/imgs/recipe_img/view_icon.png" class="views-icon"
									id="viewIcon">
								<div id="rankingViews5">views 수</div>
							</div>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- a태그로 해당 레시피 이동 -->
		<a href="#" id="rankinListIMG5">
			<div class="card rounded shadow-sm" id="rankingList">
				<!-- 레시피 이미지 -->
				<div id="imgWrap">
					<img class="card-img rounded"
						src="/imgs/ranking_img/ingredient.jpg" alt="Card image"
						id="cardImgs5">
				</div>
				<div class="container">
					<div class="card-img-overlay" id="cardOverlay">
						<div id="cardContents">
							<!-- 랭킹 등록 관련 레시피 내용 -->
							<h3 class="card-title" id="rankingTodayTitle5">레시피의 제목이 들어가는
								곳!</h3>
							<p class="card-text" id="rankingTag5">레시피 태그</p>
							<p class="card-text" id="rankingContents5">This is a wider
								card with supporting text below as a natural lead-in to
								additional content. This content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">Last updated 3 mins ago</p>
							<p class="card-text">Last updated 3 mins ago</p>
						</div>
					</div>
				</div>
			</div>
		</a> <br>
		<br>
		<br>

		<!-- 가운데로 보내는 컨테이너 끝! -->
	</div>
</div>

</body>
</html>

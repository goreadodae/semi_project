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

		var prevDay;
		var preDayYear;
		var preDayMonth;
		var nextDayYear;
		var nextDayMonth;
		var nextDay;

		/*datepicker script*/
		/*클릭 했을 때*/
		$(document).ready(function() {


			$("#datepicker").datepicker({
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
				showButtonPanel: true,
				defaultDate : new Date(),
				maxDate : new Date(),
				onSelect : function(dateText, inst) {
				var datepicker = document.getElementById("datepicker").value; //입력값

/*현재 날짜에서 이전날 다음날로 이동하는 변수*/
			var prevDay1 = datepicker.split('/');
			preDayYear = prevDay1[0];	/*년*/
			preDayMonth = prevDay1[1]; /*월*/
			prevDay = prevDay1[2]; /*일*/
/*			if(prevDay<1)
			{
				preDayMonth-1;
				
			}*/

			var prevDay2 = datepicker.split('/');
			nextDayYear = prevDay1[0];	/*년*/
			nextDayMonth = prevDay1[1]; /*월*/
			nextDay = prevDay1[2]; /*일*/

												/*데이터 피커 선택 날짜로 값 집어 넣어서 보여주기!*/
												$('#rankingDateToday').html($('#datepicker').val());


												$.ajax({
													url : "/rankingToday",
													data : {datepicker : (preDayYear+"/"+preDayMonth+"/" +prevDay)},
													type : "post",
													success : function(data) {

														for (var i = 0; i < data.length; i++) {
															$('#rankNum' + (i + 1)).html((i + 1) + "위");
															$('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
															$('#rankingTodayTitle' + (i + 1)).html(data[i].recipeTitle);
															$('#rankingViews' + (i + 1)).html(data[i].recipeTodayViews);
															$('#rankingTag' + (i + 1)).html(data[i].recipeTag);
															$('#rankingContents' + (i + 1)).html(data[i].recipeIntro);
															$('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");

														}

													},
													error : function() {
														console.log("실패");
													}

												});

											}

										});



     /*이전날 버튼*/
     $("#preBtn").click(function(event){
     	$('#rankingDateToday').html((preDayYear+"/"+preDayMonth+"/" +(prevDay-1)));
    	/*alert(prevDay-1);*/
 /*     	location.href="/rankingTodayMove?datepicker="+Tyear + "/" + Tmonth + "/" + (Tday-1);*/
     	 $.ajax({
     	url : "/rankingTodayMove",
     	data : {datepicker : (preDayYear+"/"+preDayMonth+"/" +(prevDay-=1))},
     	type : "post",
     	success : function(data) {

     		for (var i = 0; i < data.length; i++) {
     			$('#rankNum' + (i + 1)).html((i + 1) + "위");
     			$('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
     			$('#rankingTodayTitle' + (i + 1)).html(data[i].recipeTitle);
     			$('#rankingViews' + (i + 1)).html(data[i].recipeTodayViews);
     			$('#rankingTag' + (i + 1)).html(data[i].recipeTag);
     			$('#rankingContents' + (i + 1)).html(data[i].recipeIntro);
     			$('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");
     		}

     	},
     	error : function() {
     		console.log("실패");
     	}

     });


     });


/*다음날 버튼*/
     $("#nextBtn").click(function(event){
     	$('#rankingDateToday').html((preDayYear+"/"+preDayMonth+"/" +(prevDay+1)));
     		 $.ajax({
     	url : "/rankingTodayMoveNext",
     	data : {datepicker : (preDayYear+"/"+preDayMonth+"/" +(prevDay+=1))},
     	type : "post",
     	success : function(data) {

     		for (var i = 0; i < data.length; i++) {
     			$('#rankNum' + (i + 1)).html((i + 1) + "위");
     			$('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
     			$('#rankingTodayTitle' + (i + 1)).html(data[i].recipeTitle);
     			$('#rankingViews' + (i + 1)).html(data[i].recipeTodayViews);
     			$('#rankingTag' + (i + 1)).html(data[i].recipeTag);
     			$('#rankingContents' + (i + 1)).html(data[i].recipeIntro);
     			$('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");

     		}

     	},
     	error : function() {
     		console.log("실패");
     	}

     });

     });



		});


		/*클릭 하지 않았을 때 */
		window.onload = function() {


			$("#datepicker").datepicker().datepicker("setDate", new Date());
			var datepicker = document.getElementById("datepicker").value;

			var prevDay1 = datepicker.split('/');
			preDayYear = prevDay1[0];
			preDayMonth = prevDay1[1];

			prevDay = prevDay1[2];
			
     //입력값
     console.log("오늘 날짜는 ?"+datepicker);

     $.ajax({
     	url : "/rankingToday",
     	data : {datepicker : preDayYear+"/"+preDayMonth+"/" +prevDay},
     	type : "post",
     	success : function(data) {

     		for (var i = 0; i < data.length; i++) {
     			$('#rankNum' + (i + 1)).html((i + 1) + "위");
     			$('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
     			$('#rankingTodayTitle' + (i + 1)).html(data[i].recipeTitle);
     			$('#rankingViews' + (i + 1)).html(data[i].recipeTodayViews);
     			$('#rankingTag' + (i + 1)).html(data[i].recipeTag);
     			$('#rankingContents' + (i + 1)).html(data[i].recipeIntro);
     			$('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");

     		}

     	},
     	error : function() {
     		console.log("실패");
     	}

     });


/*     $('#datepicker').on('change', function() {
     	alert(1);
     	// $('#rankingDateToday').html($('#datepicker').val());
     });*/

     /*데이터 피커를 눌렀을 때  보여주세요*/
     $('.date').on('click', function() {
     	$('#datepicker').datepicker("show");
     });

    

     /*오늘 날짜 구하기*/
     /*yyyy-mm-dd 형태 단일 코드*/
     var d = new Date().toISOString().slice(0, 10);

     var x = new Date();
     var Tyear = x.getFullYear().toString().substr(2);
     var Tmonth = (x.getMonth() + 1).toString();
     var Tday = x.getDate().toString();
     (Tday.length == 1) && (Tday = '0' + Tday);
     (Tmonth.length == 1) && (Tmonth = '0' + Tmonth);
     var today = Tyear + "/" + Tmonth + "/" + Tday;

     /*오늘 날짜 가져오기*/
     document.getElementById("rankingDateToday").innerHTML = today;
     /*alert(Tyear + "/" + Tmonth + "/" + (Tday-1));*/

		/* 
		 $('#preBtn').click(function(){
		 $('#rankingDateToday').html(d-=1);
		}); */
	};


	/*datepicker script end*/
</script>
<!-- <style type="text/css">
	*{
		border: 1px solid black;
	}
</style> -->

</head>
<body>
	<br>

	<!-- datepicker 날짜 불러오기-->
	<!-- <div id="dateTop"> -->
		<div class="container" id="dateWrap">
			<div class="row justify-content-center" id="rankingPage2_1Wrap">

				<a href="javascript:void(0)" class="btn btn-secondary btn-lg active" role="button"
				aria-pressed="true" id="preBtn" class="dateButton">이전날</a>

				<div class="date">

					<input type="hidden" id="datepicker" name="datepicker"
					style="visibility: hidden" onclick="datepic();"> 
					<a href="javascript:void(0)" id="rankingDateToday"></a>

				</div>


				<a href="javascript:void(0)" class="btn btn-secondary btn-lg active" role="button"
				aria-pressed="true" id="nextBtn" class="dateButton">다음날</a>

			</div>
		</div>
		<!--   </div> -->
		<br>
		<br>
		<br>

		<div id="wholeWrap" style="padding-left: 50px;">
			<div class="container justify-content-center" id="tableContainer">
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
									<div class="center-block" id="viewDiv">
										<img src="/imgs/recipe_img/view_icon.png" class="views-icon"
										id="viewIcon">
										<div id="rankingViews1"></div>
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
									<h3 class="card-title" id="rankingTodayTitle1"></h3>
									<p class="card-text" id="rankingTag1"></p>
									<p class="card-text" id="rankingContents1"></p>
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
										<img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
										<div id="rankingViews2"></div>
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
									<h3 class="card-title" id="rankingTodayTitle2"></h3>
									<p class="card-text" id="rankingTag2"></p>
									<p class="card-text" id="rankingContents2"></p>
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
										<div id="rankingViews3"></div>
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
									<h3 class="card-title" id="rankingTodayTitle3"></h3>
									<p class="card-text" id="rankingTag3"></p>
									<p class="card-text" id="rankingContents3"></p>
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
										<div id="rankingViews4"></div>
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
									<h3 class="card-title" id="rankingTodayTitle4"></h3>
									<p class="card-text" id="rankingTag4"></p>
									<p class="card-text" id="rankingContents4"></p>
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
										<div id="rankingViews5"></div>
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
									<h3 class="card-title" id="rankingTodayTitle5"></h3>
									<p class="card-text" id="rankingTag5"></p>
									<p class="card-text" id="rankingContents5"></p>
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

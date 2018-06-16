<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>세미_랭킹 페이지 - 중간</title>


<!-- 스타일시트 초기화 -->
<link rel="stylesheet" href="/css/reset.css">

<!-- 랭킹페이지에 필요한 스타일시트 : 지현 작성 -->
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss2.css">
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss3.css">
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



<script>
	window.onload = function() {
		var preYear = new Date().getFullYear().toString() - 10; /*현재 년도 - 10년*/
		var nowYear = new Date().getFullYear().toString(); /*현재 년도*/
		var preMonth = 1; /*1월*/
		var endMonth = 12; /*12월*/
		var nowMonth = new Date().getMonth() + 1; /*현재 달*/

		var strYear = "";
		var strMonth = "";

		for (var i = preYear; i <= nowYear; i++) {
			if (i == nowYear) {
				strYear += "<option value=" + i + " selected>" + i + "년"
						+ "</option>";
			} else {
				strYear += "<option value=" + i + " >" + i + "년" + "</option>";
			}
		}

		for (var i = preMonth; i <= endMonth; i++) {

			if (i == nowMonth) {
				(i < 10) && (i = '0' + i);
				strMonth += "<option value=" + i + " selected>" + i + "월"
						+ "</option>";
			} else {
				(i < 10) && (i = '0' + i);
				strMonth += "<option value=" + i + " >" + i + "월" + "</option>";

			}
		}

		document.getElementById("yearClick").innerHTML = strYear;
		document.getElementById("monthClick").innerHTML = strMonth;

		/*현재 선택된 셀렉트 값 가져오기*/
		/*console.log($("#yearClick option:selected").val());*/
		console.log("선택하지 않은 상태의 년도 : "
				+ $("select[name=yearClickName]").val().substr(2, 4));
		console.log("선택하지 않은 상태의 년도 : "
				+ $("select[name=monthClickName]").val());
		/* 선택되어지지 않는 상태 */
		var yearClick = $("select[name=yearClickName]").val().substr(2, 4);
		var monthClick = $("select[name=monthClickName]").val();

		/*   console.log("선택 되어져 있는 년도 : "+$("select[name=yearClickName]").val().substr(2,4)); */

		/* 기존 선택하지 않은 상태  */
		$
				.ajax({
					url : "/rankingMonthlyChef",
					data : {
						year : yearClick,
						month : monthClick
					},
					type : "post",
					success : function(data) {
						console.log("성공");
            console.log("선택 안한 기본 날 : "+data);
						/*console.log(data[0].memberId);*/
              console.log(data);
						for (var i = 0; i < data.length; i++) {
							/*console.log($('#rankNum' + (i + 1)).html((i + 1) + "위"));*/

              $('#rankingMemberID'+(i+1)).html(data[i].memberId);
							$('#rankNum' + (i + 1)).html((i + 1) + "위");
							$('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
							$('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
							$('#rankingViews' + (i + 1)).html(data[i].recipeViews);
							$('#rankingTag' + (i + 1)).html(data[i].recipeTag);
							$('#rankingContents' + (i + 1)).html(data[i].recipeIntro);
              $('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");
						}

					},
					error : function() {
						console.log("실패");
					}
				});

		/*year 클릭시에  값 가져오기*/
		$("#yearClick").change(function() {
          var yearClick = $("select[name=yearClickName]").val().substr(2, 4);
           var monthClick = $("select[name=monthClickName]").val();
					/*alert($(this).children("option:selected").text());*/

					console.log("year에서 선택한 년도 : "
							+ $("select[name=yearClickName]").val()
									.substr(2, 4));
					console.log("year에서 선택한 달 : "
							+ $("select[name=monthClickName]").val());

					$.ajax({
						url : "/rankingMonthlyChef",
						data : {
							year : yearClick,
							month : monthClick
						},
						type : "post",
						success : function(data) {
							console.log("성공");
              console.log(data);
							for (var i = 0; i < data.length; i++) {
								console.log("선택한 년도 : "+ i + "번째" + data[i]);

              $('#rankingMemberID'+(i+1)).html(data[i].memberId);
              $('#rankNum' + (i + 1)).html((i + 1) + "위");
              $('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
              $('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
              $('#rankingViews' + (i + 1)).html(data[i].recipeViews);
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

		$("#monthClick").change(function() {
          var yearClick = $("select[name=yearClickName]").val().substr(2, 4);
          var monthClick = $("select[name=monthClickName]").val();

					console.log("month에서 선택한 년도 : "
							+ $("select[name=yearClickName]").val()
									.substr(2, 4));
					console.log("month에서 선택한 달 : "
							+ $("select[name=monthClickName]").val());

					$.ajax({
						url : "/rankingMonthlyChef",
						data : {
							year : yearClick,
							month : monthClick
						},
						type : "post",
						success : function(data) {
							console.log("성공");
              console.log(data);

							for (var i = 0; i < data.length; i++) {
								console.log("선택한 달 : "+ i + "번째" + data[i]);

              $('#rankingMemberID'+(i+1)).html(data[i].memberId);
              $('#rankNum' + (i + 1)).html((i + 1) + "위");
              $('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
              $('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
              $('#rankingViews' + (i + 1)).html(data[i].recipeViews);
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
    
	}
</script>

</head>
<body>
<!-- <style>
  *{
    border : 1px solid black;
  }
</style> -->

	<!-- 가운데로 보내는 컨테이너 -->

	<!-- 월별 selected option -->
	<br>
	<div class="container">

		<div class="container">
			<div class="row justify-content-end">

				<div style="width: 150px;">
					<select class="custom-select" id="yearClick" name="yearClickName">
					</select>
				</div>
				&emsp;
				<div style="width: 150px;">
					<select class="custom-select" id="monthClick" name="monthClickName">
					</select>
				</div>

			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
	</div>
	<br>

<div id="wholeWrap" class="container">
        <div class="col-lg-12">
          <h2 class="my-4">이달의 쉐프</h2>
          <hr style="border: 0.5px solid #EAEAEA;">
        </div>
      <!-- Team Members Row -->
      <div class="row">
<br><br><br>
        
        <div class="col-lg-6 col-sm-6 text-center mb-4">
          <div class="pull-left"><h3 id="rankNum1">1위</h3></div>
          <a href="#" id="rankinListIMG1">
          <img id="cardImgs1" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 300px; height: 300px;" data-toggle="collapse" data-target="#collapseExample" >
        </a>
          <h3 id="rankingMemberID1">John Smith
            <small>Job Title</small>
          </h3>
            <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
          <p style="padding-left: 10px;padding-right: 15px;" id="rankingViews1">
          
          What does this team member to? Keep it short! This is also a great spot for social links!
        </p>
        </div>


        <div class="col-lg-6 col-sm-6 text-center mb-4">
          <div class="pull-left"><h3 id="rankNum2">2위</h3></div>
          <a href="#" id="rankinListIMG2">
          <img id="cardImgs2"  class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 300px; height: 300px;">
        </a>
          <h3 id="rankingMemberID2">John Smith
            <small>Job Title</small>
          </h3>
          <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
          <p style="padding-left: 15px;padding-right: 10px;" id="rankingViews2">
          What does this team member to? Keep it short! This is also a great spot for social links!
        </p>
        </div>


        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <div class="pull-left"><h3 id="rankNum3">3위</h3></div>
          <a href="#" id="rankinListIMG3">
          <img id="cardImgs3" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 200px; height: 200px;">
        </a>
          <h3 id="rankingMemberID3">John Smith
            <small>Job Title</small>
          </h3>
          <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
          <p style="padding-left: 15px;padding-right: 10px;" id="rankingViews3">
            
          What does this team member to? Keep it short! This is also a great spot for social links!
        </p>
        </div>


        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <div class="pull-left"><h3 id="rankNum4">4위</h3></div>
          <a href="#" id="rankinListIMG4">
          <img id="cardImgs4" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 200px; height: 200px;">
        </a>
          <h3 id="rankingMemberID4">John Smith
            <small>Job Title</small>
          </h3>
           <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
          <p style="padding-left: 15px;padding-right: 10px;" id="rankingViews4">
           
          What does this team member to? Keep it short! This is also a great spot for social links!
        </p>
        </div>


        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <div class="pull-left"><h3 id="rankNum5">5위</h3></div>
          <a href="#" id="rankinListIMG5">
          <img id="cardImgs5" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 200px; height: 200px;">
        </a>
          <h3 id="rankingMemberID5">John Smith
            <small>Job Title</small>
          </h3>
            <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
          <p style="padding-left: 15px;padding-right: 10px;" id="rankingViews5">
          
          What does this team member to? Keep it short! This is also a great spot for social links!
        </p>
        </div>

<script type="text/javascript">
  $('#myCollapsible').on('hidden.bs.collapse', function () {
  // do something…
})
</script>

        <p>
  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Link with href
  </a>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    Button with data-target
  </button>
</p>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
  </div>
</div>
      </div>



</body>
</html>
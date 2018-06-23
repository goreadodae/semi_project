<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
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
    var preYear = new Date().getFullYear().toString() - 5; /*현재 년도 - 10년*/
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

/* 선택되어지지 않는 상태 */
var yearClick = $("select[name=yearClickName]").val().substr(2, 4);
var monthClick = $("select[name=monthClickName]").val();

/* 기존 선택하지 않은 상태  */
$
.ajax({
 url : "/rankingMonthlyRecipe",
 data : {
  year : yearClick,
  month : monthClick
},
type : "post",
success : function(data) {
  for (var i = 0; i < data.length; i++) {
      $('#rankNum' + (i + 1)).html((i + 1) + "위");
      $('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
      $('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
      $('#rankingViews' + (i + 1)).html(data[i].recipeMonthViews);
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

   $.ajax({
    url : "/rankingMonthlyRecipe",
    data : {
     year : yearClick,
     month : monthClick
   },
   type : "post",
   success : function(data) {
     //console.log("성공");
     for (var i = 0; i < data.length; i++) {
      $('#rankNum' + (i + 1)).html((i + 1) + "위");
      $('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
      $('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
      $('#rankingViews' + (i + 1)).html(data[i].recipeMonthViews);
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

$("#monthClick").change(
  function() {
     var yearClick = $("select[name=yearClickName]").val().substr(2, 4);
     var monthClick = $("select[name=monthClickName]").val();

   $.ajax({
    url : "/rankingMonthlyRecipe",
    data : {
     year : yearClick,
     month : monthClick
   },
   type : "post",
   success : function(data) {
     for (var i = 0; i < data.length; i++) {
      $('#rankNum' + (i + 1)).html((i + 1) + "위");
      $('#cardImgs' + (i + 1)).attr('src',data[i].recipePic);
      $('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
      $('#rankingViews' + (i + 1)).html(data[i].recipeMonthViews);
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
<style>
@import url(https://fonts.googleapis.com/css?family=Khula:700);
  @import url(//fonts.googleapis.com/earlyaccess/hanna.css);
</style>
</head>
<body>


	<!-- 가운데로 보내는 컨테이너 -->

	<!-- 월별 selected option -->
	<br>
	<div class="container"  style="padding-right: 50px;">

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

  <div id="wholeWrap"  style="padding-left: 50px;">
   <div class="container" id="tableContainer">
    <div class="col-lg-12">
      <h2 class="my-4" style=" font-family:hanna; font-weight: 800;">이달의 레시피</h2>
    </div>

    <!-- 1위 -->


    <div id="tableWrap">
     <table class="table table-hover" id="tableHover">
      <tbody>
       <tr>
        <th class='row'>
         <h3 class="pull-left" id="rankNum1" style="margin-left: 20px;">1위</h3>
<!--          <div class="float-right" id="viewDiv">
          <img src="/imgs/recipe_img/view_icon.png" class="views-icon"
          id="viewIcon">
          <div id="rankingViews1"></div>
        </div> -->
      </th>
    </tr>
  </tbody>
</table>
</div>

<!-- a태그로 해당 레시피 이동 -->
<a href="#" id="rankinListIMG1">
 <div class="card rounded shadow-sm" id="rankingList">
  <!-- 레시피 이미지 -->
  <div id="imgWrap">
   <img class="card-img rounded"
   src="/imgs/ranking_img/monthRecipeC905x350.png" alt="Card image"
   id="cardImgs1">
 </div>
 <div class="container">
   <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
     <!-- 랭킹 등록 관련 레시피 내용 -->
     <h3 class="card-title" id="rankingMonthTitle1"></h3>
     <p class="card-text" id="rankingTag1"></p>
     <p class="card-text" id="rankingContents1">.</p>
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
<!--      <div class="float-right" id="viewDiv">
      <img src="/imgs/recipe_img/view_icon.png" class="views-icon"
      id="viewIcon">
      <div id="rankingViews2"></div>
    </div> -->
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
   src="/imgs/ranking_img/monthRecipeC905x350.png" alt="Card image"
   id="cardImgs2">
 </div>
 <div class="container">
   <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
     <!-- 랭킹 등록 관련 레시피 내용 -->
     <h3 class="card-title" id="rankingMonthTitle2"></h3>
     <p class="card-text" id="rankingTag2"></p>
     <p class="card-text" id="rankingContents2"></p>

  </div>
</div>
</div>
</div>
</a> <br>
<br>
<br>

<!-- 3위 -->

<div id="tableWrap">
 <table class="table table-hover" id="tableHover">
  <tbody>
   <tr>
    <th class='row'>
     <h3 class="pull-left" id="rankNum3" style="margin-left: 20px;">3위</h3>
<!--      <div class="float-right" id="viewDiv">
      <img src="/imgs/recipe_img/view_icon.png" class="views-icon"
      id="viewIcon">
      <div id="rankingViews3"></div>
    </div> -->
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
   src="/imgs/ranking_img/monthRecipeC905x350.png" alt="Card image"
   id="cardImgs3">
 </div>
 <div class="container">
   <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
     <!-- 랭킹 등록 관련 레시피 내용 -->
     <h3 class="card-title" id="rankingMonthTitle3"></h3>
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
<!--      <div class="float-right" id="viewDiv">
      <img src="/imgs/recipe_img/view_icon.png" class="views-icon"
      id="viewIcon">
      <div id="rankingViews4"></div>
    </div> -->
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
   src="/imgs/ranking_img/monthRecipeC905x350.png" alt="Card image"
   id="cardImgs4">
 </div>
 <div class="container">
   <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
     <!-- 랭킹 등록 관련 레시피 내용 -->
     <h3 class="card-title" id="rankingMonthTitle4"></h3>
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
<!--      <div class="float-right" id="viewDiv">
      <img src="/imgs/recipe_img/view_icon.png" class="views-icon"
      id="viewIcon">
      <div id="rankingViews5"></div>
    </div> -->
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
   src="/imgs/ranking_img/monthRecipeC905x350.png" alt="Card image"
   id="cardImgs5">
 </div>
 <div class="container">
   <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
     <!-- 랭킹 등록 관련 레시피 내용 -->
     <h3 class="card-title" id="rankingMonthTitle5"></h3>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


  <!-- 부트스트랩  collapse-->
  <!-- Bootstrap  -->
  <link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
  crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
  integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
  crossorigin="anonymous"></script>
  <script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
  integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
  crossorigin="anonymous"></script>
  <script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
  integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
  crossorigin="anonymous"></script>


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
console.log("선택하지 않은 상태의 년도 : "
  + $("select[name=yearClickName]").val().substr(2, 4));
console.log("선택하지 않은 상태의 년도 : "
  + $("select[name=monthClickName]").val());


/* 선택되어지지 않는 상태 */
var yearClick = $("select[name=yearClickName]").val().substr(2, 4);
var monthClick = $("select[name=monthClickName]").val();



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
  for (var i = 0; i < data.length; i++) {
   $('#rankingMemberID'+(i+1)).html(data[i].nickname);
   $('#rankNum' + (i + 1)).html((i + 1) + "위");
   $('#cardImgs' + (i + 1)).attr('src',data[i].profile);
   $('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
   $('#rankingViews' + (i + 1)).html(data[i].recipeViews);
   $('#rankingTag' + (i + 1)).html(data[i].recipeTag);
   $('#rankingContents' + (i + 1)).html(data[i].recipeIntro);

   /* $('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");*/

 }


 /*1위 랭킹 리스트*/
 $('#cardImgs1').click(function(){
  var rankingUserId = data[0].memberId;
  $.ajax({
    url : "/rankingMonthlyChefRecipeList",
    data : {userId : rankingUserId},
    type : "get",
    success : function(data){
      console.log("리스트 아작스 성공!"+data.length);
      $('#RecipeListTbody1').html("");
      for (var i = 0; i < data.length; i++) {
        $('#RecipeListTbody1').append("<tr id='recipeLink1st"+(i+1)+"'>"+"<th scope='row'>"+ data[i].nickname +"</th>"+
          "<td>"+data[i].recipeNo+"</td>"+"<td>"+data[i].recipeTitle+"</td>"+"<td>"+data[i].recipeViews+"</td>"+"</a>"+"</tr>"
          );
        $('#recipeLink1st'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");

      }
    },
    error : function(){
      console.log("리스트 아작스 실패!");
    }
  });
})

 /*2위 랭킹 리스트*/
 $('#cardImgs2').click(function(){
  var rankingUserId = data[1].memberId;
  $.ajax({
    url : "/rankingMonthlyChefRecipeList",
    data : {userId : rankingUserId},
    type : "get",
    success : function(data){
      console.log("이주 아작스 성공222!"+data.length);
      $('#RecipeListTbody2').html("");
      for (var i = 0; i < data.length; i++) {
        $('#RecipeListTbody2').append("<tr id='recipeLink2nd"+(i+1)+"'>"+"<th scope='row'>"+ data[i].nickname +"</th>"+
          "<td>"+data[i].recipeNo+"</td>"+"<td>"+data[i].recipeTitle+"</td>"+"<td>"+data[i].recipeViews+"</td>"+"</a>"+"</tr>"
          );
        $('#recipeLink2nd'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");
      }
    },
    error : function(){
      console.log("이주 아작스 실패!");
    }
  });
})

 /*3위 랭킹 리스트*/
 $('#cardImgs3').click(function(){
  var rankingUserId = data[2].memberId;
  $.ajax({
    url : "/rankingMonthlyChefRecipeList",
    data : {userId : rankingUserId},
    type : "get",
    success : function(data){
      console.log("이주 아작스 성공222!"+data.length);
      $('#RecipeListTbody3').html("");
      for (var i = 0; i < data.length; i++) {
        $('#RecipeListTbody3').append("<tr id='recipeLink3rd"+(i+1)+"'>"+"<th scope='row'>"+ data[i].nickname +"</th>"+
          "<td>"+data[i].recipeNo+"</td>"+"<td>"+data[i].recipeTitle+"</td>"+"<td>"+data[i].recipeViews+"</td>"+"</a>"+"</tr>"
          );
        $('#recipeLink3rd'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");
      }
    },
    error : function(){
      console.log("이주 아작스 실패!");
    }
  });
})

 /*4위 랭킹 리스트*/
 $('#cardImgs4').click(function(){
  var rankingUserId = data[3].memberId;
  $.ajax({
    url : "/rankingMonthlyChefRecipeList",
    data : {userId : rankingUserId},
    type : "get",
    success : function(data){
      console.log("이주 아작스 성공222!"+data.length);
      $('#RecipeListTbody4').html("");
      for (var i = 0; i < data.length; i++) {
        $('#RecipeListTbody4').append("<tr id='recipeLink4th"+(i+1)+"'>"+"<th scope='row'>"+ data[i].nickname +"</th>"+
          "<td>"+data[i].recipeNo+"</td>"+"<td>"+data[i].recipeTitle+"</td>"+"<td>"+data[i].recipeViews+"</td>"+"</a>"+"</tr>"
          );
        $('#recipeLink4th'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");
      }
    },
    error : function(){
      console.log("이주 아작스 실패!");
    }
  });
})

 /*5위 랭킹 리스트*/
 $('#cardImgs5').click(function(){
  var rankingUserId = data[4].memberId;
  $.ajax({
    url : "/rankingMonthlyChefRecipeList",
    data : {userId : rankingUserId},
    type : "get",
    success : function(data){
      console.log("이주 아작스 성공222!"+data.length);
      $('#RecipeListTbody5').html("");
      for (var i = 0; i < data.length; i++) {
        $('#RecipeListTbody5').append("<tr id='recipeLink5th"+(i+1)+"'>"+"<th scope='row'>"+ data[i].nickname +"</th>"+
          "<td>"+data[i].recipeNo+"</td>"+"<td>"+data[i].recipeTitle+"</td>"+"<td>"+data[i].recipeViews+"</td>"+"</a>"+"</tr>"
          );
        $('#recipeLink5th'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");
      }
    },
    error : function(){
      console.log("이주 아작스 실패!");
    }
  });
})

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

      $('#rankingMemberID'+(i+1)).html(data[i].nickname);
      $('#rankNum' + (i + 1)).html((i + 1) + "위");
      $('#cardImgs' + (i + 1)).attr('src',data[i].profile);
      $('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
      $('#rankingViews' + (i + 1)).html(data[i].recipeViews);
      $('#rankingTag' + (i + 1)).html(data[i].recipeTag);
      $('#rankingContents' + (i + 1)).html(data[i].recipeIntro);
      /*$('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");*/
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

      $('#rankingMemberID'+(i+1)).html(data[i].nickname);
      $('#rankNum' + (i + 1)).html((i + 1) + "위");
      $('#cardImgs' + (i + 1)).attr('src',data[i].profile);
      $('#rankingMonthTitle' + (i + 1)).html(data[i].recipeTitle);
      $('#rankingViews' + (i + 1)).html(data[i].recipeViews);
      $('#rankingTag' + (i + 1)).html(data[i].recipeTag);
      $('#rankingContents' + (i + 1)).html(data[i].recipeIntro);
      /*$('#rankinListIMG'+(i+1)).attr('onclick',"window.top.location.href ='/recipe?recipeNo="+data[i].recipeNo+"'");*/
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
<!-- <style>
  *{
    border : 1px solid black;
  }
</style> -->

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

<div id="wholeWrap" class="container">
  <div class="col-lg-12" style="padding-right: 50px;">
    <h2 class="my-4" style=" font-family:hanna; font-weight: 800;">이달의 쉐프</h2>
    <hr style="border: 0.5px solid #EAEAEA;">
  </div>
  <!-- Team Members Row -->
  <div class="row">
    <br><br><br>


    <c:forEach var="i" begin="1" end="2"  step="1" varStatus="status">
    <div class="col-lg-6 col-sm-6 text-center mb-4"  data-toggle="collapse" href="#userRanking${status.count}" role="button" aria-expanded="false" aria-controls="userRanking${status.count}">
      <div class="pull-left"><h3 id="rankNum${status.count}">${status.count}위</h3></div>
      <a href="javascript:void(0)" id="rankinListIMG${status.count}">
        <img id="cardImgs${status.count}" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 300px; height: 300px;" >
      </a>
      <h3 id="rankingMemberID${status.count}">Strange Recipes</h3>
<!--       <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
      <p style="padding-left: 10px;padding-right: 15px;" id="rankingViews${status.count}"></p> -->

    </div>
  </c:forEach>
<br><br><br>
    <c:forEach var="i" begin="3" end="5"  step="1" varStatus="status">
    <div class="col-lg-4 col-sm-6 text-center mb-4"  data-toggle="collapse" href="#userRanking${status.count+2}" role="button" aria-expanded="false" aria-controls="userRanking${status.count+2}">
      <div class="pull-left"><h3 id="rankNum${status.count+2}">${status.count+2}위</h3></div>
      <a href="javascript:void(0)" id="rankinListIMG${status.count+2}">
        <img id="cardImgs${status.count+2}" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 200px; height: 200px;" >
      </a>
      <h3 id="rankingMemberID${status.count+2}">Strange Recipes</h3>
<!--       <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
      <p style="padding-left: 10px;padding-right: 15px;" id="rankingViews${status.count+2}"></p> -->

    </div>
  </c:forEach>

<!-- 
  <div class="col-lg-6 col-sm-6 text-center mb-4"  data-toggle="collapse" href="#userRanking1" role="button" aria-expanded="false" aria-controls="userRanking1">
    <div class="pull-left"><h3 id="rankNum1">1위</h3></div>
    <a href="javascript:void(0)" id="rankinListIMG1">
      <img id="cardImgs1" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 300px; height: 300px;" >
    </a>
    <h3 id="rankingMemberID1">Strange Recipes</h3>
    <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
    <p style="padding-left: 10px;padding-right: 15px;" id="rankingViews1"></p>

  </div>


  <div class="col-lg-6 col-sm-6 text-center mb-4"  data-toggle="collapse" href="#userRanking2" role="button" aria-expanded="false" aria-controls="userRanking2">
    <div class="pull-left"><h3 id="rankNum2">2위</h3></div>
    <a href="javascript:void(0)" id="rankinListIMG2">
      <img id="cardImgs2"  class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 300px; height: 300px;">
    </a>
    <h3 id="rankingMemberID2">Strange Recipes</h3>
    <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
    <p style="padding-left: 15px;padding-right: 10px;" id="rankingViews2"> </p>
  </div>


  <div class="col-lg-4 col-sm-6 text-center mb-4"  data-toggle="collapse" href="#userRanking3" role="button" aria-expanded="false" aria-controls="userRanking3">
    <div class="pull-left"><h3 id="rankNum3">3위</h3></div>
    <a href="javascript:void(0)" id="rankinListIMG3">
      <img id="cardImgs3" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 200px; height: 200px;">
    </a>
    <h3 id="rankingMemberID3">Strange Recipes</h3>
    <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
    <p style="padding-left: 15px;padding-right: 10px;" id="rankingViews3"></p>
  </div>


  <div class="col-lg-4 col-sm-6 text-center mb-4"  data-toggle="collapse" href="#userRanking4" role="button" aria-expanded="false" aria-controls="userRanking4">
    <div class="pull-left"><h3 id="rankNum4">4위</h3></div>
    <a href="javascript:void(0)" id="rankinListIMG4">
      <img id="cardImgs4" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 200px; height: 200px;">
    </a>
    <h3 id="rankingMemberID4">Strange Recipes</h3>
    <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
    <p style="padding-left: 15px;padding-right: 10px;" id="rankingViews4"></p>
  </div>


  <div class="col-lg-4 col-sm-6 text-center mb-4"  data-toggle="collapse" href="#userRanking5" role="button" aria-expanded="false" aria-controls="userRanking5">
    <div class="pull-left"><h3 id="rankNum5">5위</h3></div>
    <a href="javascript:void(0)" id="rankinListIMG5">
      <img id="cardImgs5" class="rounded-circle img-fluid d-block mx-auto" src="/imgs/ranking_img/005-chef.png" alt="" style="width: 200px; height: 200px;">
    </a>
    <h3 id="rankingMemberID5">Strange Recipes</h3>
    <img src="/imgs/recipe_img/view_icon.png" class="views-icon" id="viewIcon">
    <p style="padding-left: 15px;padding-right: 10px;" id="rankingViews5"></p>
  </div>
 -->
  <br><br><br>


  <!--유저별 레시피 리스트 -->
  <div >
    <div class="row">
      <c:forEach var="i" begin="1" end="5"  step="1" varStatus="status">
      <div class="collapse" id="userRanking${status.count}" style="width: 780px; margin-left: 100px;">

        <div >
          <table class="table" style="width: 750px; text-align: center;">
            <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col">레시피 번호</th>
                <th scope="col">제목</th>
                <th scope="col">View</th>
              </tr>
            </thead>
            <tbody id="RecipeListTbody${status.count}" style="cursor: pointer;">

            </tbody >
          </table>
        </div>
      </div>
    </c:forEach>

  </div>
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>


</body>
</html>
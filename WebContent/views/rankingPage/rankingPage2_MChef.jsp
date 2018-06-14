<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>세미_랭킹 페이지 - 중간</title>


<!-- 스타일시트 초기화 -->
<link rel="stylesheet" href="/css/reset.css">

<!-- 랭킹페이지에 필요한 스타일시트 : 지현 작성 -->
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss2.css">
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss_common.css">

<!-- 부트스트랩 css -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">


<!-- jquery -->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>




</head>
<body>

<!-- 월별 selected option -->
<br>
<div class="container">
  <jsp:include page="rankingPage2_1(date)2.jsp" />
</div>
<br>

<!-- 가운데로 보내는 컨테이너 -->
<div class="container" id="tableContainer">
<h3>이달의 회원</h3>
  <!-- 1위 -->
  <div id="tableWrap">
 <table class="table table-hover">
    <tbody>
    <tr>
      <th scope="row" style="margin-bottom: 0px;"><h3 class="pull-left">1위</h3></th>
    </tr>
  </tbody>
  </table>
</div>

  <!-- a태그로 해당 레시피 이동 -->
<a href="#">
<div class="card rounded shadow-sm"  id="rankingList">
  <!-- 레시피 이미지 -->
  <div id="imgWrap">
  <img class="card-img rounded" src="/imgs/ranking_img/chef1200_400.png" alt="Card image" id="cardImgs">
</div>
  <div class="container">
  <div class="card-img-overlay" id="cardOverlay">
  	<div id="cardContents">
      <!-- 랭킹 등록 관련 레시피 내용 -->
    <h3 class="card-title">레시피의 제목이 들어가는 곳!</h3>
    <p class="float-right" id="rankingNickName">닉네임 들어가는곳~~~</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">Last updated 3 mins ago</p>
     <p class="card-text">Last updated 3 mins ago</p>
  </div>
  </div>
</div>

</div>
</a>
<br><br><br>


   <!-- 2위 -->
   <div id="tableWrap">
   <table class="table table-hover">
    <tbody>
    <tr>
      <th scope="row" style="margin-bottom: 0px;"><h3 class="pull-left">2위</h3></th>
    </tr>
  </tbody>
  </table>
  </div>


  <!-- a태그로 해당 레시피 이동 -->
<a href="#">
<div class="card rounded shadow-sm"  id="rankingList">
  <!-- 레시피 이미지 -->
    <div id="imgWrap">
  <img class="card-img rounded" src="/imgs/ranking_img/chef1200_400.png" alt="Card image" id="cardImgs">
</div>
  <div class="container">
  <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
      <!-- 랭킹 등록 관련 레시피 내용 -->
    <h3 class="card-title">레시피의 제목이 들어가는 곳!</h3>
    <p class="float-right" id="rankingNickName">닉네임 들어가눈곳~~~</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">Last updated 3 mins ago</p>
     <p class="card-text">Last updated 3 mins ago</p>
  </div>
  </div>
</div>

</div>
</a>
<br><br><br>

  <!-- 3위 -->
  <div id="tableWrap">
  <table class="table table-hover">
    <tbody>
    <tr>
      <th scope="row" style="margin-bottom: 0px;"><h3 class="pull-left">3위</h3></th>
    </tr>
  </tbody>
  </table>
  </div>
  <!-- a태그로 해당 레시피 이동 -->
<a href="#">
<div class="card rounded shadow-sm"  id="rankingList">
  <!-- 레시피 이미지 -->
    <div id="imgWrap">
  <img class="card-img rounded" src="/imgs/ranking_img/chef1200_400.png" alt="Card image" id="cardImgs">
</div>
  <div class="container">
  <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
      <!-- 랭킹 등록 관련 레시피 내용 -->
    <h3 class="card-title">레시피의 제목이 들어가는 곳!</h3>
    <p class="float-right" id="rankingNickName">닉네임 들어가눈곳~~~</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">Last updated 3 mins ago</p>
     <p class="card-text">Last updated 3 mins ago</p>
  </div>
  </div>
</div>

</div>
</a>
<br><br><br>


 <!-- 4위 -->
 <div id="tableWrap">
 <table class="table table-hover">
    <tbody>
    <tr>
      <th scope="row" style="margin-bottom: 0px;"><h3 class="pull-left">4위</h3></th>
    </tr>
  </tbody>
  </table>
</div>

  <!-- a태그로 해당 레시피 이동 -->
<a href="#">
<div class="card rounded shadow-sm"  id="rankingList">
  <!-- 레시피 이미지 -->
    <div id="imgWrap">
  <img class="card-img rounded" src="/imgs/ranking_img/chef1200_400.png" alt="Card image" id="cardImgs">
</div>
  <div class="container">
  <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
      <!-- 랭킹 등록 관련 레시피 내용 -->
    <h3 class="card-title">레시피의 제목이 들어가는 곳!</h3>
    <p class="float-right" id="rankingNickName">닉네임 들어가눈곳~~~</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">Last updated 3 mins ago</p>
     <p class="card-text">Last updated 3 mins ago</p>
  </div>
  </div>
</div>

</div>
</a>
<br><br><br>


 <!-- 5위 -->
 <div id="tableWrap">
 <table class="table table-hover">
    <tbody>
    <tr>
      <th scope="row" style="margin-bottom: 0px;"><h3 class="pull-left">5위</h3></th>
    </tr>
  </tbody>
  </table>
</div>

  <!-- a태그로 해당 레시피 이동 -->
<a href="#">
<div class="card rounded shadow-sm"  id="rankingList">
  <!-- 레시피 이미지 -->
    <div id="imgWrap">
  <img class="card-img rounded" src="/imgs/ranking_img/chef1200_400.png" alt="Card image" id="cardImgs">
</div>
  <div class="container">
  <div class="card-img-overlay" id="cardOverlay">
    <div id="cardContents">
      <!-- 랭킹 등록 관련 레시피 내용 -->
    <h3 class="card-title">레시피의 제목이 들어가는 곳!</h3>
    <p class="float-right" id="rankingNickName">닉네임 들어가눈곳~~~</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <p class="card-text">Last updated 3 mins ago</p>
     <p class="card-text">Last updated 3 mins ago</p>
  </div>
  </div>
</div>

</div>
</a>
<br><br><br>

<!-- 가운데로 보내는 컨테이너 끝! -->
</div>



</body>
</html>
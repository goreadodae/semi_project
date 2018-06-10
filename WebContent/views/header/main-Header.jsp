<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>main-Header</title>

<!-- 모바일  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- 리셋 -->
<link rel="stylesheet" href="/css/reset.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/css/bootstrap.css">

<!-- 해더 스타일 -->
<link rel="stylesheet" href="/css/mainPage_css/header.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<script>
	var inCategory = false;

	/* 내비게이션 고정 */
	$(document).ready(function() {

		/* 카테고리 */
		$('#category_list').hide();

		var jbOffset = $('#content-main').offset();

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

	/* 팝업 div 삭제 */
	function delete_info(obj) {
		// 삭제할 ID 정보 찾기
		var target = obj.parentNode.getAttribute('div');
		console.log(target);
		// 삭제할 element 찾기
		var field = document.getElementById(target);
		// #field 에서 삭제할 element 제거하기
		document.getElementById('top-message').remove();

	}

	$("#div-category").mouseover(function() {
		$('#category_list').show();
	});
</script>

</head>
<body>
	<!-- Header -->
	<div class="header">

		<div id="top-message" class="col-md-12"
			style="background-color: #512772; height: 40px; padding: 0px;">

			<div id="top-message-text" class="col-md-6">
				<a href="#">
					<div>
						<p
							style="color: white; text-align: center; line-height: 40px; font-size: 16px;">
							지금 가입하시면 이벤트 혜택이 2배 ></p>
					</div>
				</a>
			</div>

			<div id="top-message-close"
				class="col-md-8 mx-auto nav justify-content-end">
				<button type="button" class="close" aria-label="Close"
					onclick="delete_info(this)"
					style="color: white; padding-bottom: 8px;">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>

		</div>

		<div class="col-md-8 mx-auto">
			<ul class="nav justify-content-end">

				<li class="nav-item text-center"><a class="nav-link" href="#"
					style="color: black; font-size: 12px;">회원가입</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					style="color: black; font-size: 12px;">로그인</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					style="color: black; font-size: 12px;">레시피 등록</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false"
					style="color: black; font-size: 12px;">고객센터</a>

					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">공지사항</a> <a
							class="dropdown-item" href="#">자주하는 질문</a> <a
							class="dropdown-item" href="#">1:1 문의</a>
					</div></li>
			</ul>
		</div>

		<!-- 해더 브랜드 이미지-->
		<div class="col-8 mx-auto">
			<div class="jumbotron text-center" style="background-color: white;">
				<div></div>
				<div>
					<h1 class="display-3" id="brandLogo">수상한레시피</h1>
				</div>
			</div>
		</div>

		<!-- 네비게이션 -->
		<div class="nav-scroller border-right-0 border-left-0"
			id="fixed_layer" style="border: 1px solid #dadada;">
			<div class="col-md-8 mx-auto" id="navi">
				<div class="row">

					<div class="col-md-2" id="div-category"
						style="background-color: #512772">
						<a class="nav-category" id="a-category" href="#"
							style="line-height: 50px; color: white;"> <img
							src="/imgs/main-img/ico_gnb_all.jpg" height="14px">&nbsp;&nbsp;&nbsp;카테고리
						</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category" href="/recipeList"
							style="line-height: 50px;">레시피</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category"
							href="/views/ranking_page/ranking_main.jsp"
							style="line-height: 50px;">랭킹</a>

					</div>

					<div class="col-md-2">
						<a class="nav-category" href="#" style="line-height: 50px;">이벤트</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category" href="#" style="line-height: 50px;">검색</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category" href="#" style="line-height: 50px;">마이홈</a>
					</div>
				</div>
			</div>
		</div>

		<div class="position-absolute col-12" id="t_category_list"
			style="padding: 0px;">
			<div class="col-md-8 mx-auto" id="category_list">
				<ul class="colum_1">
					<li calss="header"><a href="#">타이틀 1</a></li>
					<br>
					<li>오늘의 레시피</li>
					<li>이달의 레시피</li>
					<li>쌀/잡곡</li>
					<li>견과류</li>
					<br>
					<br>
					<li class="header">
						<p>치즈/델리/베이커리 1</p>
					</li>
					<hr>
					<li>빵/잼</li>
					<li>디저트/케이크</li>
					<li>치즈/버터</li>
					<li>델리만쥬</li>
					<li>델리만쥬</li>
					<li>델리만쥬</li>
					<li>델리만쥬</li>
				</ul>
				<ul class="colum_2">
					<li calss="header">
						<p>타이틀 2</p>
					</li>
					<br>
					<li>오늘의 레시피</li>
					<li>이달의 레시피</li>
					<li>쌀/잡곡</li>
					<li>견과류</li>
					<br>
					<br>
					<li class="header">
						<p>치즈/델리/베이커리 2</p>
					</li>
					<hr>
					<li>빵/잼</li>
					<li>디저트/케이크</li>
					<li>치즈/버터</li>
					<li>델리만쥬</li>
				</ul>
				<ul class="colum_2">
					<li calss="header">
						<p>타이틀 3</p>
					</li>
					<br>
					<li>오늘의 레시피</li>
					<li>이달의 레시피</li>
					<li>쌀/잡곡</li>
					<li>견과류</li>
					<br>
					<br>
					<li class="header">
						<p>치즈/델리/베이커리 2</p>
					</li>
					<hr>
					<li>빵/잼</li>
					<li>디저트/케이크</li>
					<li>치즈/버터</li>
					<li>델리만쥬</li>
				</ul>
				<ul class="colum_2">
					<li calss="header">
						<p>타이틀 4</p>
					</li>
					<br>
					<li>오늘의 레시피</li>
					<li>이달의 레시피</li>
					<li>쌀/잡곡</li>
					<li>견과류</li>
					<br>
					<br>
					<li class="header">
						<p>치즈/델리/베이커리 2</p>
					</li>
					<hr>
					<li>빵/잼</li>
					<li>디저트/케이크</li>
					<li>치즈/버터</li>
					<li>델리만쥬</li>
				</ul>
				<ul class="colum_2">
					<li calss="header">
						<p>타이틀 5</p>
					</li>
					<br>
					<li>오늘의 레시피</li>
					<li>이달의 레시피</li>
					<li>쌀/잡곡</li>
					<li>견과류</li>
					<br>
					<br>
					<li class="header">
						<p>치즈/델리/베이커리 2</p>
					</li>
					<hr>
					<li>빵/잼</li>
					<li>디저트/케이크</li>
					<li>치즈/버터</li>
					<li>델리만쥬</li>
				</ul>
			</div>
		</div>
	</div>
</body>

</html>
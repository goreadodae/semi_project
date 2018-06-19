<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>main-Header</title>

<script>
	var inCategory = false;

	$(document).ready(function() {
		
		/* 네비게이션 고정 */
		var jbOffset = $('#fixed_layer').offset();
		var jbOffset2 = $('#category_list').offset();
		
		
		$(window).scroll(function() {
			
			if ($(document).scrollTop() >= jbOffset.top) {
				/* 상단 고정하고 */
				$('#fixed_layer').addClass('jbFixed');
				$('#category_list').addClass('clFixed');			

			} else {
				$('#fixed_layer').removeClass('jbFixed');
				$('#category_list').removeClass('clFixed');	
			}
		});

		/* 웹 실행 시 카테고리 숨김 */
		$('#category_list').css('display', 'none'); 

		$('#div-category').hover(function(e) {
			if ($(e.target).is("#div-category")
				|| $(e.target).is("#a-category")) {
				$('#category_list').css('display', 'block');
				inCategory = true; // 카테고리 오픈
			}

			// 카테고리 오픈되어 있을 때
			if (inCategory) {
				/* 카테고리 호버일 때 */
				$('#category_list').hover(function(e) {
					if ($(e.target).is('.category-text')
						|| $(e.target).is('.header')
						|| $(e.target).is('#category_list')) {
						$('#category_list').css('display', 'block');
					}
				});
				/* 마우스가 떠날 때 */
				$('#category_list').mouseleave(function(e) {
					if (!$(e.target).is('.category-text')
						|| !$(e.target).is('.header')
						|| !$(e.target).is('#category_list')) {
						$('#category_list').css('display', 'none');
					}
				});
				/* 마우스가 떠날 때 */
				$('#div-category').mouseleave(function(e) {
					if (!$(e.target).is('.category-text')
						|| !$(e.target).is('.header')
						|| !$(e.target).is('#category_list')) {
						$('#category_list').css('display', 'none');
					}
				});
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
</script>
</head>

<body>
	<!-- 해더 시작 -->
	<div class="header">

		<!-- 팝업창 -->
		<div id="top-message" class="col-md-12">
		
			<div id="top-message-text" class="col-md-6 col-sm-6 col-4">
				<!-- 로그인 주소 -->
				<a href="/views/userPage/Membership.html">
					<div>
						<p id="top-message-notice">
							지금 가입하시면 이벤트 혜택이 2배 >
						</p>
					</div>
				</a>
			</div>
			<div id="top-message-close" class="col-md-8 col-sm-8 col-8 mx-auto nav justify-content-end">
				<button type="button" class="close" id="top-message-close-btn" aria-label="close" 
						onclick="delete_info(this)">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
		</div>
		<!-- 팝업창 끝-->

		<!-- 최상단 -->
		<div class="col-md-8 mx-auto" id="userMenu" style="padding:0px;">
			<ul class="nav justify-content-end">
				<li class="nav-item text-center">
					<a class="nav-link" href="/views/userPage/Membership.html">
						회원가입
					</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="/views/userPage/Login.html">
						로그인
					</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="/views/insertRecipePage/insertRecipePage.jsp">
						레시피 등록
					</a>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">
						고객센터
					</a>

					<div class="dropdown-menu">
						<a class="dropdown-item" href="/views/customerCenterPage/noticePage.jsp">공지사항</a> 
						<a class="dropdown-item" href="/views/customerCenterPage/faqPage.jsp">자주하는 질문</a> 
						<a class="dropdown-item" href="/views/customerCenterPage/writeQNAPage.jsp">1:1 문의</a>
					</div>
				</li>
			</ul>
		</div>
		<!-- 최상단 끝 -->
		
		<!-- 해더 브랜드 이미지-->
		<div class="col-8 mx-auto">
			<div class="text-center" style="background-color: white;">
				<div class="row">
					<!-- 애니메이션  -->
					<div class="col-md-2" style="padding: 0px;">
						<img id="header-ani" src="https://res.kurly.com/pc/img/1805/delivery_180524_2.gif">
					</div>
					
					<!-- 브랜드 로고  -->
					<div class="col-md-8">
						<a id="brand-logo-link" href="http://localhost/index.jsp">
							<h1 id="brandLogo">수상한레시피</h1>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 해더 브랜드 이미지 끝-->

		<!-- 네비게이션 -->
		<div class="nav-scroller border-right-0 border-left-0" id="fixed_layer">
			<div class="col-md-8 mx-auto" id="navi">
				<div class="row">
					<div class="col-md-2 col-sm-2 col-4" id="div-category">
						<a class="nav-category" id="a-category" href="#">
							<img src="/imgs/main-img/ico_gnb_all.jpg">
							<span id="category-text">카테고리</span>
						</a>
					</div>

					<div class="col-md-2 col-sm-2 col-4" id="div-receipe">
						<a class="nav-category" href="/recipeList?cate1=0&cate2=0&cate3=0&cate4=0">레시피</a>
					</div>

					<div class="col-md-2 col-sm-2 col-4">
						<a class="nav-category" href="/views/rankingPage/rankingPage.jsp">랭킹</a>
					</div>

					<div class="col-md-2 col-sm-2 col-4">
						<a class="nav-category" href="#">이벤트</a>
					</div>

					<div class="col-md-2 col-sm-2 col-4">
						<a class="nav-category" href="/views/productPage/ProductMain.jsp">상품</a>
					</div>

					<div class="col-md-2 col-sm-2 col-4">
						<a class="nav-category" href="#">마이홈</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 네비게이션 끝 -->


		<!-- 전체 카테고리 -->
		<div class="position-absolute col-md-12" id="t_category_list" style="padding: 0px;">
			<div class="col-md-8 mx-auto" id="category_list">
			
				<!-- 1번 칼럼  -->
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
					<li class="header2">
						<a href="#" id="title-1" class="category-text">채소/과일/곡류</a><hr>
					</li>
					<li class="category-text">오늘의 레시피</li>
					<li class="category-text">이달의 레시피</li>
					<li class="category-text">쌀/잡곡</li>
				</ul>

				<!-- 2번 칼럼  -->
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
					<li class="header2">
						<a href="#" id="title-1" class="category-text">채소/과일/곡류</a><hr>
					</li>
					<li class="category-text">오늘의 레시피</li>
					<li class="category-text">이달의 레시피</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
				</ul>

				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
					<li class="header2">
						<a href="#" id="title-1" class="category-text">채소/과일/곡류</a><hr>
					</li>
					<li class="category-text">오늘의 레시피</li>
					<li class="category-text">이달의 레시피</li>
					<li class="category-text">쌀/잡곡</li>
				</ul>
				
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
					<li class="header2">
						<a href="#" id="title-1" class="category-text">채소/과일/곡류</a><hr>
					</li>
					<li class="category-text">오늘의 레시피</li>
					<li class="category-text">이달의 레시피</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
				</ul>
				
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
				</ul>
				
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
				</ul>
			</div>
		</div>
		<!-- 전체 카테고리 끝 -->
	</div>
	<!-- 해더 끝  -->
</body>

</html>
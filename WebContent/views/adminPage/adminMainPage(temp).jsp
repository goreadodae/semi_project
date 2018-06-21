<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>adminPage</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>


<style>
* {
	padding: 0;
}
</style>
<script>
	var scrollUpDelay = 1;
	var scrollUpSpeed = 30;

	/* 영역 설정 */
	$(document).ready(function() {

		var $info = $("#info");

		window.onresize = function() {
			$info.html(window.innerWidth);
		}
	});

	/* 위로 올라가기 */
	function scrollUp() {
		if (document.body.scrollTop < 1) {
			return;
		}
		document.body.scrollTop = document.body.scrollTop - scrollUpSpeed;
		setTimeout('scrollUp()', scrollUpDelay);
	}
</script>
<!-- 페이지 네비게이션 고정 -->
<script>
	$(document).ready(function() {
		var jbOffset = $('#point').offset();

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
<style>
* {
	padding: 0px;
	margin: 0px;
}

.radius {
	border-radius: 2em;
	border-top-left-radius: 2em;
	border-top-right-radius: 2em;
	border-bottom-left-radius: 2em;
	border-bottom-right-radius: 2em;
	border: 2px solid black;
	height: 70px;
	padding: 1;
	background: linear-gradient(-90deg, white 50%, #30A9DE 50%);
}

.radiusImg {
	height: 70px;
	padding: 1;
}

#bascketCnt {
	background: linear-gradient(90deg, white 50%, #30A9DE 50%);
}

#postedCnt {
	background: linear-gradient(-90deg, white 50%, #F68657 50%);
}

#joinCnt {
	background: linear-gradient(-90deg, white 50%, #60c5ba 50%);
}

#viewsCnt {
	background: linear-gradient(-90deg, white 50%, #ef5285 50%);
}
.list-group li {
height: 20% !important;
}
</style>
</head>
<body>
	<div class="container-fluid" style="height: 1000px">
		<div class="col-md-12"
			style="padding: 0px; margin: 0px; height: 100%;">

			<div class="row">
				<div class="col-md-2" style="padding: 0px; height:1000px">
				<div class="col-md-12" style="height:50px" style="vertical-align:middle;" >
				<h3>수상한 레시피</h3>
				
				</div>

					<ul class="list-group">
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							회원관리<span class="badge badge-primary badge-pill">14</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							게시판관리<span
							class="badge badge-primary badge-pill">2</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							공지사항관리<span class="badge badge-primary badge-pill">1</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							<span class="badge badge-primary badge-pill">1</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							문의관리 <span class="badge badge-primary badge-pill">1</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							Morbi leo risus <span class="badge badge-primary badge-pill">1</span>
						</li>

					</ul>

				</div>

				<div class="col-md-10"
					style="border: 1px solid black; height: 1000px;">
					<div class="row">
						<div class="col-md-12"
							style="background-color: red; height: 50px;"></div>



					</div>
					<div class="row" style="height:100%">
						<div class="col-md-12" style="background-color:#F8FAFF; padding-top:15px">
							<div class="col-md-12" style="border:1px solid black; height:250px; padding:3px;">
				
								ss
								
							
							
							
							
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
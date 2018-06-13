<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>adminPage</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>


<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
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
	padding: 0;
	background: linear-gradient(-90deg, white 50%, #30A9DE 50%);
}

.radiusImg {
	height: 70px;
	padding: 1;
	border-radius: 2em;
	border-top-left-radius: 2em;
	border-top-right-radius: 2em;
	border-bottom-left-radius: 2em;
	border-bottom-right-radius: 2em;
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
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 0px">
		<div id="header"></div>

		<div style="background-color: #f8faff; padding: 0px">

			<div id="contents"
				class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
				style="border: 1px solid black; left-padding: 14px;">
				<div class="row">
					<div class="col-md-12" style="text-align: center">
						<br>
						<h3>관리자님 어서오세요!</h3>
						<br> <br>

					</div>

				</div>
				<div class="row">

					<div class="offset-md-2 col-md-10">
						<div class="row">

							<div class="radius offset-md-1 col-md-2" id="basketCnt">

								
									<div class="radiusImg col-md-6">

										<img src="/imgs/manager-img/e-commerce.png" />
												
									</div>
						

								



							</div>
							<div class="radius offset-md-1 col-md-2" id="postedCnt">
								<div class="radiusImg col-md-5">
									<img src="/imgs/manager-img/conversation.png" />
								</div>

							</div>
							<div class="radius offset-md-1 col-md-2" id="joinCnt">
								<div class="radiusImg col-md-5">
									<img src="/imgs/manager-img/user.png" />
								</div>
							</div>

							<div class="radius offset-md-1 col-md-2" id="viewsCnt">
								<div class="radiusImg col-md-5">
									<img src="/imgs/manager-img/view.png" />

								</div>
							</div>



						</div>

					</div>




				</div>


				<div class="row" style="background-color: #f8faff;">
					<div class="col-md-2"
						style="background-color: white; padding: 0px;">
						<table id="adminList" class="table table-bordered table-hover"
							style="width: 100%; height: 100%;">
							<tr>
								<th>회원관리</th>
							</tr>
							<tr>
								<th>게시물관리</th>
							</tr>
							<tr>
								<th>공지사항관리</th>
							</tr>
						</table>

					</div>


				</div>
				<div></div>
			</div>
		</div>
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
			>
		</div>

	</div>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- 초기화 -->
<link rel="stylesheet" href="/WebContent/css/reset.css">
<link rel="stylesheet" href="/WebContent/css/main-style.css">
<link rel="stylesheet" href="/css/recipeList_css/recipeList.css">

<title>수상한 레시피</title>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
</script>
</head>

<body>
	<div class="container-fluid">

		<!-- Header -->
		<div id="header">
			<!-- 해더 -->
		</div>
		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="padding: 10px;">
			<div class="row" style="margin-bottom: 30px;">
				<div class="col-md-1"></div>
				<div class="col-md-10" id="category">
					<div class="row" id="cate_class" style="margin-top: 15px;">
						<div class="col-md-12">
							<span class="category">종류별</span>
							<ul id="cate_list" class="nav">
								<li class="nav-item"><a class="nav-link active" href="#">Active</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Disabled</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="row" id="cate_situation" style="margin-top: 10px;">
						<div class="col-md-12">
							<span class="category">상황별</span>
							<ul id="cate_list" class="nav">
								<li class="nav-item"><a class="nav-link active" href="#">Active</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Disabled</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="row" id="cate_ingredient" style="margin-top: 10px;">
						<div class="col-md-12">
							<span class="category">재료별</span>
							<ul id="cate_list" class="nav">
								<li class="nav-item"><a class="nav-link active" href="#">Active</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Disabled</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="row" id="cate_method"
						style="margin-top: 10px; margin-bottom: 15px">
						<div class="col-md-12">
							<span class="category">방법별</span>
							<ul id="cate_list" class="nav">
								<li class="nav-item"><a class="nav-link active" href="#">Active</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Disabled</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>


			<div class="row">
				<div class="col-md-4">
					<div class="shadow p-3 mb-5 bg-white rounded">
						<div class="thumbnail">
							<img class="recipe_img" src="/imgs/recipe_img/pi1.jpg"
								height="100%" width="100%">
							<div class="caption">
								<h3>고소한 고등어살 파니니</h3>
								<p>by 이승재</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="shadow p-3 mb-5 bg-white rounded"></div>
				</div>
				<div class="col-md-4">
					<div class="shadow p-3 mb-5 bg-white rounded"></div>
				</div>
			</div>
		</div>


		<!-- Footer -->
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>
</body>
</html>
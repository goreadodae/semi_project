<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
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
	
</script>
<style>
* {
	padding: 0px;
	margin: 0px;
}

.list-group li {
	background-color: #566270;
	color: white;
}
#list-group li:hover {
	background-color: #a5dff9;
	color:black;
	cursor: pointer;
}
</style>
</head>
<body>
		<div class="col-md-2"
				style="background-color: #566270; height: 960px; padding: 0;">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-12"
							style="background-color: #566270; height: 50px"></div>
						<ul id="list-group" class="list-group" style="text-align: center">
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								회원관리<span class="badge badge-primary badge-pill">14</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								게시판관리<span class="badge badge-primary badge-pill">2</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								공지사항관리<span class="badge badge-primary badge-pill">1</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								FAQ관리<span class="badge badge-primary badge-pill">1</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								<a href="/qnaMgt">문의관리</a> <span class="badge badge-primary badge-pill">1</span>
							</li>


						</ul>
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
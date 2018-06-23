<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
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



<script>
	
</script>
<style>
* {
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<body>
	<div class="container-fluid" style="background-color: #dadbdb; padding:0px">
		<div class="row">

			<jsp:include page="/views/adminPage/layoutPageLeft.jsp"></jsp:include>

			<div class="col-md-10" >
				<div class="row">
					<div class="col-md-12"
						style="height: 50px; background-color: white;">s</div>


				</div>
				<br> <br>
				<div class="row">
					<div class="container col-md-12">
						<div class="col-md-12"
							style="background-color: white; height: 300px">d</div>
					</div>
				</div>

				<br> <br>
				<div class="row">

					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6">
								<div class="col-md-12"
									style="background-color: white; height: 200px">s</div>

							</div>
							<div class="col-md-6">
								<div class="col-md-12"
									style="background-color: white; height: 200px">s</div>
							</div>


						</div>
					</div>
				</div>
				<br><br>
				<div class="row" style="padding:0">
				<div class="col-md-12" >
					<div class="md-12" style="padding:0; background-color:white; height:200px" >
						
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
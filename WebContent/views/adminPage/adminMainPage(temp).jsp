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



<script>

	$(document).ready(function() { 
	
		$.ajax({
		url : "/userCountMgt",
		type : "get",
		success :function(data){
			$('#userCount').append("<h1>"+data[0]+"</h1>");
			$('#recipeBoard').append("<h1>"+data[1]+"</h1>");
			$('#buyProduct').append("<h1>"+data[2]+"</h1>");
		},
		error:function(){ 
			
		}
		
		});

		
			
		});


</script>
<style>
* {
	padding: 0px;
	margin: 0px;
}


@import url('https://fonts.googleapis.com/css?family=Patrick+Hand');

 div{font-family: 'Patrick Hand', cursive;}

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
						<!--고치는부분  -->
						<div class="col-md-12"
							style="background-color: white; height: 300px">
							<div class="row">
							<div class="col-md-4">
								<div class="row"><div class="col-md-12"><div class="row"><div class="col-md-8 mx-auto">
								<img src="/imgs/manager-img/users-group.png" width="200" height="200"></div></div>
								<div class="row"><div class="col-md-5 mx-auto" id="userCount"><h3>Member</h3></div></div></div></div></div>
							<div class="col-md-4">
								<div class="row"><div class="col-md-12"><div class="row"><div class="col-md-8 mx-auto">
								<img src="/imgs/manager-img/recipe.png" width="200" height="200"></div></div>
								<div class="row"><div class="col-md-5 mx-auto" id="recipeBoard"><h3>Recipe</h3></div></div></div></div></div>
							<div class="col-md-4">
								<div class="row"><div class="col-md-12"><div class="row"><div class="col-md-8 mx-auto">
								<img src="/imgs/manager-img/buying.png" width="200" height="200"></div></div>
								<div class="row"><div class="col-md-8 mx-auto" id="buyProduct"><h4>Today's buying</h4></div></div></div></div></div>
							</div>
							</div>
							<!--고치는부분끝  -->
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
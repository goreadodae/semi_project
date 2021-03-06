<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<style>
* {
	padding: 0;
}

.page-item.active>.page-link {
	background-color: #512772 !important;
	border-color: #512772 !important;
	color: white !important;
}

.page-item>.page-link {
	color: #512772 !important;
}

.btn.btn-primary{
	background-color: #512772 !important;
	border-color: #512772 !important;
	color: white !important;
	margin: 1px;
	
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
<script>
	function deleteRecipe(recipeNo){
		if(window.confirm("정말로 삭제하시겠습니까?")){
			$.ajax({
				url : "/recipeDelete",
				type : "post",
				data : {
					recipeNo : recipeNo,
				},
				success : function(data) {
					if(data>0){
						alert("삭제 성공");
						window.location.reload();
					}
					else{
						alert("삭제 실패");
					}
				},
				error : function() {
					console.log("실패");
				}
			});
		}
	}
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
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 0px">
		<div class="container-fluid" style="padding: 0;">
			<!-- Header -->
			<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
			<!-- 해더 -->
		</div>
		<div style="background-color: #f8faff; padding: 0px">

			<div id="contents"
				class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
				style="border: 1px solid black; left-padding: 14px;">
				<div class="row">
					<div class="col-md-2">
						<!-- 네이게이터 -->
					</div>
					<div class="col-md-10">
						<div class="col-md-12">
							<table class="table table-hover">
								<tr>
									<th scope="col">레시피번호</th>
									<th scope="col">레시피제목</th>
									<th scope="col">조회수</th>
									<th scope="col">등록일</th>
									<th scope="col">작성자ID</th>
									<th scope="col">삭제</th>
								</tr>
								
									<c:forEach begin="0"
										items="${requestScope.pageData.dataList }" var="list"
										varStatus="i">
										<tr >
										<th scope="row">${requestScope.pageData.dataList[i.count-1].recipeNo }</th>
										<th><a href="/recipe?recipeNo=${requestScope.pageData.dataList[i.count-1].recipeNo }">
										${requestScope.pageData.dataList[i.count-1].recipeTitle }</a></th>
										<th>${requestScope.pageData.dataList[i.count-1].recipeViews }</th>
										<th>${requestScope.pageData.dataList[i.count-1].postedDate }</th>
										<th>${requestScope.pageData.dataList[i.count-1].memberId }</th>
										<th><button class="btn btn-primary" onclick="deleteRecipe(${requestScope.pageData.dataList[i.count-1].recipeNo })">삭제</button>
										</tr>
									</c:forEach>
									
							</table>
						</div>
						<div class="container">
							<div class="row">
								<ul id="pageNavi" class="pagination"
									style="margin-left: auto; margin-right: auto;">
									${requestScope.pageData.pageNavi }
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<jsp:include page="/views/footer/main-Footer.jsp"></jsp:include>
		</div>

	</div>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
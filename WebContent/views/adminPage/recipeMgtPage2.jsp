
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div class="container-fluid">
		<div class="row" style="padding: 0px">
			<jsp:include page="/views/adminPage/layoutPageLeft.jsp"></jsp:include>

			<div class="container" style="padding: 0px">
				<div class="col-md-12">
					<div class="col-md-12" style="text-align: center">
						<br>
						

					</div>
				</div>

				<div class="col-md-12" style="height: 850px">
				
					<h2>게시물관리</h2><br>
					<!--테이블  -->
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
					
					
				

					<div class="container">
							<div class="row">
								<div class="offset-md-4 col-md-5">
								<ul id="pageNavi" class="pagination"
									>
									${requestScope.pageData.pageNavi }
								</ul>
								</div>
							</div>
						</div>


				</div>
			</div>


		</div>



	</div>




</body>
</html>
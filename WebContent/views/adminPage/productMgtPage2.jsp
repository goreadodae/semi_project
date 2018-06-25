
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	function sendMoney(productNo, memberNo, totalSales){
		if(totalSales!=0){
		$.ajax({
			url : "/sendMoney",
			type : "post",
			data : {
				productNo : productNo,
				memberNo : memberNo,
				totalSales : totalSales
			},
			success : function(data) {
				if(data>0){
					alert("송금 성공");
					window.location.reload();
				}
				else{
					alert("송금 실패");
				}
			},
			error : function() {
				console.log("실패");
			}
		});
		}
		else{
			alert("송금 가능한 금액이 없는 상품은 송금할 수 없습니다.");
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

.btn.btn-primary {
	background-color: #512772 !important;
	border-color: #512772 !important;
	color: white !important;
	margin: 1px;
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

				<br> <br> <br>
				<div class="col-md-12" style="height: 800px">
					<br> <br>
					<h2>상품관리</h2>
					<br>
					<table class="table table-hover">
								<tr>
									<th scope="col">#</th>
									<th scope="col">레시피제목</th>
									<th scope="col">상품제목</th>
									<th scope="col">레시피 작성자</th>
									<th scope="col">상품 가격</th>
									<th scope="col">팔린 개수</th>
									<th scope="col">송금가능한 금액</th>
									<th scope="col">송금한 금액</th>
									<th scope="col">송금</th>
								</tr>
									<c:forEach begin="0"
										items="${requestScope.productList }" var="list"
										varStatus="i">
										<tr >
										<th scope="row">${i.count}</th>
										<th>
										<a href="/recipe?recipeNo=${requestScope.productList[i.count-1].recipeNo }">
										${requestScope.productList[i.count-1].recipeTitle }</a></th>
										<th><a href="/productDetail?productNo=${requestScope.productList[i.count-1].productNo }">
										${requestScope.productList[i.count-1].productName }</a></th>
										<th>${requestScope.productList[i.count-1].recipeWriter }</th>
										<th><fmt:formatNumber value="${requestScope.productList[i.count-1].price }" groupingUsed="true"/></th>
										<th><fmt:formatNumber value="${requestScope.productList[i.count-1].sellQuantity }" groupingUsed="true"/></th>
										<th><fmt:formatNumber value="${(requestScope.productList[i.count-1].totalSales-requestScope.productList[i.count-1].sendMoney)*0.1}" groupingUsed="true"/></th>
										<th><fmt:formatNumber value="${requestScope.productList[i.count-1].sendMoney*0.1 }" groupingUsed="true"/></th>
										<th><button class="btn btn-primary" onclick="sendMoney(${requestScope.productList[i.count-1].productNo },
										${requestScope.productList[i.count-1].memberNo },
										${requestScope.productList[i.count-1].totalSales-requestScope.productList[i.count-1].sendMoney});">송금</button>
										</tr>
									</c:forEach>
									
							</table>
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




</body>
</html>
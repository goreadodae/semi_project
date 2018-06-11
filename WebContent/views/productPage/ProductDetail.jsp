<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<title>재료 패키지 구매</title>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
		$("#banner").load("/views/productPage/test2.jsp");
	});
</script>

<style>
div{
	/* border: 1px solid lightgrey; */
}

.price {
	text-align: right;
}

#title_img{
	/* background-color: oldlace; */
	padding : 0px;
	margin : 0px;
}

#title {
	border: 1px solid lightgrey;
	
}

#detail {
	border: 1px solid lightgrey;
	
}

#info1 {
	border: 1px solid lightgrey;
	background-color: oldlace;
}

#content1 {
	background-color: white;
}

#desc {
	/*padding : 20px;  */
	
}
</style>

</head>
<body>
	<div class="container-fluid">

		<!-- Header -->
		<div id="header"></div>

		<!-- 전체 컨텐츠 -->
		<br>

		<div id="total" class="contents">
		<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div id="title" class="col-md-12" style="padding: 0px;">
					<div class="row">
						<div id="title_img" class="col-md-6">
							<center>
							<img src="/imgs/product_img/product1.jpg">
							</center>
						</div>
						
						<div class="col-md-6">
							<br><h2> 오징어볶음</h2><hr>
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">
									<p>가격</p>
									<p>배송종류</p>
									<p>남은 수량</p>
									<p>수량선택</p>
									</div>
									<div class="col-md-8">
									<p>5000원</p>
									<p>묶음배송</p>
									<p>50</p>
									
									</div>
								</div>
							</div>
							<hr>
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">
									<p>합계금액</p>
									
									</div>
									<div class="col-md-8">
									<p>5000원</p>
									
									</div>
								</div>
							</div>
							<center>
							<br><br><button type="button" class="btn btn-info">장바구니</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-success">구매하기</button>
							</center>
						</div>
						
					</div>
				</div>
				
				<br><br>
				<div id="detail" class="col-md-12" style="padding: 0px;">
				<img src = "/imgs/product_img/detail.png" width=100%>
				</div>
		</div>
		</div>
		<br><br>
		
		




		<!-- Footer -->
		<br>
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>
</body>
</html>
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

<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Song+Myung" rel="stylesheet">

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
div {
	/* border: 1px solid lightgrey; */
	
}

.price {
	text-align: right;
}

.font{
	font-family: 'Song Myung', serif;
	font-weight: bold;
	
}

.sum{
	font-family: 'Song Myung', serif;
	font-weight: bold;
	font-size: 20px;
}



#title_img {
	/* background-color: oldlace; */
	padding: 0px;
	margin: 0px;
}

#title, #detail, #review, #inquiry {
	border: 1px solid lightgrey;
}



#info1 {
	border: 1px solid lightgrey;
	background-color: oldlace;
}

#content1 {
	background-color: white;
}

.part{
	background-color : lavender;
}

#desc {
	/*padding : 20px;  */
	
}

#sumprice {
	color : #AAABD3;
	font-size: 25px;
}



#part{
	display : inline;
	color : #353866;
}

th {
	text-align: center;
}

</style>

<script>
	
	 $(document).ready(function(){
         $('#minus').click(function(){
         	var value   = Number($('#qty').val());
         	if(value>1){
         		value--;
         		$('#qty').val(value);
         		$('#sumqty').html("수량 " + value +"개");
         		$('#sumprice').html($('#price').html()*value + "원");
         	}
            
         });
         
         $('#plus').click(function(){
          	var value   = Number($('#qty').val());
          	if(value<50){
          		value++;
          		$('#qty').val(value);
          		$('#sumqty').html("수량 " + value +"개");
          		$('#sumprice').html($('#price').html()*value +"원");
          	}
          });
         
     });

</script>

</head>
<body>
	<div class="container-fluid">

		<!-- Header -->
		<!-- <div id="header"></div> -->

		<!-- 전체 컨텐츠 -->
		<br>

		<div id="total" class="contents">
			<div class="col-md-8 mx-auto" style="padding: 0px;">

				<!-- 상품정보 -->
				<div id="title" class="col-md-12" style="padding: 0px;">
					<div class="row">
						<div id="title_img" class="col-md-6">
							<center>
								<img src="/imgs/product_img/product1.jpg">
							</center>
						</div>

						<div class="col-md-6">
							<br>
							<h2 class="font">오징어볶음</h2>
							<hr>
							<div class="col-md-12">
							
							
								<div class="row">
									<div class="col-md-4">
										<p>가격</p>
										<p>배송종류</p>
										<p>남은 수량</p>
										<p>수량선택</p>
									</div>
									<div class="col-md-8">
										<p id="price">5000</p>
										<p>묶음배송 (4만원 이상 무료배송)</p>
										<p>50</p>
										<button id="minus">-</button> <input id="qty" type="text" value=1 size="1" /> <button id="plus">+</button>
										

									</div>
								</div>
							</div>
							<hr>
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">
										<p class="sum">합계금액</p>
									</div>
									<div class="col-md-3"><p id="sumqty" class="sum">수량 1개</p></div>
									<div class="col-md-5" >
										<p id="sumprice" class="sum">5000원</p>
									</div>
								</div>
							</div>
							<br>
							<center>
								
								<button type="button" class="btn btn-info">장바구니</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-success">구매하기</button>
							</center>
						</div>

					</div>
				</div>

				<!-- 상세정보 (이미지로 대체) -->
				<br> <br>
				<div id="detail" class="col-md-12" style="padding: 0px;">
					<img src="/imgs/product_img/detail.JPG" width=100%>
				</div>
				


				<!-- 구매후기 -->
				<br><br>
				<div id="review">
				<br>
				<div class="part"><h3 id="part" class="font">구매후기</h3> 전체 3건</div>
				<br>
					<table class="table">
						<tr>
							<th width=10%>후기번호</th>
							<th width=65%>내용</th>
							<th width=15%>작성자</th>
							<th width=10%>등록시간</th>
						</tr>
						<!-- for문 시작 -->

						<tr>
							<td><center>3</center></td>
							<td>음...</td>
							<td><center>hong</center></td>
							<td>18.06.09</td>
						</tr>

						<tr>
							<td><center>2</center></td>
							<td>괜찮네요!ㅎㅎ</td>
							<td><center>yedin</center></td>
							<td>18.06.09</td>
						</tr>

						<tr>
							<td><center>1</center></td>
							<td>맛있음</td>
							<td><center>reumii</center></td>
							<td>18.06.09</td>
						</tr>

						<!-- for문 끝 -->
					</table>
				
				</div>
				
				

				<!-- 상품문의 -->
				<br><br>
				<div id="inquiry">
				<br>
				<div class="part"><h3 id="part" class="font">상품문의</h3> 전체 2건</div>
				<br>
					<table class="table">
						<tr>
							<th width=10%>번호</th>
							<th width=70%>문의내용</th>
							<th width=10%>작성자</th>
							<th width=10%>작성일</th>
						</tr>
						<!-- for문 시작 -->

						<tr>
							<td><center>2</center></td>
							<td>배송문의</td>
							<td>ye***</td>
							<td>18.06.09</td>
						</tr>

						<tr>
							<td><center>1</center></td>
							<td>유통기한은 언제까지인가요?</td>
							<td>reu***</td>
							<td>18.06.09</td>
						</tr>

						<!-- for문 끝 -->
					</table>
				
				</div>
				<br> <br>


			</div>
		</div>
		<br> <br>




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
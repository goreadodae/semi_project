<!-- 상품 상세 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 초기화 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Myeongjo|Song+Myung" rel="stylesheet">
<title>재료 패키지 구매</title>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
		
		/* 웹 실행 시 카테고리 숨김 */
		   $('#category_list').css('display', 'none');

		   $('#div-category').hover(function(e) {
		      if ($(e.target).is("#div-category")
		         || $(e.target).is("#a-category")) {
		         $('#category_list').css('display', 'block');
		         inCategory = true; // 카테고리 오픈
		      }

		      // 카테고리 오픈되어 있을 때
		      if (inCategory) {
		         $('#category_list').hover(function(e) {
		            if ($(e.target).is('.category-text')
		               || $(e.target).is('.header')
		               || $(e.target).is('#category_list')) {
		               $('#category_list').css('display', 'block');
		            }
		         });

		         $('#category_list').mouseleave(function(e) {
		            if (!$(e.target).is('.category-text')
		               || !$(e.target).is('.header')
		               || !$(e.target).is('#category_list')) {
		               $('#category_list').css('display', 'none');
		            }
		         });

		         $('#div-category').mouseleave(function(e) {
		            if (!$(e.target).is('.category-text')
		               || !$(e.target).is('.header')
		               || !$(e.target).is('#category_list')) {
		               $('#category_list').css('display', 'none');
		            }
		         });
		      }
	});
</script>

<style>
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
	line-height : 40px;
}



#title_img {
	/* background-color: oldlace; */
	padding: 0px;
	margin: 0px;
	overflow : hidden;
	height :600px;
}

/* #1stImg{
	top : -10%;
} */

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


#desc {
	/*padding : 20px;  */
	
}

#sumprice {
	color : #522075;
	font-size: 25px;
	
}



#part{
	display : inline;
	color : #353866;
}

#info{
	font-size: 17px;
}



#nav1,#nav2{
	text-align : center;
	line-height : 50px;
	padding:0px;
	margin : 0px;
	height : 50px;
	width : 100%;
	font-family: 'Nanum Myeongjo', serif;
	font-size: 20px;
	border : 0.5px solid #AAABD3;
	color : white;
	cursor: pointer;
	
	
}

#nav1{
	background-color : #AAABD3;
}

#nav2{
	background-color : #FAFAFA;
	color:#AAABD3;
}


a{
	padding : 0px;
	margin : 0px;
}

/* tr{
	background-color : #FFE4E1;
} */

.table_title{
	background-color : #FFF0F5;
}

.reply_title{
	cursor: pointer;
}

.reply{
	display: none;
}

/* 장바구니, 구매하기 버튼 스타일 */
.mybutton1{
	background-color: #795B8F;
	color : #F8FAFF;
	height : 50px;
	width : 200px;
	border : 1px solid #522075;
	cursor : pointer;
}

.mybutton2{
	background-color: white;
	color : #522075;
	height : 50px;
	width : 200px;
	border : 1px solid #522075;
	cursor : pointer;
}

.mybutton3{
	background-color: #522075;
	color : #F8FAFF;
	height : 50px;
	width : 200px;
	border : 0px;
	cursor : pointer;
}
</style>

<script>
	
	 $(document).ready(function(){
		 
		 
		 
		//+,- 버튼을 눌렀을때 수량 변화하는 함수
         $('#minus').click(function(){
         	var value   = Number($('#qty').val());
         	if(value>1){
         		value--;
         		$('#qty').val(value);
         		$('.basket_quantity').val(value);
         		$('#sumqty').html("수량 " + value +"개");
         		$('#sumprice').html($('#price').html()*value + "원");
         	}
            
         });
         
         $('#plus').click(function(){
          	var value   = Number($('#qty').val());
          	if(value<50){
          		value++;
          		$('#qty').val(value);
          		$('.basket_quantity').val(value);
          		$('#sumqty').html("수량 " + value +"개");
          		$('#sumprice').html($('#price').html()*value +"원");
          	}
          });
         
  
       	 //상품문의 답변보여주기
         $('.reply_title').click(function(){
        	 if($(this).next().css("display")== "none"){
        		 $(this).next().show();
        	 }
        	 else{
        		 $(this).next().hide();
        	 }
         });
       	 
       //버튼 마우스올렸을때 색상 변화
 		$('.mybutton1').mouseover(function(){
 			$(this).addClass('mybutton3');
 		});
 		
 		$('.mybutton1').mouseout(function(){
 			$(this).removeClass('mybutton3');
 			$(this).addClass('mybutton1');
 		});
 		
 		$('.mybutton2').mouseover(function(){
 			$(this).addClass('mybutton3');
 		});
 		
 		$('.mybutton2').mouseout(function(){
 			$(this).removeClass('mybutton3');
 			$(this).addClass('mybutton2');
 		});
     });

</script>
<script>
	function inputBasket(){
		var basketQuantity = $('#qty').val();
		var productNo = $('#product_no').val();
		
		$.ajax({
			url : "/basketInsert",
			data : {basketQuantity:basketQuantity,productNo:productNo},
			type : "get",
			success:function(data){
				window.open('/views/productPage/InputBasket.jsp','장바구니에 담겼습니다.','width=430,height=300,top=300,left=800, location=no,status=no,resizable=no,scrollbars=yes');
				console.log("성공");
			},
			error:function(){
				console.log("실패");
			}
		});
	}
</script>

</head>
<body>
	<div class="container-fluid">

		<!-- Header -->
		<div id="header"></div>

		<!-- 전체 컨텐츠 -->
		<br><br>

		<div id="total" class="contents">
			<div class="col-md-8 mx-auto" style="padding: 0px;">

				<!-- 상품정보 -->
				<div id="title" class="col-md-12" style="padding: 0px;">
					<div class="row">
						<div class="col-md-6 col-sm-12"  id="title_img">
							<center>
								<img src="${productInfo.product1stPic}" id="1stImg" width=80%>
							</center>
						</div>

						<div class="col-md-6 col-sm-12">
							<br><br><br><br>
							<h2 class="font">${productInfo.productName}</h2>
							<hr>
							<div class="col-md-12">
							
							
								<div class="row" id="info">
									<div class="col-md-4">
										<p>가격</p>
										<p>배송종류</p>
										<p>남은 수량</p>
										<p>수량선택</p>
									</div>
									<div class="col-md-8">
										<p id="price">${productInfo.productPrice}</p>
										<p>묶음배송 (4만원 이상 무료배송)</p>
										<p>${productInfo.productQuantity}</p>
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
										<p id="sumprice" class="sum">${productInfo.productPrice}</p>
									</div>
								</div>
							</div>
							<br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="hidden" class="basket_quantity" name="basket_quantity" value="1" >
								<input type="hidden" id="product_no" value="${productInfo.productNo}" >
								<button class="mybutton1" onclick="inputBasket();">장바구니</button>
								
								
								&nbsp;&nbsp;&nbsp;&nbsp;
								<form action="/buyDirect"  method="post" style="display:inline;">
									<input type="hidden" class="basket_quantity" name="basketQuantity" value="1" >
									<input type="hidden" id="productNo" name="productNo" value="${productInfo.productNo}" >
									<button  class="mybutton2" onclick="location.href='/buyDirect'">구매하기</button>
								</form>
							
						
							
						</div>
					</div>
				</div>
				

				
				
				<!-- 네비게이션바 -->
				<br><br>
				<div class="col-md-12" id="detailnav">

				<div class="row">
 						<!-- <a href="#detail"><div class="col-md-4" id="nav1">상품상세정보</div></a>
  						<a href="#review"><div class="col-md-4" id="nav2">구매후기</div></a>
  						<a href="#inquiry"><div class="col-md-4" id="nav3">상품문의</div></a> -->
  						
  						<div class="col-md-4" id="nav1" onclick="location.href='#detailnav'">상품상세정보</div>
  						<div class="col-md-4" id="nav2" onclick="location.href='#reviewnav'">구매후기</div>
  						<div class="col-md-4" id="nav2" onclick="location.href='#inquirynav'">전성분표기</div>
  						<!-- <div class="col-md-4" id="nav2" onclick="location.href='#inquirynav'">상품문의</div> -->
					</div>
				</div>
				
				

				<!-- 상세정보 (이미지로 대체) -->
				<div id="detail" class="col-md-12" style="padding: 0px;">

				<center>
					<img src="${productInfo.productSpecPic}" height=100%></center>
				</div>
				




				<!-- review 네비게이션바 -->
				<br><br>
				<div class="col-md-12" id="reviewnav">
				<div class="row">
  						<div class="col-md-4" id="nav2" onclick="location.href='#detailnav'">상품상세정보</div>
  						<div class="col-md-4" id="nav1" onclick="location.href='#reviewnav'">구매후기</div>
  						<div class="col-md-4" id="nav2" onclick="location.href='#inquirynav'">전성분표기</div>
					</div>
				</div>
				<!-- 구매후기 -->
				<div id="review">
				<br>
				<div class="part"><h3 id="part" class="font">&nbsp;&nbsp;구매후기</h3>&nbsp;&nbsp; 전체 3건</div>
				<br>
					<table class="table">
						<tr class="table_title">
							<th width=10%><center>후기번호</center></th>
							<th width=65%>내용</th>
							<th width=15%><center>작성자</center></th>
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
				
				
				<!-- inquiry 네비게이션바 -->
				<br><br>
				<div class="col-md-12" id="inquirynav">
				<div class="row">
  						<div class="col-md-4" id="nav2" onclick="location.href='#detailnav'">상품상세정보</div>
  						<div class="col-md-4" id="nav2" onclick="location.href='#reviewnav'">구매후기</div>
  						<div class="col-md-4" id="nav1" onclick="location.href='#inquirynav'">전성분표기</div>
					</div>
				</div>
				<!-- 상품문의 -->
				<div id="inquiry">
				<br>
				<br>
				<center><h3 id="part" class="font">&nbsp;&nbsp; 전성분표기</h3><br><br><img src="${productInfo.productInfo}" width=60%></center>
					<%-- <table class="table" >
						<tr class="table_title">
							<th width=10%><center>번호</center></th>
							<th width=65%>문의내용</th>
							<th width=15%><center>작성자</center></th>
							<th width=10%>작성일</th>
						</tr>
						<!-- for문 시작 -->

						<tr class="reply_title">
							<td><center>2</center></td>
							<td>배송문의</td>
							<td><center>ye***</center></td>
							<td>18.06.09</td>
						</tr>
						
						<tr class="reply">
							<td></td>
							<td colspan="2">
								<br>
								<div class="replyUser">Q. 오늘 시켰는데 언제쯤 도착할까요???</div>
								<hr><br>
								<div class="replyAdmin">A. 금요일에 일괄 배송되므로 빠르면 다음주 월요일에 받아보실 수 있습니다.<br> 문의주셔서 감사합니다^^</div>
								<br>
							</td>
							<td></td>
						</tr>

						<tr class="reply_title">
							<td><center>1</center></td>
							<td>유통기한은 언제까지인가요?</td>
							<td><center>reu***</center></td>
							<td>18.06.09</td>
						</tr>
						
						
						<tr class="reply">
							<td></td>
							<td colspan="2">
								<br>
								<div class="replyUser">Q. 유통기한은 언제까지 인가요?</div>
								<hr><br>
								<div class="replyAdmin">A. 답변 대기중</div>
								<br>
							</td>
							<td></td>
						</tr>

						<!-- for문 끝 -->
					</table> --%>
				<br><br><br>
				</div>
				<br>


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
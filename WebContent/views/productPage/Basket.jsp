<!-- 장바구니 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- 초기화 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<title>수상한 레시피</title>

<script>
	$(document).ready(function() {
		/* 해더 불러오는 제이쿼리 */
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
		

		var jbOffset = $('#start').offset();

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
	
	 $(document).ready(function(){
		 
		 
		 
		//+,- 버튼을 눌렀을때 수량 변화하는 함수
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

<style>

table{
	font-size : 100px;
	text-align:center;
}

.line1{
	border-bottom : 2px solid #dcdcdc;
	height : 90px;
}

.line2{
	border-top : 2px solid #522075;
	border-bottom : 2px solid #dcdcdc;
	height : 50px;
}

.inbasket{
	height: 70px;
	width: 50%;
}

.prod{
	text-align:left;
	
}

#minus,#plus{
	border : 1px solid #dcdcdc;
	background-color : #dcdcdc;
	color : grey;
	width : 25px;
	height : 25px;
}

.qtytext{
	border : 1px solid #dcdcdc;
	height : 25px;
	text-align:center;
}

.mybutton{
	background-color: #522075;
	color : #F8FAFF;
	height : 50px;
	width : 200px;
	border : 0px;
	cursor : pointer;
}

#suminfo{
	border : 2px solid #dcdcdc;
	background-color : #FAFAFA;
	text-align : center;
	height : 140px;
}

#suminfo1{
	border-top : 2px solid #dcdcdc;
	border-left : 2px solid #dcdcdc;
	border-bottom : 2px solid #dcdcdc;
	text-align : center;
	height : 140px;
}

#suminfo2{
	border-top : 2px solid #dcdcdc;
	border-bottom : 2px solid #dcdcdc;
	text-align : center;
	height : 140px;
}

#suminfo3{
	border-top : 2px solid #dcdcdc;
	border-right : 2px solid #dcdcdc;
	border-bottom : 2px solid #dcdcdc;
	background-color : #FAFAFA;
	text-align : center;
	height : 140px;
}

.sumtitle{
	 font-weight: bold;
}


.oper{
	font-size : 50px;
	color : grey;
	height : 140px;
	line-height : 130px;
}

#notice{
	background-color : #FAFAFA;
	border : 1px solid #dcdcdc;
}



</style>

</head>
<body>
	<div class="container-fluid">

		<!-- Header -->
		<div id="header"></div>


		<!-- contents -->
		<br><br>
		<div id="">
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12">
				
					<center><img src="/imgs/product_img/basket_title.png"></center>
					
					<!-- 장바구니에 담긴 상품 리스트 -->
					<br><table width=100%>
						<tr class="line2">
							<th width=5%>번호</th>
							<th width=15%></th>
							<th width=50%>상품정보</th>
							<th width=13%>수량</th>
							<th width=10%>상품금액</th>
							<th width=7%>삭제</th>
						</tr>
						
						<tr class="line1">
							<td>1</td>
							<td><center><img src="/imgs/product_img/product01.jpg" alt="제품이미지" class="inbasket"></center></td>
							<td class="prod">콩국수 (2인분)</td>
							<td><button id="minus">-</button><input type="text" value="2" size="4" class="qtytext"><button id="plus">+</button></td>
							
							
							<td>19800</td>
							<td><img src="/imgs/product_img/delete.png" alt="x"></td>
						</tr>
						
						<tr class="line1">
							<td>2</td>
							<td><img src="/imgs/product_img/product02.jpg" alt="제품이미지" class="inbasket"></td>
							<td class="prod">소고기 찹스테이크 (2인분)</td>
							<td><button id="minus">-</button><input type="text" value="1" size="4" class="qtytext"><button id="plus">+</button></td>
							<td>15900</td>
							<td><img src="/imgs/product_img/delete.png" alt="x"></td>
						</tr>
						
					</table>
					<br><br><br>
					
					<!-- 총 금액 정보 -->
					<div class="row">
						<div class="col-md-2" id="suminfo1">
							<br><span class="sumtitle">상품금액</span>
  							<hr>
  							35700원
						</div>
						
						<div class="col-md-2" id="suminfo2">
							<br><span class="sumtitle">할인금액</span>
  							<hr>
  							0원
						</div>
						
						<div class="col-md-2" id="suminfo3">
							<br><span class="sumtitle">주문금액</span>
  							<hr>
  							35700원
						</div>
						
						<div class="col-md-1"><center><span class="oper">+</span></center></div>
 						<div class="col-md-2" id="suminfo">
  								<br><span class="sumtitle">배송비</span>
  								<hr>
  								0원
						</div>
						<div class="col-md-1"><center><span class="oper">=</span></center></div>
  						<div class="col-md-2" id="suminfo">
  								<br><span class="sumtitle">결제예약금액</span>
  								<hr>
  								35700원
  						</div>
					</div>

					<br><br><br>
					
					<!-- 주문하기 버튼 -->
					<center>
					<button class="mybutton" onclick="location.href='/views/productPage/Purchase.jsp'">주문하기</button>
					</center>
					<br><br><br>
					
					
					<!-- 참고사항 -->
					<div id="notice" width=100%>
					<center><img src="/imgs/product_img/basket_bottom.png" alt="참고메시지"></center>
					</div>

				</div>
			</div>
		</div>


		<!-- Footer -->
		<br><br>
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>
</body>
</html>
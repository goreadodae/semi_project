<!-- 장바구니 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<!-- 초기화 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<title>수상한 레시피</title>

<script>
	$(document).ready(function() {
		/* 해더 불러오는 제이쿼리 */
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




<style>

table{
	text-align:center;
}

td,th{
	font-size : 15px;
}

.line1{
	border-bottom : 2px solid #dcdcdc;
	height : 120px;
}

.line2{
	border-top : 2px solid #522075;
	border-bottom : 2px solid #dcdcdc;
	height : 50px;
}

.inbasket{
	height: 100px;
	width: 40%;
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


#basketDeleteButton{
	border : 0px;
	cursor : pointer;
}

.productDetail:link { color: black; text-decoration: none;}
.productDetail:visited { color: black; text-decoration: none;}
.productDetail:hover { color: black; text-decoration: none;}
</style>


<script>

$(document).ready(function(){
	
	//1. 총 가격 계산 & 그에 따른 배송비와 결제금액 설정
	var deliveryFee = 0;	//배송비
	var eachPay = $('[name="eachPay"]');	//물품들의 총가격
	var totalPay = 0;						//다 합한 가격
	for(var j=0; j<eachPay.length ; j++){
		totalPay += Number(eachPay[j].value);
	}
	
	if(totalPay<30000){	//3만원 미만이면
		deliveryFee = 2500;//배송비 2500원
	}
	
	$('#deliverfee').html(deliveryFee);	//배송비 가격 설정
	$('#totalpayment').html(totalPay+deliveryFee);//결제예약금액(final-fee) 설정
		
		//+,- 버튼을 눌렀을때 수량 변화하는 함수
         $('.minus').click(function(){
        	var qty = $(this).next().next().next('#qty');
        	var basketQuantity = $(this).next().next().next('#qty').val();
        	var basketNo = $(this).next('.basket_no').val();
        	var productPrice = $(this).next().next('.productPrice').val();
        	var tdPrice = $(this).parent().next('#tdPrice');
        	var payment1 = $('#payment1');
        	var payment2 = $('#payment2');
        	var totalpayment = $('#totalpayment');
        	
        	if(basketQuantity>1){
        		basketQuantity--;
    	 		qty.val(basketQuantity);
    	 		tdPrice.html(tdPrice.html()-productPrice);
    	 		payment1.html(payment1.html()-productPrice);
    	 		payment2.html(payment2.html()-productPrice);    	 		
    	 		
    	 		totalPay-=Number(productPrice);
    	 		if(totalPay<30000){	//3만원 미만이면
    	 			deliveryFee = 2500;//배송비 2500원
    	 		}else{	//3만원 이상이면
    	 			deliveryFee = 0;//배송비 없음
    	 		}
    	 		
    	 		$('#deliverfee').html(deliveryFee);	//배송비 가격 설정
    	 		$('#totalpayment').html(totalPay+deliveryFee);//결제예약금액(final-fee) 설정
    	 		
    	 		$.ajax({
        			url : "/basketUpdate",
        			data : {basketQuantity:basketQuantity,basketNo:basketNo},
        			type : "get",
        			success:function(data){
        			},
        			error:function(){
        				console.log("실패");
        			}
        		});
    	 	}
            
         });
         
         $('.plus').click(function(){
        	
        	var qty = $(this).prev('#qty');
         	var basketQuantity = $(this).prev('#qty').val();
         	var basketNo = $(this).next('.basket_no').val();
         	var productPrice = $(this).next().next('.productPrice').val();
         	var productQuantity = $(this).next().next().next('.productQuantity').val();
         	var tdPrice = $(this).parent().next('#tdPrice');
         	var payment1 = $('#payment1');
        	var payment2 = $('#payment2');
         	var totalpayment = $('#totalpayment');
         	
         	if(Number(basketQuantity)<Number(productQuantity)){
         		basketQuantity++;
     	 		qty.val(basketQuantity);
     	 		tdPrice.html(Number(tdPrice.html())+Number(productPrice));
     	 		payment1.html(Number(payment1.html())+Number(productPrice));
     	 		payment2.html(Number(payment2.html())+Number(productPrice));
     	 		
     	 		totalPay+=Number(productPrice);
    	 		if(totalPay<30000){	//3만원 미만이면
    	 			deliveryFee = 2500;//배송비 2500원
    	 		}else{	//3만원 이상이면
    	 			deliveryFee = 0;//배송비 없음
    	 		}
    	 		
    	 		$('#deliverfee').html(deliveryFee);	//배송비 가격 설정
    	 		$('#totalpayment').html(totalPay+deliveryFee);//결제예약금액(final-fee) 설정
     	 		
     	 		$.ajax({
         			url : "/basketUpdate",
         			data : {basketQuantity:basketQuantity,basketNo:basketNo},
         			type : "get",
         			success:function(data){
    
         			},
         			error:function(){
         				console.log("실패");
         			}
         		});
     	 	}
         	else{
         		alert("최대 수량입니다.");
         	}
        	
          });
         
         $('.showDetail,.inbasket').click(function(){
        	 var productNo = $(this).parent().next('.productNo').val();
        	 console.log(productNo);
        	 /* location.href="/productDetail?productNo="; */
         });
         
         
         
         
         
     });

</script>



</head>
<body>
	<div class="container-fluid">

		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>


		<!-- contents -->
		<br><br>
		<div id="">
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12">
				
					<center><img src="/imgs/product_img/basket_title.png"></center>
					
					<!-- 장바구니에 담긴 상품 리스트 -->
					<br><table width=100% id="listTable">
						<tr class="line2">
							<th width=5%>번호</th>
							<th width=15%></th>
							<th width=50%>상품정보</th>
							<th width=13%>수량</th>
							<th width=10%>상품금액</th>
							<th width=7%>삭제</th>
						</tr>
						
						<c:set var="sumprice" value="0"/>	<!-- 장바구니 품목 총 가격 -->
						
						<c:forEach begin="0" items="${basket}" var="b" varStatus="i">
						<input type="hidden" id="eachPay" name="eachPay" value="${b.productPrice*b.basketQuantity}">
						<c:set var="sumprice" value="${sumprice + b.productPrice*b.basketQuantity}"/>
						
						<tr class="line1">
							<td>${i.count}</td>
							<td><center><a href="/productDetail?productNo=${b.productNo}" class="productDetail"><img src="${b.product1stPic}" alt="제품이미지" class="inbasket"></a></center></td>
							<td class="prod">
								<a href="/productDetail?productNo=${b.productNo}" class="productDetail"><span class="showDetail">${b.productName}</span></a>
							</td>
							
							<!-- 수량 변경시 update 서블릿 실행 -->
							<td>
	
								<button class="minus" id="minus">-</button>
								<input type="hidden" class="basket_no" value="${b.basketNo}">
								<input type="hidden" class="productPrice" value="${b.productPrice}">
								<input id="qty" type="text" value="${b.basketQuantity}" size="4" class="qtytext">
								<button class="plus" id="plus">+</button>
								<input type="hidden" class="basket_no" value="${b.basketNo}">
								<input type="hidden" class="productPrice" value="${b.productPrice}">
								<input type="hidden" class="productQuantity" value="${b.productQuantity}">
								
							</td>
							
							<td id="tdPrice">${b.productPrice*b.basketQuantity}</td>
							
							<!-- 삭제버튼 누를시 delete서블릿 실행 -->
							<td><button type="button" id="basketDeleteButton" onclick="location.href='/basketDelete?basketNo=${b.basketNo}'"><img src="/imgs/product_img/delete.png" alt="x"></button></td>
						</tr>
						</c:forEach>
						
					</table>
					<br><br><br>
					
					<!-- 총 금액 정보 -->
					<div class="row">
						<div class="col-md-2" id="suminfo1">
							<br><span class="sumtitle">상품금액</span>
  							<hr>
  							<span id="payment1"><c:out value="${sumprice}" /></span>원
						</div>
						
						<div class="col-md-2" id="suminfo2">
							<br><span class="sumtitle">할인금액</span>
  							<hr>
  							0원
						</div>
						
						<div class="col-md-2" id="suminfo3">
							<br><span class="sumtitle">주문금액</span>
  							<hr>
  							<span id="payment2"><c:out value="${sumprice}" /></span>원
						</div>
						
						<div class="col-md-1"><center><span class="oper">+</span></center></div>
 						<div class="col-md-2" id="suminfo">
  								<br><span class="sumtitle">배송비</span>
  								<hr>
  								<span id="deliverfee">0</span>원
						</div>
						<div class="col-md-1"><center><span class="oper">=</span></center></div>
  						<div class="col-md-2" id="suminfo">
  								<br><span class="sumtitle">결제예약금액</span>
  								<hr>
  								<span id="totalpayment"><c:out value="${sumprice}" /></span>원
  						</div>
					</div>

					<br><br><br>
					
					<!-- 주문하기 버튼 -->
					<center>
					<button class="mybutton" onclick="location.href='/forPurchaseSelect'">주문하기</button>
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
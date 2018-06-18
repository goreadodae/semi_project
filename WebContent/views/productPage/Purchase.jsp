<!-- 구매 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	
<!DOCTYPE html>
<html>
<head>

<!-- 초기화 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<!-- 결제 api -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
		
		
		////////////////////////////////////////////////////////////////
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
		
		$('#pay').click(function(){
			var basketNoTag = $('[name="basketNo1"]');
			var basketNoArr = new Array();
			
			for(var i=0; i<basketNoTag.length ; i++){
				basketNoArr[i] = basketNoTag[i].value;
				console.log("basket : "+basketNoArr);
			}
			
			jQuery.ajaxSettings.traditional=true;
			 $.ajax({
					url : "/buyingInsert",
					data : {basketNo:basketNoArr},
					type : "get",
					success:function(data){
						console.log("성공");
					},
					error:function(){
						console.log("실패");
					}
			});
		});
		
		
		
		
		//결제 api 실행
		var IMP = window.IMP; // 생략가능
		IMP.init('imp23408974'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$('#pay11').click(function(){
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 14000,	///////////////////////////////////////////////가격
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			       
			        $.ajax({
						url : "/buyingInsert",
						data : {basketQuantity:basketQuantity,productNo:productNo},
						type : "get",
						success:function(data){
							console.log("성공");
						},
						error:function(){
							console.log("실패");
						}
					});
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		});

	});
</script>



<style>
#pinfo{
	color : grey;
	font-size : 20px;
	font-weight: bold;
}

#table1{
	font-size : 100px;
	text-align:center;
}


.line1{
	border-bottom : 1px solid #dcdcdc;
	height : 90px;
}

.line2{
	border-bottom : 2px solid #dcdcdc;
	height : 50px;
}

.line3{
	border-top : 2px solid #522075;
	height : 60px;
}

.line4{
	height : 50px;
}


.inbasket{
	height: 70px;
	width: 50%;
}

.prod{
	text-align:left;
	font-weight: bold;
}

#sub{
	padding : 30px;
}

#name1,#name2{
	padding : 10px;
}

#email{
	padding : 10px;
	width : 300px;
}

.deliveryinfo{
	height : 35px;
	border : 1px solid #dcdcdc;
	font-size : 12px;
}

#phone1,#phone2,#phone3{
	text-align : center;
	width : 80px;
	
}

#notice{
	background-color : #FAFAFA;
	border : 1px solid #dcdcdc;
}


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

</head>
<body>
	<div class="container-fluid">

		<!-- Header -->
		<div id="header"></div>


		<!-- contents -->
		<br><br>
		<div id="">
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" style="padding: 0px;">
				
				<center><img src="/imgs/product_img/purchase_title.png"></center><br>
				<span id="pinfo">상품 정보</span>
				
				<!-- 구매할 상품 리스트 -->
				<hr style="border:1px solid #522075;">
					<table width=100% id="table1">
						<tr class="line2">
							<th width=5%>번호</th>
							<th width=15%></th>
							<th width=50%>상품정보</th>
							<th width=13%>수량</th>
							<th width=10%>상품금액</th>
							
						</tr>
						
						<c:forEach begin="0" items="${basket}" var="b" varStatus="i">
						<c:set var="sumprice" value="${sumprice + b.productPrice*b.basketQuantity}"/>
						<tr class="line1">
							<td>${i.count}</td>
							<td><center><img src="${b.product1stPic}" alt="제품이미지" class="inbasket"></center></td>
							<td class="prod">${b.productName}</td>
							<td>${b.basketQuantity}</td>
							<td>${b.productPrice*b.basketQuantity}</td>
						</tr>
						<input type="hidden" id="basketNo" name="basketNo1" value="${b.basketNo}">
						</c:forEach>
					</table>
					<br><br><br>
					
					
					
					<span id="pinfo">주문자 정보</span>
					<!-- 주문자 정보 -->
					<hr style="border:1px solid #522075;">
					<table width=100%>
						<tr class="line4">
							<th width=15%><span id="sub">보내는 분</span></th>
							<td width=85%><input type="text" id="name1" value="한아름" class="deliveryinfo"></td>
						</tr>
						
						<tr class="line4">
							<th><span id="sub">휴대폰</span></th>
							<td><input type="text" value="010" class="deliveryinfo" id="phone1" maxlength="3" >
							 - <input type="text" value="1111" class="deliveryinfo" id="phone2" maxlength="4">
							 - <input type="text" value="2222" class="deliveryinfo" id="phone3" maxlength="4">
							</td>	
						</tr>
						
						<tr class="line4">
							<th><span id="sub">이메일</span></th>
							<td><input type="text" value="whitestar503@naver.com" class="deliveryinfo" id="email"></td>	
						</tr>
						
						<tr class="line4">
							<th></th>
							<td><img src="/imgs/product_img/notice1.png" alt="참고메시지"></td>	
						</tr>
					</table>
					<hr>
					<br><br>
					
					
					
					<span id="pinfo">배송 정보</span>
					<!-- 배송 정보 -->
					<hr style="border:1px solid #522075;">
					<table width=100%>
						<tr class="line4">
							<th width=15%><span id="sub">주소</span></th>
							<td width=85%><textarea class="deliveryinfo" maxlength="50" cols="100" style="resize:none">
							서울 영등포구 선유동2로 57구(지번) 주소 양평동4가 2 (지번)</textarea></td>	
						</tr>
						
						<tr class="line4">
							<th><span id="sub">수령인 이름 *</span></th>
							<td><input type="text" id="name2" value="한아름" class="deliveryinfo"></td>	
						</tr>
						
						<tr class="line4">
							<th><span id="sub">휴대폰 *</span></th>
							<td><input type="text" value="010" class="deliveryinfo" id="phone1" maxlength="3" >
							 - <input type="text" value="1111" class="deliveryinfo" id="phone2" maxlength="4">
							 - <input type="text" value="2222" class="deliveryinfo" id="phone3" maxlength="4">
							</td>	
						</tr>
						
						<tr class="line4">
							<th><span id="sub">배송 요청사항</span></th>
							<td><textarea class="deliveryinfo" maxlength="30" cols="100"></textarea> 30자 제한</td>	
						</tr>
					</table>
					<hr>
					<br><br>
					
					
					<!-- 참고사항 -->
					<div id="notice" width=100%>
					<center><img src="/imgs/product_img/notice.png" alt="참고메시지"></center>
					</div>
					<br><br>
					
					
					<!-- 개인정보 수집 동의
					<span id="pinfo">개인정보 수집/제공*</span>
					
					<hr style="border:1px solid #522075;"> -->
					
					
					
					<center>
					<!-- 결제하기 버튼(BuyingInsert서블릿으로 이동) -->
					<button class="mybutton1" id="pay">결제하기</button>
					<button class="mybutton2" onclick="location.href='/basketSelect'">취소하기</button></center>
					<br><br>
				
					<div class="row">
					
					</div>
				</div>
			</div>
		</div>


		<!-- Footer -->
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>ㄴ
</body>
</html>
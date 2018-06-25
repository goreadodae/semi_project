<!-- 구매 페이지 -->
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

<!-- 초기화 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<!-- 결제 api -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
		
		
		
		//1. 총 가격 계산 & 그에 따른 배송비와 결제금액 설정
		var deliveryFee = 0;	//배송비
		var eachPay = $('[name="eachPay"]');	//물품들의 총가격
		var totalPay = 0;						//다 합한 가격
		for(var j=0; j<eachPay.length ; j++){
			totalPay += Number(eachPay[j].value);
		}
		console.log("total : " + totalPay);
		
		if(totalPay<30000){	//3만원 미만이면
			deliveryFee = 2500;//배송비 2500원
		}
		
		$('#deliverfee').html(deliveryFee);	//배송비 가격 설정
		$('#totalpayment').html(totalPay+deliveryFee);//결제예약금액(final-fee) 설정
		
		$('#pay11').click(function(){
			var basketNoTag = $('[name="basketNo1"]');
			var basketQuantity1 = $('[name="basketQuantity1"]');
			var productNo1 = $('[name="productNo1"]');
			var basketNoArr = new Array();
			var basketQuantityArr = new Array();
			var productNoArr = new Array();
			
			for(var i=0; i<basketNoTag.length ; i++){
				basketNoArr[i] = basketNoTag[i].value;
				basketQuantityArr[i] = basketQuantity1[i].value;
				productNoArr[i] = productNo1[i].value;
			}
			
			var totalpayment =$('#totalpayment').html();
			var memberNo = "${member.memberNo}";
			
			//4. 구매목록에 추가 후 페이지 전환
			jQuery.ajaxSettings.traditional=true;
			$.ajax({
					url : "/buyingInsert",
					data : {basketNo:basketNoArr,productNo:productNoArr,basketQuantity:basketQuantityArr,totalFee:totalPay,deliveryFee:deliveryFee,finalFee:totalpayment,memberNo:memberNo},
					async: false,
					type : "get",
					success:function(data){
						console.log("성공");
					},
					error:function(){
						console.log("실패");
					}
			});
			
			/* var memberNo = $('#memberNo').val(); */
			location.href="/buyingSelectRecent?rowCount="+basketNoTag.length +"&memberNo=${member.memberNo}";
				
				
		}); 
		
		//////// 결제 ////////
		var IMP = window.IMP; // 생략가능
		IMP.init('imp23408974'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		
		//2. 결제 api 실행
		$('#pay').click(function(){
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : totalPay,//totalPay,	//결제 가격
			    buyer_email : "${member.email}",//'iamport@siot.do',
			    buyer_name : "${member.memberName}",//'구매자이름',
			    buyer_tel : "${member.phone}",
			    buyer_addr : "${member.address}",
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        
			        var basketNoTag = $('[name="basketNo1"]');
					var basketQuantity1 = $('[name="basketQuantity1"]');
					var productNo1 = $('[name="productNo1"]');
					var basketNoArr = new Array();
					var basketQuantityArr = new Array();
					var productNoArr = new Array();
					
					for(var i=0; i<basketNoTag.length ; i++){
						basketNoArr[i] = basketNoTag[i].value;
						basketQuantityArr[i] = basketQuantity1[i].value;
						productNoArr[i] = productNo1[i].value;
					}
					
					var totalpayment =$('#totalpayment').html();
					var memberNo = "${member.memberNo}";
					
					//4. 구매목록에 추가 후 페이지 전환
					jQuery.ajaxSettings.traditional=true;
					$.ajax({
							url : "/buyingInsert",
							data : {basketNo:basketNoArr,productNo:productNoArr,basketQuantity:basketQuantityArr,totalFee:totalPay,deliveryFee:deliveryFee,finalFee:totalpayment,memberNo:memberNo},
							async: false,
							type : "get",
							success:function(data){
								console.log("성공");
							},
							error:function(){
								console.log("실패");
							}
					});
					
					location.href="/buyingSelectRecent?rowCount="+basketNoTag.length +"&memberNo=${member.memberNo}";
						
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

#table1 td,th{
	font-size : 14px;
}

.line1{
	border-bottom : 1px solid #dcdcdc;
	height : 120px;
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

.line5{
	height : 130px;
}


.inbasket{
	height: 100px;
	width: 40%;
}

.prod{
	text-align:left;
	font-weight: bold;
}

#sub{
	padding : 30px;
}

#name1,#name2,#phone1,#addr{
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
	/* text-align : center; */
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

/* 총 금액 정보 */
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


#addr{
	text-align : left;
}
</style>

</head>
<body>
	<div class="container-fluid" style="padding: 0px;">

		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>


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
						<input type="hidden" id="productNo1" name="productNo1" value="${b.productNo}">
						<input type="hidden" id="basketQuantity1" name="basketQuantity1" value="${b.basketQuantity}">
						<input type="hidden" id="eachPay" name="eachPay" value="${b.productPrice*b.basketQuantity}">
						</c:forEach>
					</table>
					<br><br><br>
					
					
					
					<span id="pinfo">주문자 정보</span>
					<!-- 주문자 정보 -->
					<hr style="border:1px solid #522075;">
					<table width=100%>
						<tr class="line4">
							<th width=15%><span id="sub">보내는 분</span></th>
							<td width=85%><input type="text" id="name1" value="${member.memberName}" class="deliveryinfo"></td>
						</tr>
						
						<tr class="line4">
							<th><span id="sub">휴대폰</span></th>
							<td><input type="text" value="${member.phone}" class="deliveryinfo" id="phone1">
							</td>	
						</tr>
						
						<tr class="line4">
							<th><span id="sub">이메일</span></th>
							<td><input type="text" value="${member.email}" class="deliveryinfo" id="email"></td>	
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
							<td td width=85%>
							<c:set var="addrString" value=" " />
							<c:forTokens items="${member.address}" delims="|" var="item">
								<c:set var="addrString" value="${addrString} ${item}" />
							</c:forTokens>
							<input type="text" value="${addrString}" style="width:600px" class="deliveryinfo">
							</td>
						</tr>
						
						<tr class="line4">
							<th><span id="sub">수령인 이름 *</span></th>
							<td><input type="text" id="name2" value="${member.memberName}" class="deliveryinfo"></td>	
						</tr>
						
						<tr class="line4">
							<th><span id="sub">휴대폰 *</span></th>
							<td><input type="text" value="${member.phone}" class="deliveryinfo" id="phone1"></td>	
						</tr>
						
						<tr class="line4">
							<th><span id="sub">배송 요청사항</span></th>
							<td><textarea class="deliveryinfo" maxlength="30" cols="100"></textarea> 30자 제한</td>	
						</tr>
					</table>
					<hr>
					<br><br>
					<input type="hidden" id="memberNo" value="${member.memberNo}"><!-- 스크립트에서 memberNo정보 쓰기위하여 -->

					
					<!-- 개인정보 수집 동의
					<span id="pinfo">개인정보 수집/제공*</span>
					
					<hr style="border:1px solid #522075;"> -->
					
					
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
					
					
					
					<center>
					<!-- 결제하기 버튼(BuyingInsert서블릿으로 이동) -->
					<button class="mybutton1" id="pay">결제하기</button>
					<button class="mybutton2" onclick="location.href='/basketSelect'">취소하기</button></center>
					<br><br><br><br>
				
				
					<!-- 참고사항 -->
					<div id="notice" width=100%>
					<center><img src="/imgs/product_img/notice.png" alt="참고메시지"></center>
					</div>
					<br><br><br><br>
					
					
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
	</div>
</body>
</html>
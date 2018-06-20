<!-- 구매내역 페이지 -->

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




<style>

table{
	font-size : 100px;
	text-align:center;
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

/* 맨 밑 버튼 스타일 */
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
		<br><br><br>
		<div id="">
			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12">
				
					<center><img src="/imgs/product_img/buyingRecent_title.png"></center>
					
					<!-- 구매 내역 리스트 -->
					<br><table width=100%>
						<tr class="line2">
							<th width=5%>주문코드</th>
							<th width=15%></th>
							<th width=45%>상품정보</th>
							<th width=10%>수량</th>
							<th width=15%>상품금액</th>
							<th width=10%>주문날짜</th>
						</tr>
						
						<c:set var="sumprice" value="0"/>	<!-- 구매 품목 총 가격 -->
						
						<c:forEach begin="0" items="${buying}" var="b" varStatus="i">
						<c:set var="sumprice" value="${sumprice + b.productPrice*b.buyingQuantity}"/>
						
						<tr class="line1">
							<td>${b.buyingNo}<%-- ${i.count} --%></td>
							<td><center><img src="${b.product1stPic}" alt="제품이미지" class="inbasket"></center></td>
							<td class="prod">${b.productName}</td>
							<td>${b.buyingQuantity}</td>
							<td id="tdPrice">${b.productPrice*b.buyingQuantity}</td>
							<td>${b.buyingDate}</td>
						</tr>
						</c:forEach>
						
					</table>
					<br><br><br>
					
					
					<!-- 확인 버튼 -->
					<center>
					<button class="mybutton1" onclick="location.href='/buyingSelectAll'">전체 주문내역</button>
					<button class="mybutton2" onclick="location.href='/index.jsp'">홈으로</button></center>
					</center>
					<br><br><br>
					
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
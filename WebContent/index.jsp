<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "member.model.vo.*"%>
<%
	response.setHeader("cache-control","no-cache");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<% Member m = (Member)session.getAttribute("user"); %>
<html>
<head>
<title>수상한 레시피</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<!-- 모든 스타일 시트 적용 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<!-- 메인 전용 css -->
<link rel="stylesheet" href="/css/mainPage_css/main.css">

<body style="overflow-x: hidden; overflow-y: auto;">
	<!-- 전체 컨테이너  -->
	<div class="container-fluid" style="padding: 0px;">

		<!-- 해더 영역 -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 헤더 영역 끝 -->

		<!-- 컨텐츠 영역 -->
		<div id="content-main" class="contents">

			<!-- 메인 이미지  -->
			<div class="col-md-12 col-sm-12" id="main-img-wrap">
				<img src="/imgs/main-img/main_img.jpg" width="100%" height="500px">
				<!-- 레시피 카운트 -->
				<div class="col-md-8 mx-auto" id="recipe-count">
					<div class="col-md-3 mx-auto" id="count_wrap">
						<!-- 1000자리 -->
						<div class="text-center rounded" id="count_div1">
							<strong>0</strong>
						</div>
						<!-- 100자리 -->
						<div class="text-center rounded" id="count_div2">
							<strong id="digits100"></strong>
						</div>
						<!-- 10자리 -->
						<div class="text-center rounded" id="count_div3">
							<strong id="digits10"></strong>
						</div>
						<!-- 1자리 -->
						<div class="text-center rounded" id="count_div4">
							<strong id="digits1"></strong>
						</div>
					</div>
				</div>
				<!-- 레시피 카운트 끝 -->

				<!-- ajax 이미지 카운트 받아오기 -->
				<script>
					$(document).ready(function() {
						$("#footer").load("/views/footer/main-Footer.jsp");
						$.ajax({
							url : "/mainServlet",
							type : "get",
							success : function(data) {
								var data = Number(data);
				
								var digits100 = Math.floor(data / 100);
								var digits10 = Math.floor(data / 100);
								var digits1 = data % 10;
				
								$('#digits100').html(digits100);
								$('#digits10').html(digits10);
								$('#digits1').html(digits1);
							},
							error : function() {
								console.log("실패");
							}
						});
					});
				</script>
				<!-- ajax 레시피 수 받아오기 끝 -->
			</div>
			<!-- 메인이미지 끝  -->

			<!-- 어플리케이션 다운로드  -->
			<div class="col-md-12" id="application_wrap">
				<div class="col-md-8 mx-auto" style="padding: 0px;">
					<!-- google-->
					<a href="#"> <img class="rounded"
						src="/imgs/main-img/google.png">
					</a>
					<!-- apple -->
					<a href="#"> <img class="rounded" src="/imgs/main-img/app.png">
					</a>
				</div>
			</div>
			<!-- 어플리케이션 다운로드 끝  -->
			<!--  -->


			<!-- 인트로 이미지 -->
			<div class="col-md-12 col-sm-12">
				<div class="col-md-8 mx-auto text-center" id="intro-wrap">
					<h3 style="font-family: 'Black Han Sans', sans-serif; font-weight: 200; color:#512772;">
						누적 레시피
					</h3>
					<h1 style="font-family: 'Black Han Sans', sans-serif; font-weight: 800;">수상한
						레시피에 레시피 올리고 수익올리자</h1>
					<br>
					<div class="col-md-8 mx-auto">
						<div class="row">
							<div class="col-md-4" style="height:50px;">
								<p style="line-height:50px; text-align:center; font-size:20px; font-weight:800; color:#512772; font-family: 'Hi Melody', cursive;">STEP 1</p>
							</div>
							<div class="col-md-4" style="height:50px;">
								<p style="line-height:50px; text-align:center; font-size:20px; font-weight:800; color:#512772; font-family: 'Hi Melody', cursive;">STEP 2</p>
							</div>
							<div class="col-md-4" style="height:50px;">
								<p style="line-height:50px; text-align:center; font-size:20px; font-weight:800; color:#512772; font-family: 'Hi Melody', cursive;">STEP 3</p>
							</div>
						</div>
					</div>
					
					<div class="col-md-8 mx-auto" id="intro-step" style="border: none;">
						<div class="col-md-4" id="intro-step-wrap" style="padding:0px;">
							<div class="mx-auto" style="width:110px; padding-top: 15px;">
								<img id="intro_cook_img" src="/imgs/main-img/cook2.png" width="100">
								<p style="padding-top:5px; margin:0px; font-size:23px; font-weight:800; font-family: 'Hi Melody', cursive;">요리하고</p>
							</div>
						</div>

						<div class="col-md-4" id="intro-step-wrap" style="padding:0px;">
							<div class="mx-auto" style=" width:120px; padding-top: 15px;">
								<img id="intro_recipe_img" src="/imgs/main-img/recipe.png" width="100">
								<p style="padding-top:5px; font-size:23px; font-weight:800; margin:0px;">레시피 올리고</p>
							</div>
						</div>

						<div class="col-md-4" id="intro-step-wrap" style="padding:0px;">
							<div class="mx-auto" style="width:110px; padding-top: 15px;">
								<img id="intro_money_img" src="/imgs/main-img/money.png" width="100">
								<p style="padding-top:5px; font-size:23px; font-weight:800; margin:0px;">돈 벌자</p>
							</div>
						</div>
					</div>
					<br>
					<button type="button" class="col-md-3 btn btn btn-lg"
						onclick="startClick();">시작하기</button>
					<br><br>
				</div>
			</div>

			<script>
				function startClick(){
					<%if(request.getSession()!=null){%>
						location.href="/views/insertRecipePage/insertRecipePage.jsp";
					<%}else{%>
						location.href="/views/memberPage/loginPage.jsp";
					<%}%>
				}
			</script>
			
			<!-- 인트로 끝 -->
			<!-- 사이드 메뉴 -->
			<!-- <div id="aside" style="height: 135px; display: inline-block; padding-right: 15px;">
				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; background-color: #f5f5f5; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#" style="line-height: 29px;">배송안내</a>
				</div>

				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#" style="line-height: 29px;">레시피</a>
				</div>

				<div class="col-md-12 col-sm-12 text-center"
					style="height: 29px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#" style="line-height: 29px;">베스트
						후기</a>
				</div>

				<div class="col-md-12 col-sm-12 text-center"
					style="height: 48px; border: 0.5px solid #dddddd">
					<a class="side_menu_text" href="#" onclick="scrollUp();"> <img
						src="/imgs/main-img/ico_page_top.png"
						style="display: block; margin: 0 auto;"> TOP
					</a>
				</div>
			</div> -->
			<!-- 사이드 메뉴 끝 -->

			<!-- 네비  -->
			<div id="point">
				<!-- 추천 이벤트 / 신상품 이미지 슬라이드-->
				<div class="col-md-12 mx-auto" style="background-color: #f6f1ed;">
					<br><br>
					<h1 style="text-align:center; font-weight:800">수상한 레시피 상품</h1>
					<br><br>
					<div class="col-md-8 mx-auto">
						<div class="row">
							<div class="position-absolute" style="right:20px; padding:0px; top:-35px; height:30px;">
								<a href="/productList" style="text-decoration:none;">
									<p style="color:#b5afab; line-height:30px;">
										더보기 
										<img src="/imgs/main-img/plus.png" height="15" width="15">
									</p>
								</a>
							</div>
							<!-- 추천 이벤트 이미지 슬라이드 -->
							<div class="col-md-3" id="recommendEvent" style="height:400px; padding-right:20px;">
								<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="height:400px;">
  									
  									<!-- 슬라이드 -->
  									<div class="carousel-inner">
  										
    									<div class="carousel-item active">
    										<a href="javascript:void(0)">
     											<img id="product_img_1" class="d-block w-100 bg-overlay" alt="First slide" height="400" name="sale_img">
     										</a>
     										<!-- 라벨 -->
     										<div class="position-absolute" style="top:0px; background-color:#856292; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">초특가</h5>
											</div>
											
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_sale_title_1" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_sale_price_1" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
								   		 	<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="sale_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								   		 </div>
								   		 
								   		 <div class="carousel-item">
								      		<a href="javascript:void(0)">
								      			<img id="product_img_2" class="d-block w-100" alt="Second slide" height="400" name="sale_img">
								      		</a>
								      		<!-- 라벨 -->
								      		<div class="position-absolute" style="top:0px; background-color:#856292; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">초특가</h5>
											</div>
											
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_sale_title_2" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_sale_price_2" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="sale_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								    	</div>
								    	
								    	<div class="carousel-item">
								    		<a href="javascript:void(0)">
								      			<img id="product_img_3" class="d-block w-100" alt="Third slide" height="400" name="sale_img">
								      		</a>
								      		<!-- 라벨 -->
								      		<div class="position-absolute" style="top:0px; background-color:#856292; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">초특가</h5>
											</div>
											
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_sale_title_3" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_sale_price_3" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="sale_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								   	 	</div>
									</div>
									
								  	<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"
								  	   style="height:200px; top:25%;">
								    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    	<span class="sr-only">Previous</span>
								  	</a>
								  	<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"
								  	   style="height:200px; top:25%;">
								    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
								    	<span class="sr-only">Next</span>
								  	</a>
								</div>
							</div>
							
							<div class="col-md-3" id="recommendEvent" style="height:400px; padding-right:20px;">
								<div id="carouselExampleControls2" class="carousel slide" data-ride="carousel" style="height:400px;">
  									<!-- 슬라이드 -->
  									
  									<div class="carousel-inner">
    									<div class="carousel-item active">
    										<a href="javascript:void(0)">
     											<img id="product_new_img_1" class="d-block w-100" alt="First slide" height="400" name="new_img">
     										</a>
     										<!-- 라벨 -->
     										<div class="position-absolute" style="top:0px; background-color:#e66768; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">신상품</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_new_title_1" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_new_price_1" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="new_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								   		 </div>
								   		 
								   		 <div class="carousel-item">
								   		 	<a href="javascript:void(0)">
								      			<img id="product_new_img_2"  class="d-block w-100" alt="Second slide" height="400" name="new_img">
								      		</a>
								      		<!-- 라벨 -->
								      		<div class="position-absolute" style="top:0px; background-color:#e66768; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">신상품</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_new_title_2" style="color:white; padding:5px; margin:0px"></p>
												<p id="product_new_price_2" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="new_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								    	</div>
								    	
								    	<div class="carousel-item">
								    		<a href="javascript:void(0)">
								      			<img id="product_new_img_3"  class="d-block w-100" alt="Third slide" height="400" name="new_img">
								      		</a>
								      		<!-- 라벨  -->
								      		<div class="position-absolute" style="top:0px; background-color:#e66768; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">신상품</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_new_title_3" style="color:white; padding:5px; margin:0px"></p>
												<p id="product_new_price_3" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="new_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								   	 	</div>
									</div>
									
								  	<a class="carousel-control-prev" href="#carouselExampleControls2" role="button" data-slide="prev"
								  	   style="height:200px; top:25%;">
								    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    	<span class="sr-only">Previous</span>
								  	</a>
								  	<a class="carousel-control-next" href="#carouselExampleControls2" role="button" data-slide="next"
								  	   style="height:200px; top:25%;">
								    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
								    	<span class="sr-only">Next</span>
								  	</a>
								</div>
							</div>
							
							<div class="col-md-3" id="recommendEvent" style="height:400px; padding-right:20px;">
								<div id="carouselExampleControls3" class="carousel slide" data-ride="carousel" style="height:400px;">
  									
  									<!-- 슬라이드 -->
  									<div class="carousel-inner">
    									<div class="carousel-item active">
    										<a href="javascript:void(0)">
     											<img id="product_imminent_img_1" class="d-block w-100" alt="First slide" height="400" name="sold_img">
     										</a>
     										<!-- 라벨 -->
     										<div class="position-absolute" style="top:0px; background-color:#512772; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">매진임박</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_sold_title_1" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_sold_price_1" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="sold_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								   		 </div>
								   		 
								   		 <div class="carousel-item">
								   		 	<a href="javascript:void(0)">
								      			<img id="product_imminent_img_2"  class="d-block w-100" alt="Second slide" height="400" name="sold_img">
								      		</a>
								      		<!-- 라벨 -->
								      		<div class="position-absolute" style="top:0px; background-color:#512772; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">매진임박</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_sold_title_2" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_sold_price_2" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="sold_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								    	</div>
								    	
								    	<div class="carousel-item">
								      		<a href="javascript:void(0)">
								      			<img id="product_imminent_img_3"  class="d-block w-100" alt="Third slide" height="400" name="sold_img">
								      		</a>
								      		<!-- 라벨 -->
								      		<div class="position-absolute" style="top:0px; background-color:#512772; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">매진임박</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_sold_title_3" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_sold_price_3" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="sold_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								   	 	</div>
									</div>
									
								  	<a class="carousel-control-prev" href="#carouselExampleControls3" role="button" data-slide="prev" 
								  	   style="height:200px; top:25%;">
								    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    	<span class="sr-only">Previous</span>
								  	</a>
								  	<a class="carousel-control-next" href="#carouselExampleControls3" role="button" data-slide="next"
								  	   style="height:200px; top:25%;">
								    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
								    	<span class="sr-only">Next</span>
								  	</a>
								</div>
							</div>
							
							<div class="col-md-3" id="recommendEvent" style="height:400px; padding-right:20px;">
								<div id="carouselExampleControls4" class="carousel slide" data-ride="carousel" style="height:400px;">
  									<!-- 슬라이드 -->
  									<div class="carousel-inner">
    									<div class="carousel-item active">
    										<a href="javascript:void(0)">
     											<img id="product_season_img_1" class="d-block w-100" alt="First slide" height="400" name="season_img">
     										</a>
     										<!-- 라벨 -->
     										<div class="position-absolute" style="top:0px; background-color:#ffcd16; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">계절메뉴</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_season_title_1" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_season_price_1" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="season_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								   		 </div>
								   		 <div class="carousel-item">
								   		 	<a href="javascript:void(0)">
								      			<img id="product_season_img_2"  class="d-block w-100" alt="Second slide" height="400" name="season_img">
								      		</a>
								      		<!-- 라벨 -->
								      		<div class="position-absolute" style="top:0px; background-color:#ffcd16; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">계절메뉴</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_season_title_2" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_season_price_2" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="season_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								    	</div>
								    	<div class="carousel-item">
								    		<a href="javascript:void(0)">
								      			<img id="product_season_img_3"  class="d-block w-100" alt="Third slide" height="400" name="season_img">
								      		</a>
								      		<!-- 라벨 -->
								      		<div class="position-absolute" style="top:0px; background-color:#ffcd16; width:80px; height:80px;">
												<h5 style="color:white; line-height:80px; text-align:center;">계절메뉴</h5>
											</div>
											<!-- 상품이름 / 가격 -->
											<div class="position-absolute" style="bottom:0px; width:100%; height:60px; 
														background-color: rgba(0,0,0,.7); opacity:0.8;">
												<p id="product_season_title_3" style="color:white; padding:5px; margin:0px;"></p>
												<p id="product_season_price_3" style="color:white; padding-left:5px; font-weight:800"></p>
											</div>
											<div class="position-absolute" style="height:60px; bottom:0px; right:0px;">
								   		 		<a href="javascript:void(0)" name="season_btn">
								   		 			<img src="/imgs/main-img/shopping-cart.png" height="35" width="35" 
								   		 		  	    style="margin-top:11px; margin-right:8px;">
								   		 		</a>
								   		 	</div>
								   	 	</div>
									</div>
									
								  	<a class="carousel-control-prev" href="#carouselExampleControls4" role="button" data-slide="prev"
								  	   style="height:200px; top:25%;">
								    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    	<span class="sr-only">Previous</span>
								  	</a>
								  	<a class="carousel-control-next" href="#carouselExampleControls4" role="button" data-slide="next"
								  	   style="height:200px; top:25%;">
								    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
								    	<span class="sr-only">Next</span>
								  	</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 추천 이벤트 이미지 슬라이드 끝 -->
					<br><br><br><br><br>
				</div>
				<!-- 추천 이벤트 끝  -->
				
				<script>
					$(document).ready(function() {
						// 메인 페이지에서 장바구니 담을시 무조건 1개씩
						var basketQuantity = 1;
						// 초특가
						var saleProductNoArr = [];
						var saleImgArr = [];
						// 신상품
						var newProductNoArr  = [];
						var newImgArr = [];
						
						// 매진임박
						var soldProductNoArr = [];
						var soldImgArr = [];
						
						// 계절메뉴
						var seasonProductNoArr = [];
						var seasonImgArr = [];
						
						// 초특가
						$.ajax({
							url : "/productServlet",
							type : "post",
							success : function(data) {
								var keys = Object.keys(data);
								
								// data[키] 형태로 사용해야 함
								for (var i = 0; i < keys.length; i++) {
									$('#product_img_' + (i + 1)).attr("src", data[i].product_1st_pic);
									$('#product_sale_title_' + (i + 1)).html(data[i].product_name);
									$('#product_sale_price_' + (i + 1)).html(data[i].product_price+"원");
									
									saleImgArr.push(data[i].product_1st_pic);
									saleProductNoArr.push(data[i].product_no);
								}
								
								var imgs = $('[name=sale_img]');
								var saleBtn = $('[name=sale_btn]');
								
								$('[name=sale_img]').each(function(index) {
										
									var index2 = index;
									$(this).click(function() {
										if ($(this).attr("src") == saleImgArr[index2]) {
											var productNo = saleProductNoArr[index2];
											location.href = "/productDetail?productNo=" + productNo;
										}
									});
								})
								
								// 장바구니 클릭 시 장바구니 담기기
								$('[name=sale_btn]').each(function(index) {
										
									var index2 = index;
									
									$(this).click(function() {
										<%if(m!=null){%>
										var productNo = saleProductNoArr[index2];
										
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
										<%}else{%>
											alert("로그인이 필요합니다!");
										<%}%>
									});
								})
							},
							error : function() {
								console.log("실패");
							}
						});
						
						// 새 상품
						$.ajax({
							url : "/newProductServlet",
							type : "post",
							success : function(data) {
								var keys = Object.keys(data);
								// data[키] 형태로 사용해야 함
								for (var i = 0; i < keys.length; i++) {
									$('#product_new_img_' + (i + 1)).attr("src", data[i].product_1st_pic);
									$('#product_new_title_' + (i + 1)).html(data[i].product_name);
									$('#product_new_price_' + (i + 1)).html(data[i].product_price+"원");
									
									newImgArr.push(data[i].product_1st_pic);
									newProductNoArr.push(data[i].product_no);
								}
								
								var imgs = $('[name=new_img]');
								
								$('[name=new_img]').each(function(index) {
										
									var index2 = index;
					
									$(this).click(function() {
										if ($(this).attr("src") == newImgArr[index2]) {
											var productNo = newProductNoArr[index2];
											location.href = "/productDetail?productNo=" + productNo;
										}
									});
								});
								
								// 장바구니 클릭 시 장바구니 담기기
								$('[name=new_btn]').each(function(index) {
										
									var index2 = index;
					
									$(this).click(function() {
										<%if(m!=null){%>
										var productNo = newProductNoArr[index2];
										
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
										<%}else{%>
											alert("로그인이 필요합니다.");
										<%}%>
									});
								});
								
								
							},
							error : function() {
								console.log("실패");
							}
						});
						
						// 매진임박
						$.ajax({
							url : "/imminentServlet",
							type : "post",
							success : function(data) {
								var keys = Object.keys(data);
								
								// data[키] 형태로 사용해야 함
								for (var i = 0; i < keys.length; i++) {
									$('#product_imminent_img_' + (i + 1)).attr("src", data[i].product_1st_pic);
									$('#product_sold_title_' + (i + 1)).html(data[i].product_name);
									$('#product_sold_price_' + (i + 1)).html(data[i].product_price+"원");
									
									soldImgArr.push(data[i].product_1st_pic);
									soldProductNoArr.push(data[i].product_no);
								}
								
								var imgs = $('[name=sold_img]');
								
								$('[name=sold_img]').each(function(index) {
										
									var index2 = index;
					
									$(this).click(function() {
										if ($(this).attr("src") == soldImgArr[index2]) {
											var productNo = soldProductNoArr[index2];
											location.href = "/productDetail?productNo=" + productNo;
										}
									});
								});
								
								// 장바구니 클릭 시 장바구니 담기기
								$('[name=sold_btn]').each(function(index) {
										
									var index2 = index;
					
									$(this).click(function() {
										<%if(m!=null){%>
										var productNo = soldProductNoArr[index2];
										
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
										<%}else{%>
											alert("로그인이 필요합니다.");
										<%}%>
									});
								});
							},
							error : function() {
								console.log("실패");
							}
						});
						
						// 계절상품
						$.ajax({
							url : "/seasonServlet",
							type : "post",
							success : function(data) {
								var keys = Object.keys(data);
								
								// data[키] 형태로 사용해야 함
								for (var i = 0; i < keys.length; i++) {
									$('#product_season_img_' + (i + 1)).attr("src", data[i].product_1st_pic);
									$('#product_season_title_' + (i + 1)).html(data[i].product_name);
									$('#product_season_price_' + (i + 1)).html(data[i].product_price+"원");
									
									seasonImgArr.push(data[i].product_1st_pic);
									seasonProductNoArr.push(data[i].product_no);
								}
								
								var imgs = $('[name=season_img]');
								
								$('[name=season_img]').each(function(index) {
										
									var index2 = index;
					
									$(this).click(function() {
										if ($(this).attr("src") == seasonImgArr[index2]) {
											var productNo = soldProductNoArr[index2];
											location.href = "/productDetail?productNo=" + productNo;
										}
									});
								});
								
								// 장바구니 클릭 시 장바구니 담기기
								$('[name=season_btn]').each(function(index) {
									
									var index2 = index;
									
									$(this).click(function() {
										<%if(m!=null){%>
										var productNo = seasonProductNoArr[index2];
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
										<%}else{%>
											alert("로그인이 필요합니다.");
										<%}%>
									});
								})
							},
							error : function() {
								console.log("실패");
							}
						});
					});
				</script>
				

				<!-- 레시피 검색 -->
				<div id="search" class="col-md-12"
					style="background-color: #e66768; padding: 0px;">
					<div class="col-md-8 mx-auto text-center">
						<br> <br> <br>
						<h3 style="color: white;">냉장고를 부탁해!</h3>
						<h1 style="color: yellow; font-weight: 800">내가 가진 재료로 레시피 추천받기</h1>
						<br>
						<fieldset>
							<div class="col-md-8 input-group mb-3 mx-auto">
								<input type="text" class="form-control" id="material"
									name="searchVal" placeholder="재료명으로 검색하세요."
									aria-label="Recipient's username"
									aria-describedby="basic-addon2" style="width: 150px;">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										onclick="search();">
										<img src="/imgs/icons/search.svg">
									</button>
								</div>
							</div>
						</fieldset>
					</div>
					<br> <br> <br>
				</div>

				<script>
					function search() {
						var searchVal = $('#material').val();
						location.href = "/recipeList?cate1=0&cate2=0&cate3=0&cate4=0&search=" + searchVal;
					}
				</script>
				<!-- 레시피 검색 끝 -->

				<br> <br> <br> <br> <br>

				<!-- 이주의 레시피 뷰 -->
				<div class="col-md-8 mx-auto height_auto" style="padding: 0px;">
					
					<div class="col-md-12" id="md-wrap">
						<div id="title-header">
							<h1 style="font-weight: 800">이주의 레시피</h1>
						</div>
					</div>
					
					<div class="col-md-12">
						<ul style="paiddng: 0px;">
							<div class="row">
								<!-- 1번 째  -->
								<li class="col-md-3 vm_list">
									<div class="sp_box b1" style="border: 1px solid #dadada; height: 443px;">
									
										<!-- 레시피 이미지 -->
										<a href="javascript:void(0)" id="week_link_1"> 
											<img id="week_img_1" class="img col-md-12 col-sm-12" name="week_img"
											style="padding: 0px;" alt="이미지" height="300" class="img-thumbnail">
										</a>
										
										<!-- 사용자 이미지 -->
										<img class="rounded-circle img-fluid d-block mx-auto" id="week_user_img_1" src="" alt="" 
											 style="position:absolute; width: 50px; height: 50px; top:270px; left: 50%; transform: translateX(-50%);">
											 
										<!-- 사용자 아이디 -->	 
										<p id="week_user_1" style="text-align:center; margin:0px; position:absolute; width: 50px; 
										          height: 20px; top:320px; left: 50%; transform: translateX(-50%);"></p>
										          
										<div class="col-md-12" style="padding: 0px;">
											<br>
											<!-- 제목 -->
											<p id="week_title_1" style="padding: 5px; padding-top: 15px; font-weight:500; text-align:center;" class="lead my-1"></p>
											
											<div class="col-md-12" style="padding: 0px; padding-top: 31px;">
												<div class="row" style="margin: 0px;">
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada; padding: 0px;">
														<p id="week_time_1" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="week_level_1" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="week_view_1" style="padding-left: 5px; line-height: 40px; text-align: center; color:#bebebe;">
															<img src="/imgs/main-img/like.png" width="20" height="16" style="padding-bottom:2px;">
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								
								<!-- 2번 째 -->
								<li class="col-md-3 vm_list">
									<div class="sp_box b1" style="border: 1px solid #dadada; height: 443px;">
										<a href="javascript:void(0)" id="week_link_2"> 
											<img id="week_img_2" class="img col-md-12 col-sm-12" name="week_img"
											  style="padding: 0px;" alt="이미지" height="300" class="img-thumbnail">
										</a>
										
										<!-- 사용자 이미지 -->
										<img class="rounded-circle img-fluid d-block mx-auto" id="week_user_img_2" src="" alt="" 
											 style="position:absolute; width: 50px; height: 50px; top:270px; left: 50%; transform: translateX(-50%);">
											 
										<!-- 사용자 아이디 -->	 
										<p id="week_user_2" style="text-align:center; margin:0px; position:absolute; width: 50px; 
										          height: 20px; top:320px; left: 50%; transform: translateX(-50%);"></p>
										
										<div class="col-md-12" style="padding: 0px;">
											<br>
											<p id="week_title_2" style="padding: 5px; padding-top: 15px; font-weight:500; text-align:center;" class="lead my-1"></p>
											
											<div class="col-md-12" style="padding: 0px; padding-top: 31px;">
												<div class="row" style="margin: 0px;">
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada; padding: 0px;">
														<p id="week_time_2" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="week_level_2" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="week_view_2" style="padding-left: 5px; line-height: 40px; text-align: center; color:#bebebe;">
															<img src="/imgs/main-img/like.png" width="20" height="16" style="padding-bottom:2px;">
														</p>
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</li>
								
								<!-- 3번 째 사진 -->
								<li class="col-md-3 vm_list">
									<div class="sp_box b1" style="border: 1px solid #dadada; height: 443px;">
										<a href="javascript:void(0)" id="month_link_3"> 
											<img id="week_img_3" class="img col-md-12 col-sm-12" name="week_img"
											  style="padding: 0px;" alt="이미지" height="300" class="img-thumbnail">
										</a>
										<!-- 사용자 이미지 -->
										<img class="rounded-circle img-fluid d-block mx-auto" id="week_user_img_3" src="" alt="" 
											 style="position:absolute; width: 50px; height: 50px; top:270px; left: 50%; transform: translateX(-50%);">
											 
										<!-- 사용자 아이디 -->	 
										<p id="week_user_3" style="text-align:center; margin:0px; position:absolute; width: 50px; 
										          height: 20px; top:320px; left: 50%; transform: translateX(-50%);"></p>
										
										<div class="col-md-12" style="padding: 0px;">
											<br>
											<p id="week_title_3" style="padding: 5px; padding-top: 15px; font-weight:500; text-align:center;" class="lead my-1"></p>
											<div class="col-md-12" style="padding: 0px; padding-top: 12px;">
												<div class="row" style="margin: 0px;">
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada; padding: 0px;">
														<p id="week_time_3" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="week_level_3" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="week_view_3" style="padding-left: 5px; line-height: 40px; text-align: center; color:#bebebe;">
															<img src="/imgs/main-img/like.png" width="20" height="16" style="padding-bottom:2px;">
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								
								<!-- 4번 째 사진 -->
								<li class="col-md-3 vm_list">
									<div class="sp_box b1" style="border: 1px solid #dadada; height: 443px;">
										<a href="javascript:void(0)" id="week_link_4"> 
											<img id="week_img_4" class="img col-md-12 col-sm-12" name="week_img"
											style="padding: 0px;" alt="이미지" height="300" class="img-thumbnail">
										</a>
										
										<!-- 사용자 이미지 -->
										<img class="rounded-circle img-fluid d-block mx-auto" id="week_user_img_4" src="" alt="" 
											 style="position:absolute; width: 50px; height: 50px; top:270px; left: 50%; transform: translateX(-50%);">
											 
										<!-- 사용자 아이디 -->	 
										<p id="week_user_4" style="text-align:center; margin:0px; position:absolute; width: 50px; 
										          height: 20px; top:320px; left: 50%; transform: translateX(-50%);"></p>

										<div class="col-md-12" style="padding: 0px;">
											<br>
											<!-- 타이틀 바  -->
											<p id="week_title_4" style="padding: 5px; padding-top: 15px; text-align:center; font-weight:500;" class="lead my-1"></p>
											
											<div class="col-md-12" style="padding: 0px; padding-top: 12px;">
												<div class="row" style="margin: 0px;">
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada; padding: 0px;">
														<p id="week_time_4" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="week_level_4" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="week_view_4" style="padding-left: 5px; line-height: 40px; text-align: center; color:#bebebe;">
															<img src="/imgs/main-img/like.png" width="20" height="16" style="padding-bottom:2px;">
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
							</div>
						</ul>
					</div>
				</div>

				<script>
				/* 조회수 증가 */
				/* 레시피 받아오기 */
					$(document).ready(function() {
						var recipeImgArr = [];
						var recipeNoArr = [];
						var weekUserNoArr = [];
						
						$.ajax({
							url : "/recipeServlet",
							type : "post",
							success : function(data) {
								var keys = Object.keys(data);
				
								// data[키] 형태로 사용해야 함
								for (var i = 0; i < keys.length; i++) {
									$('#week_img_' + (i + 1)).attr("src", data[i].recipe_pic);
									$('#week_title_' + (i + 1)).html(data[i].recipe_title);
									$('#week_view_' + (i + 1)).append(data[i].recipe_week);
									$('#week_time_' + (i + 1)).append(data[i].cook_time);
									$('#week_level_' + (i + 1)).append(data[i].cook_level);
				
									recipeImgArr.push(data[i].recipe_pic);
									recipeNoArr.push(data[i].recipe_no);
									weekUserNoArr.push(data[i].member_no);
								}
								var imgs = $('[name=week_img]');
				
								$('[name=week_img]').each(function(index) {
									var index2 = index;
				
									$(this).click(function() {
										if ($(this).attr("src") == recipeImgArr[index2]) {
											var recipeNo = recipeNoArr[index2];
											location.href = "/upView?recipe_no=" + recipeNo;
										}
									});
								})
							},
							error : function() {
								console.log("실패");
							}
						});
						
						$.ajax({
							url : "/memberRecipe",
							type : "post",
							success : function(data) {
								
								var keys2 = Object.keys(data);
								
								// data[키] 형태로 사용해야 함
								for (var i=0; i < keys2.length; i++) {
									for(var j=0; j<keys2.length; j++){
										if(weekUserNoArr[i] == data[j].member_no){
											$('#week_user_' + (i + 1)).html(data[j].nickname);
											$('#week_user_img_' + (i + 1)).attr("src", data[j].profile);
										}
									}
								}
							},
							error : function() {
								console.log("실패");
							}
						});
					});
				</script>

				<br> <br> <br> <br>

				<!-- 이달의 레시피 뷰  -->
				<div class="col-md-8 mx-auto height_auto" style="padding: 0px;">

					<div class="col-md-12" id="md-wrap">
						<div id="title-header">
							<h1 style="font-weight: 800">이달의 레시피</h1>
						</div>
					</div>

					<div class="col-md-12">
						<ul style="paiddng: 0px;">
							<div class="row">
							
								<!-- 1번 째  -->
								<li class="col-md-3 vm_list">
									<div class="sp_box b1" style="border: 1px solid #dadada; height: 443px;">
										<a href="javascript:void(0)" id="month_link_1"> 
											<img id="month_img_1" class="img col-md-12 col-sm-12" name="month_img"
											style="padding: 0px;" alt="이미지" height="300" class="img-thumbnail">
										</a>
										<!-- 사용자 이미지 -->
										<img class="rounded-circle img-fluid d-block mx-auto" id="month_user_img_1" src="" alt="" 
											 style="position:absolute; width: 50px; height: 50px; top:270px; left: 50%; transform: translateX(-50%);">
											 
										<!-- 사용자 아이디 -->	 
										<p id="month_user_1" style="text-align:center; margin:0px; position:absolute; width: 50px; 
										          height: 20px; top:320px; left: 50%; transform: translateX(-50%);"></p>
										
										<div class="col-md-12" style="padding:0px;">
											<br>
											<p id="month_title_1" style="padding: 5px; padding-top:15px; text-align:center; font-weight:500;" class="lead my-1"></p>
											
											<div class="col-md-12" style="padding: 0px; padding-top:31px;">
												<div id="month-option" class="row" style="margin: 0px;">
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada; padding: 0px;">
														<p id="month_time_1" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="month_level_1" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="month_view_1" style="padding-left: 5px; line-height: 40px; text-align: center; color:#bebebe;">
															<img src="/imgs/main-img/like.png" width="20" height="16" style="padding-bottom:2px;">
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								
								<!-- 2번 째 -->
								<li class="col-md-3 vm_list">
									<div class="sp_box b1" style="border: 1px solid #dadada; height: 443px;">
										<a href="javascript:void(0)" id="month_link_2"> 
											<img id="month_img_2" class="img col-md-12 col-sm-12" name="month_img"
											  style="padding: 0px;" alt="이미지" height="300" class="img-thumbnail">
										</a>
										<!-- 사용자 이미지 -->
										<img class="rounded-circle img-fluid d-block mx-auto" id="month_user_img_2" src="" alt="" 
											 style="position:absolute; width: 50px; height: 50px; top:270px; left: 50%; transform: translateX(-50%);">
										<!-- 사용자 아이디 -->	 
										<p id="month_user_2" style="text-align:center; margin:0px; position:absolute; width: 50px; 
										    height: 20px; top:320px; left: 50%; transform: translateX(-50%);"></p>
											 
										<div class="col-md-12" style="padding: 0px;">
											<br>
											<p id="month_title_2" style="padding: 5px; padding-top:15px; text-align:center; font-weight:500;" class="lead my-1"></p>
											<div class="col-md-12" style="padding: 0px; padding-top: 31px;">
												<div id="month-option" class="row" style="margin: 0px;">
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada; padding: 0px;">
														<p id="month_time_2" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="month_level_2" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="month_view_2" style="padding-left: 5px; line-height: 40px; text-align: center; color:#bebebe;">
															<img src="/imgs/main-img/like.png" width="20" height="16" style="padding-bottom:2px;">
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								
								<!-- 3번 째 사진 -->
								<li class="col-md-3 vm_list">
									
									<div class="sp_box b1" style="border: 1px solid #dadada; height: 443px;">
										<a href="javascript:void(0)" id="month_link_3"> 
											<img id="month_img_3" class="img col-md-12 col-sm-12" name="month_img"
											  style="padding: 0px;" alt="이미지" height="300" class="img-thumbnail">
										</a>
										
										<!-- 사용자 이미지 -->
										<img class="rounded-circle img-fluid d-block mx-auto" id="month_user_img_3" src="" alt="" 
											 style="position:absolute; width: 50px; height: 50px; top:270px; left: 50%; transform: translateX(-50%);">
											 
										<!-- 사용자 아이디 -->	 
										<p id="month_user_3" style="text-align:center; margin:0px; position:absolute; width: 50px; 
										   height: 20px; top:320px; left: 50%; transform: translateX(-50%);"></p>
										
										<div class="col-md-12" style="padding: 0px;">
											<br>
											<p id="month_title_3" style="padding: 5px; padding-top:15px; text-align:center; font-weight:500;" class="lead my-1"></p>
											
											<div class="col-md-12" style="padding: 0px; padding-top: 31px;">
												<div id="month-option" class="row" style="margin: 0px;">
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada; padding: 0px;">
														<p id="month_time_3" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="month_level_3" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="month_view_3" style="padding-left: 5px; line-height: 40px; text-align: center; color:#bebebe;">
															<img src="/imgs/main-img/like.png" width="20" height="16" style="padding-bottom:2px;">
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								
								<!-- 4번 째 사진 -->
								<li class="col-md-3 vm_list">
									<div class="sp_box b1" style="border: 1px solid #dadada; height: 443px;">
										<a href="javascript:void(0)" id="month_link_4"> 
											<img id="month_img_4" class="img col-md-12 col-sm-12" name="month_img"
											style="padding: 0px;" alt="이미지" height="300" class="img-thumbnail">
										</a>
										
										<!-- 사용자 이미지 -->
										<img class="rounded-circle img-fluid d-block mx-auto" id="month_user_img_4" src=""
											 style="position:absolute; width: 50px; height: 50px; top:270px; left: 50%; transform: translateX(-50%);background-color:white;">
										<!-- 사용자 아이디 -->	 
										
										<p id="month_user_4" style="text-align:center; margin:0px; position:absolute; width: 50px; 
										          height: 20px; top:320px; left: 50%; transform: translateX(-50%);"></p>
											 
										<div class="col-md-12" style="padding: 0px;">
											<br>
											<p id="month_title_4" style="padding: 5px; padding-top:15px; text-align:center; font-weight:500; "class="lead my-1"></p>
											<div class="col-md-12" style="padding: 0px; padding-top: 12px;">
												<div id="month-option" class="row" style="margin: 0px;">
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada; padding: 0px;">
														<p id="month_time_4" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="month_level_4" style="line-height: 40px; text-align: center; color:#bebebe;"></p>
													</div>
													<div class="col-md-4" style="height: 40px; border: 1px solid #dadada;">
														<p id="month_view_4" style="padding-left: 5px; line-height: 40px; text-align: center; color:#bebebe;">
															<img src="/imgs/main-img/like.png" width="20" height="16" style="padding-bottom:2px;">
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
							</div>
						</ul>
					</div>
				</div>
				
				<!-- 레시피 받아오기 -->
				<script>
					$(document).ready(function() {
						var recipeImgArr = [];
						var recipeNoArr = [];
						var monthUserNoArr = [];
						
						$.ajax({
							url : "/monthlyRecipe",
							type : "post",
							success : function(data) {
								var keys = Object.keys(data);
								// data[키] 형태로 사용해야 함
								for (var i = 0; i < keys.length; i++) {
									$('#month_img_' + (i + 1)).attr("src", data[i].recipe_pic);
									$('#month_title_' + (i + 1)).html(data[i].recipe_title);
									$('#month_view_' + (i + 1)).append(data[i].recipe_month);
									$('#month_time_' + (i + 1)).append(data[i].cook_time);
									$('#month_level_' + (i + 1)).append(data[i].cook_level);
									
									recipeImgArr.push(data[i].recipe_pic);
									recipeNoArr.push(data[i].recipe_no);
									monthUserNoArr.push(data[i].member_no);
								}
								$('[name=month_img]').each(function(index) {
				
									var index2 = index;
				
									$(this).click(function() {
										if ($(this).attr("src") == recipeImgArr[index2]) {
											var recipeNo = recipeNoArr[index2];
											location.href = "/upView?recipe_no=" + recipeNo;
										}
									});
				
								})
							},
							error : function() {
								console.log("실패");
							}
						});
						
						// 에이작스로 
						// 사진 경로와 멤버 이름을 가져오기
						/* 에이작스로 받아오기 */
						$.ajax({
							url : "/memberRecipe",
							type : "post",
							success : function(data) {
								
								var keys2 = Object.keys(data);
								
								// data[키] 형태로 사용해야 함
								for (var i=0; i < keys2.length; i++) {
									for(var j=0; j<keys2.length; j++){
										if(monthUserNoArr[i] == data[j].member_no){
											$('#month_user_' + (i + 1)).html(data[j].nickname);
											$('#month_user_img_' + (i + 1)).attr("src", data[j].profile);
										}
									}
								}
							},
							error : function() {
								console.log("실패");
							}
						});
					});
				</script>
				<!-- 이달의 레시피 끝 -->
				<br> <br> <br>

				<!-- 수상한 레시피 혜택 -->
				<div id="plus" class="col-md-12">
					<div class="col-md-8 mx-auto" style="padding: 0px;">

						<div class="row" id="plus-background"
							style="padding: 0px; background-color: #f6f7f7;">

							<div class="col-md-6 col-sm-6" id="banner1"
								style="line-height: 260px;">
								<a> <img class="col-md-12 col-sm-12" class="img-thumbnail"
									style="padding: 0px;" src="/imgs/main-img/banner.jpg" alt="이미지"
									height="180">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner2"
								style="line-height: 260px;">
								<a> <img class="col-md-12 col-sm-12" class="img-thumbnail"
									style="padding: 0px;" src="/imgs/main-img/banner2.jpg"
									alt="이미지" height="180">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner3"
								style="line-height: 260px;">
								<a> <img class="col-md-12 col-sm-12" class="img-thumbnail"
									style="padding: 0px;" src="/imgs/main-img/banner3.jpg"
									alt="이미지" height="180">
								</a>
							</div>

							<div class="col-md-2 col-sm-2" id="banner3"
								style="line-height: 260px;">
								<a> <img class="col-md-12 col-sm-12" class="img-thumbnail"
									style="padding: 0px;" src="/imgs/main-img/banner3.jpg"
									alt="이미지" height="180">
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 수상한 레시피 혜택 끝 -->

				<br> <br> <br>

				<!-- 푸터 -->
				<div id="footer"
					class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0"
					style="border: 1px solid black; padding: 10px;"></div>
				<!-- 푸터 끝 -->
			</div>
		</div>
	</div>
</body>
</html>
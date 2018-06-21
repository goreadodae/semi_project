<!-- 폰트 적용중 -->
<link href="https://fonts.googleapis.com/css?family=Hi+Melody" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//cdn.jsdelivr.net/font-iropke-batang/1.2/font-iropke-batang.css">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "member.model.vo.*"%>
	
<% Member m = (Member)session.getAttribute("user"); %>

<%
	String presentURI = request.getRequestURI();
	String beforeURI = request.getHeader("referer");	// 로그인 할 때 필요함
%>
<!DOCTYPE html>
<html>
<head>
<title>main-Header</title>
<style>
  	#scroll {
            height: 50px;
            margin:0px;
       }
	* { font-family: 'Spoqa Han Sans', 'Sans-serif'; }
	.ellip {
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	/* * { font-family: 'Iropke Batang'} */
</style>
<script>
	var inCategory = false;

	$(document).ready(function() {
		
		/* 네비게이션 고정 */
		var jbOffset = $('#fixed_layer').offset();
		var jbOffset2 = $('#category_list').offset();
		
		
		$(window).scroll(function() {
			
			if ($(document).scrollTop() >= jbOffset.top) {
				/* 상단 고정하고 */
				$('#fixed_layer').addClass('jbFixed');
				$('#category_list').addClass('clFixed');			

			} else {
				$('#fixed_layer').removeClass('jbFixed');
				$('#category_list').removeClass('clFixed');	
			}
		});

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
				/* 카테고리 호버일 때 */
				$('#category_list').hover(function(e) {
					if ($(e.target).is('.category-text')
						|| $(e.target).is('.header')
						|| $(e.target).is('#category_list')) {
						$('#category_list').css('display', 'block');
					}
				});
				/* 마우스가 떠날 때 */
				$('#category_list').mouseleave(function(e) {
					if (!$(e.target).is('.category-text')
						|| !$(e.target).is('.header')
						|| !$(e.target).is('#category_list')) {
						$('#category_list').css('display', 'none');
					}
				});
				/* 마우스가 떠날 때 */
				$('#div-category').mouseleave(function(e) {
					if (!$(e.target).is('.category-text')
						|| !$(e.target).is('.header')
						|| !$(e.target).is('#category_list')) {
						$('#category_list').css('display', 'none');
					}
				});
			}
		});
	});
</script>
</head>

<body>
	<!-- 해더 시작 -->
	<div class="header">
		<!-- 팝업창 -->
		<div id="top-message" class="col-md-12" style="display:none;">
			<div id="top-message-text" class="col-md-6 col-sm-6 col-4">
				<!-- 로그인 주소 -->
				<a href="/views/memberPage/membershipPage.html">
					<div>
						<p id="top-message-notice">
							지금 가입하시면 이벤트 혜택이 2배 >
						</p>
					</div>
				</a>
			</div>
			<div id="top-message-close" class="col-md-8 col-sm-8 col-8 mx-auto nav justify-content-end">
				<button type="button" class="close" id="top-message-close-btn" aria-label="close" 
						onclick="closePopupNotToday()">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</div>
		<!-- 팝업창 끝-->
		
		<!-- 팝업창 쿠키  -->
		<script>
			/* 1. 쿠키 만들기 */
			function setCookie(name, value, expiredays) {
				var today = new Date();
			   	today.setDate(today.getDate() + expiredays);
			    document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
			}
			
			/* 2. 쿠키 가져오기 */
			function getCookie(name) { 
   				var cName = name + "="; 
    			var x = 0; 
    			while (x <= document.cookie.length) { 
    				
        			var y = (x+cName.length); 
        			
        			if(document.cookie.substring( x, y ) == cName ) 
        			{ 
            			if((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                			endOfCookie = document.cookie.length;
            			return unescape( document.cookie.substring( y, endOfCookie )); 
       			 	} 
        			
        			x = document.cookie.indexOf( " ", x ) + 1; 
        			
        			if ( x == 0 ) 
           				break; 
   					} 
    			
    			return ""; 
			} 
			
			/* 3. 오늘하루 그만보기 */
			function closePopupNotToday(){	             
				setCookie('notToday','Y', 1);
				$("#top-message").hide();
			}
			
			/* 4. 띄우기 */
			$(window).ready(function(){
				if(getCookie("notToday")!="Y"){
					$("#top-message").show();
				} 
			});
		</script>
		<!-- 팝업창 쿠키 끝-->
		
		<!-- 실시간 검색어  -->
		<script type="text/javascript">
	        function textScroll(scroll_el_id) {
	            this.objElement = document.getElementById(scroll_el_id);
	            this.objElement.style.position = 'relative';
	            this.objElement.style.overflow = 'hidden';
	
	            this.objLi = this.objElement.getElementsByTagName('li');
	            this.height = this.objElement.offsetHeight; // li 엘리먼트가 움직이는 높이(외부에서 변경가능)
	            this.num = this.objLi.length; // li 엘리먼트의 총 갯수
	            this.totalHeight = this.height * this.num; // 총 높이
	            this.scrollspeed = 2; // 스크롤되는 px
	            this.objTop = new Array(); // 각 li의 top 위치를 저장
	            this.timer = null;
	
	            for (var i = 0; i < this.num; i++) {
	                this.objLi[i].style.position = 'absolute';
	                this.objTop[i] = this.height * i;
	                this.objLi[i].style.top = this.objTop[i] + "px";
	            }
	        }
	
	        textScroll.prototype.move = function () {
	            for (var i = 0; i < this.num; i++) {
	                this.objTop[i] = this.objTop[i] - this.scrollspeed;
	                this.objLi[i].style.top = this.objTop[i] + "px";
	            }
	            if (this.objTop[0] % this.height == 0) {
	                this.jump();
	            } else {
	                clearTimeout(this.timer);
	                this.timer = setTimeout(this.name + ".move()", 50);
	            }
	        }
	
	        textScroll.prototype.jump = function () {
	            for (var i = 0; i < this.num; i++) {
	                if (this.objTop[i] == this.height * (-2)) {
	                    this.objTop[i] = this.objTop[i] + this.totalHeight;
	                    this.objLi[i].style.top = this.objTop[i] + "px";
	                }
	            }
	            clearTimeout(this.timer);
	            this.timer = setTimeout(this.name + ".move()", 3000);
	        }
	
	        textScroll.prototype.start = function () {
	            this.timer = setTimeout(this.name + ".move()", 3000);
	        }
    	</script>
		<!-- 실시간 검색어 끝-->
		
		<!-- 최상단 -->
		<div class="col-md-8 mx-auto" id="userMenu" style="padding:0px;">
			<ul class="nav justify-content-end">
				<li class="nav-item text-center">
					<a class="nav-link" href="/views/memberPage/membershipPage.jsp" style="padding-right:10px;">
						회원가입
					</a>
				</li>
				<%if(m==null){ %>
				<li class="nav-item">
					<a class="nav-link" href="/views/memberPage/loginPage.jsp" style="padding-right:10px;">
						로그인
					</a>
				</li>
				<%}else{%>
				<li class="nav-item">
					<a class="nav-link" href="/logout?recentURI=<%=presentURI%>" style="padding-right:10px;">
						로그아웃
					</a>
				</li>
				<%}%>
				<li class="nav-item">
				<!-- 고객센터 경로 변경했어 지수야 -->
					<a class="nav-link" href="/noticeList" style="padding-right:10px;">
						고객센터
					</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="/basketSelect" style="padding-right:10px;">
						장바구니
					</a>
				</li>
			</ul>
		</div>
		<!-- 최상단 끝 -->
		<!-- 해더 브랜드 이미지-->
		<div class="col-8 mx-auto">
			<div class="text-center" style="background-color: white;">
				<div class="row">
					<!-- 애니메이션  -->
					<div class="col-md-2" style="padding: 0px;">
						<img id="header-ani" src="https://res.kurly.com/pc/img/1805/delivery_180524_2.gif">
					</div>
					
					<!-- 브랜드 로고  -->
					<div class="col-md-8">
						<a id="brand-logo-link" href="http://localhost/index.jsp">
							<h1 id="brandLogo">수상한레시피</h1>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 해더 브랜드 이미지 끝-->

		<!-- 네비게이션 -->
		<div class="nav-scroller border-right-0 border-left-0" id="fixed_layer">
			<div class="col-md-8 mx-auto" id="navi">
				<div class="row">
					<div class="col-md-2 col-sm-2 col-4" id="div-category">
						<a class="nav-category" id="a-category" href="#">
							<img src="/imgs/main-img/ico_gnb_all.jpg">
							<span id="category-text">카테고리</span>
						</a>
					</div>

					<div class="col-md-2 col-sm-2 col-4" id="div-receipe">
						<a class="nav-category" href="/recipeList?cate1=0&cate2=0&cate3=0&cate4=0">레시피</a>
					</div>

					<div class="col-md-2 col-sm-2 col-4">
						<a class="nav-category" href="/views/rankingPage/rankingPage.jsp">랭킹</a>
					</div>


					<div class="col-md-2 col-sm-2 col-4">
						<a class="nav-category" href="/productList">상품</a>
					</div>

					<div class="col-md-2">
						<a class="nav-category" href="/views/memberPage/myHomeMainPage.jsp">마이페이지</a>
					</div>
					<%if(m!=null){ %>
					<div class="col-md-2" style="padding:0px;">
						<div class="col-md-12" style="height:50px; border:1px solid #dadada;">
							<div class="row">
								<div class="col-md-4" style="height:50px;">
								</div>
								<div class="col-md-8" style="height:50px; padding:0px;">
									<div style="display:inline-block; width: 100%;">
										<p style="font-size:13px; margin:0px; padding-left:10px; text-align:left;">환영합니다.</p>
									</div>
									<div style="display:inline-block; width:50%; float:left; height:25px;">
										<p style="font-weight:800; font-size:15px; margin:0px; padding-left:10px; text-align:left; float:left;"><%=m.getNickName()%> 님</p>
									</div>
									<div style="display:inline-block; width:50%; height:25px;">
										<a href="/views/memberPage/myHomeMainPage.jsp" style="position:absolute; top:10px; display:block; 
										   text-decoration:underline; color:#878787; font-size:13px;">내정보</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%}else{ %>
					<div class="col-md-2 ellip" style="padding:0px;">
						<ul id="scroll">
	        				<li>
	                			<p style="float:left; line-height:50px; padding-left:5px; color:#00ab33;">1&nbsp;&nbsp;</p>
	            				<a id="scroll_title_1" href="#" style="color:black;">
	            				</a>
	        				</li>
					        <li>
					          	<p style="float:left; line-height:50px; padding-left:5px; color:#00ab33;">2&nbsp;&nbsp;</p>
	            				<a id="scroll_title_2" href="#" style="color:black;">
	            				</a>
					        </li>
					        <li>
					            <p style="float:left; line-height:50px; padding-left:5px; color:#00ab33;">3&nbsp;&nbsp;</p>
	            				<a id="scroll_title_3" href="#" style="color:black;">
	            				</a>
					        </li>
					        <li>
					            <p style="float:left; line-height:50px; padding-left:5px; color:#00ab33;">4&nbsp;&nbsp;</p>
	            				<a id="scroll_title_4" href="#" style="color:black;">
	            				</a>
					        </li>
					        <li>
					           	<p style="float:left; line-height:50px; padding-left:5px; color:#00ab33;">5&nbsp;&nbsp;</p>
	            				<a id="scroll_title_5" href="#" style="color:black;">
	            				</a>
					        </li>
					    </ul>
				    </div>
				    <script>
					$(document).ready(function() {
						$.ajax({
							url : "/monthlyRecipe",
							type : "post",
							success : function(data) {
								var keys = Object.keys(data);
								// data[키] 형태로 사용해야 함
								for (var i = 0; i < keys.length; i++) {
									$('#scroll_title_' +(i + 1)).append(data[i].recipe_title);
									$('#scroll_title_' +(i + 1)).attr("href", "/upView?recipe_no=" + data[i].recipe_no);
								}
							},
							error : function() {
								console.log("실패");
							}
						});
					});
				</script>
				    
				    
				    <script type="text/javascript">
				        var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
				        real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
				        real_search_keyword.start(); // 스크롤링 시작
				    </script>
					<%} %>
				</div>
			</div>
		</div>
		<!-- 네비게이션 끝 -->


		<!-- 전체 카테고리 -->
		<div class="position-absolute col-md-12" id="t_category_list" style="padding: 0px;">
			<div class="col-md-8 mx-auto" id="category_list">
			
				<!-- 1번 칼럼  -->
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
					<li class="header2">
						<a href="#" id="title-1" class="category-text">채소/과일/곡류</a><hr>
					</li>
					<li class="category-text">오늘의 레시피</li>
					<li class="category-text">이달의 레시피</li>
					<li class="category-text">쌀/잡곡</li>
				</ul>

				<!-- 2번 칼럼  -->
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
				</ul>

				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
				</ul>
				
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
				</ul>
				
				<ul class="colum">
					<li class="header">
						<a href="#" id="title-1" class="category-text">종류별</a><hr>
					</li>
					<li class="category-text">채소</li>
					<li class="category-text">과일</li>
					<li class="category-text">쌀/잡곡</li>
					<li class="category-text">견과류</li>
				</ul>
				
				<ul class="colum">
					<li class="header">
						<a href="/views/customerCenterPage/noticePage.jsp" id="title-1" class="category-text" 
						style="text-decoration:none; color:black;">
							고객센터
						</a>
						<hr>
					</li>
					<li class="category-text">
						<a href="/views/customerCenterPage/noticePage.jsp" id="title-1" class="category-text" 
						style="text-decoration:none; color:black;">
							공지사항
						</a>
					</li>
					<li class="category-text">
						<a href="/views/customerCenterPage/noticePage.jsp" id="title-1" class="category-text" 
						style="text-decoration:none; color:black;">
							FAQ
						</a>
					</li>
					<li class="category-text">
						<a href="/views/customerCenterPage/noticePage.jsp" id="title-1" class="category-text" 
						style="text-decoration:none; color:black;">
							1:1 문의
						</a>
					</li>
					<li class="category-text">
						<a href="/views/customerCenterPage/noticePage.jsp" id="title-1" class="category-text" 
						style="text-decoration:none; color:black;">
							상품문의
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 전체 카테고리 끝 -->
	</div>
	<!-- 해더 끝  -->
</body>

</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.model.vo.Member"
   import="member.model.vo.BuyProduct"%>
<%
   Member m = (Member) session.getAttribute("user");
   ArrayList<BuyProduct> p = (ArrayList<BuyProduct>) request.getAttribute("p");
   int count = 1;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Home</title>


<style>
#myPageTop {
   padding-top: 70px;
   margin: 0 auto;
}

#myPageTopUser {
   border: 2px solid #dddfe1;
   height: 180px;
}

#userInfo {
   padding: 38px 28px 28px;
   float: left;
   border-right: 2px solid #dddfe1;
   height: 100%;
}

#myPageBottom {
   font-family: 'Noto Sans KR';
   font-weight: 400;
   letter-spacing: 0;
   padding: 70px 0 170px;
}

#menu {
   float: left;
   width: 170px;
}

#menu-title {
   padding: 0 0 30px 2px;
   font: 28px/41px "Noto Sans KR Medium";
   color: #4a4a4a;
}

#menu-border {
   border: 1px solid #dcdbde;
   border-bottom: 0 none;
}

#menu-list li {
   height: 51px;
   border-bottom: 1px solid #dcdbde;
}

#menu-list li  a {
   display: block;
   overflow: hidden;
   padding: 16px 0 16px 19px;
   background: #fff
      url(https://res.kurly.com/pc/ico/1803/ico_arrow_12x22.png) no-repeat
      154px 50%;
   background-size: 6px 10px;
   font-size: 12px;
   color: #514859;
   line-height: 18px;
}

#menu-list li #on {
   background: #f7f5f8
      url(https://res.kurly.com/pc/ico/1803/ico_arrow_on_12x22.png)
      no-repeat 174px 50%;
   background-size: 6px 10px;
   color: #512772;
}

#menu-title {
   padding: 5px 0 24px;
}

#menu-tile h2 {
   height: 42px;
   font: 24px/36px "Noto Sans KR Medium";
   color: #514859;
}

#tbl-order-list {
   width: 100%;
   font-family: 'Noto Sans KR';
   font-size: 14px;
   color: #000;
   letter-spacing: 0;
}

#tbl-order-list th {
   text-align: center;
   padding: 20px 0;
   border-top: 2px solid #512772;
   border-bottom: 2px solid #ddd;
   font-weight: 400;
   font: 14px/20px 'Noto Sans KR Medium';
   color: #514859;
}

#tbl-order-list td {
   text-align: center;
   padding: 20px 40px;
   font-weight: 400;
   font: 14px/20px 'Noto Sans KR Medium';
   color: #514859;
   border-bottom: 1px solid #e9e9e9;
}

#tbl-order-list td label {
   line-height: 114px;
   margin-left: 50px;
   font-size: 12pt;
}

.no_data {
   padding: 50px 0;
   font-size: 13px;
   color: #757575;
   text-align: center;

}

.product_img {
   width: 100px;
   height: 114px;
   float: left;
}

ol, li {
   list-style: none;
}

#nav {
   margin-top:30px;
   width: 500px;
   text-align: center;
}

#nav a {
   display: inline-block;
   padding: 3px 5px;
   margin-right: 10px;
   font-family: Tahoma;
   background: #ccc;
   color: #000;
   text-decoration: none;
}

#nav a.active {
   background: #333;
   color: #fff;
}

.off-screen {
   display: none;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
	
<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
</script>

<!-- 모든 스타일 시트 적용 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<body style="overflow-x: hidden; overflow-y: auto;">
   <!-- 전체 컨테이너  -->
   <div class="container-fluid" style="padding: 0px;">

    <!-- 해더 영역 -->
	<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
	<!-- 헤더 영역 끝 -->

      <!-- 컨텐츠 영역 -->
      <div id="contents" class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0" style="border: 1px solid black; padding: 0;">
         <div class="row" id="myPageBottom">
            <div class="col-md-2" id="menu">
               <h2 id="menu-title">마이 홈</h2>
               <div id="menu-border">
                  <ul id="menu-list">
                  	 <li><a href="/views/memberPage/myHomeMainPage.jsp">내 정보</a></li>
                     <li><a href="/myBuyProduct?userNo=<%=m.getMemberNo()%>">나의 주문내역</a></li>
                      <li><a href="/myRecipe?userNo=<%=m.getMemberNo()%>">나의  레시피</a></li>
                     <li><a href="/myComments?userNo=<%=m.getMemberNo()%>">내가 쓴 댓글</a></li>
                     <li><a href="/views/memberPage/myHomeModifyInfoPage.jsp">개인 정보 수정</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-md-10">
                <div id="menu-title">
                  	<h2>내 정보</h2>
              	</div>
                <div class="container">
				  	<div class="row" style="padding-top:3px;">
				    	<div class="col" style="height:255px; border:1px solid black; padding:10px; margin-right:10px;">
				    		<div>
				    			<h5 style="padding-left:10px; padding-top:20px;">수상한 레시피 프로필</h5>
				    			<img src="<%=m.getProfile()%>" width="110" height="90" style="padding-left:10px;">
				    			<h4 style="padding-left:10px; padding-top:10px;"><%=m.getNickName()%>님</h4>
				    		</div>
				    	</div>
				    	<div class="col" style="height:255px; border:1px solid black; padding:10px; margin-right:10px;">
				    		<h6 style="padding:10px; padding-top:20px; text-align:center;">연락처</h6>
				    		<p>이메일</p>
				    		<p>휴대전화</p>
				    	</div>
				    	<div class="w-120"></div>
				    	<div class="col" style="height:255px; border:1px solid black; padding:10px; margin-right:10px;">
				    		<h6 style="padding:10px; padding-top:20px; text-align:center;">적립금</h6>
				    	</div>
				    	<div class="col" style="height:255px; border:1px solid black; margin-right:10px;">
				    		<h6 style="padding:10px; padding-top:20px; text-align:center;">장바구니</h6>
				    	</div>
				  	</div>
				</div>
               </div>
            </div>
         </div>
   	</div>
      <!-- 푸터 -->
      <div id="footer"
         class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0"
         style="border: 1px solid black; padding: 10px;"></div>
      <!-- 푸터 끝 -->
      </div><br><br>




   <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   <script src="/js/bootstrap.min.js"></script>

</body>
</html>
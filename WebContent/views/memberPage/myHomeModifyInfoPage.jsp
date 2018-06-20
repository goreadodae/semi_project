<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.*"%>
<% Member m = (Member)session.getAttribute("user"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Home</title>
<style>

#myPageTop{
	padding-top: 70px;
	margin: 0 auto;
}
#myPageTopUser{
	border: 2px solid #dddfe1;
	height: 180px;
}
#userInfo{
	padding: 38px 28px 28px;
	float:left;
	border-right: 2px solid #dddfe1;
	height:100%;
}

#myPageBottom{
    font-family: 'Noto Sans KR';
    font-weight: 400;
    letter-spacing: 0;
    padding:70px 0 170px;
}
#menu{
	float:left;
	width:170px;
}
#menu-title{
    padding: 0 0 30px 2px;
    font: 28px/41px "Noto Sans KR Medium";
    color: #4a4a4a;
}
#menu-border{
	border: 1px solid #dcdbde;
    border-bottom: 0 none;
}

#menu-list li{
	height:51px;
	border-bottom: 1px solid #dcdbde;
}

#menu-list li  a{
	display: block;
    overflow: hidden;
    padding: 16px 0 16px 19px;
    background: #fff url(https://res.kurly.com/pc/ico/1803/ico_arrow_12x22.png) no-repeat 154px 50%;
    background-size: 6px 10px;
    font-size: 12px;
    color: #514859;
    line-height: 18px;
}
#menu-list li #on{
    background: #f7f5f8 url(https://res.kurly.com/pc/ico/1803/ico_arrow_on_12x22.png) no-repeat 174px 50%;
    background-size: 6px 10px;
    color: #512772;
}

#menu-title{
	padding: 5px 0 24px;
}

#menu-tile h2{
	height: 42px;
    font: 24px/36px "Noto Sans KR Medium";
    color: #514859;
}

#check-pwd{
    padding: 38px 0 24px;
    border-top: 2px solid #512772;
}

#title-message{
    padding: 20px 0px;
    text-align: center;

}

#field-pwd{
	padding: 33px 0;
    border: 2px solid #ddd;
    text-align: center;
    
}

#userId, #txt-id,#userPwd{
    padding: 10px 0 10px;
    font: 13px/18px "Noto Sans KR Medium";
    color: #000;
}

#ok-btn button{
	display:block
    border: 1px solid #56297a;
    background-color: #795b8f;
    color: #fff;
    font-size: 13px;
    line-height: 40px;
    text-align: center;
    width: 150px;
    height: 42px;
}	
</style>
</head>

<!-- 모든 스타일 시트 적용 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<body style="overflow-x: hidden; overflow-y: auto;">
<!-- 전체 컨테이너  -->
	<div class="container-fluid" style="padding: 0px;">

		<!-- 해더 영역 -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 헤더 영역 끝 -->

		<!-- 컨텐츠 영역 -->
		<div id="contents" class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding:0;">
			<div class="row" id="myPageBottom">
				<div class="col-md-2" id="menu">
					<h2 id="menu-title">마이 홈</h2>
					<div id="menu-border">
						<ul id="menu-list">
							<li><a href="/views/memberPage/myHomeMainPage.jsp">나의 주문내역</a></li>
							<li><a href="/views/memberPage/myHomeRecipePage.jsp">나의 레시피</a></li>
							<li><a href="/views/memberPage/myHomeCommentsPage.jsp ">내가 쓴 댓글</a></li>
							<li><a href="/views/memberPage/myHomeModifyInfoPage.jsp">개인 정보 수정</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-10">
					<div id="menu-title">
						<h2>개인 정보 변경</h2>
					</div>
					<div id="check-pwd">
						<form action="/pwdCheck" method="post">
							<div id="title-message">
								<img src="/imgs/member_img/check-pwd.JPG">
							</div>
							<div id="field-pwd">
								<div id="userId">아이디</div>
								<span id="txt-id"><%= m.getMemberId() %></span>
								<input type="hidden" id="hiddenId" name="id" value=<%=m.getMemberId() %> />
								<div id="userPwd">비밀번호</div>
								<div>
									
									<input type="password" id="txt-pwd" name="password" />
								</div>
							</div>
							<div style="padding-top:20px;" id="ok-btn">
								<center>
									<button type="submit">확인</button>
								</center>
							</div>
								
						</form>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>	
		
		</div>
		
		<!-- 푸터 -->
				<div id="footer"
					class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0"
					style="border: 1px solid black; padding: 10px;"></div>
		<!-- 푸터 끝 -->
	</div>
	
	<script type="text/javascript">
		function check-btn() {
			var id = $('#txt-id').val();
			var password = $('#txt-pwd').val();
			
			$.ajax({
	        	url: "/pwdCheck",
	        	data: {password:password, id : id},
	         	type: "post",
	         	success: function() {
	            	console.log("성공");
	         	},
	         	error: function() {
	            	console.log("실패");
	         	},
	         	complete: function() {
	            	//무조건 실행
	        	 }
	     	});
		}
	</script>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String beforeURI = request.getHeader("referer");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>로그인</title>

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<link rel="stylesheet" href="/css/member_css/loginPage.css">

</head>
<script>
	$(document).ready(function() {
		/* 해더 불러오는 제이쿼리 */
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
</script>

<body style="overflow-x: hidden; overflow-y: auto;">

	<!-- 전체 컨테이너  -->
	<div class="container-fluid" style="padding: 0px;">

		<!-- 해더 영역 -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 헤더 영역 끝 -->
		
		<!-- 컨텐츠 영역 -->
		<br><br>
		<h2 style="font-weight: bold; text-align: center;">로그인</h2>
		<br><br>
		<div id="content-main" class="contents" style="background-color: #f7f5f8">
			<div class="container">
				<div class="col-md-12" id="section">
					<div class="col-md-8 mx-auto">
						<fieldset>
							<form action="/login?beforeURI=<%=beforeURI%>" method="post" id="frm">
								<!-- 아이디 -->
								<div class="col-md-12">
									<p style="float:left; line-height:48px; font-weight:800;">아이디&nbsp;&nbsp;&nbsp;&nbsp;</p>
									<input class="form-control form-login mx-auto" type="text" 
								     placeholder="Your ID" id="loginId" name="loginId" style="width:250px;"><br>
								</div> 
									<!-- 패스워드 -->
								<div class="col-md-12">
									<p style="float:left; line-height:48px; font-weight:800;">비밀번호</p>
									<input class="form-control form-login mx-auto" type="password"
									 placeholder="Your Password" id="loginPwd" name="loginPwd" style="width:250px;">
								</div>
							</form>
							
							<!-- id저장 -->
							<div class="col-md-4 mx-auto" id="noPnoM" style="left:1px;">
								<input type="checkbox" name="saveId"/><label for="saveId">ID저장</label>
							</div>
							
						</fieldset>
					</div>
					
					<div class="col-md-4 mx-auto" style="margin-bottom: 20px; left:39px;">
						<button class="btn btn-primary btn-lg btn-block form-login" 
							    onclick="login();" style="background-color:#795b8f; width:250px;">로그인</button>
					</div>
					<div class="col-md-4 mx-auto" style="margin-bottom: 20px; left:39px;">
						<p style="float:left; padding-right:50px;">
							<a href="/views/memberPage/membershipPage.jsp">회원가입</a>
						</p>
						<p>
							<a href="#">아이디</a>
							<a href="#">비밀번호 찾기</a>
						</p>
					</div>
					<hr>
					<div class="col-md-8 mx-auto">
							<div class="col-md-4 mx-auto" style="right:20px;">
								<button id="naver_id_login" style="border:none;"></button>
							</div>
						</div>
					</div>
				<br>
			</div>
		</div>
		
		<br><br><br><br>
	</div>
	<script type="text/javascript">
		//로그인 버튼
		function login(){
			if($('#loginId').val()==""||$('#loginPwd').val()==""){
				alert("아이디 또는 패스워드를 정확히 입력해주세요.")
				
			}else{
				$('#frm').submit();
			}
		}
		
		//소셜 네이버 로그인
	    var naver_id_login = new naver_id_login("RC6jETK12YcVuQccaXmJ", "http://localhost:1347/index.jsp");
		
	    var state = naver_id_login.getUniqState();
	    naver_id_login.setButton("green", 3, 55);
	    naver_id_login.setDomain("http://localhost:1347/views/memberPage/Login.html");
	    naver_id_login.setState(state);
	    naver_id_login.setPopup();
	    naver_id_login.init_naver_id_login();
	
	    var naver_id_login = new naver_id_login("RC6jETK12YcVuQccaXmJ", "http://localhost:1347/index.jsp");
	    
	    // 접근 토큰 값 출력
	    alert(naver_id_login.oauthParams.access_token);
	    
	    // 네이버 사용자 프로필 조회
	    naver_id_login.get_naver_userprofile("naverSignInCallback()");
	    
	    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	    function naverSignInCallback() {
	        alert(naver_id_login.getProfileData('email'));
	        alert(naver_id_login.getProfileData('nickname'));
	        alert(naver_id_login.getProfileData('age'));
	    }
    </script>
    
	<!-- 푸터 -->
	<div id="footer" class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0" 
	     style="border: 1px solid black; padding: 10px;">
	</div>
	<!-- 푸터 끝 -->
	<br><br>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>

</html>
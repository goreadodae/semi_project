<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String beforeURI = request.getHeader("referer"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>로그인</title>

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<style type="text/css">

#section{
	padding: 80px 100px 0px;
	margin-bottom:80px;
}

#test {
	background-color: blue;
}

#noPnoM {
	padding: 0;
	margin: 0;
}

.form-login {
	height: 46px;
	width: 360px;
}

.social-login {
	display: grid;
	grid-template-columns: 2fr;
	grid-auto-rows: 45px;
	grid-column-gap: 20px;
	grid-row-gap: 1em;
}

fieldset, legend {
	border: 0;
}

.img {
	height: 100%;
	width: 100%;
	object-fit: contain;
}

.social-login, button {
	padding: 0;
	margin: 0;
}

#facebook {
	background-color: #3b5998;
	border: 0;
}

#naver {
	background-color: #50DE00;
	border: 1px solid gray;
}

#google {
	background-color: #DB5635;
	border: 0;
}

#kakao {
	background-color: #FEE202;
	border: 0;
}
</style>
</head>

<body style="overflow-x: hidden; overflow-y: auto;">

	<!-- 전체 컨테이너  -->
	<div class="container-fluid" style="padding: 0px;">

		<!-- 해더 영역 -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 헤더 영역 끝 -->

		<!-- 컨텐츠 영역 -->
		<div id="content-main" class="contents">
		
		<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6" id="section">

				<fieldset>
					<legend>
						<h2 style="font-weight: bold;">로그인</h2>
					</legend>
					
					<form action="/login?beforeURI=<%=beforeURI%>" method="post" id="frm">
						<input class="form-control form-login" type="text"
							placeholder="Your ID" id="loginId" name="loginId"><br>
						<input class="form-control form-login" type="password"
							placeholder="Your Password" id="loginPwd" name="loginPwd">
					</form>

					<div class="col-md-8" id="noPnoM">
						<input type="checkbox" name="saveId" /><label for="saveId">ID저장</label>
					</div>
					<div></div>
					<div class="col-md-4"
						style="padding-left: 25px; margin-bottom: 20px;">
						<a href="#">ID / PW 찾기</a>
					</div>
					<div style="margin-bottom: 20px;">
						<button class="btn btn-primary btn-lg btn-block form-login"
							onclick="login();">로그인</button>
					</div>
					<span style="font-weight: bold; font-size: 20px;"><center>OR</center></span><br>
					<div class="social-login">
						<button id="naver_id_login"></button>
						<button id="google">
							<img class="img" src="/imgs/member_img/googleplus.JPG">
						</button>
						<button id="kakao">
							<a id="custom-login-btn" onclick="loginWithKakao();"> <img
								class="img" src="/imgs/member_img/kakao.JPG">
							</a>
						</button>
					</div>
					<br> <br>

					<p>
					<center>
						아직 계정이 없나요? <a href="/views/memberPage/membershipPage.jsp"
							style="margin-left: 30px;">회원가입</a>
					</center>
					</p>


				</fieldset>
			</div>
			<div class="col-md-3"></div>
			</div>
		</div>
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
    naver_id_login.setButton("green", 3, 60);
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
				<div id="footer"
					class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0"
					style="border: 1px solid black; padding: 10px;"></div>
		<!-- 푸터 끝 -->
    </div>
    
  

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>

</html>
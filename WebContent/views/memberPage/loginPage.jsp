<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<%
	String beforeURI = request.getHeader("referer");

	String firstURI = beforeURI;
	if(firstURI.equals(beforeURI)){
		firstURI = firstURI;
	} else{
		firstURI = beforeURI;
	}
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
<script type="text/javascript">
	<%if(session.getAttribute("user")==null){%>
		
	<%}else{%>
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	<%}%>
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
							<!-- 오류잡기 -->
							<form action="/login?beforeURI=<%=beforeURI%>" method="post" id="frm">
								<!-- 아이디 -->
								<div class="col-md-12">
									<p style="float:left; line-height:48px; font-weight:800;">아이디&nbsp;&nbsp;&nbsp;&nbsp;</p>
									<input class="form-control form-login mx-auto" type="text" 
								     placeholder="아이디를 입력하세요" id="loginId" name="loginId" style="width:250px;"><br>
								</div> 
									<!-- 패스워드 -->
								<div class="col-md-12">
									<p style="float:left; line-height:48px; font-weight:800;">비밀번호</p>
									<input class="form-control form-login mx-auto" type="password"
									 placeholder="비밀번호를 입력하세요" id="loginPwd" name="loginPwd" style="width:250px;">
								</div>
								<div class="col-md-4 mx-auto" style="padding:0px;">
									<p id="loginError" style="color:red; width:300px; font-size:15px; display:none;">아이디 또는 비밀번호를 다시 확인하세요. </p>
								</div>
							</form>
							
							<!-- id저장 -->
							<div class="col-md-4 mx-auto" id="noPnoM" style="left:1px;">
								<input type="checkbox" id="idSaveCheck" name="saveId"/><label for="saveId">ID저장</label>
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
							<a href="/views/memberPage/findIdPage.jsp">아이디</a>
							<a href="/views/memberPage/findPwdPage.jsp">비밀번호 찾기</a>
						</p>
					</div>
					<hr>
					<div class="col-md-8 mx-auto">
							<div class="col-md-4 mx-auto" style="right:20px;">
							<form action="/socialNaver" method="post" id="frm2">
								<input type="hidden" id="id" name="id" >
								<input type="hidden" id="name" name="name" >
								<input type="hidden" id="email" name="email" >
								<input type="hidden" id="gender" name="gender">
								<input type="hidden" name="beforeURI" value="<%=firstURI %>" >
							</form>
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
	
	function login()
	{
		console.log($('#loginPwd').val());
		if(($('#loginId').val()=="" || $('#loginPwd').val()=="")){
			alert("아이디 또는 비밀번호를 입력하세요.");
		}else{
			$.ajax({
	            url: "/loginCheck",
	            data: {loginId:$('#loginId').val(), loginPwd:$('#loginPwd').val()},
	            type: "post",
	            success: function(data) {
	                console.log("성공");
	                if(data==1){
	                	$('#frm').submit();
	                	$('#loginError').hide();
	                }else{
	                	$('#loginError').show();
	                }
	            },
	            error: function() {
	                console.log("실패");
	            },
	            complete: function() {
	                //무조건 실행
	            }
	        });
		}
	}
	
	//아이디 저장

$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='loginId']").val(userInputId); 
     
    if($("input[name='loginId']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='loginId']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='loginId']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='loginId']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
		
		//소셜 네이버 로그인
	    var naver_id_login = new naver_id_login("RC6jETK12YcVuQccaXmJ", "http://localhost/views/memberPage/callbackPage.jsp");
		
	    var state = naver_id_login.getUniqState();
	    naver_id_login.setButton("green", 3, 55);
	    naver_id_login.setDomain("http://localhost/views/memberPage/loginPage.jsp");
	    naver_id_login.setState(state);
	    naver_id_login.setPopup();
	    naver_id_login.init_naver_id_login();
	    
	    
	    function naverFrm(){
	    	$('#frm2').submit();
	    }
	    
	
    </script>
    
	<!-- 푸터 -->
	<div id="footer" class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0" 
	     style="border: 1px solid black; padding: 10px;">
	</div>
	<!-- 푸터 끝 -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>

</html>
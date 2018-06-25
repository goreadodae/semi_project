<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
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
<script type="text/javascript">
	<%if(session.getAttribute("user")==null){%>
	<%}else{%>
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	<%}%>
</script>
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
      <h2 style="font-weight: bold; text-align: center;">비밀번호 찾기</h2>
      <br><br>
      <div id="content-main" class="contents" style="background-color: #f7f5f8">
         <div class="container">
            <div class="col-md-12" id="section">
               <div class="col-md-8 mx-auto">
            	<fieldset>
                     <form action="" method="post" id="frm">
                     
                        <!-- 아이디 -->
                        <div class="col-md-12">
                           <p style="float:left; line-height:48px; font-weight:800;">아이디</p>
                           <input class="form-control form-login mx-auto" type="text" 
                             id="userId" name="userId" style="width:250px;"><br>
                        </div> 
                        
                        <!-- 이름 -->
                        <div class="col-md-12">
                           <p style="float:left; line-height:48px; font-weight:800;">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                           <input class="form-control form-login mx-auto" type="text" id="userName" name="userName" 
                                  style="width:250px; margin-left:40px;"><br>
                        </div>
                        
                        <!-- 이메일 -->
                        <div class="col-md-12">
                           <p style="float:left; line-height:48px; font-weight:800;">이메일</p>
                           <input class="form-control form-login mx-auto" type="text"
                            id="email" name="email" style="width:250px; left:0px;"><br>
                        </div>
                     </form>
                  </fieldset>
                </div>
                  <div class="col-md-4 mx-auto" style="margin-top:20px; left:36px;">
                  <button class="btn btn-primary btn-lg btn-block form-login" 
                         onclick="findPwd();" style="background-color:#795b8f; width:250px;">확인</button>
              	  </div>
               </div>
            <hr>
           </div>
           <br>
         </div>
      </div>
      
      <br><br><br><br>

    
   <!-- 푸터 -->
   <div id="footer" class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0" 
        style="border: 1px solid black; padding: 10px;">
   </div>
   <!-- 푸터 끝 -->

<script>
      function findPwd() {
         var userId = $('#userId').val();
         var userName = $('#userName').val();
         var email = $('#email').val();
         
         $.ajax({
                url: "/findPwd",
                data: {id:userId ,name:userName, email:email},
                type: "post",
                success: function(data) {
                    
                    if(data>0){
                    	alert("등록된 이메일로 임시 비밀번호를 발송하였습니다. 개인정보 변경에서 새로 변경해주시기 바랍니다.");
                    	location.replace("/views/memberPage/loginPage.jsp");
                    }else{
                         alert("잘못된 정보입니다.")
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
   </script>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="/js/bootstrap.min.js"></script>
</body>

</html>
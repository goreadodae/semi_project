<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>아이디 찾기</title>

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<link rel="stylesheet" href="/css/member_css/loginPage.css">

<style>
   .mod2{
   display: none;
   }
</style>
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
      <h2 style="font-weight: bold; text-align: center;">아이디 찾기</h2>
      <br><br>
      <div id="content-main" class="contents" style="background-color: #f7f5f8;">
         <div class="container">
            <div class="col-md-12 mod1" id="section">
               <div class="col-md-8 mx-auto">
                  <fieldset>
                     <form action="" method="post" id="frm">
                        <!-- 이름 -->
                        <div class="col-md-12">
                           <p style="float:left; line-height:48px; font-weight:800;">이름&nbsp;&nbsp;&nbsp;&nbsp;</p>
                           <input class="form-control form-login mx-auto" type="text" 
                             id="userName" name="userName" style="width:250px;"><br>
                        </div> 
                           <!-- 이메일 -->
                        <div class="col-md-12">
                           <p style="float:left; line-height:48px; font-weight:800;">이메일</p>
                           <input class="form-control form-login mx-auto" type="text"
                            id="email" name="email" style="width:250px;">
                        </div>
                     </form>
                  </fieldset>
               </div>
               
               <div class="col-md-4 mx-auto" style="margin-bottom: 20px; left:35px; margin-top:10px;">
                  <button class="btn btn-primary btn-lg btn-block form-login" 
                         onclick="findId();" style="background-color:#795b8f; width:250px;">확인</button>
               </div>
            
               </div>
               <div class="col-md-12 mod2" style="background-color:#f7f5f8; height:300px; margin-top: 40px;
                   padding: 40px 100px; margin-bottom: 80px; "><br>
               	  <div class="col-md-6 mx-auto" style="border-top:2px solid #795b8f; border-bottom: 1px solid #795b8f"><br>
                  <fieldset>
                        <div class="col-md-12" style="text-align: center; width:100%; height:130px; background-color:#f7f5f8;">
                           <h3 style="margin:10px 0 20px;">아이디 찾기가 완료되었습니다.</h3>
                           <hr>	
                           <h6>아이디 : <label id="userId"></label></h6>
                        </div> 
                  </fieldset>
               </div>
               <br>
               <div class="col-md-6 mx-auto row" style="margin: 20px 0; left:39px;">
             		<button class="btn btn-primary btn-lg btn-block form-login" 
                         	onclick="locationStr('/views/memberPage/findPwdPage.jsp');"style="background-color:#795b8f; width:150px; float:left;">비밀번호찾기</button>
               		<button class="btn btn-primary btn-lg btn-block form-login" 
                         	onclick="locationStr('/views/memberPage/loginPage.jsp');" style="background-color:#795b8f; width:150px; margin:0 0 0 50px;float:left;">확인</button>
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
      function findId() 
      {
         var userName = $('#userName').val();
         var email = $('#email').val();
          $.ajax({
                url: "/findId",
                data: {name:userName, email:email},
                type: "post",
                success: function(data) {
                    console.log("성공");
                    if(data!=null){
                      $('.mod1').hide();
                      $('.mod2').show();
                      $('#userId').text(data);
                    }else{
                        alert("오류");
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
      
      
      function locationStr(str) {
         location.replace(str);
      }
   </script>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="/js/bootstrap.min.js"></script>
</body>

</html>
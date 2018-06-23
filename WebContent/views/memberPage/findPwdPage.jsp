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

<style>
td{
   text-align: left;
   padding: 15px 7px;
   font-weight: 400;
   font: 14px/20px 'Noto Sans KR Medium';
   color: #514859;
}
</style>

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
      <h2 style="font-weight: bold; text-align: center;">비밀번호 찾기</h2>
      <br><br>
      <div id="content-main" class="contents" style="background-color: #f7f5f8">
         <div class="container">
            <div class="col-md-12" id="section">
               <div class="col-md-8 mx-auto">
                  <fieldset>               
                        <div class="col-md-10 mx-auto">
                           <table>
                              
                           
                              <tr>
                                 <td style="width:100px;">
                                    아이디
                                 </td>
                                 <td>
                                    <input class="form-control form-login mx-auto" type="text" 
                                      id="userId" name="userId" style="width:250px;">
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    이름
                                 </td>
                                 <td>
                                    <input class="form-control form-login mx-auto" type="text" 
                                       id="userName" name="userName" style="width:250px;">
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    이메일
                                 </td>
                                 <td>
                                    <input class="form-control form-login mx-auto" type="text" 
                                      id="email" name="email" style="width:250px;">
                                 </td>
                              </tr>
                        
                           </table>
                        </div>
                     </form>
                     
                  </fieldset>
                  <div class="col-md-12" style="margin-top: 20px; margin-left:155px;">
                  <button class="btn btn-primary btn-lg btn-block form-login" 
                         onclick="findPwd();" style="background-color:#795b8f; width:250px;">확인</button>
               </div>
               </div>
               
               
               </div>
            <br>
         </div>
      </div>
      
      <br><br><br><br>
   </div>

    
   <!-- 푸터 -->
   <div id="footer" class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0" 
        style="border: 1px solid black; padding: 10px;">
   </div>
   <!-- 푸터 끝 -->
   <br><br>

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
                    console.log("성공");
                    if(data!=null){
                   
                    }else{
                         
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
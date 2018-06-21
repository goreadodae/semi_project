<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.model.vo.*"%>
<% Member m = (Member)session.getAttribute("user"); %>
<% 
String [] address = m.getAddress().split(" \\| ");
String [] phone = m.getPhone().split("-");
String [] email = m.getEmail().split("@");
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Home</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
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

#menu-list li a {
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

#info-board {
   table-layout: fixed;
   border-top: 2px solid #6A3664;
   border-bottom: 1px solid #6A3664;
   line-height: 180%;
}

.memberCols1 {
   width: 150px;
   padding: 25px 0 23px 20px;
   text-align: left;
   vertical-align: middle;
   font-size: 13px;
   font-weight: bold;
}

.memberCols2 {
   width: auto;
   padding: 15px 0 13px 10px;
   border-top: 1px solid #e8e8e8;
   vertical-align: middle;
   text-align: left;
}

#btn-bar{
margin-top:20px;
margin-left:274px;

}
#btn-bar a{
   display: block border: 1px solid #56297a;
   font-size: 13px;
   line-height: 40px;
   text-align: center;
   width: 150px;
   height: 42px;
   float:left;
   margin-right: 5px;
}

#changeBtn{
margin-left:10px;
line-height: 32px;
}
#changeEmail{
display: none;
}

.problem{
   color: color: #f00;
   font-size: 11pt;
   margin: 0;
   padding: 0;
   display: none;
}

ol, li {
   list-style: none;
}
</style>
</head>

<!-- 모든 스타일 시트 적용 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<body style="overflow-x: hidden; overflow-y: auto;">
   
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">인증번호 입력</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      
      </div>
      <div class="modal-body">
        <input class="form-control" type="text" id="txt-code">
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-primary" onclick="codeCheck();">인증</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        
      </div>
    </div>
  </div>
</div>



   <!-- 전체 컨테이너  -->
   <div class="container-fluid" style="padding: 0px;">

      <!-- 해더 영역 -->
      <div id="header"></div>
      <!-- 헤더 영역 끝 -->

      <!-- 컨텐츠 영역 -->
      <div id="contents"
         class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
         style="border: 1px solid black; padding: 0;">
         <div class="row" id="myPageTop">
            <div class="col-md-2"></div>
            <div class="col-md-9" style="padding: 0;">
               <div class="col-md-12" id="myPageTopUser">
                  <div id="userInfo" class="col-md-5"></div>
                  <ul>

                  </ul>
               </div>
            </div>
            <div class="col-md-1"></div>
         </div>
         <div class="row" id="myPageBottom">
            <div class="col-md-2" id="menu">
               <h2 id="menu-title">마이 홈</h2>
               <div id="menu-border">
                  <ul id="menu-list">
                     <li><a href="/views/memberPage/myHomeMainPage.jsp">나의
                           주문내역</a></li>
                     <li><a href="/views/memberPage/myHomeRecipePage.jsp">나의
                           레시피</a></li>
                     <li><a href="/views/memberPage/myHomeCommentsPage.jsp ">내가
                           쓴 댓글</a></li>
                     <li><a href="/views/memberPage/myHomeModifyInfoPage.jsp">개인
                           정보 수정</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-md-9">
               <div id="menu-title">
                  <h2>개인 정보 변경</h2>
               </div>
               <form action="/changeInfo" method="post" ENCTYPE="multipart/form-data" id="frm">
               <div id="info-board">
                  <table width="100%" cellpadding="5" cellspacing="0" border="0">
                     <tbody>
                        <tr>
                           <td class="memberCols1">아이디</td>
                           <td class="memberCols2">
                           <input class="form-control" name="userId" readonly value="<%=m.getMemberId() %>" style="width: 150px;" />
                              </td>
                        </tr>
                        <tr>
                           <td class="memberCols1">새 비밀번호</td>
                           <td class="memberCols2"><input class="form-control"
                              type="password" id="new-pwd-1" style="width: 250px;"> <span
                              style="color: #f00;">띄어 쓰기 없이 10-20자의 영소문자, 숫자 및 특수문자
                                 조합하여야만 사용할 수 있습니다.</span></td>
                        </tr>
                        <tr>
                           <td class="memberCols1">새 비밀번호 확인</td>
                           <td class="memberCols2"><input class="form-control"
                              type="password" id="new-pwd-2" style="width: 250px;">
                              <input type="hidden" id="savePwd" name="savePwd" value="<%= m.getMemberPwd() %>">
                              </td>
                        </tr>
                        <tr>
                           <td class="memberCols1">이름</td>
                           <td class="memberCols2"><input class="form-control"
                              type="text" readonly value=<%=m.getMemberName()%>
                              style="width: 150px;" /></td>
                        </tr>
                        <tr>
                           <td class="memberCols1">휴대폰</td>
                           <td class="memberCols2"><select class="form-control" id="phone1"
                              name="phone1" style="width: 75px; float: left;">
                                 <option>010</option>
                                 <option>011</option>
                                 <option>019</option>
                                 <option>017</option>
                                 <option>016</option>
                           </select> <pre
                                 style="float: left; font-weight: bold; line-height: 32px;"> - </pre>
                              <input type="text" class="form-control" id="phone2"
                              name="phone2" onchange="phoneCheck();" value="<%=phone[1]%>"
                              style="width: 75px; float: left; text-align: center;"
                              maxlength="4"> <pre
                                 style="float: left; font-weight: bold; line-height: 32px;"> - </pre>
                              <input type="text" class="form-control" id="phone3"
                              name="phone3" onchange="phoneCheck();" value="<%=phone[2]%>"
                              style="width: 75px; float: left; text-align: center;"
                              maxlength="4">
                              <input type="hidden" id="savePhone" name="savePhone" value="<%=m.getPhone()%>" >
                              </td>
                        </tr>
                        <tr>
                           <td class="memberCols1">이메일</td>
                           <td class="memberCols2"><input class="form-control" type="text" value="<%=email[0]%>"
                              style="width: 150px; float: left;" id="first_email" />
                              <h5 style="float: left; line-height: 32px; padding: 0 5px;">@</h5>
                              <input class="form-control" type="text" value="<%=email[1]%>"
                              style="width: 150px; float: left;" id="last_email"  /> 
                              <a href="#" id="changeBtn" onclick="changeEmail();">중복검사</a>
                              <input type="hidden" id="saveEmail" name="saveEmail" value="<%= m.getEmail() %>" />
                              <span>
                                 <label class="problem"id="emailProblem"></label>
                              </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="memberCols1">주소</td>
                           <td class="memberCols2"><input type="text" id="postcode"
                              name="postcode" class="form-control"
                              style="width: 100px; float: left;" value="<%=address[0] %>"
                              readonly /> <input type="button" class="btn btn-default"
                              id="postBtn" onclick="execDaumPostcode();" value="주소 찾기"
                              style="width: 100px; float: left; height: 38px; magin: 0; padding: 0 5px;" />
                              <input type="text" id="roadAddress" name="roadAddress"
                              style="margin-right: 20px;" value="<%=address[1] %>"
                              class="form-control" readonly /> <input type="text"
                              id="addAddress" name="addAddress" value="<%=address[2] %>"
                              class="form-control" /> <span id="guide" style="color: #999"></td>
                        </tr>
                        <tr>
                           <td class="memberCols1">사진</td>
                           <td class="memberCols2">
                           <input id="stepImgFile0" multiple="multiple" type="file" style="display: none"
                              onchange="readURL(this,0);" name="profile" /> 
                              
                              <%if(m.getProfile()==null) {%>
                              
                                 <img src="/imgs/insertRecipe_img/pic_none2.jpg" width="150"
                                 height="150" id="imgFile_Step_0" onclick="document.all.stepImgFile0.click();">
                                 
                              <%}else{ %>
                              
                                 <img src="<%=m.getProfile() %>" width="150"
                                 height="150" id="imgFile_Step_0" onclick="document.all.stepImgFile0.click();">
                                 
                              <%} %>
                              <input type="hidden" id="saveProfile">
                              </td>
                        </tr>
                        <tr>
                           <td class="memberCols1">별명</td>
                           <td class="memberCols2">
                           <input class="form-control" id="nickname" onchange="nicknameCheck();" type="text" style="width:150px;" maxlength="20" />
                           <input type="hidden" id="saveNick" name="saveNick">
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div id="btn-bar">
                  <a type="submit" onclick="changeInfo();" style="background-color: #795b8f; color: #fff;">확인</a> 
                  <a type="button" style="background-color: #fff; color: #795b8f;">취소</a> 
                  <a type="button" style="background-color: #fff; color: #795b8f;">탈퇴</a>
               </div>
               </form>
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

   <script>
   var regExpSpace = /\s/g; //공백찾기
   var regExpPwd = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*=+])[a-z0-9!@#$%^&*=+]{10,20}$/; //비밀번호
   var regExpNum = /^[0-9]+$/; // 숫자만
   var regExpEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; //이메일
   var emailCheckCode; // 생성된 인증번호
   var hiddenEmail; //이메일 저장
   var regExpNickname =/^[a-zA-Zㄱ-힣0-9]*$/; // 별명
   
   //SUBMIT
   function changeInfo() {
      if($('#new-pwd-1').val() != ""||$('#new-pwd-2').val() != ""){
         if($('#new-pwd-1').val().match(regExpSpace)){
            
         }else{
             if(!regExpPwd.test($('#new-pwd-1').val())){
                
             }else{
                if($('#new-pwd-1').val() != $('#new-pwd-2').val()){
                   
                }else{
                   $('#savePwd').val($('#new-pwd-1').val());
                }
             }
         }
      }
         var phone = $('#phone1').val()+"-"+$('#phone2').val()+"-"+$('#phone3').val();
          
         if ($('#phone2').val().match(regExpSpace)||$('#phone3').val().match(regExpSpace)) {
                
            } else {
                if (!regExpNum.test($('#phone2').val())||!regExpNum.test($('#phone3').val())) {
                   
                } else {
                    if ($('#phone2').val().length != 4||$('#phone3').val().length != 4) {
                   
                    } else {
                        $('#savePhone').val(phone);
                    }
                }
            }
      
      
      $('#frm').submit();
      
   }
      
   
   
   //이메일 변경
   function changeEmail() {
      hiddenEmail = $('#first_email').val() + "@" + $('#last_email').val();
      
      if (hiddenEmail.match(regExpSpace)) {
           alert("공백이 존재합니다.");
        }else if (!regExpEmail.test(hiddenEmail)) {
           alert("알맞지 않는 이메일 형식입니다.")
        }else{
      
       $.ajax({
             url: "/emailCheck",
             data: {email: hiddenEmail},
             type: "post",
             success: function(data) {
                 console.log("성공");
                 if(data=="1"){
                 alert("이미 가입한 이메일 입니다.");
                
                
                 }else{
                    $('#changeEmail').show();
                    emailCheckCode = data;
                     $('#myModal').modal('show');
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
   
   function codeCheck(){
      if($('#txt-code').val()==emailCheckCode){
          $('#myModal').modal('hide');
          $('#saveEmail').val(hiddenEmail);
          $('#emailProblem').text("인증완료");
      }else{
         
         $('#myModal').modal('hide');
         $('#emailProblem').show();
         $('#emailProblem').text("입력된 정보가 맞지 않습니다. 다시 시도해주세요.");
      }
   }
   
   //주소찾기
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
   
   
   //사진 불러오기
    function readURL(input,stepImgNum) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
    
           reader.onload = function (e) {
              $('#imgFile_Step_'+stepImgNum).attr('src', e.target.result);
              
              var imgAddr = $('#imgFile_Step_'+stepImgNum).attr('src');
                   $('#stepRPic'+stepImgNum).attr('value',imgAddr);
            
           }
    
           reader.readAsDataURL(input.files[0]);
          }
      };
      
      //별명체크
     function nicknameCheck(){
        regExpNickname
        if($('#nickname').val() != ""){
           if (!regExpNickname.test($('#nickname').val())){
              
           }else{
              $('#saveNick').val($('#nickname').val());
           }
        }
        
        }
   
   
   </script>


   <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   <script src="/js/bootstrap.min.js"></script>

</body>
</html>
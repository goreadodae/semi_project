<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLineChar","\n"); %>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 내용</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/noticePage_css/noticeContents.css">


<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<script>
   /* 해더 불러오는 제이쿼리 */
   $(document).ready(function() {
      
      $("#footer").load("/views/footer/main-Footer.jsp");
   });
   
   function listBack()
   {
      location.href="/views/customerCenterPage/noticePage.jsp";
   }
   
   function check(){
	      if(window.confirm("삭제하시겠습니까?")){
	         return true;
	      }else{
	         return false;
	      }
	   }
   
</script>
<style>
hr {
   display: block;
   border-style: solid;
   border-color: #56297a;
}

#test {
   border-right-color: white;
}

#listBtn {
   float: right;
}

#historyTbl td {
   padding-top: 20px;
}
#historyTbl{
border-collapse:collapse;

}
#historyTbl a{
	color:black;
}
.btn.btn-outline-primary{
	background-color: #512772 !important;
	border-color: #512772 !important;
	color: white !important;
	margin: 1px;
	
}
</style>

</head>
<body>
   <div class="container-fluid">

      <jsp:include page="/views/header/main-Header.jsp"></jsp:include>
      <!--메인헤더 가지고 옴   -->

      <!--여기서부터 컨텐츠 영역(공지사항 내용)  -->
      <div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
         style="padding: 10px;" id="contents">
         <div class="row" style="padding: 0;">
            <!--공지사항 타이틀  -->
            <div class="col-md-12" style="padding: 0;">
               <br>
               <h5>
                  공지사항&nbsp;<span id="notice_sub_tit">새로운 소식과 유용한 정보들을 한곳에서
                     확인하세요.</span>
               </h5>
               <hr>
            </div>
         </div>
         <br>
         <div class="row" style="padding: 0;">
            <!--공지사항 정보와 상세내용   -->

            <div class="col-md-12" style="padding: 0;">
               <table class="table table-bordered" style="text-align: left;"
                  cellpadding="0" cellspacing="0">
                  <thead>
                     <tr>
                        <th style="width: 100px; background-color: lightgray;">제목</th>
                        <td colspan="4">${requestScope.notice.noticeTitle}</td>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <th style="background-color: lightgray">작성자</th>
                        <td colspan="4">${requestScope.notice.noticeWriter}</td>
                     </tr>
                     <tr>
                        <th style="background-color: lightgray;">작성일</th>
                        <td width="150px">${requestScope.notice.reportingDate}</td>
                        <th style="background-color: lightgray;" width="100px">조회수</th>
                        <td><span id="viewCount">${requestScope.notice.noticeViews}</span></td>
                        <!-- 카운트 해야함  -->
                     </tr>

                     <tr>
                     </tr>
                  </tbody>
               </table>



            </div>
         </div>
         <div class="row" style="padding: 0;">

            <div class="col-md-12"
               style="text-align: justify; padding: 10px; border-bottom-color: red;">
               ${fn:replace(requestScope.notice.noticeContents,newLineChar,"<br/>")}
               <br> <br>
            </div>


         </div>
         
         <!-- 바뀐부분 시작 -->
         <!--관리자일경우 -->
         
		<%if (session.getAttribute("user")!=null&& ((Member)session.getAttribute("user")).getMemberId().equals("user28")){ %>
         <div class="row" style="padding: 0;">
         	<div class="col-md-12">
         		<div class="row">
         			<div class="col-md-7 mx-auto">
         			<div class="row">
         	<!-- <div class="col-md-2"></div> -->		
            <div class="col-md-3"> 
            	<form action="/noticeUpdateReady" style="display:inline;">
            	<input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo}">
               <button class="btn btn-outline-primary" id="listBtn">수정</button>
                 </form>
            </div>
            <div class="col-md-3">
            	<form action="/noticeDelete" style="display:inline;">
            	<input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo}">
               <button type="submit" onclick="return check();"
                class="btn btn-outline-primary" id="listBtn">삭제</button>
                 </form>
            </div>
            <div class="col-md-3">
            	<button type="button" onclick="location.href='/views/customerCenterPage/noticeWrite.jsp'"
                  class="btn btn-outline-primary" id="listBtn">글쓰기(임시)</button>
            </div>
            <div class="col-md-3">
               <button type="button" onclick="location.href='/noticeList'"
                  class="btn btn-outline-primary" id="listBtn">목록</button>
            </div>
            <!-- <div class="col-md-3">
               <button type="button" onclick="location.href='/noticeList'"
                  class="btn btn-outline-primary" id="listBtn">목록</button>
            </div> -->
			<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</div>
         </div>
      <%}else{ %>   <!-- 관리자가 아닐경우 -->
      	
      	  <div class="row" style="padding: 0;">
            <div class="col-md-12">
               <button type="button" onclick="location.href='/noticeList'"
                  class="btn btn-outline-primary" id="listBtn">목록</button>
            </div>
         </div>      	
      	
      <%} %>
         
         <!-- 바뀐부분 끝-->
         
         <br> <br>
         <div class="row" style="padding: 0;">



            <div class="col-md-12" style="padding: 0">
               <table class="table "
                  style="width: 100%; border-top: 2px solid #795b8f; border-bottom: 2px solid #795b8f;"
                  id="historyTbl">
                  <tr>
                     <c:if test="${!empty requestScope.preNotice}">
                     <td style="width:5%; border-right:1px solid #dcdcdc; !important">이전글</td>
                     <td colspan="2"><a href="/noticeDetail?noticeNo=${requestScope.notice.noticeNo-1}">${requestScope.preNotice}</a></td>
                     </c:if>
                     <c:if test="${empty requestScope.preNotice}">
                     <td colspan="2">
                     　<!--공백이 숨어있어요  -->
                     </td>
                     </c:if>
                  </tr>
                  <tr>
                     <c:if test="${!empty requestScope.nexNotice}">
                     <td style="border-right:1px solid #dcdcdc; !important">다음글</td>
                     <td><a href="/noticeDetail?noticeNo=${requestScope.notice.noticeNo+1}">${requestScope.nexNotice}</a></td>
                     </c:if>
                     <c:if test="${empty requestScope.nexNotice}">
                     <td colspan="2">
                     　<!--공백이 숨어있어요  -->
                     </td>
                     
                     </c:if>
               
                  </tr>

               </table>
            </div>
         </div>


      </div>
   </div>
   <!--풋터임  -->
   <div id="footer"
      class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
      style="border: 1px solid black; padding: 10px;">
      <!-- footer -->
   </div>


   <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   <script src="/js/bootstrap.min.js"></script>
</body>
</html>
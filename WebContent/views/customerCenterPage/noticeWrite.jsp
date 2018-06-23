<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>공지사항 작성</title>
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
</style>



</head>
<body>

<div class="container-fluid">

      <jsp:include page="/views/header/main-Header.jsp"></jsp:include>
      <!--메인헤더 가지고 옴   -->

      <!--여기서부터 컨텐츠 영역(공지사항 내용)  -->
      <div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
         style="padding: 10px;" id="contents">
         <form action="/noticeInsert" method="post">
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
                        <td colspan="4"><input type="text" class="form-control" name="insertNoticeTitle" value="${requestScope.notice.noticeTitle}"></td>
                     </tr>
                  </thead>
                  <%-- <tbody>
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
                  </tbody> --%>
               </table>
            </div>
         </div>
         <div class="row" style="padding: 0;">

            <div class="col-md-12">
               <textarea rows="15" style="resize: none;" name="insertNoticeBoard" class="form-control">
               ${fn:replace(requestScope.notice.noticeContents,newLineChar,"<br/>")}</textarea>
         	<br><br>
            </div>

         </div>
         
         <!-- 바뀐부분 시작 -->
         <!--관리자일경우 -->
         
         <div class="row" style="padding: 0;">
         	<div class="col-md-12">
         		<div class="row">
         			<div class="col-md-3 mx-auto">
         			<div class="row">
         	<div class="col-md-2"></div>		
            <div class="col-md-4"> 
				
               <input type="submit" class="btn btn-outline-primary" id="insertNoticeBtn" value="글쓰기" />

            </div>
            <div class="col-md-4">
               <button type="button" onclick="location.href='/noticeList'"
                  class="btn btn-outline-primary" id="listBtn">취소</button>
            </div>
			<div class="col-md-2"></div>
						</div>
					</div>
				</div>
			</div>
         </div>
     
         
         <!-- 바뀐부분 끝-->
         
         <br> <br>
         
		 </form>

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
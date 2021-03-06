<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	response.setHeader("cache-control", "no-store");
	response.setHeader("expires", "0");
	response.setHeader("pragma", "no-cache");
%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 페이지 입니다.</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {

		$("#footer").load("/views/footer/main-Footer.jsp");
	});
	$(document).ready(function() {
		$('#list-color tr').eq(2).addClass('on');
	});
	
	 
	 var toggleText1 = false;
	 var toggleText2 = false;
	 function showQue(no){
	    console.log(no);
	    $('#'+no+"_hidingContents").toggle('display');
	    if(toggleText1==true)
	    {
	       toggleText1 = false;
	    }
	    else{

	       toggleText1 = true;
	    }
	 }
	 function deleteCheck(){
		 if(window.confirm("정말로 삭제하시겠습니까?")){
			return true; 
		 }
		 else{
			 return false;
		 }
	 }
	 </script>
<script>

var flag=false;
function showAns(id)
{
	
	console.log(id);
	$('#'+id+"_hidingAnswer").toggle('display');
    if(flag==true)
    {
    	flag = false;
    }
    else{

    	flag = true;
    }
	
	}


	

	 
	 
 </script>



<style>
* {
	margin: 0;
	padding: 0;
}

#noHasList {
	position: relative;
	text-align: center;
	top: 40%;
}

.list-arrow {
	float: right;
}

#hidingContens {
	display: none;
	text-align: center;
}

update {
	vertical-align: middle;
}
.btn.btn-outline-success{
	background-color: #512772 !important;
	border-color: #512772 !important;
	color: white !important;
	margin: 1px;
	
}.btn.btn-success{
	background-color: #512772 !important;
	border-color: #512772 !important;
	color: white !important;
	margin: 1px;

}

</style>

</head>
<body>


	<c:if test="${sessionScope.user==null}">
		<script language="javascript">
			alert("로그인 후 이용해주세요 ^^");
			location.href="/views/memberPage/loginPage.jsp";
		</script>

	</c:if>

	<div class="container-fluid" style="padding: 0px">
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row" style="padding: 0;">
				<div class="col-md-2" style="padding: 0;">
					<!--고객센터 목록  -->
					<br>
					<h2>고객센터</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h4 style="line-height: 35px">1:1문의사항&nbsp;</h4>
				</div>
			</div>
			<br>
			<div class="row" style="padding: 0;">
				<div id="customCenter" class="col-md-2" style="padding: 0;">
					<!-- 고객센터 목록 테이블  include-->
					<jsp:include page="/views/customerCenterPage/contentsLeft.jsp"
						flush="false" />
				</div>



				<div class="col-md-10">

					<table class='table'>
						<tr style="text-align: center">
							<th style="width: 10%">번호</th>
							<th style="width: 40%">제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>


						<c:forEach items="${requestScope.qnaList}" var="qnaList"
							varStatus="i">




							<tr>
								<td style="text-align: center">${i.count}</td>


								<td id="${i.count}" onclick="showQue(${i.count})"
									style="cursor: pointer; padding-left: 20px">

									${qnaList.queTitle} <c:choose>
										<c:when test="${qnaList.responseYn eq 'n'}">
											<span style="color: #007FC8">[0]</span>
										</c:when>
										<c:otherwise>

											<span style="color: #007FC8">[1]</span>
										</c:otherwise>
									</c:choose>







								</td>
								<td style="text-align: center">${qnaList.memberId}</td>
								<td style="text-align: center"><fmt:formatDate
										value="${qnaList.queTime}" pattern="yyyy-MM-dd" /></td>
							</tr>


							<tr id="${i.count}_hidingContents" style="display: none">
								<td colspan="4">
									<div class="row">
										<div class="col-md-8" style="padding: 30px">
											${fn:replace(qnaList.queContents,newLineChar,"<br>")}</div>

										<div class="col-md-4" style="padding-top: 20px;">
											<div class="row" style="padding: 0">
												<form action="/views/customerCenterPage/updateQna.jsp"
													method="post">

													<div class="col-md-6">
														<input type="submit" class="btn btn-outline-success"
															value="수정" />&nbsp;&nbsp;
													</div>

													<input type="hidden" name="queTitle"
														value="${qnaList.queTitle}" /> <input type="hidden"
														name="queContents" value="${qnaList.queContents}" /> <input
														type="hidden" name="buyingNo" value="${qnaList.buyingNo}" />
													<input type="hidden" name="queNo" value="${qnaList.queNo}" />
												</form>
												<form action="/deleteQuestion" method="post">
													<input type="hidden" style="display: inline" name="queNo"
														value="${qnaList.queNo}" />

													<div class="col-md-6">
														<button type="submit" style="display: inline"
															class="btn btn-outline-success"
															onclick="return deleteCheck();">삭제</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<c:if test="${qnaList.ansContents ne null}">
								<tr style="padding: 10px">

									<td id="${qnaList.ansNo}" onclick="showAns(${qnaList.ansNo})"
										colspan="2" style="padding-left: 100px"><img
										style="height: 10px" src="/imgs/manager-img/enter.png" /><span><span
											style="color: #007FC8">답변 :</span> 안녕하세요 고객님 수상한레시피입니다.</span></td>
									<td style="text-align: center">stangeRecipe</td>
									<td style="text-align: center"><fmt:formatDate
											value="${qnaList.ansTime}" pattern="yyyy-MM-dd" /></td>

								</tr>
								<tr>
									<td colspan="4" id="${qnaList.ansNo}_hidingAnswer"
										style="display: none">${qnaList.ansContents}</td>
								</tr>
							</c:if>
						</c:forEach>

					</table>

					<!-- 사용자가 문의 한 내역이 없을때  -->
					<c:if test="${empty requestScope.qnaList}">
						<div class="cols-md-10" style="height: 300px">

							<div id="noHasList">
								<h6>1:1문의내역이 존재하지 않습니다.</h6>

							</div>

						</div>
					</c:if>
					<div class="offset-md-11 cols-md-1">

						<br> <br> <br> <br>
						<button type="button" class="btn btn-success"
							onclick="location.href='/views/customerCenterPage/writeQNAPage.jsp'">작성하기</button>
					</div>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br>
				</div>
			</div>
		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
			>
		</div>


	</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 페이지 입니다.</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
	/*faq제목 클릭시 답변 보이게 하는 js  */
	 var toggleText1 = false;
	 var toggleText2 = false;
	 function showFaq(id){
	    console.log(id);
	    $('#'+id+"_hidingContents").toggle('display');
	    console.log($('#'+id+"_hidingContents"));
	    if(toggleText1==true)
	    {
	       toggleText1 = false;
	    }
	    else{

	       toggleText1 = true;
	    }
	 }

	$(document).ready(function() {

		var jbOffset = $('#content-main').offset();

		$(window).scroll(function() {
			if ($(document).scrollTop() >= jbOffset.top) {
				$('#fixed_layer').addClass('jbFixed');

				if (matchMedia("screen and (max-width: 767px)").matches) {
					$('#fixed_layer').removeClass('jbFixed');
				}

			} else {
				
				$('#fixed_layer').removeClass('jbFixed');
			}
			
		});

	});
	/*해당 페이지 표시 */
	$(document).ready(function(){
		$('#list-color tr').eq(1).addClass('on');
		
	});
	
	
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

#notice_sub_tit {
	font-size: 15px;
}

.list-arrow {
	float: right;
}

#hidingContens {
	display: none;
	text-align: center;
}

select:active {
	border-color: black;
}
body{
   
font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>
<body>


	<div class="container-fluid" style="padding: 0px">
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>



		<div id="contents"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<div class="row" style="padding: 0;">
				<div class="col-md-2" style="padding: 0;">
					<!--고객센터 목록  -->
					<br>
					<h2>고객센터</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h2>
						FAQ&nbsp;<span id="notice_sub_tit"> 고객님들이 자주 묻는 질문들을 모두
							모았습니다. </span>
					</h2>
				</div>
			</div>
			<br>
			<div class="row" style="padding: 0;">
				<div id="customCenter" class="col-md-2" style="padding: 0;">
					<!-- 고객센터 목록 테이블 -->
					<jsp:include page="/views/customerCenterPage/contentsLeft.jsp"
						flush="false" />
				</div>



				<div class="col-md-10">
					<form action="/byFaqCategory" method="get">
						<select id="selectedCtg" name="category" size="1"
							style="height: 30px" onChange="if(this.value)this.form.submit();">
							<!-- value있을때만 넘겨줌  -->
							<option value=>선택</option>
							<!-- 해당된 카테고리 selected 작업  -->
							<option value="회원관련"
								<c:if test="${param.category eq '회원관련'}">selected</c:if>>회원관련</option>
							<option value="사이트이용"
								<c:if test="${param.category eq '사이트이용'}">selected</c:if>>사이트이용</option>
							<option value="주문결제"
								<c:if test="${param.category eq '주문결제'}">selected</c:if>>주문결제</option>
							<option value="기타"
								<c:if test="${param.category eq '기타'}">select
					ed</c:if>>기타</option>
						</select>
					</form>
					<br>
					<table class="table" id="faqTable" style="text-align: center">
						<tr>
							<th scope="col" width="50px">번호</th>
							<th scope="col" width="100px">카테고리</th>
							<th scope="col">제목</th>
						</tr>

						<!-- 선택카테고리만  출력  -->
						<c:forEach items="${requestScope.faqList}" var="list">
							<tr>
								<td> ${list.faqNo} </td>
								<td>${list.faqCategory}</td>
								<td id="${list.faqNo}" onclick="showFaq(${list.faqNo}) "
									style="cursor: pointer">${list.faqTitle}</td>
							</tr>
							<!-- 초기 display none -->
							<tr id="${list.faqNo}_hidingContents" style="display: none;">
								<td colspan="3" style="text-align: left">
									<div class="col-md-12" style="padding:30px">
										<img src="/imgs/manager-img/question.png">&nbsp;&nbsp;&nbsp;
										${fn:replace(list.faqContents,newLineChar,"<br>")}

									</div>
								</td>
							</tr>
						</c:forEach>
					</table>



				</div>

			</div>
		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
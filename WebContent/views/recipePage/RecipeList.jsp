<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/recipePage_css/recipeList.css">

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<style>
* {
	padding: 0;
}
</style>

<script>
	var scrollUpDelay = 1;
	var scrollUpSpeed = 30;

	/* 영역 설정 */
	$(document).ready(function() {

		var $info = $("#info");

		window.onresize = function() {
			$info.html(window.innerWidth);
		}
	});

	/* 위로 올라가기 */
	function scrollUp() {
		if (document.body.scrollTop < 1) {
			return;
		}
		document.body.scrollTop = document.body.scrollTop - scrollUpSpeed;
		setTimeout('scrollUp()', scrollUpDelay);
	}
</script>
<!-- 페이지 네비게이션 고정 -->
<script>
	$(document).ready(function() {
		var jbOffset = $('#point').offset();

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
</script>
<script>
	function order(sel) {
		location.href = "/recipeList?cate1=${requestScope.cate1}"
				+ "&cate2=${requestScope.cate2}&cate3=${requestScope.cate3}&cate4=${requestScope.cate4}&order="
				+ sel.getAttribute('id') + "&search=${requestScope.search}";
	}
	function recipeSelect(recipeNo){
		$.ajax({
				url : "/upViews",
				type : "post",
				data : {
					recipeNo : recipeNo
				},
				success : function(data) {
					location.href="/recipe?recipeNo="+recipeNo;
				},
				error : function() {
					console.log("실패");
			}
		});
	};
	function insertRecipe(){
		<% Member m = (Member) session.getAttribute("user"); 
		if(m!=null) { %>
			location.href='/views/insertRecipePage/insertRecipePage.jsp';
		<%}else{%>
		if(window.confirm("로그인을 먼저 진행해주세요")){
			location.href="/views/memberPage/loginPage.jsp";
		}
		<%}%>
		
	}
	
</script>
<title>수상한 레시피</title>

<!-- 스타일 값 설정 -->

</head>

<body style="overflow-x: hidden; overflow-y: auto;">
	<div class="container-fluid" style="padding: 0;">
		<!-- Header -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 해더 -->
	</div>
	<div class="row" style="background-color: #f8faff;">
	<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
		style="padding: 10px;" id="point">
		<div class="row" style="margin-bottom: 30px;">
			<div class="col-md-12" id="category" style="background-color: white; padding: 2%; border-radius: 20px; border: 1px solid lightgray;">
				<c:forEach begin="0" items="${requestScope.category }"
					var="cate-list" varStatus="i">
					<div class="col-md-12" style="margin-bottom: 3px;">
						<span class="category"> <c:choose>
								<c:when test="${i.count-1==0 }">종류별<c:set var="order"
										value="${requestScope.classList}" />
								</c:when>
								<c:when test="${i.count-1==1 }">상황별<c:set var="order"
										value="${requestScope.situationList}" />
								</c:when>
								<c:when test="${i.count-1==2 }">방법별<c:set var="order"
										value="${requestScope.methodList}" />
								</c:when>
								<c:when test="${i.count-1==3 }">재료별<c:set var="order"
										value="${requestScope.ingredientList}" />
								</c:when>
							</c:choose>
						</span>
						<ul id="cate_list" class="nav">
							<c:forEach begin="0" items="${requestScope.category[i.count-1]}"
								var="list" varStatus="j">
								<c:set var="key" value="${order[j.count-1] }" />
								<c:set var="cate1" value="${requestScope.cate1 }" />
								<c:set var="cate2" value="${requestScope.cate2 }" />
								<c:set var="cate3" value="${requestScope.cate3 }" />
								<c:set var="cate4" value="${requestScope.cate4 }" />
								<c:choose>
									<c:when test="${i.count-1==0 }">
										<c:set var="cate1" value="${key}" />
										<c:set var="compare" value="${requestScope.cate1 }" />
									</c:when>
									<c:when test="${i.count-1==1 }">
										<c:set var="cate2" value="${key}" />
										<c:set var="compare" value="${requestScope.cate2 }" />
									</c:when>
									<c:when test="${i.count-1==2 }">
										<c:set var="cate3" value="${key}" />
										<c:set var="compare" value="${requestScope.cate3 }" />
									</c:when>
									<c:when test="${i.count-1==3 }">
										<c:set var="cate4" value="${key}" />
										<c:set var="compare" value="${requestScope.cate4 }" />
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${key==compare}">
										<li class="nav-item"><a class="nav-link active"
											href="/recipeList?cate1=${cate1}
										&cate2=${cate2}&cate3=${cate3}&cate4=${cate4}&search=null">
												${requestScope.category[i.count-1][key] }</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link nonactive"
											href="/recipeList?cate1=${cate1}
										&cate2=${cate2}&cate3=${cate3}&cate4=${cate4}&search=null">${requestScope.category[i.count-1][key] }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="row" style="margin-bottom: 2%;">
			<div class="offset-md-10 col-md-1" style="padding: 0px;">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
					<c:choose>
						<c:when test="${requestScope.order=='recipe_views' }">
							<label class="btn btn-secondary" onclick="order(posted_date);"
								id="posted_date">최신순 </label>
							<label class="btn btn-secondary active"
								onclick="order(recipe_views);" id="recipe_views"> 조회순 </label>
						</c:when>
						<c:otherwise>
							<label class="btn btn-secondary active"
								onclick="order(posted_date);" id="posted_date">최신순 </label>
							<label class="btn btn-secondary" onclick="order(recipe_views);"
								id="recipe_views"> 조회순 </label>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>

		<div class="row">
			<c:if test="${requestScope.pageData.dataList==null }">
				<jsp:include page="/views/recipePage/recipeEmpty.html"></jsp:include>
			</c:if>
			<c:forEach begin="0" items="${requestScope.pageData.dataList}"
				var="list" varStatus="i">
				<div class="col-md-4" style="margin-bottom: 3%;">
					<div style="margin: 2%; border-radius: 20px; background-color: white; height: 100%; border: 1px solid lightgray;">
						<c:url var="url" value="/recipe">
							<c:param name="recipeNo" value="${requestScope.pageData.dataList[i.count-1].recipeNo}" />
						</c:url>
					<div class="recipe-list list1" onclick="recipeSelect(${requestScope.pageData.dataList[i.count-1].recipeNo});"<%-- "location.href='${url}'" --%> style="height: 100%;">
						<div class="recipe-pic" style="padding-top: 5%;">
							<img src="${requestScope.pageData.dataList[i.count-1].recipePic}"
								class="rounded">
						</div>
						<div class="recipe-title" style="text-overflow: ellipsis; height: 50px; width: auto; overflow: hidden;">
							${requestScope.pageData.dataList[i.count-1].recipeTitle}
							<fmt:formatDate var = "postDate" value="${requestScope.pageData.dataList[i.count-1].postedDate}" pattern = "yyyy-MM-dd"/>
							<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/>
							<c:set var="sevenago" value="<%=new Date(new Date().getTime() - 60*60*24*1000*3)%>"/>
							<fmt:formatDate value="${sevenago}" pattern="yyyy-MM-dd" var="sevenago"/>
 							<c:set var="sevenafter" value="<%=new Date(new Date().getTime() + 60*60*24*1000*3)%>"/>
							<fmt:formatDate value="${sevenafter}" pattern="yyyy-MM-dd" var="sevenafter"/>
 							
 							<c:if test="${sevenago < postDate && postDate < sevenafter }">
								<img src="/imgs/recipe_img/new-tag.png" class="img-new" />
							</c:if>
						</div>
						<div class="recipe-intro" style="text-overflow: ellipsis; height: 100px; width: auto; overflow: hidden;">
						${requestScope.pageData.dataList[i.count-1].recipeIntro}
						</div>
						<div>
						<span style="margin-left: 10%; display: inline-block; font-weight: bolder; color: gray">by. ${requestScope.pageData.dataList[i.count-1].video}</span>
						<img style="margin-left: 45%;" src="/imgs/main-img/like.png" class="views-icon" width="17px">
						<div class="views"><fmt:formatNumber value="${requestScope.pageData.dataList[i.count-1].recipeViews}" groupingUsed="true"/></div>
						</div>
					</div>
				</div>
				</div>

				<div class="row"></div>
			</c:forEach>
		</div>
		
		<!-- 검색바 지수 -->
		<fieldset>
			<div class="col-md-6 input-group mb-3 mx-auto" style="padding-left:120px;">
				<input type="text" class="form-control" id="material"
					name="searchVal" placeholder=""
					aria-label="Recipient's username"
					aria-describedby="basic-addon2" style="width: 0px; margin-left: 40px;">
					<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						onclick="search();">
						<img src="/imgs/icons/search.svg">
					</button>
					</div>
					<div class="col-md-4">
						<button class="btn btn-primary" onclick="insertRecipe();"
						style="background-color: #512772 !important; color: white !important; margin-left: 350px">레시피 등록</button>
				</div>
				</div>
		</fieldset><br>
		<script>
			function search() {
				var searchVal = $('#material').val();
				location.href = "/recipeList?cate1=0&cate2=0&cate3=0&cate4=0&search="+searchVal;
			}
		</script>
		<!--지수 추가  -->
		
		<div class="row">
			<div style="margin-left: 40%;">
			<ul id="pageNavi" class="pagination">
				${requestScope.pageData.pageNavi }
			</ul>
			</div>
		</div>
		<br>			<!-- 추가 지수 -->
	</div>
	</div>

	<!-- Footer -->
	<div id="footer"
		class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
		style="border: 1px solid black; padding: 10px;">
		<jsp:include page="/views/footer/main-Footer.jsp"></jsp:include>
	</div>
</body>
</html>
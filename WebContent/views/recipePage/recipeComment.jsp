<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12" style="padding-left: 3%; padding-top: 2%;">
		<!-- 댓글제목, 갯수 -->
		<img src="/imgs/recipe_img/chat.png" style="margin-bottom: 10px;">
		<h3 style="display: inline-block; margin-top: 10px; margin-bottom: 0">댓글</h3>
	</div>
	<div class="col-md-12">
		<!-- 댓글내용 -->
		<div class="comment-content"></div>
	</div>
	<div class="container">
	<div class="row" >
		<ul id="pageNavi" class="pagination" style="margin-left: auto; margin-right: auto;">
		</ul>
	</div>
	<div class="col-md-12">
	</div>
		<!-- 댓글작성 -->
	</div>
	<script>
		function showComment(page) {
			var recipeNo = getParameters('recipeNo');
			$.ajax({
				url : "/recipeComment",
				type : "get",
				data : {
					recipeNo : recipeNo,
					page : page
				},
				success : function(data) {
					var str = '';
					console.log(data.dataList);
					for (var i = 0; i < data.dataList.length; i++) {
						str += '<div class="media">'+
						'<img class="mr-3" src="'+data.dataList[i].memberPic+'">'+
						'<div class="media-body">'+
							'<h5 class="mt-0">'+data.dataList[i].enrollDate+'</h5>'+
							data.dataList[i].commentContents+
						'</div>'+
						'</div>';
					}
					$('.comment-content').html(str);
					$('#pageNavi').html(data.pageNavi);
				},
				error : function() {
					console.log("실패");
				}
			});
		};
		$(document).ready(function() {
			showComment();
		});
		var getParameters = function(paramName) {
			// 리턴값을 위한 변수 선언
			var returnValue;

			// 현재 URL 가져오기
			var url = location.href;

			// get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
			var parameters = (url.slice(url.indexOf('?') + 1, url.length))
					.split('&');

			// 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
			for (var i = 0; i < parameters.length; i++) {
				var varName = parameters[i].split('=')[0];
				if (varName.toUpperCase() == paramName.toUpperCase()) {
					returnValue = parameters[i].split('=')[1];
					return decodeURIComponent(returnValue);
				}
			}
		};
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- 초기화 -->
<!--ddddd  -->
<link rel="stylesheet" href="/WebContent/css/reset.css">
<link rel="stylesheet" href="/WebContent/css/main-style.css">

<title>수상한 레시피</title>

<script>
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/mainpage-header/main-header.html");
		$("#footer").load("/views/mainpage-footer/main-footer.html");
	});
	$(div).style('border: 1px solid black');
</script>

<style>
/* 미구현  */
@media ( min-width : 768px) {
	.header {
		max-width: 100%;
	}
}

div {
	border: 1px solid black;
}
</style>


</head>
<body>

	<div id="header"></div>

	<div class="row">
		<div class="col-md-8">
			<h1>레시피 등록</h1>

			<!-- <form class="form-inline">
			<div class="form-group">
				<div class="row-fluid">

					<label for="exampleInputName2">레시피 제목</label> <input type="text"
						class="form-control" id="exampleInputName2"
						placeholder="예) 소고기 미역국 끓이기">
				</div>
				<br> <br>
				<div class="form-group">
					<label for="exampleInputEmail2">요리 소개</label>
					<textarea id="exampleInputEmail2" placeholder="이 레시피의 탄생배경을 적어주세요"></textarea>
				</div>
				<br> <br>
				<div class="form-group">
					<label for="exampleInputEmail2">동영상</label> <input type="email"
						class="form-control" id="exampleInputEmail2"
						placeholder="이 레시피의 탄생배경을 적어주세요">
				</div>
				</div>
				<div class="col-md-4">
				<br> <select class="form-group">
					<option selected>종류별</option>
					<option>밑반찬</option>
					<option>메인반찬</option>
					<option>국/탕</option>
					<option>찌개</option>
					<option>디저트</option>
					<option>면/만두</option>
					<option>밥/죽/떡</option>
					<option>퓨전</option>
					<option>김치/젓갈/장류</option>
					<option>양념/소스/잼</option>
					<option>양식</option>
					<option>샐러드</option>
					<option>스프</option>
					<option>빵</option>
					<option>과자</option>
					<option>차/음료/술</option>
					<option>기타</option>
				</select> <select class="form-group">
					<option selected>상황별</option>
					<option>일상</option>
					<option>초스피드</option>
					<option>손님접대</option>
					<option>술안주</option>
					<option>다이어트</option>
					<option>도시락</option>
					<option>영양식</option>
					<option>간식</option>
					<option>야식</option>
					<option>푸드스타일링</option>
					<option>해장</option>
					<option>명절</option>
					<option>이유식</option>
					<option>기타</option>
				</select> <select class="form-group">
					<option selected>방법별</option>
					<option>볶음</option>
					<option>끓이기</option>
					<option>부침</option>
					<option>조림</option>
					<option>무침</option>
					<option>비빔</option>
					<option>찜</option>
					<option>절임</option>
					<option>튀김</option>
					<option>삶기</option>
					<option>굽기</option>
					<option>데치기</option>
					<option>회</option>
					<option>기타</option>
				</select> <select class="form-group">
					<option selected>재료별</option>
					<option>소고기</option>
					<option>돼지고기</option>
					<option>닭고기</option>
					<option>육류</option>
					<option>채소류</option>
					<option>해물류</option>
					<option>달걀/유제품</option>
					<option>가공식품류</option>
					<option>쌀</option>
					<option>밀가루</option>
					<option>건어물류</option>
					<option>버섯류</option>
					<option>과일류</option>
					<option>콩/견과류</option>
					<option>곡류</option>
					<option>기타</option>
				</select>
				<button type="submit" class="btn btn-default">Send
					invitation</button>
					</div>
			</div>
		</form>
	</div> -->

			<div class="container-fluid" id="all">
				<div class="row">레시피 등록</div>
				<div class="row">
					<div class="col-md-9">
						<div class="row">
							<div class="col-md-3">
								<label for="recipeTitle">레시피 제목</label>
							</div>
							<div class="col-md-9">
								<input type="text" class="form-control"
									placeholder="예) 소고기 미역국 끓이기">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label for="recipeIntro">요리소개</label>
							</div>
							<div class="col-md-9">
								<textarea id="exampleInputEmail2"
									placeholder="이 레시피의 탄생배경을 적어주세요"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label for="recipeIntro">동영상</label>
							</div>
							<div class="col-md-9">
								<textarea id="exampleInputEmail2" placeholder="동영상"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label for="recipeIntro">카테고리</label>
							</div>
							<div class="col-md-9">
								<select class="form-group">
									<option selected>종류별</option>
									<option>밑반찬</option>
									<option>메인반찬</option>
									<option>국/탕</option>
									<option>찌개</option>
									<option>디저트</option>
									<option>면/만두</option>
									<option>밥/죽/떡</option>
									<option>퓨전</option>
									<option>김치/젓갈/장류</option>
									<option>양념/소스/잼</option>
									<option>양식</option>
									<option>샐러드</option>
									<option>스프</option>
									<option>빵</option>
									<option>과자</option>
									<option>차/음료/술</option>
									<option>기타</option>
								</select> <select class="form-group">
									<option selected>상황별</option>
									<option>일상</option>
									<option>초스피드</option>
									<option>손님접대</option>
									<option>술안주</option>
									<option>다이어트</option>
									<option>도시락</option>
									<option>영양식</option>
									<option>간식</option>
									<option>야식</option>
									<option>푸드스타일링</option>
									<option>해장</option>
									<option>명절</option>
									<option>이유식</option>
									<option>기타</option>
								</select> <select class="form-group">
									<option selected>방법별</option>
									<option>볶음</option>
									<option>끓이기</option>
									<option>부침</option>
									<option>조림</option>
									<option>무침</option>
									<option>비빔</option>
									<option>찜</option>
									<option>절임</option>
									<option>튀김</option>
									<option>삶기</option>
									<option>굽기</option>
									<option>데치기</option>
									<option>회</option>
									<option>기타</option>
								</select> <select class="form-group">
									<option selected>재료별</option>
									<option>소고기</option>
									<option>돼지고기</option>
									<option>닭고기</option>
									<option>육류</option>
									<option>채소류</option>
									<option>해물류</option>
									<option>달걀/유제품</option>
									<option>가공식품류</option>
									<option>쌀</option>
									<option>밀가루</option>
									<option>건어물류</option>
									<option>버섯류</option>
									<option>과일류</option>
									<option>콩/견과류</option>
									<option>곡류</option>
									<option>기타</option>
								</select>
							</div>
							<div class="row">
								<div class="col-md-3">
									<label for="recipeIntro">요리정보</label>
								</div>
								<div class="col-md-9">
									인원 <select class="form-group">
										<option selected>인원</option>
										<option>1인분</option>
										<option>2인분</option>
										<option>3인분</option>
										<option>4인분</option>
										<option>5인분</option>
										<option>6인분 이상</option>
									</select> 시간 <select class="form-group">
										<option selected>시간</option>
										<option>5분이내</option>
										<option>10분이내</option>
										<option>15분이내</option>
										<option>30분이내</option>
										<option>60분이내</option>
										<option>90분이내</option>
										<option>2시간이내</option>
										<option>2시간이상</option>
									</select> 난이도 <select class="form-group">
										<option selected>난이도</option>
										<option>아무나</option>
										<option>초급</option>
										<option>중급</option>
										<option>고급</option>
										<option>신의경지</option>
									</select>
								</div>
							</div>
						</div>

					</div>


					<div class="col-md-3">사진들어갈공간</div>
				</div>
			</div>
		</div>



		<div id="footer"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertRecipePage</title>

<!--CSS-->
<link rel="stylesheet" href="/css/insertRecipe_css/semi_insertRecipeCss.css">

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
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
	
	/* 요리순서-추가기능 넣는 곳  */
	function materPlus(){
		document.getElementById("materPlus").style="display:inline";
		/* $('#plusFunc').append('<form id="materPlus"><div class="row"><div class="col-md-6 mx-auto"><div class="row">'+
					'<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_material.png"></div>'+
					'<div class="col-md-10"><input type="text" class="form-control" placeholder="밀가루 100g,소금 2큰술,물100g"></div></div></div></div></form>'); */
	}
	function toolPlus(){
		document.getElementById("toolPlus").style="display:inline";
	}
	function firePlus(){
		document.getElementById("firePlus").style="display:inline";
	}
	function tipPlus(){
		document.getElementById("tipPlus").style="display:inline";
	}
	function allPlus(){
		document.getElementById("materPlus").style="display:inline";
		document.getElementById("toolPlus").style="display:inline";
		document.getElementById("firePlus").style="display:inline";
		document.getElementById("tipPlus").style="display:inline";
	}
	
	/* 요리순서-step 추가 넣는 곳  */
	
	 function stepPlus(){
		$('.test').append('<div class="row"><div class="col-md-2"><h3>Step1</h3></div>'+
				'<div class="col-md-7"><textarea class="form-control" rows="6" placeholder="예)소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="resize: none;"></textarea></div>'+
				'<div class="col-md-3"><button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none2.jpg" width="150" height="150"></button></div></div>'+
				'<div class="row"><div class="col-md-12">　　</div></div>'+
				'<div class="row">'+
				'<div class="col-md-6 mx-auto">'+
				'<div class="row">'+
				'<div class="col-md-12 mx-auto">'+
				'<div class="row">'+
				'<div class="col-md-1">　　</div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="materPlus();">재료</button></div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="toolPlus();">도구</button></div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="firePlus();">불</button></div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="tipPlus();">팁</button></div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="allPlus();">전체</button></div>'+
				'<div class="col-md-1">　　</div></div></div></div></div></div>'+
				'<div class="row"><div class="col-md-12">　　</div></div>'+
				'<div class="row"><div class="col-md-12">　　</div></div>'+
					'<form id="materPlus" style="display:none;">'+
					'<div class="row">'+
					'<div class="col-md-6 mx-auto">'+
					'<div class="row"><div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_material.png"></div>'+
						'<div class="col-md-10"><input type="text" class="form-control" placeholder="밀가루 100g,소금 2큰술,물100g"></div></div></div></div></form>'+
					'<form id="toolPlus" style="display:none;">'+
					'<div class="row"><div class="col-md-6 mx-auto"><div class="row">'+
						'<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_tool.png"></div>'+
						'<div class="col-md-10"><input type="text" class="form-control" placeholder="국자,볼"></div></div></div></div></form>'+
					'<form id="firePlus" style="display:none;">'+
					'<div class="row"><div class="col-md-6 mx-auto"><div class="row">'+
						'<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_fire.png"></div>'+
						'<div class="col-md-10"><input type="text" class="form-control" placeholder="약불"></div></div></div></div></form>'+
					'<form id="tipPlus" style="display:none;">'+
					'<div class="row"><div class="col-md-6 mx-auto"><div class="row">'+
						'<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_tip2.png"></div>'+
						'<div class="col-md-10"><textarea class="form-control" rows="2" style="resize: none;"></textarea></div></div></div></div></form>'+
					'<div class="row"><div class="col-md-12">　　</div></div>'); }
	
	/* 네비게이션부분  */
	
	 $(document).ready(function() {

			var jbOffset = $('#navClose').offset();

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


</head>
<body>


	<div class="container-fluid" id="maindiv"> 
		<!--헤더예용! -->
		<div id="header"></div>
		<br><br>
		<!-- 컨테츠예용! -->
		<div class="row" id="inRecipe">
		
			<div class="col-md-8 mx-auto" id="inRecipeTitle">
			
			<div class="row" id="inRecipeTitle">
				<div class="col-md-12" id="inRecipeTitleAll">
				<div class="row" id="mainTitle"><div class="col-md-12"><h1>레시피 등록</h1></div></div>
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<div class="row" id="inRecipeOne"> 
					<div class="col-md-9" id="inRecipeTitleLeft">
					<div class="row">					
					<div class="col-md-3"><label for="recipeTitle"><h4>레시피 제목</h4></label></div>
					<div class="col-md-9"><input type="text" class="form-control" placeholder="예) 소고기 미역국 끓이기"></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<div class="col-md-3"><label for="recipeIntro"><h4>요리소개</h4></label></div>
					<div class="col-md-9"><textarea class="form-control" rows="5" id="exampleInputEmail2" placeholder="이 레시피의 탄생배경을 적어주세요" style="resize: none;"></textarea></div>
					</div>
					<div class="row" id="navClose"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<div class="col-md-3"><label for="recipeVideo"><h4>동영상</h4></label></div>
					<div class="col-md-6"><textarea class="form-control" rows="5" id="exampleInputEmail2" placeholder="예)동영상이 있으면 주소를 입력하세요.(Youtube,네이버tvcast,다음tvpt만 가능)예)http://youtu.be/l=|AOBxo3IZmM" style="resize: none;"></textarea></div>
					<div class="col-md-3"><button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none5.jpg" width="170" height="125"></button></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<div class="col-md-3"><label for="recipeCategory"><h4>카테고리</h4></label></div>
					<div class="col-md-2">
					<select  class="form-control">
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
								</select>
					</div>
					<div class="col-md-3">
					<select class="form-control">
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
								</select>
					</div>
					<div class="col-md-2">
					<select class="form-control">
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
								</select>
					</div>
					<div class="col-md-2">
					<select class="form-control">
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
					</div><!-- 카테고리닫기 -->
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<!-- <div class="col-md-2"></div> -->
					<div class="col-md-12"><h6>분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.</h6></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<div class="col-md-3"><label for="recipeInfor"><h4>요리정보</h4></label></div>
					<div class="col-md-1">인원</div>
					<div class="col-md-2">
					 <select class="form-control">
										<option selected>인원</option>
										<option>1인분</option>
										<option>2인분</option>
										<option>3인분</option>
										<option>4인분</option>
										<option>5인분</option>
										<option>6인분 이상</option>
									</select>
					</div>
					<div class="col-md-1">시간</div>
					<div class="col-md-2">
					<select class="form-control">
										<option selected>시간</option>
										<option>5분이내</option>
										<option>10분이내</option>
										<option>15분이내</option>
										<option>30분이내</option>
										<option>60분이내</option>
										<option>90분이내</option>
										<option>2시간이내</option>
										<option>2시간이상</option>
									</select>
					</div>
					<div class="col-md-1">난이도</div>
					<div class="col-md-2">
					<select class="form-control">
										<option selected>난이도</option>
										<option>아무나</option>
										<option>초급</option>
										<option>중급</option>
										<option>고급</option>
										<option>신의경지</option>
									</select>
					</div>
					</div><!-- 요리정보 닫기 -->
				</div>
				<div class="col-md-3" id="photo">
					<button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none4.jpg" width="225" height="225"></button>
					</div>			
			</div>
			</div><!-- 레시피 기본정보 col값 줌 -->
			</div><!-- 레시피 기본 정보 넣는곳 -->
			 <br><br>
			 
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			<div class="row" id="inRecipeMater">
				<div class="col-md-12" id="materComent">
				<div class="row"><div class="col-md-12" id="materComent"><h6>재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</h6></div></div>
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<div class="row">
					<div class="col-md-4 id="materLeft">
						<div class="row"> 
						<div class="col-md-12">
						<div class="row"><div class="col-md-2">화살표!!</div><div class="col-md-10"><input type="text" class="form-control" value="재료"></div></div>
						</div></div>
						<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
						<div class="row">
						<div class="col-md-6"><button class="btn btn-default">한번에 넣기</button></div>
						<div class="col-md-6"><button class="btn btn-default">한번에 넣기</button></div>
						</div>
						<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					</div>
					<div class="col-md-8 id="materRight">
					<div class="row">
						<div class="col-md-2"><button type="button" class="btn btn-default" aria-label="Left Align">
 							 <span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
						</button></div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">
						<div class="col-md-2">화살표</div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">
						<div class="col-md-2">화살표</div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">
						<div class="col-md-8 mx-auto"><div class="row"><div class="col-md-2 mx-auto"><button class="btn btn-default">추가</button></div></div></div>
					</div>
					</div>
				</div>
				<hr>
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<div class="row" >
					<div class="col-md-12">
					<div class="row"><div class="col-md-8 mx-auto"><h6>※ 양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요.</h6></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-2 mx-auto"><button>+재료/양념 묶음 추가</button></div></div>
					</div>
				</div>
				
				</div> <!--재료정보 전체 틀 잡음  -->
				</div> <!--재료정보 넣는 곳  -->
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			<div class="row" id="inRecipeOrder">
				<div class="col-md-12">
					<div class="row"><div class="col-md-12"><h4>요리순서</h4></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-12">
					요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.<br>
					예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.<br>
      				마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다.<br>
     				 꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.</div></div>
     				 <div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
     				 
     				<div class="test">
					<div class="row"><div class="col-md-2"><h3>Step1</h3></div>
					<div class="col-md-7"><textarea class="form-control" rows="6" placeholder="예)소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="resize: none;"></textarea></div>
					<div class="col-md-3"><button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none2.jpg" width="150" height="150"></button></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
					<div class="col-md-12 mx-auto">
					<div class="row">
					<div class="col-md-1">　　</div><!-- 빈 공란 -->
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="materPlus();">재료</button></div>
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="toolPlus();">도구</button></div>
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="firePlus();">불</button></div>
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="tipPlus();">팁</button></div>
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="allPlus();">전체</button></div>
					<div class="col-md-1">　　</div><!-- 빈 공란 -->
					</div>
					</div>
					</div>
					</div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					
					
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<form id="materPlus" style="display:none;">
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
						<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_material.png"></div>
						<div class="col-md-10"><input type="text" class="form-control" placeholder="밀가루 100g,소금 2큰술,물100g"></div></div></div></div></form>
						
					<form id="toolPlus" style="display:none;">
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
						<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_tool.png"></div>
						<div class="col-md-10"><input type="text" class="form-control" placeholder="국자,볼"></div></div></div></div></form>
						
					<form id="firePlus" style="display:none;">
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
						<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_fire.png"></div>
						<div class="col-md-10"><input type="text" class="form-control" placeholder="약불"></div></div></div></div></form>
						
					<form id="tipPlus" style="display:none;">
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
						<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_tip2.png"></div>
						<div class="col-md-10"><textarea class="form-control" rows="2" style="resize: none;"></textarea></div></div></div></div></form>
						
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->	
					</div><!-- jquery 사용할 div -->
						
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-12"><button onclick="stepPlus();">+순서추가</button></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-2"><div class="row"><div class="col-md-12"><h4>요리완성사진</h4></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-12"><button>+사진 한번에 넣기</button></div></div></div>
					<div class="col-md-2"><button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130"></button></div>
					<div class="col-md-2"><button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130"></button></div>
					<div class="col-md-2"><button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130"></button></div>
					<div class="col-md-2"><button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130"></button></div>
					<div class="col-md-2"><button type="button" class="photoBtn"><img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130"></button></div>
					</div>
				</div><!--요리순서 전체 틀 잡음  -->
			</div> <!--요리순서 넣는곳-->
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			<div class="row" id="inRecipeTip">
				<div class="col-md-12">
				<div class="row">
				<div class="col-md-3"><h4>요리팁</h4></div>
				<div class="col-md-9">
				<textarea class="form-control" rows="5" placeholder="예)고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요." style="resize: none;"></textarea>
				</div>	
				</div>
				</div><!--요리팁 전체 틀 잡음  -->
			</div> <!--요리팁 넣는 곳  -->
			
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			
			<div class="row" id="inRecipeTag">
				<div class="col-md-12">
				<div class="row">
				<div class="col-md-3"><h4>태그</h4></div>
				<div class="col-md-9">
				<input type="text" class="form-control">
				</div>	
				</div>
			</div> <!--태그 전체 틀 잡음  -->
			</div> <!--태그 넣는 곳  -->
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			<div class="row" id="inRecipeBtn">
				<div class="col-md-12">
				<div class="row">
				<div class="col-md-2">ㅎㅎ</div>
				<div class="col-md-2"><button>저장</button></div>
				<div class="col-md-4"><button>저장 후 공개하기</button></div>
				<div class="col-md-2"><button>취소</button></div>
				<div class="col-md-2">ㅎㅎ</div>
				</div>
				</div>
			</div>
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			</div> <!-- 가운데정렬할것 -->
		</div> <!--컨텐츠전체--> 
		
		
		<!--푸터예용! -->
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
		
	</div><!--전체  -->



</body>
</html>

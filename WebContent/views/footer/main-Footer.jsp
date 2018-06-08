<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>main-footer</title>
<link rel="stylesheet" href="/WebContent/css/reset.css">
<link rel="stylesheet" href="/WebContent/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<style>

/* 상단 여백 10px */
#footer_link ul li {
	display: inline;
	/* 세로나열을 가로나열로 변경 */
	border-left: 1px solid #999;
	/* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
	font: bold 9px Dotum;
	/* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
	padding: 0 10px;
	/* 각 메뉴 간격 */
}

#footer_link ul li:first-child {
	border-left: none;
}
</style>
</head>

<body>
	<!-- 고객 센터 -->
	<div id="footer_cc" class="com-md-4">
		<h3 style="padding-bottom: 9px;">고객센터</h3>
		<div class="row">

			<!-- 전화문의 -->
			<div class="col-md-4 cc-call-view" style="padding-left: 15px;">
				<h6>
					<span>전화문의(010-4844-5132)</span>
				</h6>
				<dl class="list" style="margin-bottom: 0px;">
					<dt
						style="float: left; font: bold; padding-right: 8px; margin-bottom: 0px;">평일</dt>
					<dd style="margin-bottom: 0px;">
						오전 8시 - 오후 4시 <span style="font-size: 13px;">(점심시간 오후
							12시-오후1시)</span>
					</dd>
				</dl>
				<dl class="list">
					<dt style="float: left; font: bold; padding-right: 8px;">토요일,일요일
						& 공휴일</dt>
					<dd>
						<span style="font-size: 13px;">오전 10시 - 오후 8시</span>
					</dd>
				</dl>
			</div>

			<!-- 카카오톡 문의 -->
			<div class="col-md-4 cc-kakao-view" style="padding-left: 15px;">
				<h6>
					<span> <a href="#">카카오톡 문의</a>
					</span>
				</h6>

				<dl class="list" style="margin-bottom: 0px;">
					<dt
						style="float: left; font: bold; padding-right: 8px; margin-bottom: 0px;">평일</dt>
					<dd style="margin-bottom: 0px;">
						오전 8시 - 오후 4시 <span style="font-size: 13px;">(점심시간 오후
							12시-오후1시)</span>
					</dd>
				</dl>

				<dl class="list">
					<dt style="float: left; font: bold; padding-right: 8px;">토요일,일요일
						& 공휴일</dt>
					<dd>
						<span style="font-size: 13px;">오전 10시 - 오후 8시</span>
					</dd>
				</dl>

			</div>

			<!-- 1:1 문의 -->
			<div class="col-md-4 cc-qna-view" style="padding-left: 15px;">
				<h6>
					<span> <a href="#">1:1 문의</a>
					</span>
				</h6>
				<p>
					궁금한 점이 있으신가요? <br> 1:1 문의에 남겨주시면 친절히 답변 드리겠습니다.
				</p>
			</div>
		</div>
	</div>

	<!-- 링크 -->
	<div id="footer_link" class="col-md-12" style="padding: 0px;">
		<ul style="padding: 0px;">
			<li style="padding-left: 0px; font-size: 15px;"><a href="#">수상한
					레시피 소개</a></li>
			<li style="font-size: 15px;"><a href="#">이용안내</a></li>
			<li style="font-size: 15px;"><a href="#">이용약관</a></li>
			<li style="font-size: 15px;"><a href="#">광고문의</a></li>
			<li style="font-size: 15px;"><a href="#">개인정보 처리방침</a></li>
		</ul>
	</div>

	<!-- 정보 -->
	<div id="footer_info" class="col-md-12" style="padding: 0px;">
		<div class="row">

			<!-- 회사정보 -->
			<div id="info_company" class="col-md-4" style="padding-left: 15px;">
				<dl style="font-size: 12px; margin-bottom: 0px;">
					<dt style="padding-right: 2px; float: left;">법인명(상호) :</dt>
					<dd>(주) 수상한 레시피</dd>
				</dl>
				<dl style="font-size: 12px; margin-bottom: 0px;">
					<dt style="padding-right: 2px; float: left;">대표자(성명) :</dt>
					<dd>정지수</dd>
				</dl>
				<dl style="font-size: 12px; margin-bottom: 0px;">
					<dt style="float: left; padding-right: 2px;">개인정보보호책임자 :</dt>
					<dd>황지현(hjh930302@hanmail.net)</dd>
				</dl>
				<dl style="font-size: 12px; margin-bottom: 0px;">
					<dt style="float: left; padding-right: 2px;">사업자번호 :</dt>
					<dd>111-03242-223</dd>
				</dl>
			</div>

			<!-- 회사정보 -->
			<div id="info_company" class="col-md-4" style="padding-left: 15px;">
				<dl style="font-size: 12px; margin-bottom: 0px;">
					<dt style="padding-right: 2px; float: left;">마케팅제휴 :</dt>
					<dd>jong920224@naver.com</dd>
				</dl>
				<dl style="font-size: 12px; margin-bottom: 0px;">
					<dt style="padding-right: 2px; float: left;">채용문의 :</dt>
					<dd>jong920224@naver.com</dd>
				</dl>
				<dl style="font-size: 12px; margin-bottom: 0px;">
					<dt style="padding-right: 2px; float: left;">팩스 :</dt>
					<dd>070-7500-6098</dd>
				</dl>
				<dl style="font-size: 12px; margin-bottom: 0px;">
					<dt style="padding-right: 2px; float: left;">주소 :</dt>
					<dd>서울 영등포구 선유동2로 57 이레빌딩</dd>
				</dl>
			</div>

			<!-- 브랜드 로고 -->
			<div></div>
		</div>
	</div>
</body>
</html>
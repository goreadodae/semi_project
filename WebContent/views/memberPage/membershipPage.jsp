<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<%
	Member m = (Member) session.getAttribute("user");
%>
<html>
<head>
<title>수상한 레시피</title>
</head>

<!-- 모든 스타일 시트 적용 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<!-- 메인 전용 css -->
<link rel="stylesheet" href="/css/mainPage_css/main.css">
<link rel="stylesheet" href="/css/member_css/membership.css">

<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
   $(document).ready(function() {
      /* 해더 불러오는 제이쿼리 */
      $("#footer").load("/views/footer/main-Footer.jsp");
   });
</script>


<body style="overflow-x: hidden; overflow-y: auto;">
	<!-- 전체 컨테이너  -->
	<div class="container-fluid" style="padding: 0px;">

		<!-- 해더 영역 -->
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>
		<!-- 헤더 영역 끝 -->

		<!-- 컨텐츠 영역 -->
		<div id="content-main" class="contents">
			<div class="col-md-12" style="padding: 0;">
				<div class="col-md-8 mx-auto member-join" style="margin-top: 20px; padding:0px;">
					<h2>약관<a href="#" class="ghost" id="hide-button1" style="float: right; color: white;">동의함</a></h2>
					<ul class="agreement row">
						<li class="box" style="margin-left: 15px; border: 1px solid black;">
							<h3>이용약관</h3>
							<div>
								<p style="display: block; padding: 20px 0">
									<a href="javascript:void(0);"
										onclick="$(this).parent().children().not(this).css('font-weight', ''); $(this).css('font-weight', '500'); $(this).parent().parent().children('p.korean, p.english').hide().filter('.korean').show();"
										style="font-weight: 500">한국어</a> / <a
										href="javascript:void(0);"
										onclick="$(this).parent().children().not(this).css('font-weight', ''); $(this).css('font-weight', '500'); $(this).parent().parent().children('p.korean, p.english').hide().filter('.english').show();">English</a>
								</p>
								<p class="korean">
									이용 약관 <br /> <br /> 제1조 (목적) <br /> <br /> 이 이용 약관(이하
									"약관"이라고 합니다)은 KH 주식회사(이하 "회사"라고 합니다)가 운영하는 수상한 레시피 (이하 "몰"이라고
									합니다)에서 제공하는 서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리와 의무 및 책임사항을
									규정함을 목적으로 합니다. <br /> <br /> <br /> 제2조 (정의) <br /> <br />
									① "몰"이란 회사가 재화 또는 용역(이하 "재화 등"이라고 합니다)을 이용자에게 제공하기 위하여 컴퓨터 등
									정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말합니다. <br /> <br />
									② "몰"은 재화 등을 판매하는 사이버 몰을 운영하는 사업자의 의미로도 사용되며, 이 경우 "몰"은 "무브
									주식회사" 와 동등한 의미로 사용됩니다. <br /> <br /> ③ "이용자"란 몰에 접속하여 약관에 따라
									몰이 제공하는 서비스를 받는 회원 및 비회원(방문자)을 의미합니다. <br /> <br /> ④ "회원"이라
									함은 몰에 개인정보를 제공하여 회원등록을 한 자로서, 몰의 정보를 지속적으로 제공받으며, 몰이 제공하는 서비스를
									계속적으로 이용할 수 있는 자를 말합니다. <br /> <br /> ⑤ "비회원"이라 함은 몰에 회원등록을
									하지 않고 몰이 제공하는 서비스를 이용하는 자를 말합니다. <br /> <br /> ⑥ "컨텐츠"라 함은 몰에
									게재된 모든 문서, 그림, 사진, 일러스트, 사용자 환경, 로고, 소리, 음악, 컴퓨터 코드, 디자인, 구조,
									코디네이션, 표현, 전반적인 느낌과 분위기 등을 의미합니다. <br /> <br /> <br /> <br />
									제3조 (약관 등의 명시와 설명 및 개정) <br /> <br /> ① 회사는 이 약관의 내용을 이용자가 알
									수 있도록 사이트의 초기화면에 하이퍼링크로 게시합니다. 아울러 몰은 상호 및 대표자 성명, 영업소 소재지 주소,
									전화번호, 팩스번호, 이메일 주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등의 정보를 이용자가
									쉽게 알 수 있도록 몰의 초기 서비스화면에 게시합니다. <br /> <br /> ② 회사는 약관에 정하여져
									있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 하이퍼링크
									등을 통해 제공하여 이용자의 확인을 구할 수 있습니다. <br /> <br /> ③ 회사는
									전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법,
									정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련 법규를 위배하지 않는 범위에서 이 약관의
									일부를 변경, 수정, 추가, 삭제할 수 있습니다. <br /> <br /> ④ 회사가 약관을 개정할 경우에는
									적용일자 및 개정사유를 약관의 하단에 명시하고, 몰의 초기화면의 공지사항 혹은 그에 준하는 게시판 또는 웹
									페이지에 공지합니다. <br /> <br /> ⑤ 회사가 제4항에 따라 개정된 약관을 공지할 때는 현행약관과
									함께 그 적용일자로부터 7일 전부터 1일 전까지 공지합니다. <br /> <br /> ⑥ 회사가 약관을 개정할
									경우, 개정 약관은 소급적용되지 않습니다. 다만 이미 계약을 체결한 이용자가 개정약관을 적용을 받기를 원하는 뜻을
									제5항에 의한 공지기간 내에 회사에 송신하여 회사의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. <br />
									<br /> ⑦ 약관에서 정하지 아니한 사항과 이 약관의 해석에 관해서는 전자상거래등에서의소비자보호에관한법률,
									약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 등 관계 법령 및 유권 기관의 해석
									또는 통상의 상관례에 따릅니다. <br /> <br /> <br /> <br /> 제4조 (몰의 컨텐츠)
									<br /> <br /> ① 컨텐츠는 회사가 소유하고 제어하며, 법적인 권리를 보유하고 있을 뿐만 아니라
									저작권과 특허권, 상표권을 비롯한 다양한 지적 재산권법의 보호를 받습니다. <br /> <br /> ② 회사가
									혹은 약관에서 혹은 게시물에서 별도로 예외를 허용하지 않는 한, 회사의 성문화된 동의 없이, 사이트 혹은 컨텐츠의
									일부 혹은 전부를 임의의 컴퓨터, 서버, 웹 사이트 또는 다른 매체에 상업적인 목적으로 혹은 타 사이트, 타
									회사의 이익이나 홍보를 위한 목적으로 복사, 전재, 업로드, 번역, 전송, 배포, 미러링하거나 공연히 전시해서는
									안 됩니다. <br /> <br /> ③ 이용자가 컨텐츠의 고지문구와 원래 내용을 수정하거나 훼손하지 않고,
									비상업적이고 개인적인 목적으로 사용하며, 네트워크에 연결된 컴퓨터나 서버에 보관하지 않고, 추가적인 표시나 보증,
									권한 표시를 하지 않는다는 전제 하에 사이트의 컨텐츠를 다운로드하거나 컨텐츠의 사본을 보관할 수 있습니다. <br />
									<br /> ④ 회사가 아닌, 회원이 사이트의 게시판에 게시한 저작물은 제1항, 제2항, 제3항의 적용을 받지
									않으며, 이 저작물들에 대한 권리와 의무는 해당 저작물을 게시한 회원 혹은 해당 저작물에서 표시하고 있는
									저작권자에게 귀속됩니다. <br /> <br /> ⑤ 회원은 본인이 지적재산권을 소유하지 않은 저작물을
									사이트에 게시하거나 이용자가 열람 가능하게 할 경우, 해당 저작물의 저작권자 혹은 지적재산권을 보유하고 있는 자,
									회사, 단체의 인용 혹은 전재 허가를 받고 저작권자 혹은 지적재산권을 보유하고 있는 자를 명시하여야 하며, 그렇게
									하지 않아 발생한 분쟁이나 손해에 대해 회사는 책임이 없습니다. <br /> <br /> <br /> <br />
									제5조 (회사의 업무와 제공하는 서비스) <br /> <br /> ① 회사는 재화 등에 대한 정보를 제공하고
									구매 계약을 체결하며, 구매 계약이 체결된 재화 등을 배송하고, 기타 회사가 정하는 업무를 수행합니다. <br />
									<br /> <br /> <br /> 제6조 (정보의 제공 및 통지) <br /> <br /> ① 회사는
									회원이 서비스 이용 중 필요하다고 인정되는 정보 혹은 고지 사항을 이메일 또는 서신우편 등의 방법으로 회원에게
									전달할 수 있습니다. <br /> <br /> ② 긴급한 사안이라고 판단되는 경우, 회사는 회원이 제출한 유선
									혹은 무선 연락처로 회원에게 연락할 수 있습니다. <br /> <br /> ③ 회사는 다양한 방법으로 측정 및
									변동되는 실적 혹은 포인트에 따라, 그리고 회사가 인정한 공식적인 절차에 따라 회원의 등급을 정하여 별도의 혜택을
									부여할 수 있습니다. <br /> <br /> ④ 제3항의 혜택은 회원의 계정이 이용정지되거나 강등되기
									전까지만 유효합니다. <br /> <br /> ⑤ 회사는 본 약관에 따라 회원이 유관 법규 혹은 법령을
									위반하고 있음이 확인되거나, 그러할 가능성이 현저히 높다고 판단되는 경우 회원의 계정 이용을 정지시키고 유관
									기관에 해당 회원을 고소 혹은 고발할 수 있고, 이 과정에서 사이트 하단 링크에 제공되는 개인정보취급방침이
									허용하는 범위 내에서 해당 회원의 개인 정보를 사용할 수 있습니다. <br /> <br /> ⑥ 회사는 회사가
									직접 운영하는 사이트 외에 다른 경로 혹은 도메인으로 접속한 이용자의 사이트 및 재화 등의 이용에 대해 신뢰성을
									보장하지 않습니다. <br /> <br /> ⑦ 회사는 불특정다수 이용자에 대한 통지의 경우 1주일이상 사이트
									게시판에 게시함으로써 개별 통지를 대신할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는
									사항에 대하여는 개별 통지를 하는 것을 원칙으로 합니다. <br /> <br /> <br /> <br />
									제7조 (서비스의 중단) <br /> <br /> ① 회사는 서비스를 일정 범주로 구분하여 임의의 범주별 혹은
									범주의 조합별 이용 가능 시간을 별도로 정할 수 있으며, 이 경우 이용자에게 관련 내용을 공지합니다. <br />
									<br /> ② 회사는 컴퓨터, 서버 등 정보통신설비 그리고 네트워크의 보수, 점검, 교체, 고장, 두절 등의
									사유가 발생한 경우 그리고 법적 절차로 인한 경우 서비스의 제공을 사전 공지 후 일시적으로 중단할 수 있으며,
									천재지변 등 불가항력적 사유가 발생한 경우 서비스의 제공을 사전 통보 없이 일시적으로 중단할 수 있습니다. <br />
									<br /> ③ 회사는 제2항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인해 이용자 혹은 제3자가 입은
									손해에 대하여 회사의 고의 또는 과실이 입증되지 않는 한 배상하지 않습니다. <br /> <br /> ④
									회사가 사업 종목을 전환하거나, 서비스를 포기하거나, 제3사와 통합하는 등의 사유로 서비스를 더 이상 제공할 수
									없게 되는 경우, 제6조에 정한 방법으로 이용자에게 통지하고 당초 회사가 제시한 조건에 따라 이용자에게
									보상합니다. 다만, 회사가 보상 기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 몰에서
									통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다. <br /> <br /> <br />
									<br /> 제8조 (회원 가입) <br /> <br /> ① 이용자는 몰이 정한 가입 양식에 따라 혹은
									재화 등의 구매 과정에서 개인 정보를 기입하거나, 제3사의 계정 정보를 몰에 연동하는 과정에서 자동으로 기입된
									개인 정보를 확인하고, 이 약관에 동의한다는 의사표시를 함으로써 회원 가입을 신청합니다. <br /> <br />
									② 이용자는 가입 절차에 따라 기재되는 모든 정보를 사실 그대로 기재하여야 합니다. <br /> <br />
									③ 회사는 제1항에 따라 회원으로 가입할 것을 신청한 이용자들을 다음 각 호에 해당하지 않는 한 회원으로
									등록합니다. <br /> <br /> 1) 가입 신청자가 제9조 제3항에 의하여 이전에 회원 자격을 상실한
									적이 있는 경우, 단, 몰이 별도로 인정한 경우 예외로 합니다. <br /> <br /> 2) 가입 신청자가
									제2항을 위반한 경우 <br /> <br /> 3) 가입 신청자를 등록시키는 것이 몰의 기술상 지장이 있다고
									판단되는 경우 <br /> <br /> ④ 회원 가입 계약의 성립 시기는 몰의 승낙이 회원에게 도달한 시점으로
									합니다. <br /> <br /> <br /> <br /> 제9조 (회원 탈퇴 및 금지 행위) <br />
									<br /> ① 회원은 몰에 언제든지 탈퇴를 요청할 수 있으며 몰은 즉시 회원탈퇴를 처리합니다. 단, 법적
									절차가 진행 중이거나 진행될 예정인 상황에서 증거로서의 회원 정보 및 몰에서의 활동 기록 등을 보존해야 할 필요가
									있을 경우 탈퇴 처리는 제한될 수 있습니다. <br /> <br /> ② 회원이 다음 각 호의 사유에 해당하는
									경우, 몰은 해당 회원의 회원 자격을 제한 및 정지시킬 수 있습니다. <br /> <br /> 1) 개인
									정보를 허위로 기입하거나 변경한 경우 <br /> <br /> 2) 몰을 이용하여 구입한 재화 등의 대금,
									기타 몰 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 <br /> <br /> 3)
									인위적으로 몰 혹은 몰에 연결된 사이트, 서버, 네트워크의 부하를 가중시키거나 이들을 공격함으로써 몰이 정상적으로
									운영되지 못하게 하거나, 다른 이용자가 몰을 정상적으로 이용할 수 없게 하는 경우 <br /> <br />
									4) 다른 이용자에게 쪽지나 이메일 혹은 개인의 의사를 표현할 수 있는 기타 경로를 통하여 광고, 간접 광고,
									욕설, 반말, 수신자에게 불쾌감을 유발할 수 있는 가능성이 객관적으로 매우 높은 비꼼이나 풍자, 위협을 행하거나
									공연히 게시하는 경우 <br /> <br /> 5) 열람, 유출, 변경이 허용되지 않은 정보를 획득 및
									제3자에게 전달 혹은 전시, 변경하거나, 몰 내의 기술적인 문제점이나 취약점을 악용하는 등의 방식으로 몰의 건전한
									운영을 방해하는 경우 <br /> <br /> 6) 회사나 제3자의 지적재산권을 침해하는 경우 <br />
									<br /> 7) 몰의 컨텐츠를 딥링크, 페이지 스크레이프, 로봇, 스파이더 혹은 임의의 자동화 도구,
									프로그램, 알고리즘 혹은 이와 동등한 수작업을 통해 복사하거나 감시하거나 회사가 공식적으로 제공하는 구조 및
									경로를 우회하여 확보하려 하는 경우 <br /> <br /> 8) 회원의 계정을 제3자가 이용하게 한 경우 <br />
									<br /> 9) 타인, 특정 단체, 조직, 기관, 회사를 사칭하거나 허가 없이 대표하는 경우 <br /> <br />
									10) 몰을 이용함에 있어서 법령 또는 이 약관이 금지하거나 미풍양속에 반하는 행위를 하는 경우 <br /> <br />
									③ 몰이 회원 자격을 제한 혹은 정지시킨 후에도 동일한 행위가 반복되거나, 7일 이내에 그 사유가 시정되지
									아니하는 경우 몰은 해당 회원의 회원 자격을 상실시킬 수 있으며 해당 회원의 몰에 대한 접근을 기술적으로 차단할
									수 있습니다. <br /> <br /> <br /> <br /> 제10조 (회사의 의무) <br /> <br />
									① 회사는 개인정보취급방침에 따라 회원의 개인 정보를 보호하고, 개인정보취급방침을 모든 이용자가 볼 수 있도록
									사이트 초기화면 하단에 링크로 게시합니다. <br /> <br /> ② 회사는 이용자가 안전하게 서비스를
									이용할 수 있도록 일정한 수준의 보안 및 암호화 시스템을 갖춥니다. <br /> <br /> ③ 회사는 유관
									법령과 본 약관이 금지하거나 본 약관에 기재되어 있지 않더라도 통상의 상관례, 미풍양속에 반하는 행위를 하지
									않으며, 이 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하기 위해 통상의 노력을 기울입니다. <br />
									<br /> ④ 몰이 재화 등에 대하여 몰의 명백한 고의 혹은 과실에 따라 표시광고의공정화에관한법률 제3조
									소정의 부당한 표시.광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다. <br /> <br />
									<br /> <br /> 제11조 (이용자와 회원의 의무) <br /> <br /> ① 회원은 제17조
									제1항에 의한 등록 사항에 변경이 있는 경우, 즉시 이메일 혹은 기타 방법으로 몰에게 해당 변경 사항을 알려야
									합니다. <br /> <br /> ② 회원은 ID와 비밀번호 등 개인 정보에 대한 관리 책임을 가집니다. 단
									제18조의 경우는 예외로 합니다. <br /> <br /> ③ 회원은 자신의 계정을 제3자로 하여금 이용하게
									해서는 안 됩니다. <br /> <br /> ④ 회원은 자신의 계정이 도난당하거나 제3자가 사용하고 있음을
									인지한 경우 바로 회사에 알리고 회사의 안내에 따라야 합니다. <br /> <br /> ⑤ 이용자는 약관이
									수정되었는지 정기적으로 확인할 의무가 있으며, 약관의 변경 후에도 몰이 제공하는 서비스를 계속 이용한다는 것은
									변경된 약관에 동의함을 의미합니다. <br /> <br /> ⑥ 이용자는 다음 행위를 하여서는 안 됩니다. <br />
									<br /> 1) 신청 또는 변경 시 허위 내용의 등록 <br /> <br /> 2) 타인의 정보 도용 <br />
									<br /> 3) 몰에 게시된 정보의 변경 <br /> <br /> 4) 회사가 정한 것 이외의 정보(컴퓨터
									프로그램 등)를 송신 또는 게시 <br /> <br /> 5) 회사 혹은 기타 제3자의 저작권 등 지적재산권에
									대한 침해 <br /> <br /> 6) 회사 혹은 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 <br />
									<br /> 7) 외설 또는 폭력적인 메시지, 화상, 음성, 기타 미풍양속에 반하는 정보를 몰에 공개 또는
									게시하는 행위 <br /> <br /> <br /> <br /> 제12조 (구매신청) <br /> <br />
									① 몰 이용자는 몰 상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청합니다. 단, 회원인 경우 제B목 내지
									제D목의 적용을 제외할 수 있습니다. <br /> <br /> 1) 재화 등의 검색 및 선택 <br /> <br />
									2) 이름, 주소, 전화번호, 이메일 주소(또는 이동전화번호) 등 개인정보의 입력 <br /> <br />
									3) 약관 내용, 청약철회권이 제한되는 서비스, 배송료, 설치비 등의 비용 부담과 관련한 내용에 대한 확인 <br />
									<br /> 4) 마우스 클릭 등의 방법으로써 이 약관에 동의하고 위 제A목, 제B목, 제C목의 사항을
									확인하거나 거부하는 표시 <br /> <br /> 5) 재화 등의 구매신청 및 이에 관한 확인 또는 몰의
									확인에 대한 동의 <br /> <br /> 6) 결제 방법의 선택 <br /> <br /> <br />
									<br /> 제13조 (계약의 성립) <br /> <br /> ① 몰은 제12조와 같은 구매신청에 대하여
									다음 각 호에 해당하면 승낙하지 않을 수 있습니다. <br /> <br /> 1) 신청 내용에 허위, 기재
									누락, 오기가 있는 경우 <br /> <br /> 2) 미성년자가 청소년보호법에서 금지하는 재화 등을 구매하는
									경우 <br /> <br /> 3) 구매 신청을 승낙하는 것이 몰의 기술상 지장이 있다고 판단되는 경우 <br />
									<br /> ② 몰의 승낙이 제15조 제1항의 수신 확인 통지 형태로 이용자에게 도달한 시점에 계약이 성립한
									것으로 봅니다. <br /> <br /> <br /> <br /> 제14조 (지급 방법) <br /> <br />
									① 몰에서 구매한 재화 등에 대한 대금 지급 방법은 다음 각 호의 방법 중 가용한 것으로 할 수 있습니다. <br />
									<br /> 1) 폰 뱅킹, 인터넷 뱅킹, 메일 뱅킹 등 각종 계좌이체 <br /> <br /> 2)
									선불카드, 직불카드, 신용카드 등 각종 카드 결제 <br /> <br /> 3) 온라인무통장입금 <br />
									<br /> 4) 전자화폐에 의한 결제 <br /> <br /> 5) 마일리지, 포인트 등 몰이 지급한
									현금등가물에 의한 결제 <br /> <br /> 6) 몰과 계약을 맺었거나 몰이 인정한 상품권에 의한 결제 <br />
									<br /> 7) 기타 전자적 지급 방법에 의한 대금 지급 <br /> <br /> <br /> <br />
									제15조 (구매 신청의 변경 및 취소) <br /> <br /> ① 몰은 이용자의 구매 신청이 있는 경우
									이용자에게 수신 확인 통지를 합니다. <br /> <br /> ② 수신 확인 통지에 의사 표시의 불일치 등이
									있는 경우 이용자는 수신확인통지를 받은 후 즉시 구매 신청 변경 및 취소를 요청할 수 있고, 몰은 배송 전에
									이용자의 요청이 있는 경우 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는
									제17조의 규정에 따릅니다. <br /> <br /> <br /> <br /> 제16조 (재화 등의 공급)
									<br /> <br /> ① 몰은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 몰이
									이용자로부터 재화 등의 대금의 전부를 지급받은 날부터 5영업일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장
									등 기타의 필요한 조치를 취합니다. 다만, 재화 등을 예약판매 하는 경우와 같이 배송 혹은 조치 시점이 별도로
									고지된 경우에는 그러하지 아니합니다. <br /> <br /> ② 몰은 이용자가 구매한 재화 등에 대해 배송
									수단, 수단별 배송 비용 부담자, 수단별 배송 기간 등을 명시합니다. 만약 몰의 고의 혹은 과실로 인해 약정
									배송기간을 초과한 경우 몰은 그로 인한 이용자의 손해를 배상하여야 합니다. <br /> <br /> ③ 몰은
									이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다. <br /> <br />
									<br /> <br /> 제17조 (청약 철회와 환급) <br /> <br /> ① 몰과 재화 등의 구매에
									관한 계약을 체결한 이용자는 수신 확인의 통지를 받은 날로부터 7일 이내에는 청약의 철회를 할 수 있습니다. <br />
									<br /> ② 회사는 몰을 통해 제공되는 재화 등의 가격을 수시로 변경할 수 있으며, 몰은 가격 인하 또는
									홍보용 제공의 경우에는 최저가 보장, 즉 인하액 반환 또는 환불을 허용하지 않습니다. <br /> <br />
									③ 이용자가 재화 등을 배송받은 경우, 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다. <br />
									<br /> 1) 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우 <br /> <br />
									2) 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 유의미하게 감소한 경우 <br /> <br />
									3) 시간의 경과에 의하여 재화 등의 가치가 유의미하게 감소한 경우 <br /> <br /> 4) 같은 성능을
									지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우 <br /> <br /> 5)
									내용을 열람함으로써 재화 등의 구매 혹은 소비 목적이 달성되는 재화 등의 내용의 일부를 열람한 경우 <br />
									<br /> ④ 이용자는 제2항 및 제3항의 규정에도 불구하고 재화 등의 내용이 표시 내용 혹은 광고 내용과
									확연히 다르거나, 계약 내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날로부터 90일 이내 혹은 그 사실을
									안 날 또는 알 수 있었던 날로부터 30일 이내 중 더 짧은 기간 내에 청약 철회 등을 할 수 있습니다. <br />
									<br /> ⑤ 몰은 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공할 수 없을 때에는 지체
									없이 그 사유를 이용자에게 통지하고, 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날로부터 3영업일 이내에
									환급하거나 환급에 필요한 조치를 취합니다. <br /> <br /> ⑥ 몰은 이용자로부터 재화 등을 반환받은
									경우 반환일로부터 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 몰이 이용자에게 대금의
									환급을 지연한 때에는 그 지연기간에 대하여 전자상거래등에서의소비자보호에관한법률시행령이 정하는 지연이자율(연
									100분의 24)을 곱하여 산정한 지연이자를 지급합니다. <br /> <br /> ⑦ 몰은 위 대금을 환급함에
									있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 반환일로부터 3영업일
									이내에 당해 결제 수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다. <br />
									<br /> ⑧ 청약 철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. 다만 재화
									등의 내용이 표시 내용 혹은 광고 내용과 다르거나 계약 내용과 다르게 이행되어 청약 철회 등을 하는 경우 재화
									등의 반환에 필요한 비용은 몰이 부담합니다. <br /> <br /> ⑨ 이용자가 재화 등을 제공받을 때
									발송비를 부담한 경우, 몰은 청약 철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
									<br /> <br /> <br /> <br /> 제18조 (개인 정보 보호) <br /> <br />
									① 몰은 이용자의 정보 수집 시 구매 계약 이행에 필요한 정보를 수집합니다. 다음 사항을 필수 사항으로 하며 그
									외 사항은 선택사항으로 합니다. <br /> <br /> 1) 이름 <br /> <br /> 2) 주소 <br />
									<br /> 3) 휴대전화 번호 (혹은 유선전화 번호) <br /> <br /> 4) 계정 ID (회원의
									경우) <br /> <br /> 5) 계정 비밀번호 (회원의 경우) 혹은 청구서 비밀번호 (비회원의 경우) <br />
									<br /> 6) 이메일 주소 <br /> <br /> ② 몰이 이용자의 개인 식별이 가능한 개인 정보를
									수집할 때에는 반드시 당해 이용자의 동의를 받습니다. <br /> <br /> ③ 제공된 개인 정보는 당해
									이용자의 동의 없이 목적 외로 이용하거나 제3자에게 제공할 수 없습니다. 다만, 다음의 경우에는 예외로 합니다.
									<br /> <br /> 1) 배송 업무상 배송 업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소,
									휴대전화 번호, 유선전화 번호 등)를 알려주는 경우 <br /> <br /> 2) 통계 작성, 학술 연구 또는
									시장 조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 개인 정보를 가공하는 경우 <br />
									<br /> 3) 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우 <br /> <br /> 4) 도용
									방지를 위하여 본인 확인에 필요한 경우 <br /> <br /> 5) 법률의 규정 또는 법률에 의하여 필요한
									불가피한 사유가 있는 경우 <br /> <br /> ④ 몰이 제2항과 제3항에 의해 이용자의 동의를 받아야
									하는 경우에는 개인 정보 관리 책임자의 신원(소속, 이름 및 전화 번호, 기타 연락처), 정보의 수집 목적 및
									이용 목적, 제3자에 대한 정보 제공 관련 사항(제공받은 자, 제공 목적 및 제공할 정보의 내용) 등
									정보통신망이용촉진등에관한법률 제22조 제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이
									동의를 철회할 수 있습니다. <br /> <br /> ⑤ 이용자는 언제든지 몰이 가지고 있는 자신의 개인
									정보에 대해 열람 및 오류 정정을 요구할 수 있으며 몰은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다.
									이용자가 오류의 정정을 요구한 경우에는 몰은 그 오류를 정정할 때까지 당해 개인 정보를 이용하지 않습니다. <br />
									<br /> ⑥ 몰은 개인 정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며, 몰의 고의 혹은 과실에
									따른 이용자 개인 정보의 분실, 도난, 유출, 변조로 인한 이용자의 손해가 입증될 경우 이에 대하여 책임을
									집니다. <br /> <br /> ⑦ 몰이 개인정보의 수집 목적을 달성한 때에는 당해 개인 정보를 지체 없이
									파기합니다. <br /> <br /> <br /> <br /> 제19조 (부인) <br /> <br />
									① 회사는 컨텐츠의 무결성이나 몰의 서비스가 장애 없이 제공됨을 보증하지 않으며, 컨텐츠나 서비스에 대해 문제가
									발생할 경우 그 문제가 해결될 것임을 보증하지 않습니다. <br /> <br /> ② 회사는 이용자가 몰을
									사용함으로 인해 특정한 결과가 초래될 것임을 보증하지 않습니다. <br /> <br /> ③ 몰의 컨텐츠와
									구성 요소는 사전 통보 없이 변경될 수 있습니다. <br /> <br /> ④ 회사는 이용자가 몰에서
									다운로드하는 파일이나 데이터가 바이러스에 감염되거나 파괴적인 속성을 지니지 않았음을 보증하지 않습니다. <br />
									<br /> <br /> <br /> 제20조 (책임의 한계와 면제) <br /> <br /> ① 회사에
									명백한 귀책 사유가 있는 경우를 제외하고, 회사는 이용자가 몰을 이용함으로써 발생한 어떤 간접적이거나 우발적인
									손상 혹은 손해에 대해서도 책임이 없습니다. <br /> <br /> ② 이용자가 의도적으로 몰이 제공하는
									서비스가 정상적으로 작동되지 못하게 하거나, 몰에서 제공하는 컨텐츠 혹은 저작물을 불법적으로 이용, 배포 혹은
									변형함으로써 제3사에 손해를 입혔을 때, 제3사가 회사를 상대로 제기하는 요구, 의무, 청구, 비용에 대한 책임은
									이용자가 집니다. <br /> <br /> ③ 몰이나 서비스와 연계되어 있는 제3사의 행위, 거래, 태만,
									약관에 대해서는 제3사가 책임을 집니다. <br /> <br /> ④ 회사와 몰은 대한민국 서울에 위치하고
									있으며, 비록 대한민국을 제외한 지역에서 몰에 접속할 수 있을지라도, 모든 서비스가 대한민국을 제외한 지역에서
									이용 가능한 것은 아니며, 회사는 서비스의 이용을 대한민국 내로 제한할 권리가 있고, 만약 몰의 이용이 허가되지
									않은 지역에서 몰을 이용함으로써 해당 지역의 법률에 따른 문제가 발생할 경우 회사는 그에 대한 책임을 지지
									않습니다. <br /> <br /> <br /> <br /> 제21조 (약관의 위반) <br /> <br />
									① 회사는 이용자가 몰을 이용함과 관련하여 사법 절차가 진행 중이거나 진행될 예정인 경우 이용자의 신원을 포함한
									이용자 정보를 공개할 수 있습니다. <br /> <br /> ② 회사는 임의의 이용자 혹은 누군가가 의도적이건
									비의도적이건 간에, 회사 혹은 타 이용자의 권리와 재산을 침해할 때 이용자의 신원을 검증하고, 접촉을 시도할 수
									있습니다. <br /> <br /> ③ 회사는 관련 법규, 조항, 사법 절차 또는 정부 기관의 요구에 따라
									필요하다고 생각될 때 어떤 정보라도 공개할 권리를 가지고 있습니다. <br /> <br /> ④ 회사는 제3사
									또는 조직과 정보를 교환해야 할 때, 관련 법규에 의해 요구되거나 허용될 경우, 이용자의 정보를 공개할 수
									있습니다. <br /> <br /> ⑤ 회사는 이용자가 약관을 위반하였을 때, 이용자가 인지할 수 있는
									방법으로 경고를 취하고, 경고에도 불구하고 이용자의 위반 행위가 지속될 경우 이용자의 사이트 접속을 종료시키거나,
									사이트로의 접근을 차단할 수 있습니다. 단, 게시판 도배, 서비스 거부 혹은 해킹 공격, 반달리즘 등 사이트의
									보호를 위해 신속한 조치가 반드시 요구되는 상황일 경우, 사전 공지 없이 이용자의 사이트 접속을 종료시키거나,
									사이트로의 접근을 차단할 수 있습니다. <br /> <br /> <br /> <br /> 제22조 (일부
									무효) <br /> <br /> ① 본 약관의 일부 조항이 무효일지라도 다른 조항들은 유효하며, 무효인 조항은
									해당 조항의 의도를 최대한 고려하여 국내법에 저촉되지 않게 해석합니다. <br /> <br /> <br />
									<br /> 제23조 (분쟁 해결) <br /> <br /> ① 몰은 이용자가 제기하는 의견이나 불만을
									청취하고, 이용자의 피해를 보상 처리하기 위하여 고객 지원 센터를 설치 및 운영합니다. <br /> <br />
									② 몰은 이용자로부터 제출되는 불만 사항 및 의견을 처리합니다. 다만, 신속한 처리가 곤란한 경우 이용자에게 그
									사유와 처리 일정을 통보할 수 있습니다. <br /> <br /> ③ 몰과 이용자 간에 발생한 전자상거래
									분쟁과 관련하여 이용자의 피해 구제 신청이 있는 경우에는 공정거래위원회 또는 시도지사가 의뢰하는 분쟁조정기관의
									조정에 따를 수 있습니다. <br /> <br /> <br /> <br /> 제24조 (관할 법원) <br />
									<br /> ① 이용자가 몰 혹은 서비스를 이용함으로써 회사와 분쟁이 발생할 경우, 이용자와 회사는 쌍방 합의
									하에 문제를 해결하되, 합의가 이루어지지 않을 경우 회사의 영업 소재지를 관할하는 법원을 합의관할법원으로 합니다.
									<br /> <br /> ② 몰과 이용자 간에 제기된 전자상거래 소송에는 한국 법을 적용합니다. <br />
									<br /> <br /> <br /> 제25조 (회원의 적립금 운영) <br /> <br /> ①
									적립금은 화폐개념의 "적립금"으로 구성됩니다. <br /> <br /> ② "적립금"은 현금처럼 사용할 수
									있는 화폐개념입니다. 단, 현금으로 환불되지는 않습니다. <br /> <br /> ③ "회사"의 운영정책에
									따라 상품별 적립금 부여 그리고 적립금 사용가능시점 및 분할사용가능 여부가 다를 수 있습니다. <br /> <br />
									④ 회원이 적립금을 부당하게 취득한 증거가 있을 때에는 "회사"는 사전통지없이 회원의 적립금을 삭제할 수 있으며
									이와 관련하여 회원 자격을 제한할 수 있습니다. <br /> <br /> ⑤ 회원탈퇴 또는 회원자격상실 시
									잔액 여부와 상관없이 회원의 적립금은 소멸되며 타인에게 양도할 수 없습니다. <br /> <br /> ⑥
									적립금의 유효기간은 지급받은 날로부터 12개월 입니다. <br /> <br /> <br /> <br />
									부칙(시행일) 이 약관은 2018년 02월 06일부터 시행합니다. <br /> <br /> 1.0판 2013.
									03. 11 <br /> 1.1판 2014. 02. 03 <br /> 1.11판 2015. 03. 20
								</p>
								<p class="english ghost">
									Move Incorporated (herein after referred to as “the Company” or
									”we”) regards the privacy of users as highly important and
									complies with all regulations concerning the “Act on Protection
									of Information and Promotion of Utilization of Information and
									Communications Network.” <br /> By stating its privacy policy
									as shown below, the Company hereby informs users of the purpose
									and use of personal information provided by the user to the
									Company, and the measures taken for the protection of their
									personal information. <br /> <br /> ■ Personal information
									collected and the means of collection <br /> A. Information we
									collect <br /> • The Company collects the following data for
									the purpose of membership sign-ups, consultations, and service
									applications. <br /> o When signing up for membership: Name,
									birthday, gender, ID, password, home phone number, mobile
									number, e-mail, legal representative information for
									subscribers under the age of 14. <br /> o When applying for
									services: Address, payment information <br /> • Information
									collected through use of online services or the processing
									process: use record, access log, cookies, connecting IP
									information, payment record, unruly use, and others. <br /> <br />
									B. Means of collecting personal information <br /> • Personal
									information is collected through the website, letter, message
									boards, e-mail, event entries, delivery request forms, phone,
									fax, and generated data collection tool. <br /> <br /> ■
									Purpose of collection and use of personal information <br />
									The Company collects personal information for the following
									purposes and use. <br /> • Provision of services obligated by
									fulfillment of contract and the payment that follows <br />
									Supply content, purchase and payment, delivery of goods,
									billing statements and others, user verifications for financial
									transactions and financial services. <br /> • Member
									management <br /> Identify user to access members-only
									services, verify user, prevent unauthorized use, check
									membership subscription, validate age, confirm
									consent/agreement from legal representative for users under the
									age of 14, handle complaints and civil affairs, and deliver
									notices. <br /> • Marketing and promotional use <br />
									Delivery of events and unsolicited advertisements; gain a
									statistical understanding of the members’ frequency of access
									to and use of site. <br /> <br /> ■ Period of possession and
									utilization of personal information <br /> As a general rule,
									once the personal data has fulfilled the purposes for which
									they were collected, they are to be immediately discarded.
									Except for the following that will be retained for certain
									periods for reasons noted below. <br /> <br /> A. Information
									held according to the Company’s internal policies <br /> Even
									when a member has canceled his/her membership, the member’s
									personal information may be retained for 1 years from the date
									of cancelation in order to resolve future disputes, to
									cooperate with the requests of law enforcement agencies, and to
									prevent the recurrence of fraudulent uses by unruly members. <br />
									<br /> B. Grounds for holding personal information according
									to applicable statutes <br /> If retention of personal
									information is deemed necessary to operate in accordance to the
									provisions of relevant laws and regulations, including the Act
									on Consumer Protection in Electronic Commerce, then they will
									be held in possession by the Company for a certain period of
									time set by the relevant laws as noted below. <br /> • Records
									related to contracts or withdrawal of subscription: <br /> o
									Purpose of possession: Act on Consumer Protection in Electronic
									Commerce <br /> o Possession period: 5 years <br /> • Records
									related to payment and supply of goods <br /> o Purpose of
									possession: Act on Consumer Protection in Electronic Commerce <br />
									o Possession period: 5 years <br /> • Records related to
									consumer complaints or dispute settlement <br /> o Purpose of
									possession: Act on Consumer Protection in Electronic Commerce <br />
									o Possession period: 3 years <br /> • Records of log <br /> o
									Purpose of possession: Protection of Communications Secrets Act
									<br /> o Possession period: 3 months <br /> <br /> ■
									Procedures and methods of discarding personal information <br />
									As a general rule, once the personal data has fulfilled the
									purposes for which they were collected, they are immediately
									discarded. The procedure and method to discard is detailed
									below. <br /> • Discarding procedure <br /> Following the
									cause for information protection according to the internal
									policies or related statutes, once the personal data has
									fulfilled the purposes they will be transferred to a separate
									database(DB) (or filed separately in a folder if in paper
									form), then it will be discarded after a certain period of
									time. Personal information that is transferred to a separate DB
									will not be used for any other purposes except in the case of
									the law. <br /> • Discarding method <br /> Use technical
									method to stop reproduction of personal information saved in
									electronic form. <br /> ■ Disclosing personal information <br />
									As a general rule, the Company shall not disclose user’s
									personal information to any external party except for the cases
									below. <br /> • Prior consent from user <br /> • Following
									the legislation rule or when law enforcement agencies require
									such information for investigative purposes during the process
									as prescribed by the law. <br /> <br /> ■ Consignment of
									collected personal information <br /> For the provision of
									services, the Company consigns collected personal information
									to specialized companies detailed below. <br /> <br /> •
									Consignee: CJ KOREA EXPRESS, KOREA POST <br /> • Details of
									consignment: Delivery Product <br /> <br /> • Consignee: NHN
									KCP, NHN PAYCO, JTNET, LG CNS, Kakaopay, Eximbay (VISA,
									MasterCard, UnionPay, Alipay, Tenpay, WeChat, Molpay) <br /> •
									Details of consignment: Payment Progress <br /> <br /> ■
									Storing personal information <br /> <br /> We store your
									personal information outside of Korea. <br /> <br /> Type of
									information stored outside of Korea: Name, address, phone
									numbers, user ID, encrypted user password, E-mail address,
									CREWBI Pay payment information, order/payment history <br />
									Country where we store personal information in: Japan <br />
									When and how we store personal information outside of Korea: At
									the point of registration, over the internet <br /> Our
									partner that stores personal information outside of Korea:
									Amazon Web Services, Inc. (Contact:
									https://aws.amazon.com/compliance/contact/ ) <br /> Our
									partner's purpose of storing personal information: Operate
									cloud services <br /> Our partner's duration of storing and
									using personal information: While you remain registered to our
									services <br /> <br /> <br /> ■ The rights of users and
									legal representatives and methods of exercising those rights <br />
									• The user may view or edit his/her personal information and
									request to terminate membership at any time. <br /> • To view
									or edit a user’s personal information, click on ‘Edit Personal
									Information’ (or ‘Edit Member Information’) and to cancel
									subscription (terminate membership) click on ‘Terminate
									Membership.’ Upon clicking, you’ll be directed to an
									identification process before you can directly access, correct,
									or cancel membership. <br /> • User may contact the chief
									privacy officer by letter, telephone or email, and necessary
									actions will be taken. <br /> • Should a user request
									corrections on errors of personal information, the Company
									shall not use or provide any personal information until a
									correction is made. In addition, if the wrong personal
									information has already been provided to a third party, the
									Company shall immediately notify them so that a proper
									correction can be made. <br /> • If personal information is
									canceled or deleted upon request of user, the Company will
									comply with the terms specified under “Period of possession and
									utilization of personal information,” and prohibit disclosure
									or use for any other purposes. <br /> <br /> ■ Install,
									manage and deny operation of device for automatic collection of
									personal information <br /> The Company uses ‘cookies’ that
									frequently save and retrieve your information. A cookie is a
									very small text file that the server, used to operate the
									Company’s website, sends to your browser. The file is saved in
									the hard disk of your computer. <br /> The Company uses
									cookies for the following purposes: <br /> • Use and purpose
									of cookies <br /> o To analyze the frequencies of a member and
									non-member’s visit, understand user’s preferences and interests
									and track user’s footprints, and carry out target marketing and
									provide customized service by checking level of participation
									in various events and number of visits. <br /> o You have the
									right of choice in regards to the installation of cookies.
									Accordingly, you may allow all cookies by modifying your cookie
									settings, go through a confirmation process whenever a cookie
									is saved, or refuse to have all cookies saved. <br /> •
									Settings to reject establishment of cookies <br /> o To reject
									establishment of cookies, select options on your web browser
									and change your settings to allow all cookies, go through a
									verification process before saving cookies, or reject to save
									all cookies. <br /> o Example (For Internet Explorer) <br />
									- Go to ‘Tools’ located on the top of Web Browser > Internet
									Options > Privacy <br /> o However, there may be certain
									difficulties in using the services if you reject the
									installment of cookies. <br /> <br /> ■ Civil services with
									respect to personal information <br /> To protect your
									personal information and deal with complaints related to
									personal information, the Company has appointed the following
									department and chief privacy officer. <br /> <br /> •
									Principal Privacy Officer <br /> Name: Kim HyeonJin <br />
									Phone Number: 070-4788-0295 <br /> E-mail: toto3492@move.is <br />
									<br /> • You may report all complaints related to privacy
									protection, in using the Company’s service, to the chief
									privacy officer or the department in charge. <br /> • The
									Company shall provide prompt and sufficient answers to your
									report. <br /> • For further consultation or report on other
									privacy infringements, contact the following the following
									agencies. <br /> o Privacy Rights Violation Complaint Center
									(privacy.kisa.or.kr / 118) <br /> o Cybercrime Investigation
									Department, Supreme Prosecutor’s Office (www.spo.go.kr /
									02-3480-2000) <br /> o Cyber Bureau, National Police Agency
									(www.ctrc.go.kr/ 182) <br /> <br /> ■ Duty to notify <br />
									The Company shall notify users of any changes to this privacy
									policy through the website (or through individual
									notifications). <br /> • This privacy policy will be enforced
									starting 2018Y, 01M 22D.
								</p>
							</div>
						</li>
						<li class="box"
							style="margin-left: 17px; border: 1px solid black;">
							<h3>개인정보 취급방침</h3>
							<div>
								<p style="display: block; padding: 20px 0">
									<a href="javascript:void(0);"
										onclick="$(this).parent().children().not(this).css('font-weight', ''); $(this).css('font-weight', '500'); $(this).parent().parent().children('p.korean, p.english').hide().filter('.korean').show();"
										style="font-weight: 500">한국어</a> / <a
										href="javascript:void(0);"
										onclick="$(this).parent().children().not(this).css('font-weight', ''); $(this).css('font-weight', '500'); $(this).parent().parent().children('p.korean, p.english').hide().filter('.english').show();
                                ">English</a>
								</p>
								<p class="korean">
									무브 주식회사는 (이하 "회사"는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한
									법률을 준수하고 있습니다. <br /> <br /> 회사는 개인정보처리방침을 통하여 고객님께서 제공하시는
									개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지
									알려드립니다. <br /> <br /> ■ 수집하는 개인정보 항목 및 수집방법 <br /> <br />
									가. 수집하는 개인정보의 항목 <br /> o 회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은
									개인정보를 수집하고 있습니다. <br /> - 회원가입시 : 이름 , 생년월일 , 성별 , 로그인ID ,
									비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보 <br />
									- 서비스 신청시 : 주소, 결제 정보 <br /> <br /> o 서비스 이용 과정이나 사업 처리 과정에서
									서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다. <br />
									<br /> 나. 수집방법 <br /> - 홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청,
									전화, 팩스, 생성 정보 수집 툴을 통한 수집 <br /> <br /> ■ 개인정보의 수집 및 이용목적 <br />
									<br /> 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br /> o 서비스 제공에 관한 계약
									이행 및 서비스 제공에 따른 요금정산 <br /> 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지
									등 발송 , 금융거래 본인 인증 및 금융 서비스 <br /> <br /> o 회원 관리 <br /> 회원제
									서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인
									, 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 ,
									고지사항 전달 <br /> <br /> o 마케팅 및 광고에 활용 <br /> 이벤트 등 광고성 정보 전달
									, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 <br /> <br /> ■ 개인정보의 보유 및
									이용기간 <br /> <br /> 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체
									없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br /> <br />
									가. 회사 내부방침에 의한 정보보유 사유 <br /> 회원이 탈퇴한 경우에도 불량회원의 부정한 이용의 재발을
									방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 1년간 회원의 정보를 보유할 수
									있습니다. <br /> <br /> 나. 관련 법령에 의한 정보 보유 사유 <br />
									전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이
									관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. <br /> <br /> o 계약 또는 청약철회
									등에 관한 기록 <br /> -보존이유 : 전자상거래등에서의소비자보호에관한법률 <br /> -보존기간 : 5년
									<br /> <br /> o 대금 결제 및 재화 등의 공급에 관한 기록 <br /> -보존이유:
									전자상거래등에서의소비자보호에관한법률 <br /> -보존기간 : 5년 <br /> <br /> o 소비자 불만
									또는 분쟁처리에 관한 기록 <br /> -보존이유 : 전자상거래등에서의소비자보호에관한법률 <br />
									-보존기간 : 3년 <br /> <br /> o 로그 기록 <br /> -보존이유: 통신비밀보호법 <br />
									-보존기간 : 3개월 <br /> <br /> ■ 개인정보의 파기절차 및 방법 <br /> <br />
									회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은
									다음과 같습니다. <br /> <br /> o 파기절차 <br /> 회원님이 회원가입 등을 위해 입력하신
									정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한
									정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. <br /> 별도 DB로
									옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다. <br />
									<br /> o 파기방법 <br /> 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을
									사용하여 삭제합니다. <br /> <br /> ■ 개인정보 제공 <br /> <br /> 회사는 이용자의
									개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. <br /> o
									이용자들이 사전에 동의한 경우 <br /> o 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와
									방법에 따라 수사기관의 요구가 있는 경우 <br /> <br /> ■ 수집한 개인정보의 위탁 <br /> <br />
									회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다. <br /> <br />
									o 위탁 대상자 : CJ대한통운, 우체국 <br /> o 위탁업무 내용 : 상품 배송 <br /> <br />
									o 위탁 대상자 : NHN KCP, NHN PAYCO, JTNET, LG CNS, 카카오페이, Eximbay
									(VISA, MasterCard, UnionPay, Alipay, Tenpay, WeChat, Molpay) <br />
									o 위탁업무 내용 : 상품 결제처리 <br /> <br /> ■ 개인정보 국외 이전 <br /> <br />
									회사는 서비스 이행을 위해 아래와 같이 개인정보를 국외로 이전하고 있습니다. <br /> <br /> o
									이전되는 개인정보 항목 : 이름, 주소, 휴대전화 번호, 계정 ID, 계정 비밀번호, 이메일 주소, 크루비 페이
									정보, 결제 정보 <br /> o 개인정보가 이전되는 국가 : 일본 <br /> o 이전 일시 및 이전방법 :
									회원 가입한 시점에 대해 네트워크를 통한 전송 <br /> o 개인정보를 이전받는 자의 성명: Amazon
									Web Services Inc., https://aws.amazon.com/compliance/contact/ <br />
									o 개인정보를 이전 받는 자의 개인정보 이용목적: 클라우드 서버 운영 및 관리 <br /> o 개인정보를 이전
									받는 자의 개인정보 보유·이용 기간 : 회원 서비스 중일때 한함 <br /> <br /> ■ 이용자 및
									법정대리인의 권리와 그 행사방법 <br /> <br /> o 이용자는 언제든지 등록되어 있는 자신의 개인정보를
									조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. <br /> o 이용자들의 개인정보 조회,수정을
									위해서는 "개인정보변경"(또는 "회원정보수정" 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인
									확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. <br /> o 혹은 개인정보보호책임자에게
									서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다. <br /> o 귀하가 개인정보의 오류에 대한
									정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된
									개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록
									하겠습니다. <br /> o 회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는
									개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고
									있습니다. <br /> <br /> ■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 <br />
									<br /> 회사는 귀하의 정보를 수시로 저장하고 찾아내는 "쿠키(cookie)" 등을 운용합니다. 쿠키란
									웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터
									하드디스크에 저장됩니다. <br /> 회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다. <br /> <br />
									o 쿠키 등 사용 목적 <br /> <br /> 1. 회원과 비회원의 접속 빈도나 방문 시간 등을 분석,
									이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅
									및 개인 맞춤 서비스 제공 <br /> 2. 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는
									웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든
									쿠키의 저장을 거부할 수도 있습니다. <br /> o 쿠키 설정 거부 방법 <br /> 1. 쿠키 설정을
									거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할
									때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. <br /> 2. 설정방법 예(인터넷
									익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 <br /> 3. 단, 귀하께서
									쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다. <br /> <br /> ■ 광고성
									정보 전송 <br /> 1. 크루비는 고객의 명시적인 수신거부의사에 반하여 영리목적의 광고성 정보를 전송하지
									않습니다. <br /> 2. 크루비는 고객께서 뉴스레터 등 전자우편 전송에 대한 동의를 한 경우 전자우편의
									제목란 및 본문란에 다음 사항과 같이 고객께서 쉽게 알아 볼 수 있도록 조치합니다. <br /> 1) 전자우편의
									제목란 : (광고)라는 문구를 제목란에 표시하지 않을 수 있으며 전자우편 본문란의 주요 내용을 표시합니다. <br />
									2) 전자우편의 본문란 : 고객께서 수신거부의 의사표시를 할 수 있는 전송자의 명칭, 전자우편주소, 전화번호 및
									주소를 명시합니다. 고객께서 수신 거부의 의사를 쉽게 표시할 수 있는 방법을 한글 및 영문으로 각각 명시합니다.
									고객께서 동의를 한 시기 및 내용을 명시합니다. <br /> 3. 크루비는 상품정보 안내 등 온라인 마케팅을
									위해 광고성 정보를 전자우편 등으로 전송하는 경우 전자우편의 제목란 및 본문란에 다음 사항과 같이 고객께서 쉽게
									알아 볼 수 있도록 조치합니다. <br /> 1) 전자우편의 제목란 : (광고)또는(성인광고)라는 문구를
									제목란의 처음에 빈칸없이 한글로 표시하고 이어서 전자우편 본문란의 주요 내용을 표시합니다. <br /> 2)
									전자우편의 본문란 : 고객께서 수신거부의 의사표시를 할 수 있는 전송자의 명칭, 전자우편주소, 전화번호 및 주소를
									명시합니다. 고객께서 수신 거부의 의사를 쉽게 표시할 수 있는 방법을 한글 및 영문으로 각각 명시합니다. <br />
									&nbsp; <br /> 4. 팩스,휴대폰 문자전송 등 전자우편 이외의 문자전송을 통해 영리목적의 광고성 정보를
									전송하는 경우에는 전송내용 처음에 &quot;(광고)&quot;라는 문구를 표기하고 전송내용 중에 전송자의
									연락처를 명시하도록 조치합니다. <br /> <br /> ■ 개인정보에 관한 민원서비스 <br /> 회사는
									고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보보호책임자를
									지정하고 있습니다. <br /> <br /> o 개인정보보호담당자 <br /> 성명 : 김현진 <br />
									전화번호 : 070-4788-0295 <br /> 이메일 : toto3492@move.is <br /> <br />
									<br /> o 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자
									혹은 담당부서로 신고하실 수 있습니다. <br /> o 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을
									드릴 것입니다. <br /> o 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기
									바랍니다. <br /> 개인정보침해신고센터 (privacy.kisa.or.kr / 국번 없이 118) <br />
									대검찰청 사이버범죄수사단 (www.spo.go.kr / 02-3480-2000) <br /> 경찰청 사이버안전국
									(www.ctrc.go.kr/ 국번 없이 182)
								</p>
								<p class="english ghost">
									Article 1 (Purpose) <br /> <br /> The purpose of the
									following Terms and Conditions of Use(‘T&C’) is to establish
									guidelines on rights, duties and responsibilities of cybermall
									Users utilizing the internet-related services (hereinafter
									referred to as the ‘Services’) provided by the 'CREWBI'
									(hereinafter referred to as the ‘Mall’) operated by 'Move
									Incorporated' (e-commerce company). <br /> ※ 『Unless
									transactions contradict its properties, the following terms
									apply to e-commerce transactions utilizing methods of PC
									communication, wireless and others』 <br /> <br /> Article 2
									(Definition) <br /> ①‘Mall’ refers to a virtual business site
									established by Move Incorporated to trade goods or services
									(hereinafter referred to as ‘Goods and Services’) using
									computers and information communication facilities to provide
									Goods and Services to Users. The term can also be defined as a
									company operating a cybermall. <br /> <br /> ②‘User’ refers
									to a Member and Non-Member who has accessed the ‘Mall’ to use
									the services provided by the ‘Mall’ in accordance with this
									T&C. <br /> ③‘Member’ refers to a User who uses the services
									provided by the ‘Mall’ by subscribing for Membership. <br />
									④‘Non-Member’ refers to a User who uses the services provided
									by the ‘Mall’ without subscription. <br /> <br /> Article 3
									(Display, Explanation and Amendment of Terms and Conditions of
									Use) <br /> ① The ‘Mall’ shall, for easy recognition by Users,
									display the contents of this T&C, name of company and
									representative, business address(including an address handling
									customer complaints), phone number, fax number, email address,
									business license number, e-commerce permit number, and the name
									of personal information manager on the main page of the CREWBI
									‘Mall’. Only the content of this T&C can be displayed though a
									link page. <br /> ② Prior to User’s final agreement to this
									T&C, the ‘Mall’ shall provide a separate link or pop-up screen
									to obtain User’s verification on the terms of cancellation
									rights, delivery responsibilities, refund conditions and other
									important details. <br /> ③ The ‘Mall’ may make amendments
									within the permissible range without violating applicable laws
									such as the 「Act on Consumer Protection in Electronic
									Commerce」, 「Regulation of T&C」, 「Framework Act on Electronic
									Commerce and Electronic Document」, 「Electronic Financial
									Transaction Act」, 「Electronic Signature Act」, 「Act on
									Protection of Information and Promotion of Utilization of
									Information and Communications Network」, 「Door-To-Door Sales
									Act」, 「Framework Act on Consumers」 and other related Consumer
									Protection Laws. <br /> ④ The ‘Mall’ shall specify the
									effective date and the reasons for amendment of the terms and
									have post on the initial screen for 7 days prior to effective
									date until the day before the effective date. <br /> If the
									amendment is modified to the User’s disadvantage, then the
									‘Mall’ shall grant at least 30 days of grace period for notice.
									In this case, the ‘Mall’ shall clarify the ‘before and after’
									changes in an ‘easy-to-understand’ manner. <br /> ⑤ When the
									‘Mall’ makes an amendment to the T&C, the modified T&C shall be
									applied only to contracts concluded after the effective date,
									whereas all contracts concluded before the effective date will
									remain under the provisions of the old T&C. However, if the
									User who has already signed the contract wishes to have the
									amendments administered, then the User may send his/her intent
									to the ‘Mall’ and acquire consent from the ‘Mall’ within the
									notice period stated in Clause ③ and it shall be applied
									accordingly. <br /> ⑥ Any information not specified and
									interpreted in this T&C shall be in accordance with the
									e-commerce Transaction Guidelines and Related Consumer
									Protection Acts provided by the Fair Trade Commission and other
									applicable Consumer Protection Laws and Regulation of T&C Act.
									<br /> <br /> Article 4 (Provision & Replacement of Service)
									<br /> ① The ‘Mall’ shall perform the following duties: <br />
									1. Provide information regarding Goods and Services and
									conclude purchasing contracts. <br /> 2. Deliver Goods and
									Services on purchase contract. <br /> 3. Other duties
									designated by the ‘Mall.’ <br /> ② The ‘Mall’ may replace
									Goods and Services provided in future T&C in the event that
									Goods and Services are sold out or technical specifications are
									revised. In this case, the ‘Mall’ shall immediately announce
									the replacement of Goods and Services and the date of
									application on the page where present Goods and Services are
									displayed. <br /> ③ In the event that Goods and Services are
									replaced because of a change in technical specifications or
									when Goods and Services are sold out, the ‘Mall’ shall
									immediately notify the cause of replacement to the addresses of
									the Users. <br /> ④ Following the previous Clause, the ‘Mall’
									shall compensate for all damages caused. However, this shall
									not apply if the ‘Mall’ proves that such event is not caused by
									its intention or negligence. <br /> <br /> Article 5
									(Suspension of Service) <br /> ① The ‘Mall’ may temporarily
									suspend its services as a result of the following reasons:
									maintenance of computers and telecommunications equipment,
									replacement or damage repairs, and interruption of
									communication. <br /> ② The ‘Mall’ shall compensate User or
									any Third Party Member of damages caused by the temporary
									suspension of services due to reason(s) detailed in Clause ①.
									However, this shall not apply if the ‘Mall’ proves that such
									event is not caused by its intention or negligence. <br /> ③
									In the case of a conversion of business item, abandonment of
									business, merging between businesses and for other various
									reasons, the ‘Mall’ shall notify the consumer as specified in
									Article 8 and reward consumer in accordance with the conditions
									suggested by the original ‘Mall.’ However, if the ‘Mall’ does
									not advise such standard of compensation, the ‘Mall’ shall pay
									Users for their mileage or reserve in kind or cash of which
									value corresponds to the currency being used at the ‘Mall.’ <br />
									<br /> Article 6 (Membership) <br /> ① The User shall apply
									for Membership by expressing his/her intent to agree to this
									T&C after filling out the form designated by the ‘Mall’ with
									Member’s personal information. <br /> ② The ‘Mall’ shall
									register all Users who apply for Membership in the manner
									stipulated in Clause ① unless the User is not engaged in one of
									the following issues: <br /> 1. After the applicant has lost
									Membership for reasons indicated in Article 7 Clause ③, the
									applicant may acquire approval to re-subscribe for Membership
									three years after the loss of Membership. <br /> 2. Entry of
									false information or omission in the registration form. <br />
									3. If deemed that registering the User would present technical
									difficulties to the ‘Mall.’ <br /> ③ Establishment of
									Membership becomes effective at the time that the Member
									receives the ‘Mall’s approval of Membership. <br /> ④ In due
									course of time, the Member shall update the ‘Mall’ with any
									changes to his/her account information through the methods of
									editing personal information. <br /> <br /> Article 7
									(Withdrawal from Membership & Loss of Eligibility) <br /> ①
									Members of the ‘Mall’ may request, at any time, to withdraw
									from Membership and the ‘Mall’ shall immediately process the
									request. <br /> ② The ‘Mall’ may limit or suspend Membership
									for the following reasons: <br /> 1. Entry of false
									information or omission in the registration form. <br /> 2. If
									the purchase payment of goods and other ‘Mall’ usage related
									liabilities have not been paid for before the appointed date. <br />
									3. If Member interferes with others to use the ‘Mall’ or
									threatens the order of e-commerce (such as the illegal use of
									personal information). <br /> 4. If Member uses the ‘Mall’ to
									act against public order and morals prohibited by the law and
									this ‘T&C.’ <br /> ③ The ‘Mall’ may forfeit Membership of the
									Member whose Membership was suspended or limited, if the same
									actions are repeated twice or more, or if the cause is not
									corrected within 30 days. <br /> ④ When the ‘Mall’ forfeits
									Membership, all information will be cancelled. Prior to
									cancellation, the ‘Mall’ shall notify the Member and give at
									least 30 days or more to grant an opportunity to explain the
									cause. <br /> <br /> Article 8 (Notification to Members) <br />
									① Any notifications from the ‘Mall’ will be sent to the email
									address designated in advance by the Member during
									registration. <br /> ② In the event of sending notifications
									to unspecified Members, a display of notifications on the
									notice board on the website for 1 week or more may replace
									sending emails. However, the ‘Mall’ shall send individual
									notice to a Member in regards to matters which may have a
									significant influence in his/her transaction. <br /> <br />
									Article 9 (Application for Purchase) <br /> ① The User shall
									apply for purchase in the following or in a similar manner, and
									the ‘Mall’ shall provide the User with the following
									information in an ‘easy-to-understand’ manner to aid in his/her
									request for purchase. <br /> 1. Search and select Goods and
									Services <br /> 2. Enter name of recipient, address, phone
									number, email address (or mobile phone number) <br /> 3.
									Confirm matter(s) in respect to the contents of this T&C,
									limited cancellation policies, delivery fees, installation
									fees, and others <br /> 4. Express agreement to this T&C and
									confirm or refuse the above Item 3 (ex. mouse click) <br /> 5.
									Apply and confirm purchase of goods; Agree to allow
									confirmation of application from the ‘Mall’ <br /> 6. Select
									payment method <br /> ② In case of an inevitable need (for the
									‘Mall’) to disclose∙consign consumer’s personal information to
									a third party, the ‘Mall’ shall obtain consumer’s consent at
									the time of applying for purchase. This consent is not obtained
									in advance at the time of applying for Membership. At this
									time, the ‘Mall’ shall specify to the consumer the provisions
									of personal information that are being disclosed, information
									of the receiving party, purpose and intent of use and the
									duration of retention∙use. But, consignment of personal
									information according to Clause ① of Article 25 in the 「Act on
									Protection of Information and Promotion of Utilization of
									Information and Communications Network」 shall comply with
									relevant laws and legislations in regards to affairs not
									mentioned in the Act. <br /> <br /> Article 10 (Conclusion of
									Contract) <br /> ① The ‘Mall’ may not accept request for
									purchase in Article 9 if it falls under one of the following
									items. In the event of concluding a contract with a minor, the
									‘Mall’ shall notify that the failure to acquire agreement from
									a legal representative may cause cancellation of the contract
									by the minor him/herself or the legal representative. <br />
									1. Entry of false information or omission in the registration
									form <br /> 2. Purchase of cigarettes and liquor and other
									Goods and Services prohibited by the Youth Protection Law <br />
									3. If deemed that accepting application for purchase may cause
									technical problems to the ‘Mall’ <br /> ② The contract is
									deemed to be concluded when the acceptance of the ‘Mall’ is
									delivered to the User in the form stipulated in Clause ① of
									Article 12. <br /> ③ The acceptance of the ‘Mall’ shall
									include confirmation on the User’s request for purchase,
									availability of sales, and correction or cancellation of the
									request for purchase. <br /> <br /> Article 11 (Payment
									Method) <br /> The method of payment for Goods and Services
									purchased through the ‘Mall’ may be selected from the following
									items. The ‘Mall’ may not collect any additional fees regarding
									payment for Goods and Services. <br /> 1. Account transfer
									through phone banking, internet banking, mail banking and
									others. <br /> 2. Card payment through prepaid card, debit
									card, credit card, and others. <br /> 3. Online bank transfer
									<br /> 4. Electronic money <br /> 5. Payment upon receipt <br />
									6. Mileage points or points offered by the ‘Mall’ <br /> 7.
									Gift voucher contracted or approved by the ‘Mall’ <br /> 8.
									Other means of electronic payment <br /> <br /> Article 12
									(Notice of Receipt, Change and Cancellation of Application for
									Purchase) <br /> ① The ‘Mall’ shall send a notice of receipt
									to the User after receiving the User’s application for
									purchase. <br /> ② In the case of a discord between the User’s
									intent and the received notice, the User may change or cancel
									the application for purchase immediately after receipt. If the
									request for change or cancellation is made prior to delivery,
									the ‘Mall’ shall process the request accordingly without any
									delay. In the event that payment has already been made, User
									shall follow the guidelines detailed in Article 15 -
									Cancellation of Purchase. <br /> <br /> Article 13 (Provision
									of Goods and Services) <br /> ① Unless otherwise specified,
									the ‘Mall’ shall take necessary measures such as customizing
									production and packaging and deliver Goods and Services within
									7 days from the date of purchase. However, if the ‘Mall’ has
									already received payment in whole or in part, then delivery
									shall be processed within 3 business days from the date of
									receipt. In such instances, the ‘Mall’ shall take necessary
									measures to inform the User on procedures of provision and
									delivery status of Goods and Services. <br /> ② The ‘Mall’
									shall specify delivery method, payer, and delivery time for
									each delivery method for the Goods and Services purchased by
									the User. In the event that the ‘Mall’ exceeds the designated
									period of delivery, it shall compensate the User for damages.
									However, this shall not apply if the ‘Mall’ proves that such
									event is not caused by its intention or negligence. <br /> <br />
									Article 14 (Refund) <br /> In the event that the Goods and
									Services are sold-out or unavailable and cannot be provided or
									delivered to a User who applied for purchase, the ‘Mall’ shall
									notify the User without any delay, and if payment for Goods and
									Services has already been made in advance, the ‘Mall’ shall
									take necessary measures or refund payment within 3 business
									days from the date of receipt. <br /> <br /> Article 15
									(Cancellation of Purchase) <br /> ① The User who purchased
									Goods and Services by concluding the contract with the ‘Mall’
									in accordance to Clause ② of Article 13 in the 「Acts on
									Consumer Protection in Electronic Commerce」 may cancel purchase
									within 7 days from the date on which the User received a
									written contract (if the written contract is received later
									than the supply of Goods and Services, then the receipt date is
									set on the date when User received the Goods and Services or
									when Goods and Services have been supplied). But, cancellation
									of purchase according to 「Acts on Consumer Protection in
									Electronic Commerce」 shall comply with relevant laws and
									legislations in regards to affairs not mentioned in the Acts. <br />
									② The User may not return or exchange Goods and Services in the
									event of one of the following reasons: <br /> 1. Delivered
									Goods lost or damaged at the fault of the User (however,
									cancellation of purchase may be acceptable if packaging was
									damaged in the process of checking content) <br /> 2.
									Significant decrease in value of Goods and Services due to
									partial use or consumption by the User <br /> 3. Not available
									for resale due to a significant decrease in value of Goods and
									Services from lapse of time <br /> 4. The Goods may be
									replaced by Goods showing the same performance, but packaging
									of the original is damaged <br /> ③ In the case of items 2 or
									4 of Article 2 Clause ②, the cancellation of purchase by User
									will not be limited if the ‘Mall’ failed to clearly specify the
									fact that cancellation of purchase is limited or that it would
									take necessary measures to provide the Goods. <br /> ④ Despite
									Clause ① and ②, the User may cancel his/her purchase of goods
									within 3 months from the date of receipt of the goods or within
									30 days from the date on which he/she recognized or could have
									recognized that Goods and Services differ from the
									advertisement or the provision of contract. <br /> <br />
									Article 16 (Effect of Cancellation of Purchase) <br /> ① In
									the event of a return of Goods from a User, the ‘Mall’ shall
									refund payment of Goods within 3 business days. In the event of
									a delay in refund, the ‘Mall’ shall pay User with the interest
									calculated by the number of days delayed with the overdue
									interest rate indicated on the 「Act on Consumer Protection in
									Electronic Commerce」 <br /> ② In regards to the
									above-mentioned case, if the User made payment of Goods with
									credit card or electronic money, the ‘Mall’ shall immediately
									request the business who provided such payment method to
									suspend or cancel payment. <br /> ③ In the event of any
									cancellation of purchase, the User shall bear the costs arising
									from returning the Goods. On the account of the User’s
									cancellation of purchase, the ‘Mall’ shall not claim charge for
									cancellation or compensation for damage. However, in the event
									of a cancellation of purchase caused by a discord in the
									contents of Goods and the advertisement or the provision of
									contract, the ‘Mall’ shall bear the costs of returning the
									Goods. <br /> ④ If the User bore the delivery fees when he/she
									received the Goods, the ‘Mall’ shall specify and make
									noticeable as to who would bear the delivery fees upon
									cancellation of purchase. <br /> <br /> Article 17
									(Protection of Personal Information) <br /> ① The ‘Mall’
									collects a minimum amount of information necessary to provide
									the services. <br /> ② At the time of applying for Membership,
									the ‘Mall’ shall not collect information needed for the
									performance of purchase contract in advance. But, in the case
									where personal identification is required before the
									performance of a purchase contract, a minimum amount of
									specified personal information is collected for the fulfillment
									of obligation in regards to relevant laws and legislation. <br />
									③ The ‘Mall’ shall obtain consent from User to collect∙use
									personal information by notifying User with the aim/purpose of
									collection∙use. <br /> ④ The ‘Mall’ shall not use the personal
									information outside their intended purpose. In the event of an
									uprising of a new use or when disclosing to third parties, the
									‘Mall’ shall notify the purpose of use and obtain consent from
									User during the stage of use disclosure. But, there are
									exceptions for cases regulated in the relevant laws and
									legislations. <br /> ⑤ In the event that the ‘Mall’ is
									required to acquire the approval of User by Clause ② and ③, the
									‘Mall’ shall specify its personal information manager
									(affiliation, name, phone number, other contact information),
									purpose of collection and use of information, information about
									Third Party (recipient, purpose of provision and the
									information to be provided), and the provisions stipulated in
									Clause ② of Article 22 of the 「Act on Protection of Information
									and Promotion of Utilization of Information and Communications
									Network」. The User may at any time cancel his/her approval. <br />
									⑥ User may, at any time, request for confirmation and
									correction of error in their personal information possessed by
									the ‘Mall,’ and the ‘Mall’ shall be responsible for taking any
									necessary measures without any delay. In the event that a User
									requests for the correction of an error, the ‘Mall’ shall not
									use the applicable personal information until error is
									corrected. <br /> ⑦ For protection of personal information,
									the ‘Mall’ shall limit the number of persons handling personal
									information to a minimum, and shall be responsible for any
									damages caused by loss, theft, leakage, falsification, and
									disclosure of personal information including credit card and
									bank account information to third parties without consent of
									the User. <br /> ⑧ The ‘Mall’ or any Third Parties who
									received personal information from the ‘Mall,’ shall without
									any delay destroy all personal information once the purpose of
									collection has been achieved. <br /> ⑨ The ‘Mall’ shall not
									have the agreement form regarding the collection∙use∙disclosure
									of personal information set to be filled out in advance. The
									‘Mall’ must specify services that will be restricted if User
									does not agree to the collection∙use∙disclosure of personal
									information, and the ‘Mall’ shall not limit services or refuse
									to accept Membership applications on the basis of User’s
									refusal to agree to collecting∙using∙disclosing of personal
									information that do not include the collection of compulsory
									information. <br /> <br /> Article 18 (Obligations of the
									‘Mall’) <br /> ① The ‘Mall’ shall not take any actions against
									public policy or actions restricted by the law and this T&C.
									The ‘Mall’ shall put its best efforts in providing Goods and
									Services on a stable basis in accordance with the provisions in
									this T&C. <br /> ② The ‘Mall’ shall be equipped with a
									security system to protect personal information of Users
									(including credit information) and provide a safe environment
									for Users to use the online services. <br /> ③ In accordance
									with Article 3 of the Law related to 『Fairness of Display and
									Advertisement』, the ‘Mall’ shall be responsible to compensate
									User(s) if damages were caused by displaying or adding unjust
									or unreasonable advertisement for certain Goods and Services <br />
									④ The ‘Mall’ shall not send any profit-making emails which are
									not wanted by Users. <br /> <br /> Article 19 (Obligations
									for ID & Password of Member) <br /> ① Member shall be
									responsible for the management of his/her ID and password,
									except for the case in Article 17. <br /> ② Member shall not
									allow any Third Party to use his/her ID and password. <br /> ③
									When a Member recognizes that his/her ID and/or password is
									stolen or is being used by a Third Party, the Member shall
									immediately notify the ‘Mall’, and follow the instructions of
									the ‘Mall.’ <br /> <br /> Article 20 (Obligations of User) <br />
									Users shall avoid the following actions: <br /> 1. Register
									false information at the time application or revision of
									information <br /> 2. Use others’ personal information <br />
									3. Change information displayed on the ‘Mall’ <br /> 4. Remit
									or display information (computer program and others) other than
									the information put on by the ‘Mall’ <br /> 5. Infringe
									copyright or intellectual property rights of the ‘Mall’ or the
									Third Party <br /> 6. Take any action that harms the
									reputation and interrupts the operation of the ‘Mall’ or a
									Third Party <br /> 7. Disclose or display any information
									containing indecent or violent message, video, voice, and other
									information going against good public order and morals. <br />
									<br /> Article 21 (Relationship between Linking Mall & Linked
									Mall) <br /> ① In the event that the main mall and the
									sub-mall are linked with a hyperlink (ex. the subject of
									hyperlink includes text, image and video), the former is called
									as the Linking Mall (Website) and the latter is called as the
									Linked Mall (Website). <br /> ② If the Linking Mall specifies
									and notifies the fact that it is not responsible for any
									transaction with the User for any Goods and Services
									independently provided by the Linked Mall on the initial page
									of the website of the Linking Mall or a pop-up window, then the
									Linking Mall is not responsible for such transaction. <br /> <br />
									Article 22 (Copyright & Limitation of Use) <br /> ① The
									copyright and other intellectual property rights for the works
									produced by the ‘Mall’ shall belong to the ‘Mall.’ <br /> ②
									The User may not use or cause any Third Party to use
									information with intellectual property rights belonging to the
									‘Mall’ for reproduction, transmission, publishing,
									distribution, broadcasting or other profit-making use without
									prior consent of the ‘Mall.’ <br /> ③ The ‘Mall’ shall notify
									the User when using the copyright belonging to the applicable
									User in accordance with mutual T&C. <br /> <br /> Article 23
									(Resolution of Dispute) <br /> ① The ‘Mall’ shall apply and
									reflect the opinion or complaint made by User(s), and install
									and operate a process for compensation of consumers’ damages. <br />
									② The ‘Mall’ shall give priority to any opinion or complaint
									made by User(s). However, in the event that it may not be able
									to promptly deal with the matter, the ‘Mall’ shall notify the
									User with the cause and the final settlement schedule. <br />
									③ When a User files for Remedy of Damage regarding a dispute
									between the ‘Mall’ and the User, the matter may be commissioned
									for arbitration by the Fair Trade Commission or a Dispute
									Conciliation Services Organization selected by the City Mayor.
									<br /> <br /> Article 24 (Jurisdiction & Governing Law) <br />
									① All e-commerce related lawsuits between the ‘Mall’ and a User
									shall be in accordance with the address of the User at the time
									of indictment. If an address is nonexistent, then the lawsuit
									shall fall under exclusive jurisdiction of the district court
									in the vicinity of User’s place of residence. In the event that
									the address or residence of the User is not clear at the time
									of indictment or if User is a foreign resident, the lawsuit
									shall be filed to the competent court on the Civil Procedures
									Code. <br /> ② Any and all e-commerce-related lawsuits between
									the ‘Mall’ and a User shall be governed by the law of the
									Republic of Korea.
								</p>
							</div>
						</li>
					</ul>
					
					<div class="button-bar" id="btnBar1" style="padding-top:5px; padding-left:1075px;">
						<button type="button" class="btn btn-primary" style="background-color:black;" onclick="exit();">동의하지 않음</button>
						<button type="button" class="agree2 btn btn-primary" onclick="nextShow();">동의함</button>
					</div>
					
					<!-- 이메일 인증 -->
					<div class="col-md-12 member-join ghost" id="phone-auth" style="padding:0px;">
						<h2>
							이메일 인증 <a href="#" class="ghost" id="hide-button2" style="float: right; color: white;">확인</a>
						</h2>
						<div class="box" id="emailCheck">
							<div class="msg only-desktop">
								<pre class="desktop">이메일 인증은 사이트에 가입한 적이 있는지 확인하는 단계입니다.
본인의 이메일 주소를 입력하여 본인확인을 하는 서비스입니다.</pre>
							</div>
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<ul class="filter">
									<li class="line mx-auto">
										<label>이메일</label>
										<div>
											<input type="text" id="first_email" size="10" />
											<h5>@</h5>
											<input type="text" id="last_email" size="10"
												list="email_select" placeholder="선택하세요" />
											<datalist id="email_select">
												<option value="" selected>::선택하기::</option>
												<option value="naver.com">naver.com</option>
												<option value="nate.com">nate.com</option>
												<option value="daum.net">daum.net</option>
												<option value="gmail.com">gmail.com</option>
												<option value=" ">::직접입력::</option>
											</datalist>
											<a href="#" style="margin-left: 30px; line-height: 35px;"
												id="checkBtn" onclick="emailCheck();">인증요청</a>
										</div>
									</li>
									<li class="line "><label class="ghost emailCheck">인증번호</label>
										<div>
											<input class="ghost emailCheck" id="checkBar" type="text">
											<h5>
											</h5>
											<div id="checkCount" class="ghost" style="padding-top:10px;"></div>
											<div id="reCheck" class="ghost">
												<a href="#" style="margin-left: 30px; line-height: 30px;"
													id="reCheckBtn" onclick="reEmailCheck();">재요청</a>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="col-md-3"></div>
						</div>
						
						<!-- 이메일 인증 확인 바 -->
						<div class="button-bar" id="btnBar2" style="padding-left:1170px;">
								<button class="btn btn-primary" id="next-page" type="submit" style="width:100px;">확인</button>
						</div>
					</div>
					
						<div class="col-md-12 member-join ghost" id="member-insert" style="padding:0px; height: 1090px;">
						<h2>회원 정보 입력</h2>
						<form action="/insertMember" method="post" id="frm" style="">
							<div class="box mx-auto" style="height:854px;">
								<div>
									<div style="width: 100%; float: left; padding-left:310px;">
										<div class="form-group mx-auto">
											<label for="userId">아이디</label> 
											<input type="text" class="form-control" id="userId" name="userId"
												onchange="idCheck();" placeholder="띄어 쓰기 없이 영소문자/숫자 6-12자"
												maxlength="12"> 
												<label class="problem" id="idProblem"></label>
										</div>
										<div class="form-group mx-auto">
											<label for="userPwd1">비밀번호</label> <input type="password"
												class="form-control" id="userPwd1" name="userPwd"
												onchange="pwdCheck1();"
												placeholder="띄어 쓰기 없이 10-20자의 영소문자, 숫자 및 특수문자 조합" maxlength="20">
											<label class="problem" id="pwdProblem1"></label>
										</div>
										<div class="form-group mx-auto">
											<label for="userPwd2">비밀번호 확인</label> <input type="password"
												class="form-control" id="userPwd2" onchange="pwdCheck2();"
												placeholder="위의 비밀번호를 다시 입력해주세요." maxlength="20"> <label
												class="problem" id="pwdProblem2"></label>
										</div>
										<div class="form-group mx-auto" >
											<label for="userName">이름</label> <input type="text"
												class="form-control" id="userName" name="userName"
												onchange="nameCheck();" placeholder="이름" maxlength="20">
											<label class="problem" id="nameProblem"></label>
										</div>
										<div class="form-group mx-auto">
											<label for="birth">생년월일</label> <input type="text"
												class="form-control" id="birth" name="birth"
												onchange="birthCheck();" placeholder="생년월일 ex) 930707"
												maxlength="6"> <label class="problem"
												id="birthProblem"></label>
										</div>
										<div class="form-group mx-auto">
											<label for="phone">휴대폰</label><br> <select
												class="form-control" name="phone1"
												style="width: 90px; float: left; margin-right:5px;">
												<option>010</option>
												<option>011</option>
												<option>019</option>
												<option>017</option>
												<option>016</option>
												
											</select> <input type="text" class="form-control" id="phone"
												name="phone2" onchange="phoneCheck();"
												placeholder=" ' - ' 없이 휴대폰번호입력" style="width: 333px; margin-left:5px;"
												maxlength="8"> <label class="problem"
												id="phoneProblem"></label>
										</div>
										
										<div class="form-group mx-auto" style="height:170px; margin-bottom:0px;">
											<label for="postcode">주소</label><br> 
											<input type="text" id="postcode" name="postcode" placeholder="우편번호"
												class="form-control" style="width: 100px; float: left; margin-right:10px;"
												readonly />
											
											<input type="button" class="btn btn-default" id="postBtn" onclick="execDaumPostcode();" value="주소 찾기"
												style="width: 100px; height: 42px; margin:0; magin-left:5px; padding: 0 5px;" />
												
											<input type="text" id="roadAddress" name="roadAddress"
												placeholder="도로명주소" style="margin-right: 20px; margin-top:10px;"
												class="form-control" readonly /> 
												
											<input type="text" id="addAddress" name="addAddress" 
											    placeholder="상세주소 입력" class="form-control" style="margin-top:10px;"/> 
												<span id="guide" style="color: #999"></span> 
												<label class="problem" id="addressProblem"></label>
										</div>
										<div class="form-group mx-auto">
											<label for="userName" style="margin-top:10px;">성별</label> <label class="problem"
												id="genderProblem"></label> <input type="hidden"
												id="hiddenGender" name="gender" /> <input type="hidden"
												id="hiddenEmail" name="email" />
											<p style="margin-bottom:5px;"></p>
											<div class="btn-group mx-auto" role="group" aria-label="..."
												id="gender">
												<button type="button" class="btn btn-default" id="genderM" style="margin-right:15px;">남자</button>
												<button type="button" class="btn btn-default" id="genderF">여자</button>
											</div>
										</div>
										<input type="hidden" id="userImg" name="userProfile" value="/imgs/member_img/boy.png">
										<input type="hidden" name="userNickName" value="유저"/>
									</div>
									<div style="">
										<div class="form-group1">
											<label><h3></h3></label> <label class="jombi" id="check5">
												<h2 class="ghost" id="ok-5">
													<span class="glyphicon glyphicon-ok" aria-hidden="true"
														style="color: #00FF40;"></span>
												</h2>
												<h2 class="ghost" id="remove-5">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"
														style="color: red;"></span>
												</h2>
											</label>
										</div>
										<div class="form-group1">
											<label><h3></h3></label> <label class="jombi" id="check6">
												<h2 class="ghost" id="ok-6">
													<span class="glyphicon glyphicon-ok" aria-hidden="true"
														style="color: #00FF40;"></span>
												</h2>
												<h2 class="ghost" id="remove-6">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"
														style="color: red;"></span>
												</h2>
											</label>
										</div>
										<div class="form-group1">
											<label><h3></h3></label>
										</div>
										<div class="form-group1">
											<label><h3></h3></label> <label class="jombi" id="check7">
												<h2 class="ghost" id="ok-7">
													<span class="glyphicon glyphicon-ok" aria-hidden="true"
														style="color: #00FF40;"></span>
												</h2>
												<h2 class="ghost" id="remove-7">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"
														style="color: red;"></span>
												</h2>
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3"></div><br><br><br>
							<div class="button-bar" id="btnBar1" style="padding-top:5px; padding-left:1190px;">
								<button class="btn btn-primary" type="button" onclick="allCheck();" style="width:80px; height:40px;">확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			</div>
		</div>
				<div id="footer" class="col-md-8 col-sm-12 mx-auto border-left-0 border-right-0"
			      style="border: 1px solid black; padding: 10px;"></div>
			<!-- 푸터 끝 -->
		
		<!-- 스크립트 -->
		<script>
			/* 정규식 표현 */
	   		var regExpId = /^[a-z0-9_]{6,}$/; // 아이디 영소문자+숫자 6-12
	    	//var regExpPwd = /^(?=.*[a-z])(?=.*[!@#$%*+=-])(?=.*[0-9]).{8,20}$/; //비밀번호 영소문자+숫자+특수문자 8-20
	    	var regExpPwd = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*=+])[a-z0-9!@#$%^&*=+]{10,20}$/;
	    	var regExpSpace = /\s/g; //공백찾기
	    	var regExpNum = /^[0-9]+$/{2,}$/; // 한글만
	    	var SetTime; //인증시간
	        var regExpEmailFirst = /^[a-zA-Z0-9_]$/; // 이메일 영 대소문자+숫자
	        var regExpEmailLast = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; // 이메일 주소
	        var regExpEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; //이메일 검사
	        var emailCheckCode; // 생성된 인증번호
	    	var hiddenEmail; //이메일 저장
	    	var surnameList1 = 
	    		['가', '간', '갈', '감', '강', '견', '경', '계', '고', '곡', '공'
	    		, '곽', '교', '구', '국', '군', '궉', '권', '근', '금', '기', '길'
	    		, '김', '나', '난', '남', '낭', '내', '노', '뇌', '누', '단', '담'
	    		, '당', '대', '도', '돈', '동', '두', '마', '만', '매', '맹', '명'
	    		, '모', '목', '묘', '묵', '문', '미', '민', '박', '반', '방', '배'
	    		, '백', '범', '변', '복', '봉', '부', '비', '빈', '빙', '사', '삼'
	    		, '상', '서', '서', '석', '선', '설', '서', '성', '소', '손', '송'
	    		, '수', '순', '승', '시', '신', '심', '십', '아', '안', '애', '야'
	    		, '양', '어', '엄', '여', '연', '염', '엽', '영', '예', '오', '옥'
	    		, '온', '옹', '왕', '요', '용', '우', '운', '원', '위', '유', '육'
	    		, '윤', '은', '음', '이', '인', '임', '자', '장', '저', '전', '점'
	    		, '정', '제', '조', '종', '좌', '주', '준', '즙', '증', '지', '지'
	    		, '진', '차', '창', '채', '천', '초', '최', '추', '춘', '탁', '탄'
	    		, '태', '판', '팽', '편', '평', '포', '표', '풍', '피', '필', '하'
	    		, '학', '한', '함', '해', '허', '현', '형', '호', '홍', '화', '환'
	    		, '황', '후', '흥']; //추가
	    		
	    	var surnameList2 = 
	    		['강전', '남궁', '독고', '동방', '망절', '사공', '서문', '선우'
	    			, '소봉', '어금', '징곡', '제갈', '황보']; //추가
	    	var nametest=0;//추가
	    	
	    	function nextShow() {
	            $('#phone').css("display", "block");
	        }
	    	
	    	function exit(){
	    		location.href="/index.jsp";
	    	}
	    	
	        $('.agree2').click(function() {
	            $('.agreement').slideToggle();
	            $('#btnBar1').hide();
	            $('#hide-button1').show();
	            $('#phone-auth').show();
	        });
	        
	        $('#hide-button1').click(function() {
	            $('.agreement').slideToggle();
	        });
	
	        function emailCheck() {
	            hiddenEmail = $('#first_email').val() + "@" + $('#last_email').val();
	            
	            if (hiddenEmail.match(regExpSpace)) {
	            	alert("공백이 존재합니다.");
	            }else if (!regExpEmail.test(hiddenEmail)) {
	            	alert("알맞지 않는 이메일 형식입니다.")
	            }else{
	            	$('.emailCheck').show();
	            	SetTime = 180; // 최초 설정 시간(기본 : 초)
	            	$('#checkCount').show();
	                $('#checkBtn').hide();
	    			
	                $.ajax({
	                    url: "/emailCheck",
	                    data: {email: hiddenEmail},
	                    type: "post",
	                    success: function(data) {
	                        console.log("성공");
	                        if(data=="1"){
	                        // 바꾸기
	                        alert("이미 가입한 이메일 입니다.");
	                        $('.emailCheck').toggle();
	                        $('#checkCount').toggle();
	                        $('#checkBtn').show();
	                        }else{
	                        	emailCheckCode = data;
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
	        
	        //추가
	        $('#reCheckBtn').click(function() {
	        	SetTime = 180;
	            tid = setInterval('msg_time()',1000);
	        });
	        
	        function reEmailCheck() {
	        	 hiddenEmail = $('#first_email').val() + "@" + $('#last_email').val();
	             
	        	 if (hiddenEmail.match(regExpSpace)) {
	             	alert("공백이 존재합니다.");
	             }else if (!regExpEmail.test(hiddenEmail)) {
	             	alert("알맞지 않는 이메일 형식입니다.")
	             }else{
	             
	            	 $('#reCheck').hide();
	            	 SetTime = 180; // 최초 설정 시간(기본 : 초)
	            	 $('#checkCount').show();
	                 
	                 $.ajax({
	                     url: "/emailCheck",
	                     data: {email: hiddenEmail},
	                     type: "post",
	                     success: function(data) {
	                         console.log("성공");
	                         emailCheckCode = data;
	                         
	                         
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
	
	        //수정
	        function msg_time() { // 1초씩 카운트
	        	if(SetTime>0){
	            m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초"; // 남은 시간 계산
	        	}else{
	        	m=" ";
	        	}
	            var msg = "<font color='red' style='margin-left:30px'>" + m + "</font>";
	            console.log(m);
	            if(m!="NaN분 NaN초"){
	            	if(SetTime>-1){
	            	$("#checkCount").html(msg);	
	            	}
	             }
	            SetTime--; // 1초씩 감소
            	if (SetTime < -1) { // 시간이 종료 되었으면..
                	clearInterval(tid); // 타이머 해제
               	 	$('#checkCount').hide();
                	$('#reCheck').show();
                	alert("시간이 초과되었습니다. 다시 시도해주시기 바랍니다");
            		}
	        }
	        
	        window.onload = function() {
	            tid = setInterval('msg_time()',1000);
	        };
	        window.onload = function TimerStart() {
	            tid = setInterval('msg_time()', 1000)
	        };
	
	        $('#next-page').click(function() {
	        	
	        	if($('#checkBar').css("display")=="none"){
	        		alert("이메일 인증을 완료하신 후 눌러주시기 바랍니다.");
	        	}
	        	
	        	if($('#checkBar').val()==emailCheckCode){
		            $('#emailCheck').slideToggle();
		            $('.desktop').html("이메일 인증이 완료되었습니다.");
		            clearInterval(tid); // 타이머 해제
		            $('.filter').hide();
		            $('#btnBar2').hide();
		            $('#hide-button2').show();
		            $('#member-insert').show();
		            $('#hiddenEmail').val(hiddenEmail);
	        	}else{
	        		alert("인증번호를 다시 확인해주시기 바랍니다.");
	        	}
	        });
	        
	        
	        
	        $('#hide-button2').click(function() {
	            $('#emailCheck').slideToggle();
	        });
	
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
	
	        function idCheck() {
	            $('#check1').css('visibility', 'visible');
	
	            if ($('#userId').val().match(regExpSpace)) {
	                $('#userId').css('border', '3px solid red');
	                $('#remove-1').show();
	                $('#ok-1').hide();
	                $('#idProblem').text("공백을 제거해주세요.");
	                $('#idProblem').show();
	                $('#remove-1').css("margin-bottom", "20px");
	
	            } else {
	                if (!regExpId.test($('#userId').val())) {
	                    $('#userId').css('border', '3px solid red');
	                    $('#remove-1').show();
	                    $('#ok-1').hide();
	                    $('#idProblem').text("띄어 쓰기 없이 영소문자/숫자 6-12자로 입력해주세요.");
	                    $('#idProblem').show();
	                    $('#remove-1').css("margin-bottom", "20px");
	
	                } else {
	                	$.ajax({
	                        url: "/idCheck",
	                        data: {userId:$('#userId').val()},
	                        type: "post",
	                        success: function(data) {
	                            console.log("성공");
	                            if(data==1){
	                            	$('#userId').css('border', '3px solid red');
	                                $('#remove-1').show();
	                                $('#ok-1').hide();
	                                $('#idProblem').text("이미 사용중인 아이디입니다.");
	                                $('#idProblem').show();
	                                $('#remove-1').css("margin-bottom", "20px");
	                            }else{
	                            	  $('#userId').css('border', '3px solid #00FF40');
	                                  $('#ok-1').show();
	                                  $('#remove-1').hide();
	                                  $('#idProblem').hide();
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
	        }
	
	        function pwdCheck1() {
	            $('#check2').css('visibility', 'visible');
	
	            if ($('#userPwd1').val().match(regExpSpace)) {
	                $('#userPwd1').css('border', '3px solid red');
	                $('#remove-2').show();
	                $('#ok-2').hide();
	                $('#pwdProblem1').text("공백을 제거해주세요.");
	                $('#pwdProblem1').show();
	                $('#remove-2').css("margin-bottom", "20px");
	
	            } else {
	                if (!regExpPwd.test($('#userPwd1').val())) {
	                    $('#userPwd1').css('border', '3px solid red');
	                    $('#remove-2').show();
	                    $('#ok-2').hide();
	                    $('#pwdProblem1').text("띄어 쓰기 없이 영소문자, 숫자 및 특수문자 조합");
	                    $('#pwdProblem1').show();
	                    $('#remove-2').css("margin-bottom", "20px");
	                } else {
	                    $('#userPwd1').css('border', '3px solid #00FF40');
	                    $('#ok-2').show();
	                    $('#remove-2').hide();
	                    $('#pwdProblem1').hide();
	                }
	            }
	        }
	
	        function pwdCheck2() {
	            $('#check3').css('visibility', 'visible');
	
	            if ($('#userPwd2').val().match(regExpSpace)) {
	                $('#userPwd2').css('border', '3px solid red');
	                $('#remove-3').show();
	                $('#ok-3').hide();
	                $('#pwdProblem2').text("공백을 제거해주세요.");
	                $('#pwdProblem2').show();
	                $('#remove-3').css("margin-bottom", "20px");
	
	            } else {
	
	                if ($('#userPwd1').val() != $('#userPwd2').val()) {
	                    $('#userPwd2').css('border', '3px solid red');
	                    $('#remove-3').show();
	                    $('#ok-3').hide();
	                    $('#pwdProblem2').text("비밀번호가 다릅니다.");
	                    $('#pwdProblem2').show();
	                    $('#remove-3').css("margin-bottom", "20px");
	                } else {
	                    $('#userPwd2').css('border', '3px solid #00FF40');
	                    $('#ok-3').show();
	                    $('#remove-3').hide();
	                    $('#pwdProblem2').hide();
	                }
	            }
	        }
	
	      //변경 성씨 검사 추가
	        function nameCheck() {
	        	var surname = $('#userName').val().substring(0,2);
	        	
	            $('#check4').css('visibility', 'visible');
	            if ($('#userName').val().match(regExpSpace)) {
	                $('#userName').css('border', '3px solid red');
	                $('#remove-4').show();
	                $('#ok-4').hide();
	                $('#nameProblem').text("공백을 제거해주세요.");
	                $('#nameProblem').show();
	                $('#remove-4').css("margin-bottom", "20px");
	            } else {
	                if (!regExpKor.test($('#userName').val())) {
	                    $('#userName').css('border', '3px solid red');
	                    $('#remove-4').show();
	                    $('#ok-4').hide();
	                    $('#nameProblem').text("한국어로 정확한 이름을 입력해주세요.");
	                    $('#nameProblem').show();
	                    $('#remove-4').css("margin-bottom", "20px");
	                } else {
	                		nametest=0
	                	
	                		for(var i=0; i<surnameList1.length; i++){
	                			if(surnameList1[i]==surname.substring(0,1)){
	                				nametest=1;
	                			}
	                		}
	                		for(var i=0; i<surnameList2.length; i++){
	                			if(surnameList2[i]==surname.substring(0,2)){
	                				nametest=1;
	                			}
	                		}
	                	if(nametest==0){	
	                		$('#userName').css('border', '3px solid red');
		                    $('#remove-4').show();
		                    $('#ok-4').hide();
		                    $('#nameProblem').text("유효한 성씨가 아닙니다.");
		                    $('#nameProblem').show();
		                    $('#remove-4').css("margin-bottom", "20px");
	                	}else{
	                		 $('#userName').css('border', '3px solid #00FF40');
	                         $('#ok-4').show();
	                         $('#remove-4').hide();
	                         $('#nameProblem').hide();
	                		}
	                	}
	            	}
	       		}
	
	      //변경 윤달추가
	        function birthCheck() {
	        	var year;
	        	var day;
	        	
	        	
	            $('#check5').css('visibility', 'visible');
	
	            if ($('#birth').val().match(regExpSpace)) {
	                $('#birth').css('border', '3px solid red');
	                $('#remove-5').show();
	                $('#ok-5').hide();
	                $('#birthProblem').text("공백을 제거해주세요.");
	                $('#birthProblem').show();
	                $('#remove-5').css("margin-bottom", "20px");
	
	            } else {
	                if (!regExpNum.test($('#birth').val())) {
	                    $('#birth').css('border', '3px solid red');
	                    $('#remove-5').show();
	                    $('#ok-5').hide();
	                    $('#birthProblem').text("숫자만 입력해주세요.");
	                    $('#birthProblem').show();
	                    $('#remove-5').css("margin-bottom", "20px");
	                } else {
	                	if($('#birth').val().substring(0, 2)<10){
	                		year = $('#birth').val().substring(0, 2)*1+2000;
	                	}else{
	                		year = $('#birth').val().substring(0, 2)*1+1900;
	                	}
	                	
	                		
	                    if ($('#birth').val().substring(2, 4) > 0 && $('#birth').val().substring(2, 4) < 13) {
	                    	day = 32 - new Date(year, $('#birth').val().substring(2, 4)-1, 32).getDate();
	                        if ($('#birth').val().substring(4, 6) > 0 && $('#birth').val().substring(4, 6) < day+1) {
	                            $('#birth').css('border', '3px solid #00FF40');
	                            $('#ok-5').show();
	                            $('#remove-5').hide();
	                            $('#birthProblem').hide();
	                        } else {
	                            $('#birth').css('border', '3px solid red');
	                            $('#remove-5').show();
	                            $('#ok-5').hide();
	                            $('#birthProblem').text(day+"일을 초과하였습니다.");
	                            $('#birthProblem').show();
	                            $('#remove-5').css("margin-bottom", "20px");
	                        }
	                    } else {
	                        $('#birth').css('border', '3px solid red');
	                        $('#remove-5').show();
	                        $('#ok-5').hide();
	                        $('#birthProblem').text("12월을 초과하였습니다.");
	                        $('#birthProblem').show();
	                        $('#remove-5').css("margin-bottom", "20px");
	                    }
	                }
	            }
	        }
	
	        function phoneCheck() {
	            $('#check6').css('visibility', 'visible');
	            if ($('#phone').val().match(regExpSpace)) {
	                $('#phone').css('border', '3px solid red');
	                $('#remove-6').show();
	                $('#ok-6').hide();
	                $('#phoneProblem').text("공백을 제거해주세요.");
	                $('#phoneProblem').show();
	                $('#remove-6').css("margin-bottom", "20px");
	            } else {
	                if (!regExpNum.test($('#phone').val())) {
	                    $('#phone').css('border', '3px solid red');
	                    $('#remove-6').show();
	                    $('#ok-6').hide();
	                    $('#phoneProblem').text("숫자만 입력해주세요.");
	                    $('#phoneProblem').show();
	                    $('#remove-6').css("margin-bottom", "20px");
	                } else {
	                    if ($('#phone').val().length != 8) {
	                        $('#phone').css('border', '3px solid red');
	                        $('#remove-6').show();
	                        $('#ok-6').hide();
	                        $('#phoneProblem').text("앞자리를 뺀 8자리를 정확히 입력해주시기 바랍니다.");
	                        $('#phoneProblem').show();
	                        $('#remove-6').css("margin-bottom", "20px");
	                    } else {
	                        $('#phone').css('border', '3px solid #00FF40');
	                        $('#ok-6').show();
	                        $('#remove-6').hide();
	                        $('#phoneProblem').hide();
	                    }
	                }
	            }
	        }
	        
	        
	        $('#genderM').click(function(){
				 $('#hiddenGender').val("M");
				 $('#userImg').val('/imgs/member_img/boy.png');
				 $('#genderM').css("background-color","#eeeeee");
				 $('#genderF').css("background-color","white");
			});
	        
	        $('#genderF').click(function(){
	        	$('#hiddenGender').val("F");
	        	$('#userImg').val('/imgs/member_img/girl.png');
				$('#genderF').css("background-color","#eeeeee");
				$('#genderM').css("background-color","white");
			});
	        
	        function allCheck() {
	            var success = 0;
	            if ($('#userId').val() == ""&&$('#ok-1').css("display")=="none") {
	                $('#check1').css('visibility', 'visible');
	                $('#userId').css('border', '3px solid red');
	                $('#remove-1').show();
	                $('#ok-1').hide();
	                success--;
	            }else{
	                success++;
	            }
	            if ($('#userPwd1').val() == ""&&$('#ok-2').css("display")=="none") {
	                $('#check2').css('visibility', 'visible');
	                $('#userPwd1').css('border', '3px solid red');
	                $('#remove-2').show();
	                $('#ok-2').hide();
	                success--;
	                
	            }else{
	                success++;
	            }
	            
	            if ($('#userPwd2').val() == ""&&$('#ok-3').css("display")=="none") {
	                $('#check3').css('visibility', 'visible');
	                $('#userPwd2').css('border', '3px solid red');
	                $('#remove-3').show();
	                $('#ok-3').hide();
	                success--;
	                
	            }else{
	                success++;
	            }
	            
	            if ($('#userName').val() == ""&&$('#ok-4').css("display")=="none") {
	                $('#check4').css('visibility', 'visible');
	                $('#userName').css('border', '3px solid red');
	                $('#remove-4').show();
	                $('#ok-4').hide();
	                success--;
	                
	            }else{
	                success++;
	            }
	            
	            if ($('#birth').val() == ""&&$('#ok-5').css("display")=="none") {
	                $('#check5').css('visibility', 'visible');
	                $('#birth').css('border', '3px solid red');
	                $('#remove-5').show();
	                $('#ok-5').hide();
	                success--;
	                
	            }else{
	                success++;
	            }
	            
	            if ($('#phone').val() == ""&&$('#ok-6').css("display")=="none") {
	                $('#check6').css('visibility', 'visible');
	                $('#phone').css('border', '3px solid red');
	                $('#remove-6').show();
	                $('#ok-6').hide();
	                success--;
	               
	            }else{
	                success++;
	            }
	            
	            if ($('#postcode').val() == "") {
	                $('#postBtn').css('border', '3px solid red');
	                success--;
	            } else{
	                success++;
	            }
	            
	            if ($('#addAddress').val() == ""&&$('#ok-7').css("display")=="none") {
	                $('#check7').css('visibility', 'visible');
	                $('#addAddress').css('border', '3px solid red');
	                $('#remove-7').show();
	                $('#ok-7').hide();
	                success--;
	                
	            }else{
	                success++;
	            }
	            
	            if(success==8) {
	                $('#frm').submit();
	            }
	        }
    </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>

</html>
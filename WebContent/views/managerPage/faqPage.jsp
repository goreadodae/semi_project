<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FAQ ������ �Դϴ�.</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	/* �ش� �ҷ����� �������� */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});

	$(document).ready(function() {
		var stat = true; /*display���¿� ����.... */
		$("#whenClick").click(function() { /* faq ���� Ŭ���� �̺�Ʈ �߻�  */
			if (stat == true) /*when display is none */
			{
				$("#hidingContens").css("display", "block");
				stat = false;

			} else { /*  when display is block */
				console.log("false���϶�");
				$("#hidingContens").css("display", "none");
				stat = true;
			}
		});
	});

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
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

#notice_sub_tit {
	font-size: 15px;
}

#faq-color {
	background-color: #dcdbde;
}

.list-arrow {
	float: right;
}

#hidingContens {
	display: none;
	text-align: center;
}
#whenClick{
	cursor:pointer;

}
</style>
</head>
<body>

	<div class="container-fluid" style="padding:0px">
		<div id="header"></div>

		<div id="contents"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<div class="row" style="padding: 0;">
				<div class="col-md-2" style="padding: 0;">
					<!--������ ���  -->
					<br>
					<h2>������</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h2>
						FAQ&nbsp;<span id="notice_sub_tit"> ���Ե��� ���� ���� �������� ���
							��ҽ��ϴ�. </span>
					</h2>
				</div>
			</div>
			<br>
			<div class="row" style="padding: 0;">
				<div id="customCenter" class="col-md-2" style="padding: 0;">
					<!-- ������ ��� ���̺� -->

					<table class="table table-bordered table-hover">
						<tr id="notice-color">
							<td><a href="/views/managerPage/noticePage.jsp"
								style="color: black">��������<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td id="faq-color"><a href="/views/managerPage/faqPage.jsp"
								style="color: black">FAQ<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="/views/managerPage/oneToOneQNAPage.jsp"
								style="color: black">1:1����<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="#" style="color: black">��ǰ���Ź���<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
					</table>

				</div>
				<div class="col-md-10">
					<!-- for�� ���?????  -->
					<table class="table" id="faqTable" style="text-align: center">
						<tr>
							<th scope="col" width="50px">��ȣ</th>
							<th scope="col" width="100px">ī�װ�</th>
							<th scope="col">����</th>
						</tr>
						<tr>
							<td>1</td>
							<td>ȸ������</td>
							<td id="whenClick">ȸ�����Խ� �־����� ������ �������ֳ���??</td>
						</tr>
					</table>
					<div class="row">
						<div class="col-md-10" id="hidingContens">
							<img src="/imgs/manager-img/faq.png" height="15px">&nbsp;
							�ƹ��͵� �����ϴ� ����^^
							<!-- faq �̹���, faq�亯 ����  -->

						</div>

					</div>

				</div>

			</div>
		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>

	<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
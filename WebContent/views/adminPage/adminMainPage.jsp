<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>adminPage</title>
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
</script>
<style>
* {
	padding: 0px;
	margin: 0px;
}

.radius {
	border-radius: 2em;
	border-top-left-radius: 2em;
	border-top-right-radius: 2em;
	border-bottom-left-radius: 2em;
	border-bottom-right-radius: 2em;
	border: 2px solid black;
	height: 70px;
	padding: 1;
	background: linear-gradient(-90deg, white 50%, #30A9DE 50%);
}

.radiusImg {
	height: 70px;
	padding: 1;
}

#bascketCnt {
	background: linear-gradient(90deg, white 50%, #30A9DE 50%);
}

#postedCnt {
	background: linear-gradient(-90deg, white 50%, #F68657 50%);
}

#joinCnt {
	background: linear-gradient(-90deg, white 50%, #60c5ba 50%);
}

#viewsCnt {
	background: linear-gradient(-90deg, white 50%, #ef5285 50%);
}
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 0px">
		<div id="header"></div>

		<div style="background-color: #f8faff; padding: 0px">

			<div id="contents"
				class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
				style="border: 1px solid black; left-padding: 14px;">
				<div class="row">
					<div class="offset-md-2 col-md-10" style="text-align: center">
						<br>
						<h2>ȯ���մϴ�!! �����ڴ�!</h2>
						
						<br> <br>

					</div>

				</div>
				<div class="row">

					<div class="offset-md-2 col-md-10">
						<div class="row">

							<div class="radius offset-md-1 col-md-2" id="basketCnt">

								<div class="row">
									<div class="radiusImg col-md-6">

										<img src="/imgs/manager-img/e-commerce.png" />

									</div>
									<div class="col-md-5">
										<div style="text-align: center">
											<span style="font-size: 20px">200</span> <b>��</b>

										</div>
										<div style="text-align: center">
											<span style="font-size: 10px"><b>order</b></span>
										</div>
									</div>
								</div>


							</div>
							<div class="radius offset-md-1 col-md-2" id="postedCnt">

								<div class="row">
									<div class="radiusImg col-md-6">
										<img src="/imgs/manager-img/conversation.png" />

									</div>
									<div class="col-md-6">

										<div style="text-align: center">
											<span style="font-size: 20px">1,254</span> <b>��</b>

										</div>
										<div style="text-align: center">
											<span style="font-size: 10px"><b>posted</b></span>
										</div>

									</div>
								</div>

							</div>
							<div class="radius offset-md-1 col-md-2" id="joinCnt">
								<div class="row">
									<div class="radiusImg col-md-6">
										<img src="/imgs/manager-img/user.png" />
									</div>
									<div class="col-md-6">
										<div style="text-align: center">
											<span style="font-size: 20px"> 1,200 </span> <b>��</b>
										</div>
										<b>subscriber</b>
									</div>
								</div>
							</div>

							<div class="radius offset-md-1 col-md-2" id="viewsCnt">
								<div class="row">
									<div class="radiusImg col-md-6">
										<img src="/imgs/manager-img/view.png" />

									</div>
									<div class="col-md-5" style="text-align: center">
										<div>
											<span style="font-size: 20px"> 1,200 </span> <br> <br>
										</div>
										<b>views</b>


									</div>

								</div>
							</div>



						</div>

					</div>




				</div>
				<br>


				<div class="row" style="background-color: #f8faff;">
					<div class="col-md-2" style="padding: 0px;">
						<table id="adminList" class="table table-bordered table-hover"
							style="background-color: white" style="width: 100%;">
							<tr style="background-color: #dcdbde">
								<th><a href="/views/adminPage/adminMainPage.jsp">Home</a></th>
							</tr>
							<tr>
								<th><a href="/views/adminPage/memberMgtPage.jsp">ȸ������</a></th>
							</tr>
							<tr>
								<th>�Խù�����</th>
							</tr>
							<tr>
								<th>�������װ���</th>
							</tr>
							<tr>
								<th><a href="/views/adminPage/qnaMgtPage.jsp"></a>���ǰ���</th>
							</tr>
						</table>

					</div>
					<div class="col-md-10">

						<div class="row">
							<div class="col-md-5" style="margin: 0 auto; text-align: center">
								<h3><a href="/views/adminPage/memberMgtPage.jsp">���� ������ ȸ�������Դϴ�.</a></h3>
								<br> <br>


							</div>
						</div>
						<div class="row">
							<div class=col-md-12>
								<table class="table" style="text-align: center">
									<tr>
										<th>ȸ����ȣ</th>
										<th>���̵�</th>
										<th>��й�ȣ</th>
										<th>�̸�</th>
										<th>�������</th>
										<th>����ó</th>
										<th>����</th>
										<th>�̸���</th>
										<th>��������</th>

									</tr>
									<tr>
										<td>59</td>
										<td>han5631</td>
										<td>saf*****</td>										
										<td>�ѿ���</td>
										<td>930505</td>
										<td>010454546</td>
										<td>��</td>
										<td>kiki123@naver.com</td>
										<td>2018-06-14</td>


									</tr>
								</table>
								<br> <br> <br> <br>
							</div>

						</div>

						<div class="row">
							<div class="col-md-5" style="margin: 0 auto; text-align: center">
								<h3><a href="/views/adminPage/qnaMgtPage.jsp">�̴亯 ���ǻ����� �ֽ��ϴ�.</a></h3>
							</div>
							<br><br><br><br>
						</div>

						<div class="row">
							<div class="col-md-12">
								<table class="table" style="width: 100%; text-align:center">
									<tr>
										<th>��ȣ</th>
										<th>����</th>
										<th>�ۼ���</th>
										<th>�ۼ���</th>

									</tr>
									<tr>
										<td>2424</td>
										<td>���̽Ű��� �ܰ���</td>
										<td>�����</td>
										<td>2018-06-04</td>
									</tr>

								</table>
							</div>
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
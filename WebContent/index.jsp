<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- �ʱ�ȭ -->
<link rel="stylesheet" href="/WebContent/css/reset.css">
<link rel="stylesheet" href="/WebContent/css/main-style.css">

<title>������ ������</title>

<script>
	/* �ش� �ҷ����� �������� */
	$(document).ready(function() {
		$("#header").load("/views/mainpage-header/main-header.html");
		$("#footer").load("/views/mainpage-footer/main-footer.html");
	});
</script>

<style>
/* �̱���  */
@media ( min-width : 768px) {
	.header {
		max-width: 100%;
	}
}
</style>

</head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ������</title>

<body>
	<!-- ��ü ȭ��  -->
	<div class="container-fluid">

		<!-- Header -->
		<div id="header">
			<!-- load -->
		</div>

		<!-- ������ -->
		<div id="" class="contents">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12 col-sm-12" style="padding: 0px;">
						<img
							src="http://img-cf.kurly.com/shop/data/skin/designgj/img/banner/74e51d1f685eef277b3f8bcc4f46a6e6.jpg"
							alt="�̹���" class="col-md-12 col-sm-12" height="350"
							style="padding: 0px;">
					</div>

					<!--      <div class="col-md-3 col-sm-3 text-center text-white bg-primary text-white">
                    <h1>��ŷ</h1>
                    <p class="lead my-3">Multiple lines of text that form the lede, informing new readers quickly and efficiently about what's
                        most interesting in this post's contents.</p>
                </div> -->
				</div>
			</div>

			<br> <br>



			<div class="col-md-8 mx-auto">
				<div class="row">
					<div class="col-md-4 col-sm-4" style="padding: 0px;">
						<img src="/imgs/main-img/main_page_1.jpg" height="426"
							style="width: 100%; border: 1px solid #dadada;">
					</div>
					<div class="col-md-4 col-sm-4" style="padding: 0px;">
						<div>
							<img src="/imgs/main-img/main_page_2.jpg"
								style="width: 100%; border: 1px solid #dadada;" height="213"
								border="1px solid black;">
						</div>
						<div>
							<img src="/imgs/main-img/main_page_2.jpg"
								style="width: 100%; border: 1px solid #dadada;" height="213">
						</div>
					</div>
					<div class="col-md-4 col-sm-4" style="padding: 0px;">
						<div>
							<img src="/imgs/main-img/main_page_2.jpg"
								style="width: 100%; border: 1px solid #dadada;" height="213">
						</div>
						<div>
							<img src="/imgs/main-img/main_page_2.jpg"
								style="width: 100%; border: 1px solid #dadada;" height="213">
						</div>
					</div>
				</div>
			</div>
			<br> <br>

			<div>
				<div class="col-md-12"></div>

			</div>

			<div class="col-md-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header"
					style="padding: 0px;">
					<h1>���� �� �� ������</h1>
				</div>

				<div class="col-md-12" style="padding: 0px;">
					<div class="row">
						<div class="col-md-3 col-sm-3">
							<div class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
								<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/����.jpg" alt="�̹���" height="325" class="img-thumbnail">
								<div class="col-md-12">
									<p class="lead my-1">���� �޴��� ����</p>
									<p class="display-6">By �����</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-12">
							<div class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
								<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/����.jpg" alt="�̹���" height="325" class="img-thumbnail">
								<div class="col-md-12">
									<p class="lead my-1">���� �޴��� ����</p>
									<p class="display-6">By �����</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-12">
							<div class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
								<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/����.jpg" alt="�̹���" height="325" class="img-thumbnail">
								<div class="col-md-12">
									<p class="lead my-1">���� �޴��� ����</p>
									<p class="display-6">By �����</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-12">
							<div class="col-md-12 col-sm-12"
								style="border: 1px solid #dadada; padding: 0px;">
								<img class="col-md-12 col-sm-12" style="padding: 0px;"
									src="/imgs/main-img/����.jpg" alt="�̹���" height="325" class="img-thumbnail">
								<div class="col-md-12">
									<p class="lead my-1">���� �޴��� ����</p>
									<p class="display-6">By �����</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br> <br>

			<div class="col-8 mx-auto" style="padding: 0px;">
				<div class="col-md-12" id="main-contents-header"
					style="padding: 0px;">
					<h1>�������� ������</h1>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-3">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/����.jpg" alt="�̹���" height="325" class="img-thumbnail">
							<div class="col-md-12">
								<p class="lead my-1">���� �޴��� ����</p>
								<p class="display-6">By �����</p>
							</div>
						</div>
					</div>

					<div class="col-md-3 col-sm-12">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/����.jpg" alt="�̹���" height="325" class="img-thumbnail">
							<div class="col-md-12">
								<p class="lead my-1">���� �޴��� ����</p>
								<p class="display-6">By �����</p>
							</div>
						</div>
					</div>

					<div class="col-md-3 col-sm-12">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/����.jpg" alt="�̹���" height="325" class="img-thumbnail">
							<div class="col-md-12">
								<p class="lead my-1">���� �޴��� ����</p>
								<p class="display-6">By �����</p>
							</div>
						</div>
					</div>

					<div class="col-md-3 col-sm-12">
						<div class="col-md-12 col-sm-12"
							style="border: 1px solid #dadada; padding: 0px;">
							<img class="col-md-12 col-sm-12" style="padding: 0px;"
								src="/imgs/main-img/����.jpg" alt="�̹���" height="325" class="img-thumbnail">
							<div class="col-md-12">
								<p class="lead my-1">���� �޴��� ����</p>
								<p class="display-6">By �����</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br>


		<!-- Footer -->
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
	</div>

</body>
</html>
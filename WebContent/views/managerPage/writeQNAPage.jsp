<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1:1���� �ۼ�</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script>
	/* �ش� �ҷ����� �������� */
	$(document).ready(function() {
		/* $("#header").load("/views/header/main-Header.jsp"); */
		$("#footer").load("/views/footer/main-Footer.jsp");
	});

	$(document).ready(function() { /*�ֹ���ȣ ���̺�  jquery  */
		var stat = true;
		$('#orderInquiry').click(function() {
			if (stat == true) {
				$('#hidingInquiry').css("display", "block");
				stat = false;
			} else {
				$('#hidingInquiry').css("display", "none");
				stat = true;
			}
		});

	});
	
	$(document).ready(function(){
		$('#close').click(function(){
			$('#hidingInquiry').hide();
		});
	});
	
	$(document).ready(function() { /*�ֹ���ȣ ���̺�  �ݱ�  */
		$('#addrow>tr').click(function() {
			$('#hidingInquiry').css("display", "none");
		});
	});

	/* 1:1���� �̹��� �߰�  jQuery  */
	$(document).ready(function(){
		cnt2 = 1;
		cnt = $('#rowCount').length + 1;
		$('#addImg').click(function() {
			if (cnt <= 5) 
			{
				$('#addRow').append('<tr class="rowTr" id="rowTr_'+cnt2+'"><td><span>'+ cnt
									+ ' '+ '<button>���� ����</button>'+ ' '+ '<label>���õ� ���� ����</label>'
									+ ' '+ '<img src="/imgs/manager-img/minus.png" class="minus-cursor"'
									+ 'onclick="removeRow('+ cnt2+ ');"/></span></td></tr>');
					cnt++;
					cnt2++;
					
					
			} else {alert("�̹����� �ִ� 5������ ���ε尡 �����մϴ�.");}
		});
			
	});
	
	function removeRow(cnt2) {/* �̹����߰� �� ����   */
		if ($('#rowTr_' + cnt2).remove()) {
			cnt--;	/* �����Ҷ����� ���� */
			/* cnt2--; /* �����Ҷ����� ���� */
		}
	}
	
	
	$(document).ready(function(){
		$('.selectRdo').click(function(){
			$('.selectRdo').prop("checked",false);
			$(this).prop("checked",true);

			});
		});


	
</script>

<style>

* {
	margin: 0;
	padding: 0;
}

.list-arrow {
	float: right;
}

#notice_sub_tit {
	font-size: 15px;
}

#notice-color {
	background-color: #dcdbde;
}

#qnaWriteSpace {
	width: "200px";
}

#hidingInquiry {
	display: none;
}

#close {
	cursor:pointer;
	float: right;
}

#prInfoPolicy {
	text-size: 1px;
}

#qnaSubmit {
	float: right;
}

#writeQNAFormTbl tr>td:first-child {
	vertical-align: middle;
	text-align: center;
}

#addRow tr td {
	text-align: left !important;
}

#addRow img{
	cursor:pointer;
}


</style>


</head>
<body>
	<div class="container-fluid" style="padding:0px">
		<div id="header"></div>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row" style="padding: 0;">
				<div class="col-md-2" style="padding: 0;">
					<!--������ ���  -->
					<br>
					<h2>������</h2>
					<br>
				</div>
				<div class="col-md-8">
					<br>
					<h4>1:1���ǻ���&nbsp;</h4>
				</div>
			</div>
			<br>
			<div class="row" style="padding: 0;">
				<div id="customCenter" class="col-md-2" style="padding: 0;">
					<!-- ������ ��� ���̺� -->

					<table class="table table-bordered table-hover" id="forWriting">
						<tr>
							<td><a href="/views/managerPage/noticePage.jsp"
								style="color: black">��������<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr>
							<td><a href="/views/managerPage/faqPage.jsp"
								style="color: black">FAQ<img
									src="/imgs/manager-img/right-arrow.png" height="9px"
									class="list-arrow"></a></td>
						</tr>
						<tr id="notice-color">
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
					<table class="table table-bordered" id="writeQNAFormTbl">
						<tr height="70px">
							<td width="100px" style="background-color: #dcdbde;">����</td>
							<td><br> <input type="text" size="100%" /></td>


						</tr>
						<tr height="70px">

							<td style="background-color: #dcdbde">�ֹ���ȣ</td>

							<td><input type="text" style="width: 25%" readonly />
							<button type="button" class="btn btn-info" id="orderInquiry" style="height:2em">�ֹ���ȸ</button>
								<div class="col-md-8" style="border: 1px solid; height: 300px"
									id="hidingInquiry">
									�����Ͻ� �ֹ���ȣ�� �����ϼ���<br>
									<table class="table table-bordered"
										style="width: 100%; height: 8; text-align: center;">
										<tr style="background-color: gray;">
											<th height="8">�ֹ���ȣ</th>
											<th>�ֹ�����</th>
											<th>��ǰ��</th>
											<th>����</th>
											<th>�ֹ��ݾ�</th>
											<th>����</th>

										</tr>
										<tr>
											<td>1</td>
											<td>2017-08-09</td>
											<td>�����</td>
											<td>1</td>
											<td>2000</td>
											<td><input type="radio" class="selectRdo"></td>
										</tr>
										<tr>
											<td>1</td>
											<td>2017-08-09</td>
											<td>�����</td>
											<td>1</td>
											<td>2000</td>
											<td><input type="radio" class="selectRdo"></td>
										</tr>


									</table>
									<p id="close">close</p>

								</div></td>
						</tr>
						<tr>
							<td height="70px" style="background-color: #dcdbde">�̸���</td>
							<td><input type="text" /> <!-- Ÿ���� �̸��Ϸ� �ٲ�  --></td>

						</tr>
						<tr>
							<td height="70px" style="background-color: #dcdbde">���ڸ޽���</td>
							<td><input type="text" size="10" maxLength="4" />&nbsp;- <input
								type="text" size="10" maxLength="4" />&nbsp;- <input
								type="text" size="10" maxLength="4" /></td>
						</tr>
						<tr>
							<td style="background-color: #dcdbde;">����</td>
							<td>

								<p>
									<b>1:1 ���� �ۼ� �� Ȯ�����ּ���!</b>
								</p> <br> <b style="font-size: 15px">��ǰ / ȯ��</b><br> -��ǰ
								���� Ȥ�� �̻����� ��ǰ(ȯ��)�� �ʿ��� ��� ������ �Բ� ��ü���� ������ �����ּ���.<br> <br>
								<b style="font-size: 15px">�ֹ����</b><br> -�ֹ���� ��û�� ����� ���� ����
								6�ñ��� �����մϴ�. ���� 6�� ���Ŀ��� ������ ���۵Ǿ� ��Ұ� �Ұ����մϴ�.<br> -�ֹ���ǰ�� �κ�
								��Ҵ� �Ұ����մϴ�. ��ü �ֹ���� �� �籸�� ���ּ���. <br> <br> 
								<b style="font-size: 15px">���</b><br> -�ֹ� �Ϸ� �� ��� ���(�ù�)�� ������
								�Ұ����մϴ�.<br> -����� �� ��۽ð� ������ �Ұ����մϴ�.(������ ����)<br> <br>
								*�ֹ���� �� ���� ���� 5��(�ָ� ������ 12��)���� ������ ���Ǵ� ���� �亯�帳�ϴ�. ���� ���Ǵ� ������ ����
								8�� ���� ���������� �亯�ص帳�ϴ�. <br> <br> <!-- 1:1���� ����  --> <textarea
									style="width: 100%; height: 300px; resize: none;">
						 </textarea>
							</td>
						</tr>
						<tr>
							<td style="background-color: #dcdbde">�̹���</td>
							<td>

								<div id="refImage">
									<table class="table" id="addRow">
										<tr id="rowCount">
											<td><span><span id="num">1</span>
													<button>���� ����</button> <label>���õ� ���� ����</label> <img
													src="/imgs/manager-img/add.png" id="addImg" /> </span></td>
										</tr>

									</table>
								</div>
							</td>
						</tr>

					</table>

					<div class="col-md-8" id="prInfoPolicy">

						<b>�������� ���� �� �̿뿡 ���� �ȳ�</b> <br> <b>�����׸�:</b> �̸�, ��ȭ��ȣ, �̸����ּ�<br>
						<b>��������:</b> ��ǰ���� ���� �� ��� �ּ�<br> <b>�̿�Ⱓ:</b> ��Ģ������ �������� ���� ��
						�̿������ �޼��� �Ŀ��� �ش� ������ ��ü ���� �ı��մϴ�.<br> ��, ��������� ������ ���Ͽ� ������
						�ʿ䰡 �ִ� ���<br> �����Ⱓ ���� ���������� ������ �� �ֽ��ϴ�. <br>�� ���� ������ ������
						������ ����������޹�ħ�� �ؼ��մϴ�.<br>

						<div class="row">
							<div class="col-md-10 row" style="border: 1px soild">
								<div class="col-md-10" style="text-align: center">
									<br> <input type="radio" id="agreeRdo" name="whetherAgree"
										value="agree"><label>����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="disAgreeRdo" name="whetherAgree"
										value="disAgree" /><label>�������� �ʽ��ϴ�</label>

								</div>
							</div>
						</div>

					</div>
					<div class="row">

						<div class="offset-md-11 col-md-1">
							<button type="button" class="btn btn-success" id="qnaSubmit"
								onclick="save()">����</button>

						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
			>
		</div>


	</div>
</body>
</html>
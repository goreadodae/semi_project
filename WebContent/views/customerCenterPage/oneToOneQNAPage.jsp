<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1:1 ���� ������ �Դϴ�.</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">

<jsp:include page="/views/main/default_layout.jsp"></jsp:include>
<script>
	/* �ش� �ҷ����� �������� */
	$(document).ready(function() {
		
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
	$(document).ready(function(){
		$('#list-color tr').eq(2).addClass('on');
	});
	
	
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

#noHasList{
	position:relative;
	text-align:center;
	top:40%;

}
.list-arrow{
	float:right;
}

</style>

</head>
<body>


<c:if test="${sessionScope.user==null}" >
	<c:redirect url="/views/memberPage/loginPage.jsp"/>
</c:if>
	
	
		<!--  1:1 ���� ������ ���鶧 �����ؾ� �� ��!!
			1. �α����������� 1:1���ǰ� �����ϴ�....
			(�α����� ���� �ʾ��� ��� �α��� â���� ������!!)
			2. ȸ���� 1:1 ���Ǹ� �ۼ����� �� ������ db�� ���..
			3. ������ ���������� ���ǻ����� �� �� �ְ� �����Ѵ�..�Ф�
			4. ����ڴ� ������ �ߴ� ���ǵ� �� �� �ְ� �ؾ� �Ѵ�.
			5. ���ǳ����� ���ٸ�!! �÷��� ����� ���� �������������� ���ǳ����� �������� �ʴ´ٴ� ������ �־�� ��!!
			6. �۾��� ��ư Ŭ���� �� �������� �ۼ� �������� ����
			7. ������
		  -->
	<div class="container-fluid" style="padding:0px">
		<jsp:include page="/views/header/main-Header.jsp"></jsp:include>

		<div class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;" id="contents">
			<div class="row" style="padding:0;">
				<div class="col-md-2" style="padding:0;">
					<!--������ ���  -->
					<br>
					<h2>������</h2>
					<br>
				</div>
				<div class="col-md-8" >
					<br>
					<h4 style="line-height:35px">
						1:1���ǻ���&nbsp;
					</h4>
				</div>
			</div>
			<br>
			<div class="row" style="padding:0;">
				<div id="customCenter" class="col-md-2" style="padding:0;">
					<!-- ������ ��� ���̺�  include-->
					<jsp:include page="/views/customerCenterPage/contentsLeft.jsp" flush="false"/>
				</div>

			<div class="col-md-10">
			<!-- <a href="/views/managerPage/writeQNAPage.jsp">�ۼ��ϱ�(�ӽø�ũ)</a> -->
			
			<table class='table'>
			<tr>
			<th>��ȣ</th>
			<th>ī�װ�</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			</tr>

			</table>
			<!-- ����ڰ� ���� �� ������ ������  -->
			<div class="cols-md-10" style=" height:300px">
				
				<div id="noHasList">
					<h6>1:1���ǳ����� �������� �ʽ��ϴ�.</h6>
				
				</div>
			
			</div>
			<div class="offset-md-11 cols-md-1">
			
			
			<button type="button" class="btn btn-success" onclick="location.href='/views/customerCenterPage/writeQNAPage.jsp'">�ۼ��ϱ�</button>
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
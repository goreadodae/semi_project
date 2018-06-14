<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>

<!-- 스타일시트 초기화 -->
<link rel="stylesheet" href="/css/reset.css">


<!-- 부트스트랩 css -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">


<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

<!-- 랭킹페이지에 필요한 스타일시트 : 지현 작성 -->
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss3.css">


</head>
<body>

<script>
  window.onload = function(){
    var preYear = new Date().getFullYear().toString() -10; /*현재 년도 - 10년*/
    var nowYear = new Date().getFullYear().toString(); /*현재 년도*/
    var preMonth = 1; /*1월*/
    var endMonth = 12; /*12월*/
    var nowMonth = new Date().getMonth()+1;  /*현재 달*/

    var strYear="";
    var strMonth="";

    for(var i=preYear; i<=nowYear; i++)
    {
    if(i == nowYear)
    {
      strYear += "<option value=" + i + " selected>" + i  + "년" +"</option>";
    }else{
      strYear += "<option value=" + i + " >" + i  + "년" +"</option>";
    }
    }

    for(var i=preMonth; i<=endMonth; i++)
    {
      
      if(i == nowMonth)
      {
        strMonth += "<option value=" + i + " selected>" + i  + "월" +"</option>";
      } else {
      strMonth += "<option value=" + i + " >" + i + "월"  +"</option>";

     }
    }
    
    document.getElementById("yearClick").innerHTML = strYear;
    document.getElementById("monthClick").innerHTML = strMonth;
  }
</script>
<div class="container">
<div class="row justify-content-end">

<div style="width: 150px;">
<select class="custom-select" id="yearClick">
</select>
</div>
&emsp;
<div style="width: 150px;">
<select class="custom-select" id="monthClick">
</select>
</div>

</div>
</div>
<br><br><br><br>

</body>
</html>
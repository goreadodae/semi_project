<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
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


/*현재 선택된 셀렉트 값 가져오기*/
/*console.log($("#yearClick option:selected").val());*/
//console.log("선택하지 않은 상태의 년도 : "+$("select[name=yearClickName]").val());
//console.log("선택하지 않은 상태의 년도 : "+$("select[name=monthClickName]").val());
 var yearClick = $("select[name=yearClickName]").val().substr(2,4);
 var monthClick = $("select[name=monthClickName]").val();

  //console.log("선택한 년도 : "+$("select[name=yearClickName]").val().substr(2,4));

/*바뀐 셀렉트 값 가져오기*/
$("#yearClick").change(function(){
/*alert($(this).children("option:selected").text());*/
 // console.log("선택한 년도 : "+yearClick.substr(2,4));


    $.ajax({
      url : "/rankingMonthlyRecipe",
      data : {year : yearClick, month : monthClick},
      type : "post",
      success : function(data){
      //  console.log("성공");
        for(var i=0; i<data.lenth;i++){
       //     console.log(i+"번째"+data[i]);
            $("#rankNum"+(i+1)).html(i+"위");
            $("#cardImgs"+(i+1)).attr("src",data[i].completePic);
            $("#rankingTodayTitle"+(i+1)).html(data[i].recipeTitle);
            $("#rankingViews"+(i+1)).html(data[i].recipeTodayViews);
            $("#rankingTag"+(i+1)).html(data[i].recipeTag);
            $("#rankingContents"+(i+1)).html(data[i].recipeIntro);
          }
          
        

      },
      error : function(){
        console.log("실패");
      }
    });

});

  $("#monthClick").change(function(){
  //console.log("선택한 달 : "+monthClick);

    $.ajax({
      url : "/rankingMonthlyRecipe",
      data : {year : yearClick, month : monthClick},
      type : "post",
      success : function(data){
          for(var i=0; i<data.lenth;i++){
            //  console.log(i+"번째"+data[i]);
              $("#rankNum"+(i+1)).html(i+"위");
              $("#cardImgs"+(i+1)).attr("src",data[i].completePic);
              $("#rankingTodayTitle"+(i+1)).html(data[i].recipeTitle);
              $("#rankingViews"+(i+1)).html(data[i].recipeTodayViews);
              $("#rankingTag"+(i+1)).html(data[i].recipeTag);
              $("#rankingContents"+(i+1)).html(data[i].recipeIntro);
            }
            
      },
      error : function(){
        console.log("실패");
      }
    });
    });

  }


/* window.onload=function(){
    var yearClick = $("yearClick").val()

    var monthClick = $("monthClick").val();

    $.ajax({
      url : "/rankingMonthlyRecipe",
      data : {year : yearClick, month : monthClick},
      type : "post",
      success : function(data){
        console.log("성공");

      },
      error : function(){
        console.log("실패");
      }
    });

  }*/


</script>
<div class="container">
<div class="row justify-content-end">

<div style="width: 150px;">
<select class="custom-select" id="yearClick" name="yearClickName">
</select>
</div>
&emsp;
<div style="width: 150px;">
<select class="custom-select" id="monthClick" name="monthClickName">
</select>
</div>

</div>
</div>
<br><br><br><br>

</body>
</html>
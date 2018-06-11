<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 css -->

<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
    integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">


<!-- jquery -->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>

<!-- 랭킹페이지에 필요한 스타일시트 : 지현 작성 -->
<link rel="stylesheet" href="/css/ranking_css/semi_rankingCss3.css">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
  $( function(){
    $( "#datepicker" ).datepicker({
        dateFormat: 'yy년 mm월 dd일',
        showOtherMonths: true,
        selectOtherMonths: true,
        changeMonth: true,
        changeYear : true,
        maxDate: new Date(),
        defaultDate : new Date(),
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //월 이름
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        /*선택한 날짜 가져오기*/
        onSelect: function () {
            selectedDate = $.datepicker.formatDate("yy년 mm월 dd일", $(this).datepicker('getDate'));

            /*선택한 날짜 라벨로 가져오기*/
            console.log(selectedDate);
            document.getElementById("rankingDateToday").innerHTML =selectedDate;
        }

    });

    /*오늘 날짜 가져오기*/
   $("#datepicker").datepicker('setDate', new Date());
    document.getElementById("rankingDateToday").innerHTML = $("#datepicker").val();
});



</script>



</head>
<body>

<!-- <input type="text" id="datepicker" placeholder="날짜선택"> -->
<input type="text" id="datepicker" placeholder="날짜선택">


<h2 id="rankingDateH2"><label id="rankingDateToday" value="dateToday" onclick="calendarCheck();"></label></h2>



</body>
</html>
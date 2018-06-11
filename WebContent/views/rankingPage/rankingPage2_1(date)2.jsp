<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- 스타일시트 초기화 -->
<link rel="stylesheet" href="/css/reset.css">


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

<!-- jquery ui 불러오는 css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>


 $(document).ready(function(){

$.datepicker.setDefaults({
      dateFormat : 'yy년 mm월 dd일',
      prevText : '이전 달',
      nextText : '다음 달',
      monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
      dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
      dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
      dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
      showMonthAfterYear : true,
      yearSuffix : '년',
      changeMonth : true,
      changeYear : true,
      maxDate : new Date(),
      defaultDate : new Date(),
      onSelect: function (date) {
              document.getElementById("prtDateTrigger").innerHTML = date;
          }    
   });
       
       $('#prtDateTrigger').click(function(){
          $(function() {
      $("#prtDateTrigger").datepicker();
   });
       })

   });


/*  $(function() {
      $("#prtDateTrigger").datepicker();
   });
*/


    var x = new Date();
    var Tyear = x.getFullYear().toString();
    var Tmonth = (x.getMonth() + 1).toString();
    var Tday = x.getDate().toString();
    (Tday.length == 1) && (Tday = '0' + Tday);
    (Tmonth.length == 1) && (Tmonth = '0' + Tmonth);
    var today = Tyear + "년 " + Tmonth+ "월 " + Tday + "일";


    /*오늘 날짜 가져오기*/
   /*    $("#datepicker").datepicker('setDate', new Date());*/
    document.getElementById("rankingDateToday").innerHTML =  today;


</script>



</head>
<body>

<div class="container">
<!-- <input type="text" id="datepicker" placeholder="날짜선택"> -->
<!-- <input type="text" id="datepicker" placeholder="날짜선택" readonly="readonly">


<h2 id="rankingDateToday"></h2> -->

<input type="hidden" id="datepicker" placeholder="날짜선택" readonly="readonly">

<!-- <a href="javascript:void(0);" id="prtDateTrigger"><h2 id="rankingDateToday"></h2></a> -->

<div id="prtDateTrigger"><h2 id="rankingDateToday"></h2></div>



</div>


</body>
</html>
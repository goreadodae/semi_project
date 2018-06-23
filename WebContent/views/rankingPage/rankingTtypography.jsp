<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
@import url(https://fonts.googleapis.com/css?family=Khula:700);
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
#testWrap {
	/* background-color: #F8FAFF; */
	/* border-radius: 25px; */
	height : 170px;
  width: 1120px;
 /* margin-left:14.2%;*/
/* 	width : 1110px; */
/*	border-top: 3px solid #F8FAFF; 
	border-bottom : 3px solid #F8FAFF;*/
/* 	margin-left:175px; */
border: 3px dashed #FFE400;
border-radius: 10px;

}
.hidden {
  opacity:0;
}
.console-container {
 padding-top:50px;
  font-family:hanna;
  font-size:2.3em;
  font-weight: 800;
  text-align:center;
  height:100px;
  width:900px;
  display:block;
  color:black;
  top:0;
  bottom:0;
  left:0;
  right:0;
  margin:auto;
}
.console-underscore {
  display:inline-block;
  position:relative;
  top:-0.14em;
  left:10px;
}
</style>
</head>
<body>
<div id="testWrap" class="container">
<div class='console-container'><span id='text'></span><div class='console-underscore' id='console'>_</div></div>
</div>

<script type="text/javascript">
// function([string1, string2],target id,[color1,color2])    
 consoleText(['오늘의 랭킹, 이달의 랭킹, 이달의 쉐프를 소개합니다!(짝짝)', '수상한 레시피의 랭킹에 도전하세요!', '상위 랭킹 레시피를 패키지 상품으로 만들어 드립니다 :D'], 'text',['rebeccapurple','rebeccapurple','#FFE400']);

function consoleText(words, id, colors) {
  if (colors === undefined) colors = ['#fff'];
  var visible = true;
  var con = document.getElementById('console');
  var letterCount = 1;
  var x = 1;
  var waiting = false;
  var target = document.getElementById(id)
  target.setAttribute('style', 'color:' + colors[0])
  window.setInterval(function() {

    if (letterCount === 0 && waiting === false) {
      waiting = true;
      target.innerHTML = words[0].substring(0, letterCount)
      window.setTimeout(function() {
        var usedColor = colors.shift();
        colors.push(usedColor);
        var usedWord = words.shift();
        words.push(usedWord);
        x = 1;
        target.setAttribute('style', 'color:' + colors[0])
        letterCount += x;
        waiting = false;
      }, 1000)
    } else if (letterCount === words[0].length + 1 && waiting === false) {
      waiting = true;
      window.setTimeout(function() {
        x = -1;
        letterCount += x;
        waiting = false;
      }, 1000)  //문장 체인지 속도
    } else if (waiting === false) {
      target.innerHTML = words[0].substring(0, letterCount)
      letterCount += x;
    }
  }, 120) //타이핑속도
  window.setInterval(function() {
    if (visible === true) {
      con.className = 'console-underscore hidden'
      visible = false;

    } else {
      con.className = 'console-underscore'

      visible = true;
    }
  }, 400)
}
</script>
</body>
</html>
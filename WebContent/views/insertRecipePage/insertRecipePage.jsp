<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertRecipePage</title>

<!--CSS-->
<link rel="stylesheet" href="/css/insertRecipe_css/semi_insertRecipeCss.css">


<!-- 모든 스타일 시트 적용 -->
<jsp:include page="/views/main/default_layout.jsp"></jsp:include>

<title>수상한 레시피</title>

<script>
	var stepFileNum =1;
	/* 해더 불러오는 제이쿼리 */
	$(document).ready(function() {
		$("#header").load("/views/header/main-Header.jsp");
		$("#footer").load("/views/footer/main-Footer.jsp");
	});
	
	
	/* 요리순서-추가기능 넣는 곳  */
	function materOrderPlus(plusNum){
		document.getElementById("materOrderPlus"+plusNum).style="display:inline";
		
	 }
	function toolPlus(plusNum){
		document.getElementById("toolPlus"+plusNum).style="display:inline";
	}
	function firePlus(plusNum){
		document.getElementById("firePlus"+plusNum).style="display:inline";
	}
	function tipPlus(plusNum){
		document.getElementById("tipPlus"+plusNum).style="display:inline";
	}
	function allPlus(plusNum){
		document.getElementById("materOrderPlus"+plusNum).style="display:inline";
		document.getElementById("toolPlus"+plusNum).style="display:inline";
		document.getElementById("firePlus"+plusNum).style="display:inline";
		document.getElementById("tipPlus"+plusNum).style="display:inline";
	} 
	
	/* 재료양념-전체 추가부분 */
	var materNum = 3; 
	var materAllDel =1;

	function materComPlus(){
		
		$('#materComPlus').append('<div id="materComPlusAllDel'+materAllDel+'"><div class="row">'+
				'<div class="col-md-4 id="materLeft">'+
				'<div class="row">'+
				'<div class="col-md-12">'+
				'<div class="row"><div class="col-md-12"><input type="text" class="form-control" placeholder="재료"></div></div>'+
				'</div></div>'+
				'<div class="row"><div class="col-md-12">　　</div></div>'+
				'<div class="row">'+
				'<div class="col-md-12"><button onclick="materAllDelBtn('+materAllDel+');">삭제</button></div></div>'+
				'<div class="row"><div class="col-md-12">　　</div></div></div>'+				
			'<div class="col-md-8 id="materRight" id="materPlus'+materNum+'">'+
			'<div id="materPlusRow'+materNum+'">'+
			'<div class="row">'+	
				'<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>'+
				'<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>'+
				'<div class="col-md-2"><button onclick="materDelete('+materNum+');">삭제</button></div></div>'+
			'<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 --></div>'+
			'<div id="materPlusRow'+materNum+'">'+
			'<div class="row">'+
				'<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>'+
				'<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>'+
				'<div class="col-md-2"><button onclick="materDelete('+materNum+');">삭제</button></div></div>'+
			'<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 --></div>'+
			'<div id="materPlusRow'+materNum+'">'+
			'<div class="row" id="materPlusRow2">'+
				'<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>'+
				'<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>'+
				'<div class="col-md-2"><button onclick="materDelete('+materNum+');">삭제</button></div></div>'+
			'<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 --></div></div></div>'+
			'<div class="row"><div class="col-md-12">　　</div></div>'+
					'<div class="row"><div class="col-md-8 mx-auto">'+
					'<div class="row"><div class="col-md-2 mx-auto"><button class="btn btn-default" onclick="materPlus('+materNum+');">추가</button></div></div></div></div>'+
				'<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 --></div>'); materNum++; materAllDel++;
				
	}
	
	/* 재료양념-전체 삭제부분  */
	
	function materAllDelBtn(materAllDel){
		
		$('#materComPlusAllDel'+materAllDel).remove();

	}
	
	
	/* 재료 추가 부분  */	
		 
	function materPlus(materNum){
		
		$('#materPlus'+materNum).append('<div id="materPlusRow'+materNum+'" style="resize: none;"><div class="row"><div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>'+
		'<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div><div class="col-md-2"><button onclick="materDelete('+materNum+');">삭제</button></div></div><div class="row"><div class="col-md-12">　　</div></div></div>');
		materNum++;
	}  
	
	
	function materDelete(materNum){
		
		$('#materPlusRow'+materNum).remove();

	}
	

	
	/* 요리순서-step 추가 넣는 곳  */
	 var count = 2;
	var plusNum =1;
	  function stepPlus(){
		  
		$('.test').append('<div class="row"><div class="col-md-2"><h3>Step'+count+'</h3></div>'+
				'<div class="col-md-7"><textarea class="form-control" rows="6" placeholder="예)소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="resize: none;"></textarea></div>'+
				'<div class="col-md-3"><div class="row"><div class="col-md-12" id="stepImg'+plusNum+'">'+
					'<input id="stepImgFile'+plusNum+'" multiple="multiple" type="file" style="display:none" class="stepImgClass"/>'+
					'<img src="/imgs/insertRecipe_img/pic_none2.jpg" width="150" height="150" id="imgFile_Step_'+plusNum+'" onclick="document.all.stepImgFile'+plusNum+'.click();"></div></div></div></div>'+
				'<div class="row"><div class="col-md-12">　　</div></div>'+
				'<div class="row">'+
				'<div class="col-md-6 mx-auto">'+
				'<div class="row">'+
				'<div class="col-md-12 mx-auto">'+
				'<div class="row">'+
				'<div class="col-md-1">　　</div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="materOrderPlus('+plusNum+');">재료</button></div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="toolPlus('+plusNum+');">도구</button></div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="firePlus('+plusNum+');">불</button></div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="tipPlus('+plusNum+');">팁</button></div>'+
				'<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="allPlus('+plusNum+');">전체</button></div>'+
				'<div class="col-md-1">　　</div></div></div></div></div></div>'+
				'<div class="row"><div class="col-md-12">　　</div></div>'+
					'<form class="mater" style="display:none;" id="materOrderPlus'+plusNum+'">'+
					'<div class="row">'+
					'<div class="col-md-6 mx-auto">'+
					'<div class="row"><div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_material.png"></div>'+
						'<div class="col-md-10"><input type="text" class="form-control" placeholder="밀가루 100g,소금 2큰술,물100g"></div></div></div></div></form>'+
					'<form class="mater" style="display:none;" id="toolPlus'+plusNum+'">'+
					'<div class="row"><div class="col-md-6 mx-auto"><div class="row">'+
						'<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_tool.png"></div>'+
						'<div class="col-md-10"><input type="text" class="form-control" placeholder="국자,볼"></div></div></div></div></form>'+
					'<form class="mater" style="display:none;" id="firePlus'+plusNum+'">'+
					'<div class="row"><div class="col-md-6 mx-auto"><div class="row">'+
						'<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_fire.png"></div>'+
						'<div class="col-md-10"><input type="text" class="form-control" placeholder="약불"></div></div></div></div></form>'+
					'<form class="mater" style="display:none;" id="tipPlus'+plusNum+'">'+
					'<div class="row"><div class="col-md-6 mx-auto"><div class="row">'+
						'<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_tip2.png"></div>'+
						'<div class="col-md-10"><textarea class="form-control" rows="2" style="resize: none;"></textarea></div></div></div></div></form>'+
					'<div class="row"><div class="col-md-12">　　</div></div>'); count++; plusNum++;
					
		} 
	
	/* 네비게이션부분  */
	
	 $(document).ready(function() {

			var jbOffset = $('#navClose').offset();

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
	

	
	/* 그림추가부분-메인  */
	
	
	$(document).ready(function() {
           $("#fileUpload").on('change', function() {
             //Get count of selected files
             var countFiles = $(this)[0].files.length;
             var imgPath = $(this)[0].value;
             var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
             var imgFile_Main = $('#imgFile_Main');
             var imgFile_Suc_One = $('#imgFile_Suc_One');
             imgFile_Main.empty();
             if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
               if (typeof(FileReader) != "undefined") {
                 //loop for each file selected for uploaded.
                 for (var i = 0; i < countFiles; i++) 
                 {
                   var reader = new FileReader();
                   reader.onload = function(e) {

                      imgFile_Main.attr('src',e.target.result);
                      imgFile_Suc_One.attr('src',e.target.result);
                      
                   }

                   reader.readAsDataURL($(this)[0].files[i]);
                 }
               } else {
                 alert("This browser does not support FileReader.");
               }
             } else {
               alert("Pls select only images");
             }
           });
         });
	
		/* 그림추가부분-요리완성1  */
	 $(document).ready(function() {
	        $("#fileSucOne").on('change', function() {
	          //Get count of selected files
	          var countFiles = $(this)[0].files.length;
	          var imgPath = $(this)[0].value;
	          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
	          var imgFile_Suc_One = $('#imgFile_Suc_One');
	          imgFile_Suc_One.empty();
	          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
	            if (typeof(FileReader) != "undefined") {
	              //loop for each file selected for uploaded.
	              for (var i = 0; i < countFiles; i++) 
	              {
	                var reader = new FileReader();
	                reader.onload = function(e) {
	                	imgFile_Suc_One.attr('src',e.target.result);
	                }
	                imgFile_Suc_One.show();
	                reader.readAsDataURL($(this)[0].files[i]);
	              }
	            } else {
	              alert("This browser does not support FileReader.");
	            }
	          } else {
	            alert("Pls select only images");
	          }
	        });
	      });
		
		/* 그림추가부분-요리완성2  */
	 $(document).ready(function() {
	        $("#fileSucTwo").on('change', function() {
	          //Get count of selected files
	          var countFiles = $(this)[0].files.length;
	          var imgPath = $(this)[0].value;
	          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
	          var imgFile_Suc_Two = $('#imgFile_Suc_Two');
	          imgFile_Suc_Two.empty();
	          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
	            if (typeof(FileReader) != "undefined") {
	              //loop for each file selected for uploaded.
	              for (var i = 0; i < countFiles; i++) 
	              {
	                var reader = new FileReader();
	                reader.onload = function(e) {
	                	imgFile_Suc_Two.attr('src',e.target.result);
	                }
	                imgFile_Suc_Two.show();
	                reader.readAsDataURL($(this)[0].files[i]);
	              }
	            } else {
	              alert("This browser does not support FileReader.");
	            }
	          } else {
	            alert("Pls select only images");
	          }
	        });
	      });
		
	 /* 그림추가부분-요리완성3  */
	 $(document).ready(function() {
	        $("#fileSucThrid").on('change', function() {
	          //Get count of selected files
	          var countFiles = $(this)[0].files.length;
	          var imgPath = $(this)[0].value;
	          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
	          var imgFile_Suc_Thrid = $('#imgFile_Suc_Thrid');
	          imgFile_Suc_Thrid.empty();
	          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
	            if (typeof(FileReader) != "undefined") {
	              //loop for each file selected for uploaded.
	              for (var i = 0; i < countFiles; i++) 
	              {
	                var reader = new FileReader();
	                reader.onload = function(e) {
	                	imgFile_Suc_Thrid.attr('src',e.target.result);
	                }
	                imgFile_Suc_Thrid.show();
	                reader.readAsDataURL($(this)[0].files[i]);
	              }
	            } else {
	              alert("This browser does not support FileReader.");
	            }
	          } else {
	            alert("Pls select only images");
	          }
	        });
	      });
	 
	 /* 그림추가부분-요리완성4  */
	 $(document).ready(function() {
	        $("#fileSucFour").on('change', function() {
	          //Get count of selected files
	          var countFiles = $(this)[0].files.length;
	          var imgPath = $(this)[0].value;
	          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
	          var imgFile_Suc_Four = $('#imgFile_Suc_Four');
	          imgFile_Suc_Four.empty();
	          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
	            if (typeof(FileReader) != "undefined") {
	              //loop for each file selected for uploaded.
	              for (var i = 0; i < countFiles; i++) 
	              {
	                var reader = new FileReader();
	                reader.onload = function(e) {
	                	imgFile_Suc_Four.attr('src',e.target.result);
	                }
	                imgFile_Suc_Four.show();
	                reader.readAsDataURL($(this)[0].files[i]);
	              }
	            } else {
	              alert("This browser does not support FileReader.");
	            }
	          } else {
	            alert("Pls select only images");
	          }
	        });
	      });
	 
	 /* 그림추가부분-요리완성5  */
	 $(document).ready(function() {
	        $("#fileSucFive").on('change', function() {
	          //Get count of selected files
	          var countFiles = $(this)[0].files.length;
	          var imgPath = $(this)[0].value;
	          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
	          var imgFile_Suc_Five = $('#imgFile_Suc_Five');
	          imgFile_Suc_Five.empty();
	          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
	            if (typeof(FileReader) != "undefined") {
	              //loop for each file selected for uploaded.
	              for (var i = 0; i < countFiles; i++) 
	              {
	                var reader = new FileReader();
	                reader.onload = function(e) {
	                	imgFile_Suc_Five.attr('src',e.target.result);
	                }
	                imgFile_Suc_Five.show();
	                reader.readAsDataURL($(this)[0].files[i]);
	              }
	            } else {
	              alert("This browser does not support FileReader.");
	            }
	          } else {
	            alert("Pls select only images");
	          }
	        });
	      });
	 
	 
	 /* 그림추가부분-요리완성-전체  */
	 $(document).ready(function() {
	        $("#fileSucAll").on('change', function () {
	          //Get count of selected files
	          var countFiles = $(this)[0].files.length;/* 파일의 개수  */
	          var imgPath = $(this)[0].value;/* 값? 선택된 파일의 값? */
	          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
	          var imgFile_Suc_One = $('#imgFile_Suc_One'); var imgFile_Suc_Two = $('#imgFile_Suc_Two'); 
	          var imgFile_Suc_Thrid = $('#imgFile_Suc_Thrid');  var imgFile_Suc_Four = $('#imgFile_Suc_Four'); var imgFile_Suc_Five = $('#imgFile_Suc_Five');
	          /* imgFile_Suc_One.empty(); */
	          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
	            if (typeof(FileReader) != "undefined") {
	              //loop for each file selected for uploaded.
	              for (var i = 0; i < countFiles; i++) 
	              {
	            	  var reader = new FileReader();
	            	  if(i==0){
	                reader.onload = function(e) {
	                	imgFile_Suc_One.attr('src',e.target.result);}
	                }else if(i==1){
	                	reader.onload = function(e) {
	                		imgFile_Suc_Two.attr('src',e.target.result);
		                }
	                }else if(i==2){
	                	reader.onload = function(e) {
	                		imgFile_Suc_Thrid.attr('src',e.target.result);
		                }
	                }else if(i==3){
	                	reader.onload = function(e) {
	                		imgFile_Suc_Four.attr('src',e.target.result);
		                }
	                }else if(i==4){
	                	reader.onload = function(e) {
	                		imgFile_Suc_Five.attr('src',e.target.result);
		                }
	                }
	                reader.readAsDataURL($(this)[0].files[i]);
	              }
	            } else {
	              alert("This browser does not support FileReader.");
	            }
	          } else {
	            alert("Pls select only images");
	          }	          
	        });
	      });
	 
	 /* 그림추가부분-step  */
	 
	 /* function updateImg(inputTag,imgBox)
	 {
		 var inputs = document.getElementsByClassName("stepImgClass");
         
         for (var i =0; i<inputs.length ; i++){
       	  console.log("인풋 태그" + inputs[i].id);
         }
         var countFiles = inputTag.files.length;
         var imgPath = inputTag.value;
         console.log(inputTag);
         var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
         console.log(extn);
         console.log(plusNum);
         var imgFile_Step = $('#'+imgBox.id);
        /*  imgFile_Step.empty(); */
         /* if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
           if (typeof(FileReader) != "undefined") {
             //loop for each file selected for uploaded.
             for (var i = 0; i < countFiles; i++) 
             {
               var reader = new FileReader();
               reader.onload = function(e) {
              	/*  imgFile_Step.attr('src',e.target.result);*/
               	/* console.log(e.target.result);
               	imgBox.src = e.target.result;
               }
               reader.readAsDataURL(inputTag.files[i]);
             }
           } else {
             alert("This browser does not support FileReader.");
           }
         } else {
           alert("Pls select only images");
         }
	 } */ 
	 
	/* $(document).ready(function() { */
		
	        /* $('.stepImgClass').on('change', function () {
	          //Get count of selected files
	          
	          var inputs = document.getElementsByClassName("stepImgClass");
	          
	          for (var i =0; i<inputs.length ; i++){
	        	  console.log("인풋 태그" + inputs[i].id);
	          }
	      
	          console.log($(this).siblings('img').attr('id'));
	          
	          var countFiles = $(this)[0].files.length;
	          var imgPath = $(this)[0].value;
	          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
	          console.log(plusNum);
	          var imgFile_Step = $('#'+$(this).siblings('img').attr('id'));
	         /*  imgFile_Step.empty(); */
	          /* if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
	            if (typeof(FileReader) != "undefined") {
	              //loop for each file selected for uploaded.
	              for (var i = 0; i < countFiles; i++) 
	              {
	                var reader = new FileReader();
	                reader.onload = function(e) {
	                	imgFile_Step.attr('src',e.target.result);
	                }
	                reader.readAsDataURL($(this)[0].files[i]);
	              }
	            } else {
	              alert("This browser does not support FileReader.");
	            }
	          } else {
	            alert("Pls select only images");
	          }
	        }); */
	      /* }); */
	 
	/* function testFileALL(num) {
		 var countFiles = $(this)[0].files.length;
         var imgPath = $(this)[0].value;
         var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
         var imgFile_Step = $('#imgFile_Step_0');  alert(num);
         imgFile_Step.empty();
         if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
           if (typeof(FileReader) != "undefined") {
             //loop for each file selected for uploaded.
             for (var i = 0; i < countFiles; i++) 
             {
               var reader = new FileReader();
               reader.onload = function(e) {
               	imgFile_Step.attr('src',e.target.result);
               }
               reader.readAsDataURL($(this)[0].files[i]);
             }
           } else {
             alert("This browser does not support FileReader.");
           }
         } else {
           alert("Pls select only images");
         }
		
	}; */
	 
	/* 그림추가부분-step 쉽게변경  */
	
	function uploadStepFile(){
		

		var imgFile_Step_0 = document.getElementById("imgFile_Step_0");

		
		 var filePath=$('.stepImgClass').val();
		 
	
		 
		 $('#imgFile_Step_0').attr('src',filePath);
		
	};
	
	 /* 동영상-썸네일  */
	
	   function changeVideo(){
		 
		 var videoAddr = document.getElementById("recipeVideoTa").value; 
		 
		 var result  = videoAddr.substr(-11, 11);
		 
		var videoAddr = "http://img.youtube.com/vi/"+result+"/0.jpg";
		 
		$('#videoImg').attr('src',videoAddr);
		 
	 };
	 
</script>


</head>
<body>


	<div class="container-fluid" id="maindiv"> 
		<!--헤더예용! -->
		<div id="header"></div>
		<br><br>
		<!-- 컨테츠예용! -->
		<div class="row" id="inRecipe">
		
			<div class="col-md-8 mx-auto" id="inRecipeTitle">
			
			<div class="row" id="inRecipeTitle">
				<div class="col-md-12" id="inRecipeTitleAll">
				<div class="row" id="mainTitle"><div class="col-md-12"><h1>레시피 등록</h1></div></div>
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<div class="row" id="inRecipeOne"> 
					<div class="col-md-9" id="inRecipeTitleLeft">
					<div class="row">					
					<div class="col-md-3"><label for="recipeTitle"><h4>레시피 제목</h4></label></div>
					<div class="col-md-9"><input type="text" class="form-control" placeholder="예) 소고기 미역국 끓이기"></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<div class="col-md-3"><label for="recipeIntro"><h4>요리소개</h4></label></div>
					<div class="col-md-9"><textarea class="form-control" rows="5" id="exampleInputEmail2" placeholder="이 레시피의 탄생배경을 적어주세요" style="resize: none;"></textarea></div>
					</div>
					<div class="row" id="navClose"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<div class="col-md-3"><label for="recipeVideo"><h4>동영상</h4></label></div>
					<div class="col-md-6"><textarea class="form-control" rows="5" id="recipeVideoTa" placeholder="예)동영상이 있으면 주소를 입력하세요.(Youtube만 가능)예)http://youtu.be/l=|AOBxo3IZmM" style="resize: none;" onchange="changeVideo();"></textarea></div>
					<div class="col-md-3"><img src="/imgs/insertRecipe_img/pic_none5.jpg" width="170" height="125" id="videoImg"></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<div class="col-md-3"><label for="recipeCategory"><h4>카테고리</h4></label></div>
					<div class="col-md-2">
					<select  class="form-control">
									<option selected>종류별</option>
									<option>밑반찬</option>
									<option>메인반찬</option>
									<option>국/탕</option>
									<option>찌개</option>
									<option>디저트</option>
									<option>면/만두</option>
									<option>밥/죽/떡</option>
									<option>퓨전</option>
									<option>김치/젓갈/장류</option>
									<option>양념/소스/잼</option>
									<option>양식</option>
									<option>샐러드</option>
									<option>스프</option>
									<option>빵</option>
									<option>과자</option>
									<option>차/음료/술</option>
									<option>기타</option>
								</select>
					</div>
					<div class="col-md-3">
					<select class="form-control">
									<option selected>상황별</option>
									<option>일상</option>
									<option>초스피드</option>
									<option>손님접대</option>
									<option>술안주</option>
									<option>다이어트</option>
									<option>도시락</option>
									<option>영양식</option>
									<option>간식</option>
									<option>야식</option>
									<option>푸드스타일링</option>
									<option>해장</option>
									<option>명절</option>
									<option>이유식</option>
									<option>기타</option>
								</select>
					</div>
					<div class="col-md-2">
					<select class="form-control">
									<option selected>방법별</option>
									<option>볶음</option>
									<option>끓이기</option>
									<option>부침</option>
									<option>조림</option>
									<option>무침</option>
									<option>비빔</option>
									<option>찜</option>
									<option>절임</option>
									<option>튀김</option>
									<option>삶기</option>
									<option>굽기</option>
									<option>데치기</option>
									<option>회</option>
									<option>기타</option>
								</select>
					</div>
					<div class="col-md-2">
					<select class="form-control">
									<option selected>재료별</option>
									<option>소고기</option>
									<option>돼지고기</option>
									<option>닭고기</option>
									<option>육류</option>
									<option>채소류</option>
									<option>해물류</option>
									<option>달걀/유제품</option>
									<option>가공식품류</option>
									<option>쌀</option>
									<option>밀가루</option>
									<option>건어물류</option>
									<option>버섯류</option>
									<option>과일류</option>
									<option>콩/견과류</option>
									<option>곡류</option>
									<option>기타</option>
								</select>
					</div>
					</div><!-- 카테고리닫기 -->
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<!-- <div class="col-md-2"></div> -->
					<div class="col-md-12">
					<h6>분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.<br> 분류를 하셔야만 넘어 갈 수 있어요!</h6></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">					
					<div class="col-md-3"><label for="recipeInfor"><h4>요리정보</h4></label></div>
					<div class="col-md-1">인원</div>
					<div class="col-md-2">
					 <select class="form-control">
										<option selected>인원</option>
										<option>1인분</option>
										<option>2인분</option>
										<option>3인분</option>
										<option>4인분</option>
										<option>5인분</option>
										<option>6인분 이상</option>
									</select>
					</div>
					<div class="col-md-1">시간</div>
					<div class="col-md-2">
					<select class="form-control">
										<option selected>시간</option>
										<option>5분이내</option>
										<option>10분이내</option>
										<option>15분이내</option>
										<option>30분이내</option>
										<option>60분이내</option>
										<option>90분이내</option>
										<option>2시간이내</option>
										<option>2시간이상</option>
									</select>
					</div>
					<div class="col-md-1">난이도</div>
					<div class="col-md-2">
					<select class="form-control">
										<option selected>난이도</option>
										<option>아무나</option>
										<option>초급</option>
										<option>중급</option>
										<option>고급</option>
										<option>신의경지</option>
									</select>
					</div>
					</div><!-- 요리정보 닫기 -->
				</div>
				<div class="col-md-3"> <!-- 메인 사진 넣는 곳  -->
					<div class="row">
					<div class="col-md-12" id="wrapper">
					<input id="fileUpload" multiple="multiple" type="file" style="display:none"/>
					<img src="/imgs/insertRecipe_img/pic_none4.jpg" width="230" height="230" id="imgFile_Main" onclick="document.all.fileUpload.click();"> 
					</div></div>
					</div>			
			</div>
			</div><!-- 레시피 기본정보 col값 줌 -->
			</div><!-- 레시피 기본 정보 넣는곳 -->
			 
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			


			<div class="row" id="inRecipeMater">
				<div class="col-md-12">
				
				<div class="row"><div class="col-md-12" id="materComent"><h6>재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</h6></div></div>
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<div id="materComPlus">
				<div id="materComPlusAllDel0">
				<div class="row">
					<div class="col-md-4 id="materLeft">
						<div class="row"> 
						<div class="col-md-12">
						<div class="row"><div class="col-md-12"><input type="text" class="form-control" placeholder="재료"></div></div>
						</div></div>
						<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
						<div class="row">
						<div class="col-md-12"><button onclick="materAllDelBtn(0);">삭제</button></div>
						</div>
						<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					</div>					
					<div class="col-md-8 id="materRight" id="materPlus0">
					<div id="materPlusRow0">
					<div class="row">				
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>
						<div class="col-md-2"><button onclick="materDelete(0);">삭제</button></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 --></div>
					<div id="materPlusRow1">
					<div class="row">
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>
						<div class="col-md-2"><button onclick="materDelete(1);">삭제</button></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 --></div>
					<div id="materPlusRow2">
					<div class="row" id="materPlusRow2">
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)돼지고기"></div>
						<div class="col-md-5"><input type="text" class="form-control" placeholder="예)300g"></div>
						<div class="col-md-2"><button onclick="materDelete(2);">삭제</button></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 --></div>
					</div>					
				</div>
				
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-8 mx-auto">
					<div class="row"><div class="col-md-2 mx-auto"><button class="btn btn-default" onclick="materPlus(0);">추가</button></div></div></div></div>
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 --></div><!-- 재료양념전체삭제부분닫음 --></div><!-- 재료양념전체추가부분닫음 -->
				
				
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<hr>
				<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
				<div class="row" >
					<div class="col-md-12">
					<div class="row"><div class="col-md-8 mx-auto"><h6>※ 양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요.</h6></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->				
					<div class="row"><div class="col-md-2 mx-auto"><button onclick="materComPlus();">+재료/양념 묶음 추가</button></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->	
					</div>
				</div>
				
				</div> <!--재료정보 전체 틀 잡음  -->
				</div> <!--재료정보 넣는 곳  -->
				
				
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			<div class="row" id="inRecipeOrder">
				<div class="col-md-12">
					<div class="row"><div class="col-md-12"><h4>요리순서</h4></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-12">
					요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.<br>
					　예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.<br>
      				　마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다.<br>
     				 　꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.</div></div>
     				 <div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
     				 
     				<div class="test">
					<div class="row"><div class="col-md-2"><h3>Step1</h3></div>
					<div class="col-md-7"><textarea class="form-control" rows="6" placeholder="예)소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="resize: none;"></textarea></div>
					<div class="col-md-3">
					<div class="row"><div class="col-md-12" id="stepImg0"> <!--onchange="testFileALL(0)"  -->
					<input id="stepImgFile0" multiple="multiple" type="file" style="display:none" class="stepImgClass" onchange="uploadStepFile();" />
					<!-- <img src="/imgs/insertRecipe_img/pic_none2.jpg" width="150" height="150" id="imgFile_Step_0" onclick="document.all.stepImgFile0.click();"> -->
					<img src="/imgs/insertRecipe_img/pic_none2.jpg" width="150" height="150" id="imgFile_Step_0" onclick="document.all.stepImgFile0.click();"></div></div></div>
					</div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
					<div class="col-md-12 mx-auto">
					<div class="row">
					<div class="col-md-1">　　</div><!-- 빈 공란 -->
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="materOrderPlus(0);">재료</button></div>
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="toolPlus(0);">도구</button></div>
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="firePlus(0);">불</button></div>
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="tipPlus(0);">팁</button></div>
					<div class="col-md-2"><button type="button" class="btn btn-outline-dark" onclick="allPlus(0);">전체</button></div>
					<div class="col-md-1">　　</div><!-- 빈 공란 -->
					</div>
					</div>
					</div>
					</div></div>
									
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<form class="mater" style="display:none;" id="materOrderPlus0">
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
						<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_material.png"></div>
						<div class="col-md-10"><input type="text" class="form-control" placeholder="밀가루 100g,소금 2큰술,물100g"></div></div></div></div></form>
						
					<form class="mater" style="display:none;" id="toolPlus0">
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
						<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_tool.png"></div>
						<div class="col-md-10"><input type="text" class="form-control" placeholder="국자,볼"></div></div></div></div></form>
						
					<form class="mater" style="display:none;" id="firePlus0">
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
						<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_fire.png"></div>
						<div class="col-md-10"><input type="text" class="form-control" placeholder="약불"></div></div></div></div></form>
						
					<form class="mater" style="display:none;" id="tipPlus0">
					<div class="row">
					<div class="col-md-6 mx-auto">
					<div class="row">
						<div class="col-md-2"><img src="/imgs/insertRecipe_img/icon_tip2.png"></div>
						<div class="col-md-10"><textarea class="form-control" rows="2" style="resize: none;"></textarea></div></div></div></div></form>
						
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->	
					</div><!-- jquery 사용할 div -->
											
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-12"><button onclick="stepPlus();">+순서추가</button></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					
					<div class="row"><div class="col-md-2"><div class="row"><div class="col-md-12"><h6>요리완성사진</h6></div></div>
					<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
					<div class="row"><div class="col-md-12" id="successImgAll"><input id="fileSucAll" multiple="multiple" type="file" file_gubun="work" style="display:none"/>
					<button type="button" onclick="document.all.fileSucAll.click();">+사진 한번에 넣기</button></div></div></div>
					<div class="col-md-2"><div class="row"><div class="col-md-12" id="successImgOne">
					<input id="fileSucOne" multiple="multiple" type="file" style="display:none"/>
					<img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130" id="imgFile_Suc_One" onclick="document.all.fileSucOne.click();"></div></div></div>
					<div class="col-md-2"><div class="row"><div class="col-md-12" id="successImgTwo">
					<input id="fileSucTwo" multiple="multiple" type="file" style="display:none"/>
					<img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130" id="imgFile_Suc_Two" onclick="document.all.fileSucTwo.click();"></div></div></div>
					<div class="col-md-2"><div class="row"><div class="col-md-12" id="successImgThrid">
					<input id="fileSucThrid" multiple="multiple" type="file" style="display:none"/>
					<img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130" id="imgFile_Suc_Thrid" onclick="document.all.fileSucThrid.click();"></div></div></div>
					<div class="col-md-2"><div class="row"><div class="col-md-12" id="successImgFour">
					<input id="fileSucFour" multiple="multiple" type="file" style="display:none"/>
					<img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130" id="imgFile_Suc_Four" onclick="document.all.fileSucFour.click();"></div></div></div>
					<div class="col-md-2"><div class="row"><div class="col-md-12" id="successImgFive">
					<input id="fileSucFive" multiple="multiple" type="file" style="display:none"/>
					<img src="/imgs/insertRecipe_img/pic_none2.jpg" width="130" height="130" id="imgFile_Suc_Five" onclick="document.all.fileSucFive.click();"></div></div></div>
					</div>
				</div><!--요리순서 전체 틀 잡음  -->
			</div> <!--요리순서 넣는곳-->
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			<div class="row" id="inRecipeTip">
				<div class="col-md-12">
				<div class="row">
				<div class="col-md-3"><h4>요리팁</h4></div>
				<div class="col-md-9">
				<textarea class="form-control" rows="5" placeholder="예)고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요." style="resize: none;"></textarea>
				</div>	
				</div>
				</div><!--요리팁 전체 틀 잡음  -->
			</div> <!--요리팁 넣는 곳  -->
			
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			
			<div class="row" id="inRecipeTag">
				<div class="col-md-12">
				<div class="row">
				<div class="col-md-3"><h4>태그</h4></div>
				<div class="col-md-9">
				<input type="text" class="form-control">
				</div>	
				</div>
			</div> <!--태그 전체 틀 잡음  -->
			</div> <!--태그 넣는 곳  -->
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			<div class="row" id="inRecipeBtn">
				<div class="col-md-12">
				<div class="row">
				<div class="col-md-2">ㅎㅎ</div>
				<div class="col-md-2"><button>저장</button></div>
				<div class="col-md-4"><button>저장 후 공개하기</button></div>
				<div class="col-md-2"><button>취소</button></div>
				<div class="col-md-2">ㅎㅎ</div>
				</div>
				</div>
			</div>
			
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			<div class="row"><div class="col-md-12">　　</div></div><!-- 빈 공란 -->
			
			</div> <!-- 가운데정렬할것 -->
		</div> <!--컨텐츠전체--> 
		
		
		<!--푸터예용! -->
		<div id="footer"
			class="col-md-8 col-sm-12  mx-auto border-left-0 border-right-0"
			style="border: 1px solid black; padding: 10px;">
			<!-- footer -->
		</div>
		
	</div><!--전체  -->



</body>
</html>

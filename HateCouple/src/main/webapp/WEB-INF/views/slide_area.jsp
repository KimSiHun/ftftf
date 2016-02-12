<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- link to css -->
<link rel="stylesheet" href="resources/stylesheets/slide_bar.css" type="text/css">

<!-- 1. Link to jQuery (1.8 or later), -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> <!-- 33 KB -->




<script type="text/javascript">


$(document).ready(function(){
	
	  var eleWidth = $(".vis_frame ul li").innerWidth();
      var state = false;
      var playOn = false;
      var direction = "left";
      var time = 2000;
      var bannerAuto;
      function play() {
         if (!playOn) {
            playOn = true;
            bannerAuto = setInterval(function() {
               if (direction == "left") {
                  $(".left").click();
               } else {
                  $(".right").click();
               }
            }, time);
         }
      }
      function stop() {
         if (playOn) {
            playOn = false;
            clearInterval(bannerAuto);
         }
      }
      function left() {
         stop();
         direction = "left";
         $(".vis_frame > ul").animate(
               {
                  left : eleWidth * -1
               },
               300,
               "swing",
               function() {
                  $(this).children("li:first").insertAfter(
                        $(this).children("li:last"));
                  $(this).css({
                     left : 0
                  });
                  state = false;
                  play();
               });
      }
      function right() {
         stop();
         direction = "right";
         $(".vis_frame > ul > li:last").insertBefore(
               $(".vis_frame > ul > li:first"));
         $(".vis_frame > ul").css({
            left : eleWidth * -1
         });
         $(".vis_frame > ul").animate({
            left : 0
         }, 300, "swing", function() {
            state = false;
            play();
         });
      }
      $(".left").click(function() {
         if (!state) {
            state = true;
            left();
         }
      });
      $(".right").click(function() {
         if (!state) {
            state = true;
            right();
         }
      });
      $(".stop").click(function() {
         stop();
      });
      $(".play").click(function() {
         play();
      });
      $(".play").click();
	
	
	
	

	
	
	//$.getJSON("getMV", function(json){
		// json객체 -> String
		
		//alert( JSON.stringify(json)  );
			
		//	 $('#get').click(function(){	 
				 
				 
	//	$.each(json.movies, function(i, mv){
			
			
			
		//	var img = $('<img/>').attr('src', mv.c_poster_img).css({'width' : '10%' , 'height' : '10%'});
		//	var li = $('<li></li>').append(img);
		//	var div = $('<div></div>').append(li);
		//	
		//	$('ul').append(div);
			
			
			
			//var msgTd = $("<td></td>").text(m.c_poster_img);
			//var uTd = $("<td></td>").text(m.c_movie_title);
			
			//var dataTr = $("<tr></tr>").prepend(msgTd, uTd);
			//$("table").prepend(dataTr);
	
		//});
		
	// });
		
	//});	
});


</script>

<title>Insert title here</title>

</head>
<body>
<button id="get">get MV_Poster</button> 
    <div id="wrap">
      <h1>영화 이미지 슬라이드</h1>
      <div id="banner">
         <div class="vis_frame">
            <ul>
               <li><a href="#"><img src="resources\images\revenant.gif"
                     alt="레버넌트" /></a></li>
               <li><a href="#"><img src="resources\images\panda3.jpg"
                     alt="쿵푸판다" /></a></li>
               <li><a href="#"><img src="resources\images\carol.jpg"
                     alt="캐롤" /></a></li>
               <li><a href="#"><img src="resources\images\maker.jpg"
                     alt="드레스메이커" /></a></li>
            </ul>
         </div>
      </div>
      <div id="b_control">
         <a href="#play" class="play"><img src="resources\images\play.gif"
            width="11" height="11" alt="재생" /></a> <a href="#stop" class="stop"><img
            src="resources\images\stop.gif" width="11" height="11" alt="멈춤" /></a>
      </div>
      <div id="b_bt">
         <a href="#left" class="left"><img src="resources\images\left.gif"
            alt="이전 배너이미지" /></a> <a href="#right" class="right"><img
            src="resources\images\right.gif" alt="다음 배너이미지" /></a>
      </div>
      <div id="pos"></div>
   </div>
 
 
 

</body>
</html>


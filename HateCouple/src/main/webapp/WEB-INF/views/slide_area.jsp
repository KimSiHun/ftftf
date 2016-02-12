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
<script type="text/javascript" src="resources/js/slide_bar.js" ></script>

<title>Insert title here</title>

</head>
<body>
<button id="get">get MV_Poster</button> 
    <div id="wrap">
      <h1>영화 이미지 슬라이드</h1>
      <div id="banner">
         <div class="vis_frame">
           <!-- 여기에 <ul><li></li></ul> 형태로 포스터이미지 출력되는 div-->       
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


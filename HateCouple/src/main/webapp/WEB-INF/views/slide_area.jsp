<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 1. Link to jQuery (1.8 or later), -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> <!-- 33 KB -->

<!-- fotorama.css & fotorama.js. -->
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->

<style type="text/css">

<!-- 이미지 클릭 시 링크가 가능하게 해주는 css 입니다. -->
.fotorama__html div,
.fotorama__html a {
  display: block;
  height: 100%;
  /* Transparent links are not clickable in IE,
     but non-existent background fixes this.
    (Put an empty 1×1 image here to avoid
     errors in console.) */
  background: url(_.gif);
}


</style>

<title>Insert title here</title>

</head>
<body>

<!-- 2. fotorama 슬라이드 이미지 div영역입니다. 아직 샘플 -->
<div class="fotorama"
 	data-width="500"  
 	data-height="300" 
 	data-nav="thumbs"
 	data-autoplay ="ture"
 	data-loop="true"
 	data-keyboard="true"
 	>
 	
 	<div data-img="http://movie.phinf.naver.net/20151229_126/14513737252567fehq_JPEG/movie_image.jpg"><a href="http://google.com/"></a></div>
	<div data-img="http://movie.phinf.naver.net/20160121_2/14533409853749GqxA_JPEG/movie_image.jpg"><a href="http://google.com/"></a></div>
 
</div>

</body>
</html>
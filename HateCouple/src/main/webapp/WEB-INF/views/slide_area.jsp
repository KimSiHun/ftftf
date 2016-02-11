<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">



</style>

<!-- 1. Link to jQuery (1.8 or later), -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> <!-- 33 KB -->




<script type="text/javascript">
// "getMV"로 영화정보를 json형태로 가져오는 기능

$(document).ready(function(){	

	
	
	$.getJSON("getMV", function(json){
		// json객체 -> String
		
		//alert( JSON.stringify(json)  );
			
			 $('#get').click(function(){
		$.each(json.movies, function(i, mv){
			
			
			
			var img = $('<img/>').attr('src', mv.c_poster_img).css({'width' : '10%' , 'height' : '10%'});
			var li = $('<li></li>').append(img);
			var div = $('<div></div>').append(li);
			
			$('ul').append(div);
			
			
			
			//var msgTd = $("<td></td>").text(m.c_poster_img);
			//var uTd = $("<td></td>").text(m.c_movie_title);
			
			//var dataTr = $("<tr></tr>").prepend(msgTd, uTd);
			//$("table").prepend(dataTr);
	
		});
		
	  });
		
	});	
});


</script>

<title>Insert title here</title>

</head>
<body>
<button id="get">get MV_Poster</button>

  <ul>
  <div><li><img src =""></li></div>
  
  </ul> 
 
 
 

</body>
</html>


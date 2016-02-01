<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script> 
$(document).on("mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll", function(e) {
    e.preventDefault();
    return;
});
$(document).on("keydown.disableScroll", function(e) {
    var eventKeyArray = [32, 33, 34, 35, 36, 37, 38, 39, 40];
    for (var i = 0; i < eventKeyArray.length; i++) {
        if (e.keyCode === eventKeyArray [i]) {
            e.preventDefault();
            return;
        }
    }
});
$(document).ready(function(){
    $("#go").click(function(){
        $("#fst").slideUp("slow");
    });
    $("#back").click(function(){
        $("#fst").slideDown("slow");
    });
});
</script>
<style> 

#fst {
	width:100%;
    height: 930px;
    margin: 5px 0px 15px 0px;
    text-align: center;
    color: #000000;
    background-color: #ffffff;
    border: solid 2px #c3c3c3;
}

#snd_bar {
    width:100%;
    height: 50px;
	margin: 0px 0px 0px 0px;
    text-align: center;
    background-color: #000000;
    color: #ffffff;
    border-bottom: solid 2px #c3c3c3;
}

#snd_content {
    width:100%;
    height: 930px;
    margin: 10px 0px 15px 0	px;
    text-align: center;
    background-color: #ffffff;
    border: solid 2px #c3c3c3;
}

#bar_location {
    height: 40px;
	margin-top:  auto;
	margin-bottom: auto;
	margin-left: 10px;
    text-align: center;
    background-color: #000000;
    color: #ffffff;
    float: left;
}

#bar_weather {
    height: 40px;
	margin-right: 10px;
    text-align: center;
    background-color: #000000;
    color: #ffffff;
    float: right;
}

#logo {
    height: 100px;
    width: 300px;
    margin : auto;
    color: #ffffff;
    text-align: center;
    background-color: #000000;
    border: solid 2px #c3c3c3;
}
</style>
</head>
<body style="overflow:hidden;">
 
<div id="fst"><div id="logo"><h1>로고</h1><div>
<input id="search_addr"><button id="go">검색</button></div></div>
</div>

<div id="snd_content">
<div id="snd_bar">
	<div id="bar_location"><h3>경기도 수원시 장안구<button id="back">지역 재설정</button></h3></div>
	<div id="bar_weather"><h3>2016년 2월 1일 09:07 -7 미세먼지 농도 옅음</h3> </div>
</div>
<h1>내용</h1>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script> 
$(document).ready(function(){
	//정보표시창(두번째)로 이동
    $("#go").click(function(){   	
    	$("#go").ready(function(){
        	$("#fst").slideUp("slow");
    	});
    });
	// 주소 재설정 창으로 이동
    $("#back").click(function(){
        $("#fst").slideDown("slow");
    });
});
//마우스 스크롤 금지
$(document).on("mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll", function(e) {
    e.preventDefault();
    return;
});
//키보드로 이동 금지
$(document).on("keydown.disableScroll", function(e) {
    var eventKeyArray = [32, 33, 34, 35, 36, 37, 38, 39, 40];
    for (var i = 0; i < eventKeyArray.length; i++) {
        if (e.keyCode === eventKeyArray [i]) {
            e.preventDefault();
            return;
        }
    }
});
function realtimeClock() {
	  document.rtcForm.rtcInput.value = getTimeStamp();
	  setTimeout("realtimeClock()", 1000);
	}

	function getTimeStamp() { // 24시간제
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
	}

	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}


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

#logo {
    height: 100px;
    width: 300px;
    margin : auto;
    color: #ffffff;
    text-align: center;
    background-color: #000000;
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


#snd_content {
    height: 930px;
    width:100%;
    text-align: center;
    background-color: #ffffff;
    border: solid 2px #c3c3c3;
}

#left_content {
    height: 865px;
    width: 40%;
    color: #000000;
    text-align: center;
    background-color: #ffffff;
    border: solid 2px #c3c3c3;
    float: left;
}
#right_content {
    height: 865px;
    width: 59%;	
    color: #000000;
    text-align: center;
    background-color: #ffffff;
    border: solid 2px #c3c3c3;
    float: right;
}
</style>
</head>
<body style="overflow:hidden;" onload="realtimeClock()">
 
<div id="fst"><div id="logo"><h1>로고</h1></div>
<div>
	<button id="go">검색</button></div>		
</div>


<div id="snd_content">
	<div id="snd_bar">
		<div id="bar_location"><h3><button id="back">지역 재설정</button></h3></div>
		<div id="bar_weather">
			<form name="rtcForm">
			<input type="text" name="rtcInput" size="20" readonly="readonly" />
			</form></div>
	</div>
	<div id="left_content">
	왼쪽
	</div>
	<div id="right_content">
	오른쪽
	</div>
</div>
</body>
</html>

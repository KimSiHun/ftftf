<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script> 
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

        }
    }).open();
}
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
 
<div id="fst"><div id="logo"><h1>로고</h1>
	<div>
		<div>
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소">
			<button id="go">검색</button></div>
		</div>
	</div>
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

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@CHARSET "UTF-8";

#fst {
	width: 100%;
	height: 930px;
	margin: 5px 0px 15px 0px;
	text-align: center;
	color: #000000;
	background-color: #ffffff;
	border: solid 2px #c3c3c3;
}

#logo {
	height: 200px;
	width: 600px;
	margin: auto;
	color: #ffffff;
	text-align: center;
	background-color: #000000;
	border: solid 2px #c3c3c3;
}

#snd_bar {
	width: 100%;
	height: 50px;
	margin: 0px 0px 0px 0px;
	text-align: center;
	background-color: #000000;
	color: #ffffff;
	border-bottom: solid 2px #c3c3c3;
}

#bar_location {
	height: 40px;
	margin-top: auto;
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

#wrap {
	margin: auto;
	width: 300px;
	background-color: #ffffff;
	border: solid 2px #505050;
}

#snd_content {
	height: 930px;
	width: 100%;
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

#empty {
	height: 100px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		//정보표시창(두번째)로 이동
		$("#go").click(function() {
			$("#fst").slideUp("slow");
		});
		
		// 주소 재설정 창으로 이동
		$("#back").click(function() {
			$("#fst").slideDown("slow");
		});
	});
	//마우스 스크롤 금지
	$(document)
		.on("mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll",
			function(e) {
				e.preventDefault();
				return;
			});
	//키보드로 이동 금지
	$(document).on("keydown.disableScroll", function(e) {
		var eventKeyArray = [ 32, 33, 34, 35, 36, 37, 38, 39, 40 ];
		for (var i = 0; i < eventKeyArray.length; i++) {
			if (e.keyCode === eventKeyArray[i]) {
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
		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);
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
	
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
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
                document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample3_address').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
	
	
</script>

</head>
<body style="overflow: hidden;" onload="realtimeClock()">

	<div id="fst">
		<div id="empty"></div>
		<div id="empty"></div>
		<div id="empty"></div>
		<div id="logo">
			<h1>로고, 타이틀 들어갈 자리</h1>
		</div>
		<div id="empty"></div>
			<input type="text" id="sample3_postcode" placeholder="우편번호">
			- <input type="button" onclick="sample3_execDaumPostcode()"
				value="우편번호 찾기"><br>
				<button id="go">검색</button>

			<div id="wrap"
				style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
				<img
					src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
					id="btnFoldWrap"
					style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
					onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
	</div>


	<div id="snd_content">
		<div id="snd_bar">
			<div id="bar_location">
				<h3>
					<button id="back">지역 재설정</button>
				</h3>
			</div>
			<div id="bar_weather">
				<form name="rtcForm">
					<input type="text" name="rtcInput" size="20" readonly="readonly" />
				</form>
			</div>
		</div>
		<div id="left_content">왼쪽</div>
		<div id="right_content">오른쪽</div>
	</div>
</body>
</html>

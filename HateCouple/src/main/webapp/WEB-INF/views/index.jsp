<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/stylesheets/index.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	$(document).ready(function() {
		//정보표시 구역(두번째)으로 이동
		$("#go").click(function() {
			var addr = document.getElementById('sample6_address').value;
			document.getElementById('search_addr').value = addr;
			$("#fst").slideUp("slow");
		});
		
		// 최초 구역으로 이동 - 기존 주소창 비우기
		$("#back").click(function() {
			$("#sample6_address").val(" ");
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
                //document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById('sample6_address2').focus();
            }
        }).open();
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

			<div id="searchBox">
				<!--										 유저가 주소검색으로만 입력할 수 있게 readonly사용 -->
				<input type="text" id="sample6_address" placeholder="주소" readonly="readonly">
				<input type="button" onclick="sample6_execDaumPostcode()" value="주소검색"><br>
				<button id="go">검색</button>
			</div>
	</div>
		

	<div id="snd">
		<div id="snd_bar">
			<div id="bar_location">
					<form name="addrForm">
					<input id="search_addr" type="text" name="addrInput" size="30"	/>
					</form>
					<button id="back">지역 재설정</button>
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

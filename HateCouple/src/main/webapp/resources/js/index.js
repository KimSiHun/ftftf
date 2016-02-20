	$(document).ready(function() {
		//정보표시 구역(두번째)으로 이동
		$("#go").click(function() {
			var addr = document.getElementById('sample6_address').value;
			document.getElementById('search_addr').value = addr;
			var dongaddr = document.getElementById('sample6_address').value;
			document.getElementById('dongName').value = addr;
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
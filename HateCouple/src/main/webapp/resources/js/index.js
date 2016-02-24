	$(document).ready(function() {
		//정보표시 구역(두번째)으로 이동
		$("#go").click(function() {
			var addr = document.getElementById('sample6_address').value;
			document.getElementById('search_addr').value = addr;
			var dongaddr = document.getElementById('sample6_address').value;

			$("#fst").slideUp("slow");
			
			
			
			var url = "https://apis.daum.net/local/geo/addr2coord?apikey=085c621120828d233c8a25e9eee763e8&q="+addr+"&output=json";
			// 좌표 구하기
			$.getJSON(url+"&callback=?", function(json){
				// 초기화시 리스트 비움.
				$("ul").empty();
								
				var items = json.channel.item;
				// 좌표를 검색형태로 가공
				$.each(items, function(i, it){
					var lat = it.lat;
					var lng = it.lng;
					
					var pos = lat+","+lng;
					// 가공된 좌표, 검색질의로 해당 질의에 답 구하기.
					var url2="https://apis.daum.net/local/v1/search/keyword.json?apikey=085c621120828d233c8a25e9eee763e8&q&query=CGV영화관&location="+pos+"&radius=2000";
					$.getJSON(url2+"&callback=?",function(json2){
						var items2 = json2.channel.item;
						// 해당 json value로 li에 붙이기 . -> 영화관 이름만
						$.each(items2,function(i,it2){
							
							// list에 영화관 이름 붙이기. 상위 ul
							var li = $('<li class = "theaterNameLI"></li>').append(it2.title);
							$('#theaterNameUL').append(li);
						});
						
						// mapAndList.jsp의 <ul><li></li><ul> 속의 영화관지점명의 값을 빼내기 위한 코드
						var thName = $('.theaterNameLI').text();
						console.log(thName);
					});
					
				});
				
			});
			
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
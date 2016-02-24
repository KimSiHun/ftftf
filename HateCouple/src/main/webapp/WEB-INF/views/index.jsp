<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/stylesheets/index.css"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=085c621120828d233c8a25e9eee763e8&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/index.js"></script>
<script type="text/javascript" src="resources/js/haein.js"></script>

<script>
	
</script>

</head>
<body style="overflow: hidden;" onload="realtimeClock()">

	<div id="fst">

		<div id="logo">
			<h1>로고, 타이틀 들어갈 자리</h1>
		</div>

		<div id="searchBox">
			<!-- 유저가 주소검색으로만 입력할 수 있게 readonly사용 -->
			<input type="text" id="sample6_address" placeholder="주소">
			<button id="go">검색</button>
		</div>

	</div>


	<div id="snd">
	<!-- 2번째 view 상단바 자리 -->
		<div id="snd_bar">
			<div id="bar_location">
				<form name="addrForm">
					<input id="search_addr" type="text" name="addrInput" size="30" />
				</form>
				<button id="back">지역 재설정</button>
			</div>

			<div id="bar_weather">
				<form name="rtcForm">
					<input type="text" name="rtcInput" size="20" readonly="readonly" />
				</form>
			</div>
		</div>

		<!-- 2번째 view 왼쪽 화면 -->
		<div id="left_content">
			<jsp:include page="movieMain.jsp" />
		</div>
		<!-- 2번째 view 오른쪽 화면 -->
		<div id="right_content">
			<jsp:include page="mapAndList.jsp"/>
		</div>
	</div>
</body>
</html>

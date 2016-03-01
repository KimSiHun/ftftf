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
</head>
<body style="overflow: hidden;" onload="realtimeClock()">

	<div id="fst">
		<table id="icon_top">
			<!-- 유저가 주소검색으로만 입력할 수 있게 readonly사용 -->
				<tr height="80%"><td><img src="http://localhost:8080/hate/resources/images/popcorn_icon.png" width="100%" height="100%"></td></tr>
				<tr id="icon_under" height="20%">
					<td id="searchBox">
						<input type="text" id="sample6_address" placeholder="서울 내 지역 검색 Ex)강남">
						<button id="go">검색</button>
					</td>
				</tr>
		</table>
	</div>


	<div id="snd">
		<!-- 2번째 view 상단바 자리 -->
		<div id="snd_bar">
			<div id="backspace">
				<a id="search_addr"><img src="resources/images/backspace.png"
					width="100px" height="100px"></a>

			</div>

		</div>

		<!-- 2번째 view 왼쪽 화면 -->
		<div id="left_content">
			<jsp:include page="movieMain.jsp" />
		</div>
		<!-- 2번째 view 오른쪽 화면 -->
		<div id="right_content">
			<jsp:include page="mapAndList.jsp" />
		</div>
	</div>
</body>
</html>

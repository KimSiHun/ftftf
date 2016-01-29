<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	나도 되나?
	<!-- window1 -->
	<div id="window"> <!-- 첫 화면 -->
		<div id="logo">로고</div>
		<div id="searchFirst">검색바</div>
	</div>

	<!-- window2 -->
	<div id="window2"> <!-- 두번째 화면 -->
		<div id="mainBar"> <!-- 상단 고정바 -->
			<div id="searchResultBar">검색결과바</div>
			<div id="weatherBar">날씨바</div>
		</div>
		<div id="content">
			<div id="cinema"><!-- 왼쪽화면 -->
				<div id="cinema-role">영화이미지돌아가는곳</div>
				<div id="cinema-list">해당 정보 리스트</div>
			</div>
			<div id="info"><!-- 오른쪽화면 -->
				<div id="map">지도</div>
				<div id="list">맛집리스트</div>
			</div>
		</div>
	</div>
</body>
</html>
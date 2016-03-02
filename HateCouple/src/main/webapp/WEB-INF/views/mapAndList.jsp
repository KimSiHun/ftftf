<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#theaterNameUL {
	width: 380px;
	line-height: 2em;
	list-style: none;
	background-color: rgba(31, 0, 0, 0.7);
	color: white;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding: 10px 10px 10px 10px;
	margin: auto;
	left: auto;
}

#textSpan {
	color: #8F1717;
	font-family: Consolas, monaco, monospace;
	font-size: 24px;
	font-style: normal;
	font-variant: normal;
	font-weight: 500;
	line-height: 26.4px;
}

#cgvLogo {
	margin-top: 125px;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<hr>
	<br>
	<div id="map" style="width: 95%; height: 350px; margin: auto;"></div>
	<br>
	<ul id="theaterNameUL"></ul>
	<div>
		<div>
			<span id="textSpan">go to</sapn> <a
				href="http://www.cgv.co.kr/ticket/"><img id="cgvLogo"
					src="resources/images/cgv.png" alt="cgv"></a>
		</div>
	</div>
</body>
</html>
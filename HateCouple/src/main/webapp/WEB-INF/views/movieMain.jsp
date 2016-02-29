<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<title>bxSlider</title>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="./resources/js/jquery.bxslider.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

#banner_wrap {
	position: relative;
	width: 80%;
}

#banner_slider {
	position: relative;
	padding-left: 100px;
}

#slide_banner {
	list-style: none;
	margin: 0 auto;
	display: inline-block;
}

.slide_img {
	margin: 0 auto;
}

#prevBtn {
	left: 0;
	top: 100px;
}

#nextBtn {
	right: 0;
	top: 100px;
}
</style>
</head>

<body>
	<div id="banner_wrap">
		<div>
			<a href="#" id="prevBtn"> <img src="resources/images/left.gif"
				alt="이전">
			</a>
		</div>
		<div id="banner_slider">
			<span id="slide_banner"> </span>
		</div>
		<div>
			<a href="#" id="nextBtn"> <img src="resources/images/right.gif"
				alt="다음">
			</a>
		</div>
	</div>

	<table width="600px" height="30px" cellspacing="0">
		<tr>
			<td>영화관</td>
			<td>title</td>
			<td width="100px">시작시간</td>
			<td>잔여좌석</td>

		</tr>
	</table>
	<div style="width: 600px; height: 300px; overflow: auto">
		<table id="Tb">
		</table>
	</div>
</body>

</html>

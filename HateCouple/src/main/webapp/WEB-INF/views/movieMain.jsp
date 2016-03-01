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
	width: 700px;
	margin: auto;
}

#banner_slider {
	width: 600px;
	float: left;
}

#slide_banner {
	list-style: none;
	margin: 0 auto;
	display: inline-block;
}

.slide_img {
	margin: 0 auto;
}

#first {
	width: 50px;
	height: 264px;
	float: left;
	margin-top: 95px;
}

#right {
	width: 50px;
	height: 264px;
	float: left;
	margin-top: 95px;
}

#BigTable {
	width: 800px;
	height: 300px;
	overflow-x: hidden;
}

#Tableth {
	width: 800px;
	background: #333;
	color: #fff;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	padding: 15px 0;
}

#Tablecontent {
	width: 800px;
	background: #333;
	color: #fff;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	padding: 15px 0;
	align: center;
}
</style>
</head>

<body>
	<div id="banner_wrap">
		<div id="first">
			<a href="#" id="prevBtn"> <img class="Img"
				src="resources/images/left.gif" alt="이전">
			</a>
		</div>
		<div id="banner_slider">
			<span id="slide_banner"> </span>
		</div>
		<div id="right">
			<a href="#" id="nextBtn"> <img class="Img"
				src="resources/images/right.gif" alt="다음">
			</a>
		</div>
	</div>



	<div id="BigTable">
		<table>
			<tr align="center">
				<th width="100px" id="Tableth">영화관</th>
				<th id="Tableth">영화 제목</th>
				<th id="Tableth">시작시간</th>
				<th id="Tableth">잔여좌석</th>
			</tr>
		</table>


		<table id="Tablecontent">

		</table>
	</div>

</body>

</html>

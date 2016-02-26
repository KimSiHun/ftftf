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
$(document).ready(function(){



});

</script>




<style>
* {
   margin: 0;
   padding: 0;
}

#banner_wrap {
   position: relative;
   width: 800px;
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
   position: absolute;
   left: 0;
   top: 100px;
}

#nextBtn {
   position: absolute;
   right: 0;
   top: 100px;
}
</style>
</head>

<body>
    <div id="banner_wrap">
        <span id="slide_banner">
        </span>
    </div>
    <p>
            <a href="#" id="prevBtn">
                <img src="resources/img/left.gif" alt="이전">
            </a>
        </p>
        <p>
            <a href="#" id="nextBtn">
                <img src="resources/img/right.gif" alt="다음">
            </a>
        </p>
    
</body>

</html>

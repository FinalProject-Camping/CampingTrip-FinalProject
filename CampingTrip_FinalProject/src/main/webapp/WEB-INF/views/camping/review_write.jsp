<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성하기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style type="text/css">
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.column {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 5px;
	background-color:#f3f3df;
}

.grade {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;
	display: flex;
    align-items: center;
    justify-content:center;
}
.grade_value{
	padding-bottom:15px;
}
.title {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 25px;
	font-weight: bold;
}

input[type='text'] {
	width: 100%;
}

textarea {
	width: 100%;
	resize: none;
	height: 300px;
}
.star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
    display:inline-block;
  }
  
  .star input[type='range'] {
    width: 100%;
    height: 100%;
    position: absolute;
    opacity:0;
    left: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color:  #ffd400;
    overflow: hidden;
    pointer-events: none;
  }
  .btn2 {
	display: inline-block;
	background: black;
	text-transform: uppercase;
	font-weight: 500;
	font-style: normal;
	font-size: 15px;
	font-weight: bold;
	letter-spacing: 0.3em;
	color: white;
	padding: 10px 30px 10px;
	background: black;
	text-decoration: none;
	margin: 0.625rem;
	border: none;
	border: 1px solid rgba(223, 190, 106, 0.3);
	border-radius: 5px;
}
</style>
<script type="text/javascript">
	$(function(){
		resizeWindow();
	})
	function drawStar(target,index){		
    	$('#'+index).css('width',target.value*20+'%');
    	$('#score'+index).empty();
    	$('#score'+index).append(target.value);
  	}

	function resizeWindow(){
		window.resizeTo(535, 680);
	}
</script>
</head>
<body>
	<div class="container">
		<form action="reviewwriteres.do" method="post">
		<input type="hidden" name="campno" value="${campno}">
		<c:set var="loginId" value='<%=session.getAttribute("id")%>' />
		<input type="hidden" name="writer" value="${loginId}">
		<div class="row mt-3">
			<div class="title">리뷰작성</div>
		</div>
		<div class="row mt-3">
			<div class="col-12 column">제목</div>
			<div class="col-12 column_value">
				<input type="text" name="title">
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-12 column">내용</div>
			<div class="col-12 column_value">
				<textarea name="content"></textarea>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-12 column">캠핑지 평가</div>
		</div>
		<div class="row mt-3 d-flex">
			<div class="col-3 grade">서비스</div>
			<div class="col-9 grade_value">
				<span class="star">★★★★★<span id="1">★★★★★</span>
				<input	type="range" name="service" oninput="drawStar(this,1)" value="1" step="0.5" min="0" max="5">
				</span>
				(<span id="score1">0</span>)
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">청결도</div>
			<div class="col-9 grade_value">
				<span class="star">★★★★★<span id="2">★★★★★</span>
				<input	type="range" name="cleanliness" oninput="drawStar(this,2)" value="1" step="0.5" min="0" max="5">
				</span>
				(<span id="score2">0</span>)
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">가성비</div>
			<div class="col-9 grade_value">
				<span class="star">★★★★★<span id="3">★★★★★</span>
				<input	type="range" name="cost" oninput="drawStar(this,3)" value="1" step="0.5" min="0" max="5">
				</span>
				(<span id="score3">0</span>)
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">위치</div>
			<div class="col-9 grade_value">
				<span class="star">★★★★★<span id="4">★★★★★</span>
				<input	type="range" name="location" oninput="drawStar(this,4)" value="1" step="0.5" min="0" max="5">
				</span>
				(<span id="score4">0</span>)
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-12 d-flex justify-content-center">
				<input type="submit" class="btn2" value="등록">
				<button type="button" class="btn2" onclick="window.close()">취소</button>
			</div>
		</div>
		</form>
	</div>
</body>
</html>
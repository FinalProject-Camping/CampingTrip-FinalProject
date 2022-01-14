<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="/resources/css/tagsinput.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/tagsinput.js" charset="UTF-8"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #e5e5e5;
}

.middle {
	position: relative;
	width: 50%;
	max-width: 500px;
}

.slider {
	position: relative;
	z-index: 1;
	height: 10px;
	margin: 0 15px;
}

.slider>.track {
	position: absolute;
	z-index: 1;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	border-radius: 5px;
	background-color: #c6aee7;
}

.slider>.range {
	position: absolute;
	z-index: 2;
	left: 25%;
	right: 25%;
	top: 0;
	bottom: 0;
	border-radius: 5px;
	background-color: #6200ee;
}

.slider>.thumb {
	position: absolute;
	z-index: 3;
	width: 30px;
	height: 30px;
	background-color: #6200ee;
	border-radius: 50%;
}

.slider>.thumb.left {
	left: 25%;
	transform: translate(-15px, -10px);
}

.slider>.thumb.right {
	right: 25%;
	transform: translate(15px, -10px);
}

input[type="range"] {
	position: absolute; /* opacity로 가린 것을 이벤트도 비활성화하기 위해 */
	pointer-events: none;
	-webkit-appearance: none;
	z-index: 2;
	height: 10px;
	width: 100%;
	opacity: 0;
}

input[type="range"]::-webkit-slider-thumb { /* 겹쳐진 두 thumb를 모두 활성화 */
	pointer-events: all;
	width: 30px;
	height: 30px;
	border-radius: 0;
	border: 0 none;
	background-color: red;
	cursor: pointer; /* appearance를 해야 위의 스타일들을 볼 수 있음 */
	-webkit-appearance: none;
}
</style>
<body>
	<div class="middle">
		<div class="multi-range-slider">
			<!-- 진짜 슬라이더 -->
			<input type="range" id="input-left" min="0" max="100" value="25" />
			<input type="range" id="input-right" min="0" max="100" value="75" />
			<!-- 커스텀 슬라이더 -->
			<div class="slider">
				<div class="track"></div>
				<div class="range"></div>
				<div class="thumb left"></div>
				<div class="thumb right"></div>
			</div>
		</div>
	</div>

</body>
<script>
const inputLeft = document.getElementById("input-left"); 
const inputRight = document.getElementById("input-right"); 
const thumbLeft = document.querySelector(".slider > .thumb.left"); 
const thumbRight = document.querySelector(".slider > .thumb.right"); 
const range = document.querySelector(".slider > .range"); 
const setLeftValue = () => { 
	const _this = inputLeft; 
	const [min, max] = [parseInt(_this.min), parseInt(_this.max)]; 
	// 교차되지 않게, 1을 빼준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해. 
	_this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1); 
	// input, thumb 같이 움직이도록 
	const percent = ((_this.value - min) / (max - min)) * 100; thumbLeft.style.left = percent + "%"; 
	range.style.left = percent + "%"; }; 
	const setRightValue = () => { const _this = inputRight; const [min, max] = [parseInt(_this.min), parseInt(_this.max)]; 
	// 교차되지 않게, 1을 더해준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해. 
	_this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1); 
	// input, thumb 같이 움직이도록 
	const percent = ((_this.value - min) / (max - min)) * 100; 
	thumbRight.style.right = 100 - percent + "%";
	range.style.right = 100 - percent + "%"; 
	}; 
	
	inputLeft.addEventListener("input", setLeftValue); 
	inputRight.addEventListener("input", setRightValue);

</script>
</html>
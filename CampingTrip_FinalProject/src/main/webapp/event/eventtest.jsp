<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event</title>
<link type="text/css" rel="stylesheet" href="../resources/css/roulette.css">
<script type="text/javascript" src="../resources/js/roulette.js"></script>
</head>

<body>
<h2>이달의 이벤트</h2>
<br>

<!-- 페이지 상단 -->
<div style="border: 1px solid #f1f1f1; width:800px; height:70px; line-height:25px; background-color:#f1f1f1;">
<br>
		<div style="font-size:25px; font-weight:bold; float:left;  margin-left:100px;">
			MY COUPON
		</div>
	<!-- 000에 ID, 총 포인트 값 가져오기 -->	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	000 님의 총 포인트는 000점 입니다.
	<div class="detail"><a href="eventdetail.jsp"><br>📜&nbsp;상세내역 보러가기>></a></div>
</div>
<br>

<!-- 룰렛 기능구현(임시로 영역 구분)-->
<div class="container">
		
		<div class="arrow"></div>
		<div class="eq8" id="roullete">
			<div class="panel panel_1" style="background: #00D8FF;">
				<strong class="txt">1</strong>
			</div>
			<div class="panel panel_2" style="background: #F2CB61;">
				<strong class="txt">2</strong>
			</div>
			<div class="panel panel_3" style="background: #FAECC5;">
				<strong class="txt">3</strong>
			</div>
			<div class="panel panel_4" style="background: #665C00;">
				<strong class="txt">4</strong>
			</div>
			<div class="panel panel_5" style="background: #476600;">
				<strong class="txt">5</strong>
			</div>
			<div class="panel panel_6" style="background: #2F9D27;">
				<strong class="txt">6</strong>
			</div>
			<div class="panel panel_7" style="background: #003399;">
				<strong class="txt">7</strong>
			</div>
			<div class="panel panel_8" style="background: #6B66FF;">
				<strong class="txt">8</strong>
			</div>
		</div>
		<button class="startBtn" onclick="clickStartBtn();">start</button>

	</div>

	<!-- 롤렛 패널 수정 팝업  -->
	<div class="popup">
		<div class="popup-content">
			<h1 class="title">panel edit</h1>
			<table>
				<tbody>
					<tr>
						<th><label for="addText">TEXT</label></th>
						<td><input type="text" id="addText"></td>
					</tr>
					<tr>
						<th><label for="showColorBox">COLOR</label></th>
						<td class="showColorBox" id="showColorBox">TEXT</td>
					</tr>

					<tr>
						<td><input type="radio" id="colorTypeBg" name="colorType"
							value="background" checked="checked"> <label
							for="colorTypeBg">background</label> <br /> <input type="radio"
							id="colorTypeFont" name="colorType" value="font"> <label
							for="colorTypeFont">font</label></td>
						<td>
							<div id="palletBox" class="pallet"></div> <input type="hidden"
							id="fontColor"> <input type="hidden" id="color">
						</td>
					</tr>

				</tbody>

			</table>

			<div class="btnArea" id="btnArea">
				<input type="button" id="cancelBtn" value="CANCEL"
					onclick="triggerAddPop();"> <input type="button"
					id="addBtn" value="ADD" onclick="clickAddBtn();"> <input
					type="button" id="saveBtn" value="SAVE" onclick="clickUpdateBtn();">
			</div>
		</div>
	</div>
<!-- 쿠폰존 -->
<br><br>
<h3>불멍하조 전용혜택</h3>
<hr style="width:800px; float:left;">

<br><br>
<div class="coupon" style="left:400px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>
<div class="coupon" style="left:750px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>


<div class="download" style="left:400px; top:930px;">
쿠폰받기⬇
</div>
<div class="download" style="left:750px; top:930px;">
쿠폰받기⬇
</div>

<br><br><br><br><br><br><br><br>
<h3>제휴회원 전용혜택</h3>
<hr style="width:800px; float:left;">

<br><br>
<div class="coupon" style="left:400px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>
<div class="coupon" style="left:750px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>

<div class="download" style="left:400px; top:1205px;">
쿠폰받기⬇
</div>
<div class="download" style="left:750px; top:1205px;">
쿠폰받기⬇
</div>

<br><br><br><br><br><br><br><br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
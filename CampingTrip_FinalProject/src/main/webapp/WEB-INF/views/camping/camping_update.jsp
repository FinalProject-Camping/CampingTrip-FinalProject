<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑지 상세페이지</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="/resources/datepicker/css/datepicker.min.css"
	rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker css -->
<script src="/resources/datepicker/js/datepicker.js"></script>
<!-- Air datepicker js -->
<script src="/resources/datepicker/js/datepicker.ko.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<link type="text/css" rel="stylesheet" href="/resources/css/tagsinput.css">
<script src="/resources/js/tagsinput.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52cf2e3096a1ac308c542aa15c92feed&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style type="text/css">
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.main, .detail_content {
	margin-top: 100px;
}
.main {
	border: 1px solid #e9ecef;
	border-radius: 1em;
	max-width:1100px;
}
.date {
	color: gray;
}
.row{
	margin-left:20px;
}
.chk_date {
	display: inline-block;
	width: 122px;
	text-align: center;
	font-weight: bold;
}

.room_list a {
	color: black;
	text-decoration: none;
	font-weight: bold;
}

.room_title {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 28px;
}

.room_price {
	font-size: 20px;
	font-weight: bold;
	color: rgb(255, 138, 61);
}

.room_people {
	font-size: 16px;
	font-weight: bold;
}
.room_list{
	padding:10px;
}
#review_ajaxList{
	margin-top:55px;
}
.card-body button{
	font-weight:bold;
}
.review_grade{
	display:inline-block;
	width:180px;
}
.camping_header{
	display:flex;
	justify-content: space-between;
}
.camping_name{
	font-family:'EliceDigitalBaeum_Bold';
	font-size:40px;
}
.camping_header_tap{
	display:flex;
}
.tap_detail{
	font-size:14px;
	color:gray;
	margin-left:10px;
}
.camping_tags{
	margin-top:10px;
	display:flex;
	align-items:center;
}
.tag_style{
	border: 2px solid #198754;
	border-radius:2em;
	padding:3px;
	font-weight:bold;
	color:#198754;
	margin-right:3px;
	margin-top:5px;
	background-color:white;
}
#total_grade_sp{
	font-family:'EliceDigitalBaeum_Bold';
	font-size:20px;
}
#category_grade,#total_grade_value{
	font-weight:bold;
}
.title{
	font-family:'EliceDigitalBaeum_Bold';
	font-size:40px;
}
.column{
	font-family:'EliceDigitalBaeum_Bold';
	font-size:25px;
	border-right: 10px solid #19875459;
}
.value{
	font-size:20px;
}
.category{
	background-color:#198754;
	color:white;
	font-family:'EliceDigitalBaeum_Bold';
	font-size:30px;
}
textarea{
	padding:10px;
	width:100%;
	height:150px;
	border:0px;
	resize:none;
}
.value > input[type=text]{
	width:100%;
	border:0px;
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
	padding: 15px 50px 15px;
	transition: all 0.7s ease-out;
	background: linear-gradient(270deg, #005282, black, black);
	background-position: 1% 50%;
	background-size: 300% 300%;
	text-decoration: none;
	margin-left:50px;
	margin-right:50px;
	border: none;
	border: 1px solid rgba(223, 190, 106, 0.3);
	border-radius: 5px;
}
.badge{
	color:white;
	background-color:#056bca;
	margin-right:3px;
}
#tags{
	display:none;
}
.bootstrap-tagsinput .badge [data-role="remove"]:after {
    content: "x";
    padding: 0px 4px;
    background-color: rgba(0, 0, 0, 0.1);
    border-radius: 50%;
    font-size: 13px;
}
</style>
<script type="text/javascript">
	
	function open_roomDetail(roomno){
		
		var options = 'top=10, left=10, width=580, height=700, status=no, menubar=no, toolbar=no, resizable=no';
		window.open("roomdetail.do?roomno="+roomno, "roomdetail", options);
		
	}
	
	function openWindowPop(url, name) {
		var options = 'top=10, left=10, width=1000, height=570, status=no, menubar=no, toolbar=no, resizable=no';
		window.open(url, name, options);
	}
	function openReviewWrite(campno){
		var options = 'top=10, left=10, width=585, height=645, status=no, menubar=no, toolbar=no, resizable=no';
		window.open('reviewwrite.do?campno='+campno, 'reviewwrite', options);
	}
	function priceLocale(price){
		return price.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
	function refreshPage(){
		window.location.reload();
	}
	
	function moveToReservation(roomno) {
		//로그인이 없거나 페널티가 있는경우 안되게
		$.ajax({
			url : "loginChk.do",
			method : "post",
			success : function(data) {
				if (data.data === true) {
					openWindowPop('reservationform.do?roomno='+roomno, 'reservform');
				} else {
					if (confirm("로그인이 필요한 작업입니다. 로그인 하시겠습니까?")) {
						location.href = 'loginform.do';
					} else {

					}
				}
			}
		})
	}
	function moveToLogin(){
		location.href = 'loginform.do';
	}
	function refreshReviewlist(){
		var campno = {"campno" : ${campDto.campno}};
		$.ajax({
			
			url:"reviewlistajax.do",
			type:"post",
			data:JSON.stringify(campno),
			contentType:"application/json",
			success:function(result){
				var comments="";
				alert("성공");
				$(result).each(function(){
					console.log(typeof(this.create_date));
					comments +='<div class="review_element row">';
					comments +='<div class="review_profile col-2">';
					comments +='<img class="rounded-circle img-fluid" src="/resources/img/'+this.thumbnail+'"></div>';
					comments +='<div class="review_content_part col-10">';
					comments +='<div class="review_top d-flex justify-content-between">';
					comments +='<span class="review_title">'+this.title+'</span> <span class="review_grade"><span class="star-rating"><span style="width:'+ (this.total)*20+'%"></span></span>('+this.total+'점)</span>';
					comments +='</div>';
					comments +='<div class="review_content">'+this.content+'</div>';
					comments +='<div class="review_date d-flex justify-content-end align-items-end">';
					comments +='<span class="date">'+this.create_date+'</span></div></div></div>';
				});
				
				$("#review_ajaxList").empty();
				$("#review_ajaxList").append(comments);
			},
			error:function(){
				alert("통신실패");
			}
		});
	}
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="main container shadow mb-5">
		<form action="campUpdateRes.do" method="post">
		<input type="hidden" name="campno" value="${campDto.campno}">
		<div class="row mt-5">
			<div class="col-md-12 title">
				캠핑지 정보수정
			</div>
		</div>
		<div class="row category mt-3 mb-3">
			기본정보
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				캠핑지 이름	
			</div>
			<div class="value col-md-8">
				${campDto.name}
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				캠핑지 타입	
			</div>
			<div class="value col-md-8">
				${campDto.camptype_tostr() }
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				주소	
			</div>
			<div class="value col-md-8">
				${campDto.address }
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				상세주소	
			</div>
			<div class="value col-md-8">
				${campDto.address_detail }
			</div>
		</div>
		<div class="row category mt-5 mb-3">
			상세정보
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				캠핑지 소개글	
			</div>
			<div class="value col-md-8">
				<textarea name="intro">${campDto.intro}</textarea>
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				캠핑지 이용규칙
			</div>
			<div class="value col-md-8">
				<textarea name="rule">${campDto.rule}</textarea>
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				이용가능 서비스
			</div>
			<div class="value col-md-8">
				<textarea name="service">${campDto.service}</textarea>
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				핸드폰 번호
			</div>
			<div class="value col-md-8">
				<input type="text" name="phone" value="${campDto.phone }">
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				이메일
			</div>
			<div class="value col-md-8">
				<input type="text" name="email" value="${campDto.email }">
			</div>
		</div>
		<div class="row mt-3 mb-3">
			<div class="column col-md-4">
				태그
			</div>
			<div class="value col-md-8">
				<input class="input2" type="text" id="tags" name="tags" data-role="tagsinput" value="${campDto.tags }">
			</div>
		</div>
		<div class="row mt-5 mb-5">
				<div class="col-md-12 mt-5 mb-5 d-flex justify-content-center">
						<input type="submit" class="btn2" value="수정">
						<button type="button" class="btn2" onclick="location.href='campdetail.do?campno=${campDto.campno}'">취소</button>
				</div>
		</div>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
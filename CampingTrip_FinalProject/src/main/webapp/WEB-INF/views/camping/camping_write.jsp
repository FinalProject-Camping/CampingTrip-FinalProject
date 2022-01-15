<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑지 등록</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/css/tagsinput.css">
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="http://kit.fontawesome.com/2d323a629b.js"></script>
<style type="text/css">
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

html, body {
	height: 100%;
	overflow: hidden;
}

h4 {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 38px;
}

.main_wrap {
	display: flex;
	height: 100%;
}

.main_left {
	width: 40%;
	height: 100%;
	overflow: hidden;
	margin: 0 auto;
}

.main_right {
	width: 60%;
	height: 100%;
	overflow: auto;
	margin: 0 auto;
}

.main_img {
	width: 100%;
	height: 100%;
	background-image: url('/resources/img/camping_main.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.main_content {
	height: 100%;
}

.page_nav {
	color: #181818;
}
.badge{
	color:white;
	background-color:#056bca;
	margin-right:3px;
}
#tags{
	display:none;
}
/*input style*/
input {
	outline: none;
	border: none;
}

textarea {
	outline: none;
	border: none;
}

textarea:focus, input:focus {
	border-color: transparent !important;
}

input:focus::-webkit-input-placeholder {
	color: transparent;
}

input:focus:-moz-placeholder {
	color: transparent;
}

input:focus::-moz-placeholder {
	color: transparent;
}

input:focus:-ms-input-placeholder {
	color: transparent;
}

textarea:focus::-webkit-input-placeholder {
	color: transparent;
}

textarea:focus:-moz-placeholder {
	color: transparent;
}

textarea:focus::-moz-placeholder {
	color: transparent;
}

textarea:focus:-ms-input-placeholder {
	color: transparent;
}

input::-webkit-input-placeholder {
	color: #999999;
}

input:-moz-placeholder {
	color: #999999;
}

input::-moz-placeholder {
	color: #999999;
}

input:-ms-input-placeholder {
	color: #999999;
}

textarea::-webkit-input-placeholder {
	color: #999999;
}

textarea:-moz-placeholder {
	color: #999999;
}

textarea::-moz-placeholder {
	color: #999999;
}

textarea:-ms-input-placeholder {
	color: #999999;
}

.wrap-input2 {
	width: 80%;
	position: relative;
	border-bottom: 2px solid #adadad;
	margin-bottom: 37px;
}

.input2 {
	display: block;
	width: 100%;
	font-family: Poppins-Regular;
	font-size: 15px;
	color: #555555;
	line-height: 1.2;
}

.focus-input2 {
	position: absolute;
	display: block;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	pointer-events: none;
}

.focus-input2::before {
	content: "";
	display: block;
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 0;
	height: 2px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
	background: rgba(60, 179, 113, 1);
	background: -webkit-linear-gradient(45deg, #3cb371, #35bfe5);
	background: -o-linear-gradient(45deg, #3cb371, #35bfe5);
	background: -moz-linear-gradient(45deg, #3cb371, #35bfe5);
	background: linear-gradient(45deg, #3cb371, #35bfe5);
}

.focus-input2::after {
	content: attr(data-placeholder);
	display: block;
	width: 100%;
	position: absolute;
	top: 0px;
	left: 0;
	font-size: 13px;
	color: #999999;
	line-height: 1.2;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
}

input.input2 {
	height: 45px;
}

input.input2+.focus-input2::after {
	top: 16px;
	left: 0;
}

textarea.input2 {
	min-height: 115px;
	padding-top: 13px;
	padding-bottom: 13px;
}

textarea.input2+.focus-input2::after {
	top: 16px;
	left: 0;
}

.input2:focus+.focus-input2::after {
	color: black;
	font-weight: bold;
	top: -17px;
}

.input2:focus+.focus-input2::before {
	width: 100%;
}

.has-val.input2+.focus-input2::after {
	color: black;
	font-weight: bold;
	top: -17px;
}

.has-val.input2+.focus-input2::before {
	width: 100%;
}
/*---------------------------------*/
.address_input {
	width: 80%;
}
/*---------*/
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
	margin: 0.625rem;
	border: none;
	border: 1px solid rgba(223, 190, 106, 0.3);
	border-radius: 5px;
}

.btn2:hover {
	color: #fff;
	border: 1px solid rgba(223, 190, 106, 0);
	color: $white;
	background-position: 99% 50%;
}

#type_blank {
	display: inline-block;
	width: 80px;
	height: 38px;
}

.sub_main {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 20px;
	font-weight: bold;
	margin-left: 30px;
}

textarea {
	resize: none;
}

.main_right {
	margin-left: 5%;
	margin-right: 5%;
}


.add_room {
	margin: 5px;
	border: 2px solid black;
	border-radius: 5px;
	height: 150px;
	width: 300px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 25px;
	cursor: pointer;
}
.room_content{
	padding:5px;
	width:150px;
}
.room_element {
	margin: 5px;
	border: 2px solid black;
	border-radius: 5px;
	height: 150px;
	width: 300px;
	font-size: 15px;
	padding:5px;
}
.room_image{
	width:130px;
	overflow:hidden;
	border-radius:1em;
}
.image-thumbnail{
	position:absolute;
	width:130px;
	height:138px;
	object-fit:cover;
}
.room_name{
	font-size:20px;
	font-family: 'EliceDigitalBaeum_Bold';
}
.room_price{
	font-size:20px;
	font-weight:bold;
	color:#0574d1;
}
.black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index:1001;
        -moz-opacity: 0.8;
        opacity:.80;
        filter: alpha(opacity=80);
    }
    .white_content {
        display: none;
        position: absolute;
        top: 25%;
        left: 25%;
        width: 50%;
        height: 50%;
        padding: 16px;
        border: 2px solid green;
        background-color: white;
        z-index:1002;
        overflow: auto;
    }
	.bootstrap-tagsinput{
		border:0px;
		box-shadow: unset;
	}
	#addfile{
		color:black;
	}
	#addfile:hover{
	
	}
	.file-btn{
		display:inline-block;
	}
	.ck_column{
		display:inline-block;
		font-size:14px;
		color:black;
		font-weight:bold;
		margin-bottom:20px;
		padding-right:10px;
	}
	.file_element{
		display:flex;
		margin-bottom:5px;
	}
	.fwidth{
		width:80%;
	}
	.file_delete{
		margin-left:10px;
		padding-top:8px;
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	.exp{
		border-bottom:0px;
	}
	.logo{
		position:absolute;
		top:50%;
		left:18%;
		color:white;
		font-weight:bold;
		font-size:40px;
		transform:translate(-50%,-50%);
	}
	.logo a{
		text-decoration:none;
		color:white;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		console.log("hi");

						/*=====[ Focus Contact2 ]*/
						$('.input2').each(function() {
							$(this).on('blur', function() {
								console.log("hi");
								if ($(this).val().trim() != "") {
									$(this).addClass('has-val');
								} else {
									$(this).removeClass('has-val');
								}
							});
						});

						$('input[name=type]').change(function() {
							if ($(this).is(":checked")) {
								$("#span_type").addClass("::before");
							} else {
								$("#span_type").removeClass("::before");
							}
							console.log("hi");
							$(this).on('')
						});
						
						//화면 첫화면 설정
						movePhase("A");
						//file-delete 이벤트 추가
						$("a[name='file-delete']").on("click", function(e) {
					          e.preventDefault();
					         deleteFile($(this));
					   });
					});

	function daumAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				document.getElementById("address").value = addr;
				$('input[name=address]').addClass('has-val');
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("address_detail").focus();
			}
		}).open();
	}

	function movePhase(level) {
		$('.main_content').each(function() {
			$(this).hide();
		});

		$('#phase_' + level).show();
		$('#room_form').hide();
	}
	var openWin;
	function openWindowPop(url, name) {
		var options = 'top=10, left=10, width=528, height=528, status=no, menubar=no, toolbar=no, resizable=no';
		openWin = window.open(url, name, options);
	}
	
	//file 추가,삭제 함수
	function addFile(){
		var str="<div class='file_element'><input class='form-control fwidth' type='file' name='camp_image'><a href=''#this' class='file_delete' name='file-delete'>삭제</a></div>";
		$("#file-list").append(str);
		$("a[name='file-delete']").on("click",function(e){
			e.preventDefault();
			deleteFile($(this));
		});
	}
	function deleteFile(obj){
		obj.parent().remove();
	}
	
	function validateInputChk(page){
		if(page == "A"){
			if(!$("input[name=name]").val()){
				alert("캠핑지명을 입력해주세요.");
				$("input[name=name]").focus();
			}else if(!$("input[name=address]").val()){
				alert("캠핑지 주소를 입력해주세요");
				$("input[name=address]").focus();
			}else if(!$("input[name=address_detail]").val()){
				alert("캠핑지 상세주소를 입력해주세요");
				$("input[name=address_detail]").focus();
			}
			else if($("input[name=camp_type]:checkbox:checked").length < 1){
				alert("캠핑지 종류를 하나이상 선택해주세요");
				$("input[name=camp_type]").focus();
			}else{
				movePhase('B');
			}
		} else if(page=="B"){
			if(!$("textarea[name=intro]").val()){
				alert("캠핑지 소개글을 입력해주세요.");
				$("textarea[name=intro]").focus();
			} else if(!$("textarea[name=service]").val()){
				alert("이용가능 서비스를 입력해주세요.");
				$("textarea[name=service]").focus();
			} else if(!$("textarea[name=rule]").val()){
				alert("캠핑지내 이용규칙을 입력해주세요.");
				$("textarea[name=rule]").focus();
			} else{
				movePhase('C');
			}
		}
	}
	
</script>
</head>
<body>
	<div class="main_wrap">
		<div class="main_left">
			<div class="main_img"></div>
			<div class="logo"><a href="index.jsp"><i class="fas fa-campground"></i>CampingTrip</a></div>
		</div>
		
		<div class="main_right">
		<!-- form 태그 시작 -->
		<form name="fileForm" action="insertcamp.do" method="post" enctype="multipart/form-data">
			<c:set var="loginId" value='<%=session.getAttribute("id")%>' />
			<input type="hidden" name="writer" value="${loginId}">
			<div class="main_content container" id="phase_A">
				<div class="row mt-3">
					<div class="col-12 d-flex justify-content-end">
						<div class="page_nav">● ○ ○</div>
					</div>
				</div>
				<div class="row" style="height: 100px;">
					<div
						class="col-md-12 d-flex align-items-center justify-content-center">
						<h4>캠핑지 등록</h4>
					</div>
				</div>
				<div class="row mb-5">
					<div class="col-md-12">
						<span class="sub_main">Step 1. 캠핑지 기본정보</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							data-validate="Name is required">
							<input class="input2" type="text" id="name" name="name" required>
							<span class="focus-input2" data-placeholder="캠핑지 이름"></span>
						</div>
					</div>
					
				</div>
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<div class="address_input d-flex justify-content-center">
							<div class="wrap-input2 flex-fill validate-input"
								data-validate="Name is required">
								<input class="input2" type="text" id="address" name="address"
									readonly onclick="daumAddress()" required><span
									class="focus-input2" data-placeholder="캠핑지 주소"></span>
							</div>
							<button type="button" class="btn btn-outline-dark align-self-baseline mt-2"
								style="float: right;" onclick="daumAddress()">주소찾기</button>
						</div>
					</div>
					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							data-validate="Name is required">
							<input class="input2" type="text" id="address_detail"
								name="address_detail" required> <span class="focus-input2"
								data-placeholder="상세주소"></span>
						</div>
					</div>

					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							style="border-bottom: 0px;" data-validate="Name is required">
							<div id="type_blank"></div>
							<input class="btn-check input2" type="checkbox" name="camp_type"
								id="price_category1" value="autocamping" > <label
								class="btn btn-outline-dark" for="price_category1">오토캠핑</label>

							<input class="btn-check" type="checkbox" name="camp_type"
								id="price_category2" value="glamping"> <label
								class="btn btn-outline-dark" for="price_category2">글램핑</label> <input
								class="btn-check" type="checkbox" name="camp_type"
								id="price_category3" value="caravan"> <label
								class="btn btn-outline-dark" for="price_category3">카라반</label> <input
								class="btn-check" type="checkbox" name="camp_type"
								id="price_category4" value="pension"> <label
								class="btn btn-outline-dark" for="price_category4">펜션</label> <span
								class="focus-input2" id="span_type" data-placeholder="캠핑지 종류"></span>
						</div>
					</div>
					<div class="col-md-12 d-flex justify-content-center exp">
						<div class="form-group wrap-input2" id="file-list">
							<span class="ck_column">이미지추가</span><span class="file-btn"><a id="addfile" href="#this" onclick="addFile()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg></a></span>
							<div class="file-group">
								<div class="file_element">
								<input class="form-control fwidth" type="file" name="camp_image"><a href="#this" class="file_delete" name="file-delete">삭제</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<button type="button" class="btn2" onclick="validateInputChk('A')">다음단계</button>
						
					</div>
				</div>

			</div>
			<div class="main_content container" id="phase_B">
				<div class="row mt-3">
					<div class="col-12 d-flex justify-content-end">

						<div class="page_nav">○ ● ○</div>
					</div>
				</div>
				<div class="row mb-5 mt-3">
					<div class="col-md-12">
						<span class="sub_main">Step 2. 캠핑지 상세정보</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							data-validate="Name is required">
							<textarea class="input2" name="intro" required></textarea>
							<span class="focus-input2" data-placeholder="캠핑지 소개"></span>
						</div>
					</div>
					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							data-validate="Name is required">
							<textarea class="input2" name="service" required></textarea>
							<span class="focus-input2" data-placeholder="이용가능 서비스"></span>
						</div>
					</div>
					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							data-validate="Name is required">
							<textarea class="input2" name="rule" required></textarea>
							<span class="focus-input2" data-placeholder="캠핑지 이용수칙"></span>
						</div>
					</div>
					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							data-validate="Name is required">
							<input class="input2" type="text" name="phone"><span
								class="focus-input2" data-placeholder="연락처"></span>
						</div>
					</div>
					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							data-validate="Name is required">
							<input class="input2" type="text" name="email"><span
								class="focus-input2" data-placeholder="이메일"></span>
						</div>
					</div>
					<div class="col-md-12 d-flex justify-content-center">
						<div class="wrap-input2 validate-input"
							data-validate="Name is required">
							<span class="ck_column">태그입력</span>
							<input class="input2" type="text" id="tags" name="tags" data-role="tagsinput">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<button type="button" class="btn2" onclick="movePhase('A')">이전단계</button>
						<button type="button" class="btn2" onclick="validateInputChk('B')">다음단계</button>
					</div>
				</div>
			</div>
			<div class="main_content container" id="phase_C">
				<div class="row mt-3">
					<div class="col-12 d-flex justify-content-end">
						<div class="page_nav">○ ○ ●</div>
					</div>
				</div>
				<div class="row mb-5 mt-5">
					<div class="col-md-12">
						<span class="sub_main">Step 3. 캠핑지 숙소등록</span>
					</div>
				</div>
				<div id="room_list" class="row d-flex">
					<div class="add_room col-md-6"
						onclick="openWindowPop('roominsertform.do','roomadd')">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
</svg>
					</div>
				</div>
				<div id="room_form">
				</div>
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<button type="button" class="btn2" onclick="movePhase('B')">이전단계</button>
						<input type="submit" class="btn2" value="등록하기">
					</div>
				</div>
			
			</div>
			
		</form>
		<!-- form 태그 종료 -->
		</div>
	</div>
	

</body>
</html>
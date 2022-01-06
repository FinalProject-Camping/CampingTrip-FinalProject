<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

<style type="text/css">
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 700;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype')
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 300;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype');
}

.nanumbarungothic * {
 font-family: 'NanumBarunGothic', sans-serif;
}

@media screen and (max-width: 767px) { #mainbody,#seeAddr { font-size: 13px; }  .btn-suggest, .btns, .btns-n, .btn-suggest-n{width:25%}  #user-circle{font-size:30px;} .titleandprice{font-size:21px;} .slider-1{height:350px;}}
@media screen and (min-width: 768px) and (max-width: 991px) { #mainbody,#seeAddr { font-size: 13px; }  #mainbody > .row{margin-left:5%; margin-right:5%;} .btn-suggest, .btns, .btns-n, .btn-suggest-n{width:25%} #user-circle{font-size:30px;} .titleandprice{font-size:21px;} .slider-1{height:400px;}}
@media screen and (min-width: 992px) and (max-width: 1199px) { #mainbody,#seeAddr { font-size: 14px; }  #mainbody > .row{margin-left:12%; margin-right:12%;} .btn-suggest, .btns, .btns-n, .btn-suggest-n{width:25%} #user-circle{font-size:30px;}  .titleandprice{font-size:22px;} .slider-1{height:460px;}}
@media screen and (min-width: 1200px) and (max-width: 1399px) { #mainbody,#seeAddr { font-size: 15px; }  #mainbody > .row{margin-left:15%; margin-right:15%;}  .btn-suggest, .btns, .btns-n, .btn-suggest-n{width:25%} #user-circle{font-size:35px;} .titleandprice{font-size:23px;} .slider-1{height:480px;}}
@media screen and (min-width: 1400px) { #mainbody,#seeAddr { font-size: 15px; }  #mainbody > .row{margin-left:18%; margin-right:18%;}  .btn-suggest, .btns, .btns-n, .btn-suggest-n{width:25%} #user-circle{font-size:35px;} .titleandprice{font-size:23px;} .slider-1{height:500px;}}  

#mainbody, .modal{font-family: NanumBarunGothic;}
.hr{color: #ff8a3d}
.bold{font-weight: bold;}
.gray{color:gray;}
.red{color:red;}
.black(color:black;)
.message{display:none; margin-top:1.5%;}
a{text-decoration: none; color:black;}

.place-btn{background-color: rgb(0, 191, 121); border: solid 2px rgb(0, 191, 121); border-radius: 15px; padding-right:12px; padding-left:12px; color : white; font-weight: bold; margin-right:8px;}

.btns{background-color: #FFFFFF; border: solid 1px rgb(0, 191, 121); border-radius: 5px; padding-right:3%; padding-left:3%; color : rgb(0, 191, 121); font-weight: bold; height: 50px;}
.btns:hover{
	transition: all 0.3s;
	border: solid 1px rgb(0, 191, 121);
	background-color: rgb(0, 191, 121);
	color : white;
}
.btns-n{cursor:default !important; background-color: lightgray; border: solid 1px lightgray; border-radius: 5px; padding-right:3%; padding-left:3%; color : white; font-weight: bold; height: 50px;}

#btn-heart{margin-bottom:3px; background-color: #FFFFFF; border: solid 1px black; color : rgb(255, 59, 0); border-radius: 5px; padding-right:18px !important; padding-left: 18px !important;  font-weight: bold; height: 50px; 	font-size: 13px !important; }
/* #btn-heart:hover{
	transition: all 0.3s;
	border: solid 1px rgb(255, 59, 0);
	background-color: rgb(255, 59, 0);
	color : white;
}
#btn-heart:hover .heart{transition: all 0.3s; color:#FFF !important;} */
.heart{color: #000 !important;}
.btn-heart-n{cursor:default !important; background-color: lightgray !important; border: solid 1px lightgray !important; color : white !important; border-radius: 5px; padding-right:18px !important; padding-left: 18px !important;  font-weight: bold; height: 50px; 	font-size: 13px !important; }

.btn-del{background-color: #FFFFFF; border: solid 1px gray; color : gray; border-radius: 5px; padding-right:3%; padding-left:3%; font-weight: bold; height: 50px;}
.btn-del:hover{
	transition: all 0.3s;
	border: solid 1px gray;
	background-color: gray;
	color : white;
}

.btn-suggest{background-color: #FFFFFF; border: solid 1px #ff8a3d; color : #ff8a3d; border-radius: 5px;  font-weight: bold; height: 50px;}
.btn-suggest:hover{
	transition: all 0.3s;
	border: solid 1px #ff8a3d;
	background-color: #ff8a3d;
	color : white;
}
.btn-suggest-n{cursor:default !important; background-color: lightgray; border: solid 2px lightgray; color : white; border-radius: 5px;  font-weight: bold; height: 50px;}

.btn-update{background-color: #FFFFFF; border: solid 1px #ff9c78; color : #ff9c78; border-radius: 5px;  font-weight: bold; height: 50px;}
.btn-update:hover{
	transition: all 0.3s;
	border: solid 1px #ff9c78;
	background-color: #ff9c78;
	color : white;
}

        
#adminModal .modal-header, #reportModal .modal-header {background-color: lightgray;}

#suggestModal .modal-header{background-color: #ff8a3d; color:white;}
#suggestprice {outline: none;}

#chat .modal-header{background-color: lightgray; color: black;}
#chat .modal-footer{background-color: lightgray;}

#admin-select, #admin-textarea, #report-select, #report-textarea {border: 2px solid darkgray; border-radius: 5px; outline: none;}

#user-circle{ color:gray; }
#report{ cursor: pointer;}


#content img{
	width:100% !important;
	height: auto !important;
}

#seeAddr{
	min-width:300px;
	width:auto;
	height:auto;
	position: fixed;
	top: 45%;
	left:50%;
	transform: translate(-50%, -50%);
	padding:30px;
	background-color: white;
	border-radius: 8px;
}

/* toast */
.toast-success {background-color: rgb(255, 59, 0) !important;}
.toast-error {background-color: #BD362F !important;}
.toast-info {background-color: #2F96B4 !important;}
.toast-warning {background-color: #F89406 !important;}
.toast-top-right {top: 2%;}

/* -----------------slide------------------- */
 ul, li, h1, h2, h3, h4, h5 {
    margin:0;
    padding:0;
    list-style:none;
}

a {
    color:inherit;
    text-decoration:none;
}

/* 커스텀 */

/* 슬라이더 1 시작 */
.slider-1 {
	margin:2.5%;
	margin-top:2%;
	margin-bottom:0;
    position:relative;
    border-radius: 8px;
}

/* 슬라이더 1 - 페이지 버튼 */
.slider-1 > .page-btns {
    text-align:center;
    position:absolute;
    bottom:20px;
    left:0;
    width:100%;
}

.slider-1 > .page-btns > div {
    width:20px;
    height:20px;
    background-color:rgba(255,255,255,.5);
    border-radius:4px;
    display:inline-block;
    cursor:pointer;
    margin-right: 5px;
}

.slider-1 > .page-btns > div.active {
    background-color:rgba(255,255,255,1);
}

/* 슬라이더 1 - 슬라이드 */

.slider-1 > .slides > div {
	border-radius: 8px;
    position:absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    opacity:0;
    transition: opacity 0.3s;
    background-position:center;
    background-size:cover;
    background-repeat:no-repeat;
}

.slider-1 > .slides > div.active {
    opacity:1;
    transition: opacity 0.3s;
}

/* 슬라이더 좌우 버튼 */
.slider-1 > .side-btns > div {
    position:absolute;
    top:0;
    left:0;
    width:25%;
    height:100%;
    cursor:pointer;
}
.slider-1 > .side-btns > div:last-child {
    left:auto;
    right:0;
}
.slider-1 >.side-btns > div > span {
    position:absolute;
    top:50%;
    left:20px;
    transform:translatey(-50%);
    background-color:white;
    opacity:0.5;
    padding:1px 13px;
    border-radius:50px;
    font-size:25px;
}
.slider-1 >.side-btns > div:last-child > span {
    left:auto;
    right:20px;
}

.margin{margin-top:2.5%; margin-bottom:2.5%;}
.titleandprice{margin-bottom:0.5%;}
.popular-title{overflow: hidden;text-overflow: ellipsis;word-wrap: break-word;display: -webkit-box;-webkit-line-clamp: 1; -webkit-box-orient: vertical;}


</style>

<script type="text/javascript">
const seq = '${dto.seq}';
const writer = '${dto.id}';

const sessionUserType = '${sessiondto.myrole}'; //${sessiondto.usertype}
const sessionid = '${sessiondto.myid}'; //${sessiondto.userid}

	//general user
	function report(){
		
		var select = document.getElementById('report-select');
		var value = select.options[select.selectedIndex].value;
		var reason = document.getElementById('report-textarea');
		
		if(value === "2"){
			var trimVal = reason.value;
			if(trimVal === '' || trimVal === null){
				alert("사유를 입력하세요.");
				reason.value = '';
				return false;
			}
		}else{
			reason.value = select.options[value].innerHTML;
		}
		alert(reason.value);
		return false;
	}
	
	//writer
	function del(){
		if(confirm("게시글을 삭제하시겠습니까?")){
			location.href='delete.do?writer=${dto.id}&seq=${dto.seq}';
		}
	}
	function update(){
		location.href='updateform.do?writer=${dto.id}&seq=${dto.seq}';
	}
	function renewal(){
		$.ajax({
			url:"renewal.do?seq=${dto.seq}",
			method: "post",
			success:function(data){ 
				if(data.data === '성공'){
					location.href='selectone.do?seq=${dto.seq}';
				}else if(data.data === '초과'){
					alert('갱신 횟수 5회 초과하였습니다.');	
				}else if(data.data === '실패'){
					alert('최신글 등록은 일 1회만 가능합니다.');
				}else{
					location.href="error.do";
				}
			}
		})
	}
	
	function getTime(date){
		var today = new Date();
		var regdate = new Date(date);
		var timegap = today - regdate;
		var d = parseInt(timegap/86400000);
		var t = parseInt(timegap/3600000);
		var m = parseInt(timegap/60000);
		
		switch(true){
			case (d > 7):return date.split(' ')[0]; 
			case (d >= 1): return d+'일 전';
			case (t >= 1): return t+'시간 전';
			case (m >= 1): return m+'분 전';
			default: return '방금 전';
		}
	}
	
	//admin
	function adminDel(){
		var select = document.getElementById('admin-select');
		var value = select.options[select.selectedIndex].value;
		var reason = document.getElementById('admin-textarea');
		
		if(value === "3"){
			var trimVal = reason.value;
			if(trimVal === '' || trimVal === null){
				alert("사유를 입력하세요.");
				reason.value = '';
				return false;
			}
		}else{
			reason.value = select.options[value].innerHTML;
		}
		alert(reason.value);
		return false;
	}
	
	//가격제안
	function suggest(){
		if(sessionid ===''){
			toastr.options.positionClass = "toast-top-right";
			toastr.options.timeOut = 1000;
			toastr.warning("로그인이 필요합니다");
			return;
		}
		
		if(document.getElementById('suggestprice').value === ''){
			return false;
		}
		if(document.getElementsByClassName('message')[0].style.getPropertyValue('display') === 'block'){
			return false;
		}
		alert('제안성공');
		return false;
	}
	
	function addheart(ele){
		
		$.ajax({
			url:"addheart.do?seq=${dto.seq}&sessionid=${sessiondto.userid}",
			method: "post",
			success:function(data){ 
				if(data.data === false){
					toastr.options.positionClass = "toast-top-right";
					toastr.options.timeOut = 1000;
					toastr.warning("로그인이 필요합니다");
				}else if(data.data === 'differenet'){
					location.href="error.do";
				}else{
					if(data.data === '성공'){
						ele.children[2].innerText = parseInt(ele.children[2].innerText) + 1;
						ele.children[0].classList.remove('far');
						ele.children[0].classList.add('fas');
						ele.setAttribute('onclick', 'rmheart(this)');
						
						toastr.options.positionClass = "toast-top-right";
						toastr.options.timeOut = 700;
						toastr.success("찜 추가 완료");
					}else{
						toastr.options.positionClass = "toast-top-right";
						toastr.warning("추가 실패");
					}
				}
			},
			error:function(){
				toastr.options.positionClass = "toast-top-right";
				toastr.warning("통신 실패");
			}
		})
	}
	
	function rmheart(ele){
		
		$.ajax({
			url:"rmheart.do?seq=${dto.seq}&sessionid=${sessiondto.userid}",
			method: "post",
			success:function(data){ 
				if(data.data === false){
					toastr.options.positionClass = "toast-top-right";
					toastr.options.timeOut = 1000;
					toastr.warning("로그인이 필요합니다");
				}else if(data.data === 'differenet'){
					location.href="error.do";
				}else{
					if(data.data === '성공'){
						ele.children[2].innerText = parseInt(ele.children[2].innerText) - 1;
						ele.children[0].classList.remove('fas');
						ele.children[0].classList.add('far');
						ele.setAttribute('onclick', 'addheart(this)');
						
						toastr.options.positionClass = "toast-top-right";
						toastr.options.timeOut = 700;
						toastr.success("찜 해제 완료")
					}else{
						toastr.options.positionClass = "toast-top-right";
						toastr.warning("해제 실패");
					}
				}
			},
			error:function(){
				toastr.options.positionClass = "toast-top-right";
				toastr.warning("통신 실패");
			}
		})
	}
	
	document.addEventListener("DOMContentLoaded", ()=>{
		
		//admin SELECT
		document.getElementById('admin-select').addEventListener("change", function(){
			if(this.value === "3"){
				document.getElementById('admin-textarea').value = '';
				document.getElementById('admin-textarea').style.display = 'block';
			}else{
				document.getElementById('admin-textarea').style.display = 'none';
			}
		});
		//user SELECT
		document.getElementById('report-select').addEventListener("change", function(){
			if(this.value === "2"){
				document.getElementById('report-textarea').value = '';
				document.getElementById('report-textarea').style.display = 'block';
			}else{
				document.getElementById('report-textarea').style.display = 'none';
			}
		});
		 		  
		//shown.bs.modal 이벤트가 느려서 직접 생성
		document.getElementById('report').addEventListener('click', ()=>{
			document.getElementById('report-select').options[0].selected = true;
			document.getElementById('report-textarea').style.display = 'none';
			document.getElementById('report-textarea').value = '';
		}, false);
		document.getElementById('admindel').addEventListener('click', ()=>{
			document.getElementById('admin-select').options[0].selected = true;
			document.getElementById('admin-textarea').style.display = 'none';
			document.getElementById('admin-textarea').value = '';
		}, false);
		document.getElementById('suggestbtn').addEventListener('click', ()=>{
			document.getElementsByClassName('message')[0].style.display = 'none';
			document.getElementById('suggestprice').value = '';
		}, false);
		
		
		
		var chat = document.getElementById('chat');
		chat.addEventListener('shown.bs.modal', function () {
			this.style.display = 'none';
			setTimeout(function(){
				document.getElementById('chat').style.display = 'block';
			} ,500);
		})
		
		//가격제안
		document.getElementById('suggestprice').onkeyup = function(){
 			this.value = this.value.replace(/,/g,'');
 			this.value = this.value.replace(/(^0+)|[^0-9]/g,'');
			var	val = parseInt(this.value);
			var msg = document.getElementsByClassName('message')[0];
			var price = parseInt(document.getElementById('price').getAttribute('value'))*0.7;
			
			switch(true){
			case (isNaN(val)): msg.innerHTML='판매가격을 입력해주세요'; msg.style.display = 'block'; break;
			case (val < price): msg.innerHTML='최소가격은 70%이하일 수 없습니다.'; msg.style.display = 'block'; break;
			default : msg.style.display = 'none'; break;
			}
			this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

	})
	
	

	
</script>

</head>
<body>

	<br>

	<div class="container" id="mainbody">
	
	    <div class="row">
	        <div class="col-12">
	        	<div>
	        		<span class="bold">카테고리 > </span><span id=category>${dto.category }</span>
	        	</div>
	        	
	        	<!-- 이미지 -->
	        	<div>
					<div class="slider-1">
					    <div class="slides">

					    </div>
					    <div class="page-btns">
					    
					    </div>
					    <div class="side-btns">
					        <div>
					            <span><i class="fas fa-angle-left align-middle"></i></span>
					        </div>
					        <div>
					            <span><i class="fas fa-angle-right align-middle"></i></span>
					        </div>
					    </div>
					</div>	
					
					<script type="text/javascript">
					var imglist = '${dto.imglist}'.split(',');
					var imgListLength = imglist.length;
					var slide = document.querySelector('.slides');
					imglist.forEach( img => {
						slide.innerHTML += '<div style="background-image:url('+img+');"></div>';							
					});
					slide.children[0].classList.add('active');
					
					var page = document.querySelector('.page-btns');
					for(var i = 0; i < imgListLength; i++){
						page.innerHTML += '<div></div>';
					}
					page.children[0].classList.add('active');
					
					//-----trade : 거래상태-----
					var trade = '${dto.trade}';
					if(trade === 'N'){
						document.querySelector('.slider-1').style.setProperty('opacity','0.5');
					}
					
					
					$('.slider-1 > .page-btns > div').click(function(){
					    var $this = $(this);
					    var index = $this.index();
					    
					    $this.addClass('active');
					    $this.siblings('.active').removeClass('active');
					    
					    var $slider = $this.parent().parent();
					    
					    var $current = $slider.find(' > .slides > div.active');
					    
					    var $post = $slider.find(' > .slides > div').eq(index);
					    
					    $current.removeClass('active');
					    $post.addClass('active');
					});

					// 좌/우 버튼 추가 슬라이더
					$('.slider-1 > .side-btns > div').click(function(){
					    var $this = $(this);
					    var $slider = $this.closest('.slider-1');
					    
					    var index = $this.index();
					    var isLeft = index == 0;
					    
					    var $current = $slider.find(' > .page-btns > div.active');
					    var $post;
					    
					    if ( isLeft ){
					        $post = $current.prev();
					    }
					    else {
					        $post = $current.next();
					    };
					    
					    if ( $post.length == 0 ){
					        if ( isLeft ){
					            $post = $slider.find(' > .page-btns > div:last-child');
					        }
					        else {
					            $post = $slider.find(' > .page-btns > div:first-child');
					        }
					    };
					    
					    $post.click();
					});
					
					if(trade !== 'N'){
						setInterval(function(){
						    $('.slider-1 > .side-btns > div').eq(1).click();
						}, 6000);	
					}
					
					</script>
	        	</div>
	        	<!--  -->

				<!-- 유저정보 -->
				<div class="row margin" style="padding-left: 2.5%; padding-right: 2.5%;">
					<div class="col-8">
						<div class="row">
							<div class="col-lg-1 col-2">
								<span class="fas fa-user-circle fa-2x h-100" id="user-circle"></span>
							</div>
							<div class="col-lg-11 col-10">
								<a href="person.do?id=${dto.id }"><span id="writer" class="bold">${dto.id }</span><br></a>
								<span class="align-middle"> <span id="regdate"
									class="align-middle"></span>&nbsp;&nbsp; <script
										type="text/javascript">
							var regdate = document.getElementById('regdate');
							regdate.innerHTML = getTime('${dto.regdate}');
						</script> <span class="fas fa-eye fa-lg"></span> <span id="hit"
									class="align-middle"> ${dto.hit }</span>
								</span>
							</div>
						</div>
					</div>
					<!-- user report -->
					<div class="col-4">
						<div style="text-align: right; height: 100%;">
							<span id="report" style="display: none;"><span
								class="fas fa-exclamation-triangle h-100 fa-lg gray"
								data-bs-toggle="modal" data-bs-target="#reportModal"></span></span>
						</div>
					</div>
				</div>
				
	        </div>
	        
	        
	        <div class="col-12">
	        	<div style="padding-left:2%; padding-right:2%;">
	        	
	        		<div class="col"><hr class="hr" style="height: 1px; margin:0;"></div>
	        		
	        		<div class="margin">
	        		<div class="titleandprice bold">
	        			<span class="align-middle">
	        			<span class="align-middle bold" id="issale"></span>
	        			
	        			<script type="text/javascript">
	        				var issale = document.getElementById('issale');
	        				if(trade === 'Y'){
	        					issale.innerHTML = '[판매]';
	        					issale.style.setProperty('color','rgb(0, 191, 121)');
	        				}else if(trade === 'N'){
	        					issale.innerHTML = '[완료]';
	        					issale.style.setProperty('color','gray');
	        				}else{
	        					issale.innerHTML = '[예약]';
	        					issale.style.setProperty('color','#ff8a3d');
	        				}
	        			</script>
	        			
	        			<span class="align-middle bold" id="title">${dto.title }</span>
	        			</span>
	        		</div>
	        		<div class="titleandprice bold" id="price" value="${dto.price }" style="color:#ff8a3d;"></div>
	        		
	        			<script type="text/javascript">
							var price = document.getElementById('price');
							price.innerHTML = '${dto.price}'.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
							
							if(trade === 'N'){
								price.style.setProperty("text-decoration", "line-through");
								price.style.setProperty("color","lightgray");
							}
	        			</script>
	        		
	        		<div><span class="bold">상품 상태 &nbsp;&nbsp;</span><span id="quality">${dto.quality }</span></div>
	        		<div><span class="bold">배송 방법 &nbsp;&nbsp;</span><span id="delivery">${dto.delivery }</span></div>
	        		<div><span class="bold">거래 지역 &nbsp;&nbsp;</span><span id="placelist"></span></div>
						<script type="text/javascript">
							var place = document.getElementById('placelist');
							var list = '${dto.place}'==''? null : '${dto.place}'.split(',');
							if(list){
								list.forEach(li =>{
									place.append(createBtn(li));
								});
							}else{
								place.append('-')
							}
							
							function createBtn(name){
								var btn = document.createElement('button');
								btn.classList.add('place-btn','align-top');
								btn.setAttribute('onclick','window.open(`https://map.naver.com/v5/search/' + name +'`)');
								btn.setAttribute('value',name);
								btn.innerHTML = name;
								return btn;
							}
						</script>	
					</div>        		
	        		
	        		<div class="col"><hr class="hr" style="height: 1px; margin:0;"></div>
	        	
	        	<!-- 연락처보기 -->
	        		<div class="margin">
	        		<div>
	        			<span style="cursor: pointer;" onclick="seeAddr()" id="seeAddr-span">
		        			<span class="align-middle fas fa-address-card fa-lg"></span>
		        			<span class="align-middle">판매자 연락처 보기 </span>
	        			</span>
	        		</div>
	        		<div><span style="color:gray;" id="addrMasking"></span></div>
	        			<script>
	        				if(trade === 'N'){
	        					document.getElementById('addrMasking').innerHTML = '<span class="gray bold">* 거래가 완료되어 판매자 정보를 확인할 수 없습니다.</span>';
	        					document.getElementById('seeAddr-span').setAttribute('onclick','');
	        					document.getElementById('seeAddr-span').style.setProperty('cursor','default');
	        				}else{
	        					var email = '${dto.email}'.split('@');
		        				var phone = '${dto.phone}'.split('-');
		        				document.getElementById('addrMasking').append(email[0].substring(0,2)+'*****@'+email[1] + ' | ' +  phone[0] +'-'+ phone[1].substring(0,2)+'**-'+phone[2].substring(0,2)+'**');
	        				}
	        				
	        				function seeAddr(){
	        					if(sessionid ===''){
	        						toastr.options.positionClass = "toast-top-right";
	        						toastr.options.timeOut = 1000;
	        						toastr.warning("로그인이 필요합니다");
	        						return;
	        					}
	        					
	        					var seeAddr = document.getElementById('seeAddr');
	        					seeAddr.style.setProperty('display','block');
	        					$(seeAddr).animate({opacity:'1'},200);
	        				}
	        			
	        			</script>
	        		<br>
	        		
	        		
	        	<!-- 유저별 메뉴 -->
	        		<div>
	        			<div id="user" style="text-align: right; display:none;">
	        				<span class="align-middle">
		        				<button type="button" class="w-100" id="btn-heart" onclick="addheart(this);">
		        					<span class="align-middle far fa-heart fa-lg"></span><br>
		        					<span id="heart" class="align-top heart">${dto.heart }</span>
		        				</button>
	        				</span>
	        				
	        				<script type="text/javascript">
	        				if(sessionid != '' && sessionUserType != 'admin' && sessionid != writer){
	        					$.ajax({
		        					url:"confirmheart.do?seq=${dto.seq}&sessionid=호갱", //${sessiondto.userid}
		        					method: "post",
		        					success:function(data){ 
		        						if(data.data){
		        							var ele = document.getElementById('btn-heart');
		        							ele.children[0].classList.remove('far');
		        							ele.children[0].classList.add('fas');
		        							ele.setAttribute('onclick', 'rmheart(this)');
		        						}
		        					}
		        				})
	        				}	
	        				</script>
	        				<span class="align-middle">
	        					<button id="suggestbtn" type="button" class="btn-suggest" data-bs-toggle="modal" data-bs-target="#suggestModal"><span class="align-middle fas fa-dollar-sign fa-lg"></span><span class="align-middle"> 가격 제안</span></button>
	        					<button id="chatbtn" type="button" class="btns" data-bs-toggle="modal" data-bs-target="#chat"><span class="align-middle fas fa-comments-dollar fa-lg"></span><span class="align-middle"> 구매 채팅</span></button>
	        				</span>
	        			</div>
	        			
	        			<div id="owner" style="text-align: right; display:none;">
	        				<button class="btn-del w-25" type="button" onclick="del();"><span class="align-middle fas fa-trash-alt fa-lg"></span><span class="align-middle"> 삭제</span></button>
	        				<button class="btn-update w-25" type="button" onclick="renewal();"><span class="align-middle fas fa-arrow-up fa-lg"></span><span class="align-middle"> 위로</span></button>
	        				<button class="btn-update w-25" type="button" onclick="update();"><span class="align-middle fas fa-pencil-alt fa-lg"></span><span class="align-middle"> 수정</span></button>
	        			</div>
	        			
	        			<div id="admin" style="text-align: right; display:none;">
	        				<button id="admindel" class="btn-del w-25" type="button" data-bs-toggle="modal" data-bs-target="#adminModal"><span class="align-middle fas fa-trash-alt fa-lg"></span><span class="align-middle"> 글 삭제</span></button>
	        			</div>
	        		</div>
	        		</div>
	        		
	        		<script type="text/javascript">
	        			switch(true){
						case (sessionUserType === 'admin') : document.getElementById('admin').style.display = 'block'; break;
						case (sessionid === writer) : document.getElementById('owner').style.display = 'block';
													  break; 
						default : document.getElementById('user').style.display = 'block';
			 		  			  document.getElementById('report').style.display = 'block';  
								  if(trade === 'N'){
									  var btnheart = document.getElementById('btn-heart');
									  var btnsuggest = document.getElementById('suggestbtn');
									  var btnchat = document.getElementById('chatbtn');
									  
									  btnheart.classList.add('btn-heart-n');
									  btnheart.setAttribute('onclick','');
									  document.querySelector('#btn-heart > #heart').classList.remove('heart');
									  btnsuggest.classList.remove('btn-suggest');
									  btnsuggest.classList.add('btn-suggest-n');
									  btnsuggest.setAttribute('onclick','');
									  btnchat.classList.remove('btns');
									  btnchat.classList.add('btns-n');
									  btnchat.setAttribute('onclick','');
								  }
	        			}
								  
	        		</script>
	        		
	        	</div>
	        </div>
	    </div>
	    
<!-- 주의사항 -->
	    <div class="row">
	    	<div class="col">
	    		<div style="padding:2%; ">
				<div class="darkgray" style="background-color: rgb(255, 238, 219); border-radius: 8px; padding:2%;">
		        	<b>📢 아래 사항에 유의해주세요.</b><br><br>
					- 등록된 판매 물품과 내용은 개별 판매자가 등록한 것으로서, (주)캠핑트립은 등록을 위한 시스템만 제공하며 내용에 대하여 일체의 책임을 지지 않습니다.<br>
		        	- 구매문의 채팅이나 전화 등을 이용해 연락하고 외부 메신저 이용 및 개인 정보 유출에 주의하세요.<br>
					- 계좌이체 시 선입금을 유도할 경우 안전한 거래인지 다시 한번 확인하세요.<br>
					- 불확실한 판매자(본인 미인증, 해외IP, 사기의심 전화번호)의 물건은 구매하지 말아주세요.<br>					
					💬 기타문의 → <a href="#" target="_blank">캠핑트립 고객센터</a>
				</div>
				</div>
	    	</div>
	    </div>
	    
<!-- 콘텐트-->
	    <div class="row">
	    	<div class="col">
	    		<div style="padding: 2%;" id="content">
					${dto.content }
				</div>
	    	</div>
	    </div>
	    
<!-- 태그 -->
	    <div class="row gray"><div class="col"><div style="padding-left:2%;padding-right:2%;" id="tag"></div></div></div>
	    	<script type="text/javascript">
	    		document.getElementById('tag').innerHTML = '${dto.tag}'.split(',').join("\u00a0\u00a0\u00a0");
	    	</script>
		<div class="row"><div class="col"><hr class="hr" style="height: 2px;"></div></div>
		
		
<!--  추천매물 -->
		<br><br><br>
		<div class="row">
			<div class="col-8">
				<h3>이런 매물은 어떠세요?</h3><br>
			</div>
			<div class="col-4" style="text-align: right;">
				<h5><a href="list.do?keyword=">중고 메인 <span></span></a></h5>
			</div>
		</div>	
		
		<div class="row" id="popular">

			<div class="row" id="popular-hit-list" style="margin:0 auto;">
				<div class="col-12">
					<h5>최근 많은 회원님들이 조회했어요</h5>
					<br><br>
				</div>
			</div>
				
		</div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1a06c511e7475a92c07a62d70ae0304&libraries=services"></script>
		<script type="text/javascript">
				var geocoder = new kakao.maps.services.Geocoder();
 				//current 
 				let latitude , longitude;
 				let placelist = [];
 				let resultlist = [];
				
 				function getCurrent(callback){
 					
 					return new Promise(function(resolve, reject){
 						navigator.geolocation.getCurrentPosition(function(pos) {
 						    resolve(pos);
 						})
 					});
 				}
 				
/*  				function test(place){
 					let arr = new Array();
					let callback = function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							let obj = new Object();
							obj.x = result[0].x;
							obj.y = result[0].y;
							obj.name = result[0].address_name;
							arr.push(obj);
						}
					};
 					return new Promise(function(resolve, reject){
 						
						place.forEach( p => {
							geocoder.addressSearch(p, callback);
						});
						resolve(arr);
 					});
 				} */
				
		
 				$.ajax({
					url:"getpopularhit.do",
					async:false,
					data:{"seq":${dto.seq}},
					method: "post",
					success:function(datalist){ 
						var list = $.parseJSON(datalist.data);	
						var popular_hit_list = document.getElementById('popular-hit-list');
						
						list.forEach( data => {
							
							placelist.push(data.place);
							
							var hitdata = 
								'<div class="popular-hit-ele col-lg-4 col-6" style="margin-bottom:10px;">'+
								'<div style="cursor:pointer;" onclick="location.href=`selectone.do?seq='+ data.seq +'`" >'+		
								'<div style="height:270px;">'+
								'<div style="height:70%; border-radius: 8px; background-image:url('+ data.imglist.split(',')[0] +'); background-position: center; background-size: cover;">'+
								'</div>'+
								'<div style="height:29%; width:100%;">'+
								'<h5 class="popular-title" style="margin-top:5px;">'+ data.title +'</h5>'+
								'<div class="bold"><span>'+ data.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'</span> 원</div>'+
								'<div>'+
								'<span class="place"></span>&nbsp;&nbsp;'+
								'<span class="distance" style="color:#ff8a3d;"></span>'+
								'</div></div></div></div></div>';
								
							popular_hit_list.innerHTML += hitdata;
						});
						
					},
					error: function(){
						toastr.options.positionClass = "toast-top-right";
						toastr.warning("통신 실패");
					}
				}); 
 				
				let callback = function(result, status) {
					if (status === kakao.maps.services.Status.OK) {
						
 						let obj = new Object();
						obj.x = result[0].x;
						obj.y = result[0].y;
						obj.name = result[0].address_name;
						resultlist.push(obj);  
						
					}
				};
				
 				function getaddress(place){
 					
 					return new Promise(function(resolve, reject){
 						geocoder.addressSearch(place, (result, status) => {
 							if (status === kakao.maps.services.Status.OK) {
 						    	resolve(result);
 							}
 						})
 					});
 				}
				
				//geocoder.addressSearch(p, callback);
 				
				getCurrent().then(function(data){
					var latitude = data.coords.latitude;
					var longitude = data.coords.longitude;
					var children = document.getElementsByClassName('popular-hit-ele');
					
					placelist.forEach( places => {
						var place = places.split(',');
						
						var array = new Array();

						for(var i = 0 ; i < place.length; i++){
							getaddress(place[i]).then(function(result){
								console.log(result);
							});
						}	
						
					});
					
					
					
					
					
					//console.log(resultlist);
					//최단거리
/* 					for(var i = 0; i < resultlist.length; i++){
						
						let name = '';
						let km = 99999;
						resultlist[i].forEach( result => {
							
							var distance = getDistanceFromLatLonInKm(latitude, longitude, result.x, result.y);
							if(distance < km){
								km = distance;
								name = result.name;
							}
							
						});
						
						$(children[i]).find('.price').html(name);
						$(children[i]).find('.distance').html(km);
					} */
					
				}); 
 				
 				function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
 					 function deg2rad(deg) {
 					 return deg * (Math.PI/180) 
 					} 
 					var R = 6371; // Radius of the earth in km 
 					var dLat = deg2rad(lat2-lat1); // deg2rad below 
 					var dLon = deg2rad(lng2-lng1); 
 					var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2); 
 					var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
 					var d = R * c; // Distance in km 

 					return d; 
 				}
					

 					

 				
 				
 				
 				
		
		</script>
		
	</div>
	<br><br><br><br><br><br><br><br>
	
	
<!-- 연락처보기 -->
	<div id="seeAddr" style="display:none; opacity: 0;" class="shadow-lg">
		<div class="row">
			<div class="col-10"><b>판매자 연락처</b></div>
			<div class="col-2" style="text-align:right;"><span style="cursor: pointer;" onclick="addrclear()" class="fas fa-times fa-lg"></span></div>
		</div>
		<br>
		<div style="padding:20px; background-color: #f8f9fa" id="개인정보">
			
		</div>
		<script type="text/javascript">
			var agree = '${dto.agree}';
			
			if(agree === 'Y'){
				document.getElementById('개인정보').innerHTML = '${dto.email}'+'<br>'+'${dto.phone}';
			}else{
				document.getElementById('개인정보').innerHTML = '<b>연락처를 비공개한 회원입니다.<br> ※구매 채팅 또는 가격 제안하기 기능을 이용해보세요.</b>';
			} 
			

			addrclear = ()=>{
				document.getElementById('seeAddr').style.setProperty('opacity','0');
				document.getElementById('seeAddr').style.display='none'; 
			}
		</script>
		<br>
		판매 완료되거나 글이 수정된 지 한 달이 지난 경우,<br>
		전화번호와 이메일 주소가 노출되지 않습니다.
		<br><br>
		<b><a href="https://cyberbureau.police.go.kr/prevention/sub7.jsp?mid=020600" target="'_black">*휴대폰 및 계좌번호 사기조회 서비스 이동 ></a></b>
	</div>



	<!-- Modal admin delete-->
	<div class="modal fade" id="adminModal" tabindex="-1" aria-labelledby="adminModal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    
	 	<!-- 폼 -->
	    <form action="admindel.do" method="post" onsubmit="return adminDel()">
	  	<!-- hidden -->
	    <input type="hidden" name="seq" value="${seq }">
	    <input type="hidden" name="adminid" value="${userid }">
	    
	      <div class="modal-header">
	        <h5 class="modal-title bold" id="exampleModalLabel">게시글 삭제 사유 선택</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<select id="admin-select" class="select w-100">
				<option value="0" selected>상품 도배 행위, 광고성 게시글</option>
				<option value="1">욕설/반말/부적절한 언어</option>
				<option value="2">사기/허위 게시글</option>
				<option value="3">직접 입력</option>
			</select>
			<br><br>
			<textarea id="admin-textarea" name="reason" style="width: 100%; height:200px; resize: none; display:none;"></textarea>
	      </div>
	      <div class="modal-footer" style="border:none;">
	        <button type="button" class="btn-del" data-bs-dismiss="modal">close</button>
	        <button type="submit" class="btn-del"><span class="align-middle fas fa-trash-alt fa-lg"></span></button>
	      </div>
	    </form>
	    
	    </div>
	  </div>
	</div>
	
	
	<!-- modal user-report -->
	<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    
	 	<!-- 폼 -->
	    <form action="report.do" method="post" onsubmit="return report()">
	  	<!-- hidden -->
	    <input type="hidden" name="seq" value="${seq }">
	    <input type="hidden" name="reportid" value="${userid }">
	    
	      <div class="modal-header">
	        <h5 class="modal-title bold" id="exampleModalLabel">신고 사유 선택</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	*허위 신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니<br>
	      	신중하게 신고해주세요 <br><br>
	      	<select id="report-select" class="select w-100">
				<option value="0" selected>상품 도배 행위, 광고성 게시글</option>
				<option value="1">욕설/반말/부적절한 언어</option>
				<option value="2">직접 입력</option>
			</select>
			<br><br>
			<textarea id="report-textarea" name="reason" style="width: 100%; height:200px; resize: none; display:none;"></textarea>
			
			<!-- 자료첨부 -->
			<label for="avatar">증거자료첨부:</label> <br>
			<input type="file"
			       id="file" name="file"
			       accept="image/png, image/jpeg" multiple>
						
	      </div>
	      <div class="modal-footer" style="border:none;">
	        <button type="button" class="btn-del" data-bs-dismiss="modal">close</button>
	        <button type="submit" class="btn-del">신고</button>
	      </div>
	    </form>
	    
	    </div>
	  </div>
	</div>
	
	<!--  modal user-suggest -->
	<div class="modal fade" id="suggestModal" tabindex="-1" aria-labelledby="reportModal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    
	 	<!-- 폼 -->
	    <form action="suggest.do" method="post" onsubmit="return suggest()">
	  	<!-- hidden -->
	    <input type="hidden" name="seq" value="${seq }">
	    <input type="hidden" name="suggestid" value="${userid }">
	    
	      <div class="modal-header">
	        <h5 class="modal-title bold" id="exampleModalLabel">가격 제안</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	*가격제안은 한번만 가능합니다. 신중하게 제안을 해주세요.<br>
	      	가격제안은 물품가격의 70%까지만 가능합니다.
			<br><br>
            <div>
            	<input type="text" placeholder="가격을 입력해주세요" class="border-radius" name="suggestprice" id="suggestprice" autocomplete="off"/><span class="won">&nbsp;원</span>
        	</div>
        	<div class="message red" id="suggestmessage"></div>
	      </div>
	      <div class="modal-footer" style="border:none;">
	        <button type="button" class="btn-del" data-bs-dismiss="modal">close</button>
	        <button type="submit" class="btn-suggest">제안하기</button>
	      </div>
	    </form>
	    
	    </div>
	  </div>
	</div>
	
	

	<!--  modal user-chat -->
	<div class="modal " id="chat" tabindex="-1" aria-labelledby="adminModal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h5 class="modal-title bold" id="exampleModalLabel">캠핑가자</h5>
	        <!-- 예약신청 popover 버튼구현 검토 -->
	        <button type="button" class="btn-del" style="margin-left: 30px;"><span class="fas fa-calendar-check fa-lg"></span> 예약신청</button>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <div class="modal-body">
			<div class="container" style="padding-right: 0; padding-left: 0; height:500px;" id="chatroom">
				<div class="row" style="">
					<div class="col-12" style="" >
						<div style='width:50%; height:auto; border-radius: 5px; background-color: rgb(99, 170, 255); padding:5px;'>
							ㅇ라ㅓㅣㄴ아러먀ㅣㅈ더리나어랴미더리ㅓㄴ야ㅣ러ㅣㄴ야러미냥러ㅣㅁ야너림냥러ㅣㄴ아러ㅣ냐더sdfslkdfjlskdfjsldifslieflsiesfldkflasdfsdfsefse
						</div>
					</div>

				</div>
			</div>
	      </div>
	      
	      <div class="modal-footer">
	      	<div class="container"style="padding-right: 0; padding-left: 0; height:120px;">
				<div class="row" style="--bs-gutter-x: 0; height: 100%;">
						<div class="col-10"><textarea style="border:none; display:block; outline:none; width:100%; height:100%; resize: none;"></textarea></div>
						<div class="col-2">
							<button type="button" style="outline:none; border:none; width:100%; height:100%; background-color: rgb(99, 170, 255); color:white;"><span class="fas fa-paper-plane fa-2x"></span></button>
						</div>
				</div>	      	
	      	</div>
	      </div>
	    
	    </div>
	  </div>
	</div>

</body>
</html>


















































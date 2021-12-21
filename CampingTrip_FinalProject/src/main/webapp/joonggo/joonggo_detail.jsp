<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//UserDto userdto = (UserDto)session.getAttribute("login");
	String sessionid = null;
	String usertype = null;
	String penalty = null;
	/*if(userdto != null){
		userid = userdto.getUserid();
		userType = userdto.getUsertype();
		penalty = userdto.getPenalty();
	}*/
%>

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

@media screen and (max-width: 767px) { #mainbody { font-size: 13px; } #thumbnail{max-height: 300px; max-width: 100%;}}
@media screen and (min-width: 768px) and (max-width: 991px) { #mainbody { font-size: 13px; } #thumbnail{max-height: 350px; max-width: 100%;}}
@media screen and (min-width: 992px) and (max-width: 1199px) { #mainbody { font-size: 14px; } #thumbnail{max-height: 400px; max-width: 100%;}}
@media screen and (min-width: 1200px) and (max-width: 1399px) { #mainbody { font-size: 15px; } #thumbnail{max-height: 450px; max-width: 100%;} #mainbody > .row{margin-left:3%; margin-right:3%;}}
@media screen and (min-width: 1400px) { #mainbody { font-size: 16px; } #thumbnail{max-height: 500px; max-width: 100%;} #mainbody > .row{margin-left:8%; margin-right:8%;}}

#mainbody, .modal{font-family: NanumBarunGothic;}
.hr{color: #ff8a3d}
.bold{font-weight: bold;}
.gray{color:gray;}
.red{color:red;}
.message{display:none; margin-top:1.5%;}
a{text-decoration: none; color:black;}

.btns{background-color: #FFFFFF; border: solid 2px rgb(0, 191, 121); border-radius: 5px; padding-right:3%; padding-left:3%; color : rgb(0, 191, 121); font-weight: bold; height: 50px;}
.btns:hover{
	transition: all 0.3s;
	border: solid 2px rgb(0, 191, 121);
	background-color: rgb(0, 191, 121);
	color : white;
}

#btn-heart{background-color: #FFFFFF; border: solid 2px rgb(255, 59, 0); color : rgb(255, 59, 0); border-radius: 5px; padding-right:18px !important; padding-left: 18px !important;  font-weight: bold; height: 50px; 	font-size: 13px !important; }
#btn-heart:hover{
	transition: all 0.3s;
	border: solid 2px rgb(255, 59, 0);
	background-color: rgb(255, 59, 0);
	color : white;
}
#btn-heart:hover #heart{transition: all 0.3s; color:#FFF !important;}
#heart{color: #000 !important;}

.btn-del{background-color: #FFFFFF; border: solid 2px gray; color : gray; border-radius: 5px; padding-right:3%; padding-left:3%; font-weight: bold; height: 50px;}
.btn-del:hover{
	transition: all 0.3s;
	border: solid 2px gray;
	background-color: gray;
	color : white;
}

.btn-suggest{background-color: #FFFFFF; border: solid 2px #ff8a3d; color : #ff8a3d; border-radius: 5px; padding-right:3%; padding-left:3%; font-weight: bold; height: 50px;}
.btn-suggest:hover{
	transition: all 0.3s;
	border: solid 2px #ff8a3d;
	background-color: #ff8a3d;
	color : white;
}

.btn-update{background-color: #FFFFFF; border: solid 2px #FFB98B; color : #FFB98B; border-radius: 5px; padding-right:3%; padding-left:3%; font-weight: bold; height: 50px;}
.btn-update:hover{
	transition: all 0.3s;
	border: solid 2px #FFB98B;
	background-color: #FFB98B;
	color : white;
}

        
#adminModal .modal-header, #reportModal .modal-header {background-color: lightgray;}

#suggestModal .modal-header{background-color: #ff8a3d; color:white;}
#suggestprice {outline: none;}

#chat .modal-header{background-color: lightgray; color: black;}
#chat .modal-footer{background-color: lightgray;}

#admin-select, #admin-textarea, #report-select, #report-textarea {border: 2px solid darkgray; border-radius: 5px; outline: none;}

#user-circle{ color:gray; }
#report{color:gray; font-size: 25px !important; cursor: pointer;}

#writer{font-size: 17px !important;}

/* toast */
.toast-success {background-color: rgb(255, 59, 0) !important;}
.toast-error {background-color: #BD362F !important;}
.toast-info {background-color: #2F96B4 !important;}
.toast-warning {background-color: #F89406 !important;}
.toast-top-right {top: 2%;}

</style>

<script type="text/javascript">
const sessionUserType = 'general';
const sessionid = '캠핑가자1';
const boardwriter = '캠핑가자';

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
			//location.href="delete.do?seq=" + ${seq };
		}
	}
	function update(){
		//location.href="update.do?seq=" + ${seq};
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
		ele.children[2].innerText = parseInt(ele.children[2].innerText) + 1;
		toastr.options.positionClass = "toast-top-right";
		toastr.options.timeOut = 700;
		toastr.success("찜 추가 완료");
		$(ele.children[0]).removeClass('far');
		$(ele.children[0]).addClass('fas');
		ele.setAttribute('onclick', 'rmheart(this)');
	}
	
	function rmheart(ele){
		ele.children[2].innerText = parseInt(ele.children[2].innerText) - 1;
		toastr.options.positionClass = "toast-top-right";
		toastr.options.timeOut = 700;
		toastr.success("찜 해제 완료");
		$(ele.children[0]).removeClass('fas');
		$(ele.children[0]).addClass('far');
		ele.setAttribute('onclick', 'addheart(this)');
	}
	
	document.addEventListener("DOMContentLoaded", ()=>{
		
 		switch(true){
		case (sessionUserType === 'admin') : document.getElementById('user').style.display = 'none'; 
											 document.getElementById('report').style.display = 'none';
											 document.getElementById('owner').style.display = 'none'; break;
		case (sessionid === boardwriter) : document.getElementById('user').style.display = 'none'; 
		 								   document.getElementById('admin').style.display = 'none'; 
		 								   document.getElementById('report').style.display = 'none'; break;
		default : document.getElementById('owner').style.display = 'none';
		 		  document.getElementById('admin').style.display = 'none'; break;}	 
		
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
		
		
		
		//popover
		var popover = new bootstrap.Popover(document.querySelector('.popover-dismiss'), {
			  trigger: 'focus'
		});
		
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
	<br><br>

	<div class="container" id="mainbody">
		<div class="row">
			<div class="col-8">
				<div class="row">
				<div class="col-lg-1 col-md-1 col-2">
					<span class="fas fa-user-circle fa-3x h-100" id="user-circle"></span>
				</div>
				<div class="col-lg-11 col-md-11 col-10">
					<a href="#"><span id="writer" class="bold">캠핑고고</span><br></a>
					<span class="align-middle">
					<span id="regdate" class="align-middle" >2021-05-29 13:29:30</span>&nbsp;
					<span class="fas fa-eye fa-lg" style="color:gray;"></span>&nbsp;
					<span id="hit">50</span>
					</span>
				</div>
				</div>
			</div>
			<div class="col-4">
				<div style="text-align: right; height:100%;">
					<span id="report"><span class="fas fa-exclamation-triangle h-100" data-bs-toggle="modal" data-bs-target="#reportModal"></span></span>
				</div>
			</div>
		</div>
		
		<div class="row"><div class="col"><hr class="hr" style="height: 2px;"></div></div>
	
	    <div class="row">
	        <div class="col-lg-6 col-12">
	        		<div>
	        			<span class="bold">카테고리 > </span><span id=category>캠핑 용품</span>
	        		</div>
	        	<div style="text-align: center; padding:2%; padding-left:8%; padding-right:8%;">
	        		<img id="thumbnail" class="rounded" src="https://img.wizwid.com/PImg/706861/bsc/706861593.jpg">
	        	</div>
	        </div>
	        <div class="col-lg-6 col-12">
	        	<div style="padding:2%;">
	        		<div style="font-size: 16pt;">
	        			<span class="align-middle">
	        			<span class="align-middle bold" id="issale" style="color:rgb(0, 191, 121)">[판매중]</span>
	        			<span class="align-middle bold" id="title">거의 새것 캠핑용품 일괄 판매 급처 정말 싸게팔아요..</span>
	        			</span>
	        		</div>
	        		<div class="bold" id="price" style="font-size: 18pt;" value="55000">55,000<span>원</span></div>
	        		
	        		<div class="col"><hr class="hr" style="height: 1px;"></div>
	        		<div><span class="bold">상품 상태 &nbsp;&nbsp;</span><span id="quality">거의 새 것</span></div>
	        		<div><span class="bold">배송 방법 &nbsp;&nbsp;</span><span id="delivery">직거래, 택배거래</span></div>
	        		<div><span class="bold">거래 지역 &nbsp;&nbsp;</span><span id="placelist">잠실동, 삼성동</span></div>
	        		<div class="col"><hr class="hr" style="height: 1px;"></div>
	        		<div>
	        			<span style="cursor: pointer;" tabindex="0" class="popover-dismiss" data-bs-toggle="popover" data-bs-trigger="focus" title="연락처 보기" data-bs-content="">
	        				<script>
	        					document.getElementsByClassName('popover-dismiss')[0].setAttribute('data-bs-content', 'email : ' + '123asdfsdf4@naver.com' + '\nphone : ' + '');
	        				</script>
		        			<span class="align-middle fas fa-address-card fa-lg"></span>
		        			<span class="align-middle">연락처 보기 </span>
	        			</span>
	        		</div>
	        		<div><span style="color:red;">본인인증이 미완료된 회원입니다.</span></div>
	        		<br>
	        		<div>
	        			<div id="user" style="text-align: right;" class="w-100">
	        				<span class="align-middle">
		        				<button type="button" id="btn-heart" onclick="addheart(this);">
		        					<span class="align-middle far fa-heart fa-lg"></span><br>
		        					<span id="heart" class="align-top">25</span>
		        				</button>
	        				</span>
	        				
	        				
	        				<span class="align-middle w-100" style="height:100%;">
	        					<button id="suggestbtn" type="button" class="btn-suggest w-25" data-bs-toggle="modal" data-bs-target="#suggestModal"><span class="align-middle fas fa-dollar-sign fa-lg"></span><span class="align-middle"> 가격 제안</span></button>
	        					<button type="button" class="btns w-25" onclick=""><span class="align-middle fas fa-envelope fa-lg"></span><span class="align-middle"> 문자</span></button>
	        					<button type="button" class="btns w-25" data-bs-toggle="modal" data-bs-target="#chat"><span class="align-middle fas fa-comments-dollar fa-lg"></span><span class="align-middle"> 구매 채팅</span></button>
	        				</span>
	        			</div>
	        			<div id="owner" style="text-align: right;">
	        				<button class="btn-del w-25" type="button" onclick="del();"><span class="align-middle fas fa-trash-alt fa-lg"></span><span class="align-middle"> 삭제</span></button>
	        				<button class="btn-update w-25" type="button" onclick="update();"><span class="align-middle fas fa-pencil-alt fa-lg"></span><span class="align-middle"> 수정</span></button>
	        			</div>
	        			<div id="admin" style="text-align: right;">
	        				<button id="admindel" class="btn-del w-25" type="button" data-bs-toggle="modal" data-bs-target="#adminModal"><span class="align-middle fas fa-trash-alt fa-lg"></span><span class="align-middle"> 글 삭제</span></button>
	        			</div>
	        		</div>
	        	</div>
	        	
	        	<!-- 경고문구 -->
	        	<div class="gray">
	        		<br>
	        		<b>! 아래 사항에 유의해주세요.</b><br>
	        		카페 구매문의 채팅이나 전화 등을 이용해 연락하고 외부 메신저 이용 및 개인 정보 유출에 주의하세요.<br>
					계좌이체 시 선입금을 유도할 경우 안전한 거래인지 다시 한번 확인하세요.<br>
					불확실한 판매자(본인 미인증, 해외IP, 사기의심 전화번호)의 물건은 구매하지 말아주세요.<br>
					등록된 판매 물품과 내용은 개별 판매자가 등록한 것으로서, (주)캠핑트립은 등록을 위한 시스템만 제공하며 내용에 대하여 일체의 책임을 지지 않습니다.
	        	</div>
	        </div>
	    </div>
	    
	    
	    <div class="row">
	    	<div class="col-xs-12">
				<div class="notice_text" style="background-color: rgb(255, 238, 219); margin-top:1.5%;">
					📢 거래에 관한 의무와 책임은 각 판매자에게 있습니다.
					<br> [AD] [로또리치] 로또 1등 당첨번호 받기! ▶ 
					<a href="https://vvd.bz/2wk" target="_blank" class="link">https://vvd.bz/2wk</a> 
					<br>
					💬 기타문의 → <a href="#" target="_blank"></a>
				</div>
	    	</div>
	    </div>
	    
	    <div class="row"><div class="col"><hr class="hr" style="height: 2px;"></div></div>
	    <div class="row"style="padding: 2%;">
	    	<div id="content">
	    		<pre>안녕하세요. 캠핑용 의자랑 기타 물품 판매합니다 
사놓고 쓰질 않았어요
직거래 원합니다
01099225401
	    		</pre>
	    		<img src="https://img.wizwid.com/PImg/706861/bsc/706861593.jpg" width="50%" height="50%"><br>
	    		<img src="https://img.wizwid.com/PImg/707021/bsc/707021453.jpg" width="50%" height="50%"><br>
	    		
	    	
	    	</div>
	    </div>
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


















































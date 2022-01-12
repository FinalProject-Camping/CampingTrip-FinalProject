<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <meta property="og:title" content="${dto.title }" /> 
<meta property="og:url" content="http://localhost:8787/CampingTrip_FinalProject/joonggo_selectone.do?seq=${dto.seq }" />
<meta property="og:type" content="website" />
<meta property="og:image" content="http://oracleksk.p-e.kr/image/icon/logo.PNG" /> 
<meta property="og:description" content="캠핑트립 중고거래" /> 
<meta property="og:image:width" content="300">
<meta property="og:image:height" content="100"> --%>
<title>상세보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="resources/css/nanumfont.css">
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

<style type="text/css">
@media screen and (max-width: 767px) { #mainbody,#seeAddr,#seeLink { font-size: 20px; } .popular-title , .price, .popular-addr{ font-size: 20px !important;} #user-circle{font-size:40px;} .titleandprice{font-size:20px;} .slider-1{height:450px;} .popularimgdiv{height:400px !important;}  .btns, .btns-n{margin-top:5px; width:99% !important; font-size:17px !important; height:80px !important;} #btn-heart, .btn-heart-n, .btn-del, .btn-update, .btn-share{margin-top:5px; width:49% !important; font-size:17px !important; height:80px !important;} .categorydiv{font-size:20px !important;}}
@media screen and (min-width: 768px) and (max-width: 991px) { #mainbody,#seeAddr,#seeLink{ font-size: 21px ;} .popular-title , .price, .popular-addr{ font-size: 21px !important;} #user-circle{font-size:50px;} .titleandprice{font-size:21px;} .slider-1{height:550px;} .popularimgdiv{height:430px !important;} .btns, .btns-n{margin-top:5px; width:99% !important; font-size:18px !important; height:80px !important;} #btn-heart, .btn-heart-n, .btn-del, .btn-update, .btn-share{margin-top:5px; width:49% !important; font-size:18px !important; height:80px !important;} .categorydiv{font-size:21px !important;}}
@media screen and (min-width: 992px) and (max-width: 1199px) { #mainbody,#seeAddr,#seeLink { font-size: 14px; }  #mainbody{width:750px;} .btns, .btns-n{width:50%} #user-circle{font-size:30px;}  .titleandprice{font-size:22px;} .slider-1{height:460px;}}
@media screen and (min-width: 1200px) { #mainbody,#seeAddr,#seeLink { font-size: 15px; }  #mainbody{width:825px;}  .btns, .btns-n{width:50%} #user-circle{font-size:35px;} .titleandprice{font-size:23px;} .slider-1{height:500px;}}  

#mainbody{font-family: NanumBarunGothic;}
.hr{color: gray; }
.bold{font-weight: bold;}
.gray{color:gray;}
.red{color:red;}
.black(color:black;)
.message{display:none; margin-top:1.5%;}
a{text-decoration: none; color:black;}

.place-btn{background-color: rgb(0, 191, 121); border: solid 2px rgb(0, 191, 121); border-radius: 15px; padding-right:12px; padding-left:12px; color : white; font-weight: bold; margin-right:8px;}

.btns{background-color: #FFFFFF; border: solid 1px rgb(0, 191, 121); border-radius: 4px; padding-right:3%; padding-left:3%; color : rgb(0, 191, 121); font-weight: bold; height: 50px;}
.btns:hover{
	transition: all 0.3s;
	border: solid 1px rgb(0, 191, 121);
	background-color: rgb(0, 191, 121);
	color : white;
}
.btns-n{cursor:default !important; background-color: lightgray; border: solid 1px lightgray; border-radius: 5px; padding-right:3%; padding-left:3%; color : white; font-weight: bold; height: 50px;}


#btn-heart{color:rgb(229, 99, 45); background-color: #FFFFFF; border: solid 1px rgb(229, 99, 45); border-radius: 4px; padding-right:18px !important; padding-left: 18px !important;  font-weight: bold; height: 50px; 	font-size: 13px !important; }
#btn-heart:hover{
	transition: all 0.3s;
	border: solid 1px rgb(229, 99, 45);
	background-color: rgb(229, 99, 45);
	color : white;
}
#btn-heart:hover .heart{transition: all 0.3s; color:#FFF !important;}
.heart{color: #000 !important;}
.btn-heart-n{cursor:default !important; background-color: lightgray !important; border: solid 1px lightgray !important; color : white !important; border-radius: 5px; padding-right:18px !important; padding-left: 18px !important;  font-weight: bold; height: 50px; 	font-size: 13px !important; }

.btn-del{background-color: #FFFFFF; border: solid 1px gray; color : gray; border-radius: 4px; padding-right:3%; padding-left:3%; font-weight: bold; height: 50px;}
.btn-del:hover{
	transition: all 0.3s;
	border: solid 1px gray;
	background-color: gray;
	color : white;
}

.btn-update{background-color: #FFFFFF; border: solid 1px #ff9c78; color : #ff9c78; border-radius: 4px;  font-weight: bold; height: 50px;}
.btn-update:hover{
	transition: all 0.3s;
	border: solid 1px #ff9c78;
	background-color: #ff9c78;
	color : white;
}

.btn-share{background-color: #FFFFFF; border: solid 1px gray; color : gray; border-radius: 4px;  font-weight: bold; height: 50px; width:23.5%;}

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
#seeLink{
	width:300px;
	height:auto;
	position: fixed;
	top: 45%;
	left:50%;
	transform: translate(-50%, -50%);
	background-color: white;
}
#seeLink > .row{
	padding-left:30px;
	padding-right:30px;
}

/*rgb(255, 59, 0)*/
/* toast */
.toast-success {background-color: rgb(0, 191, 121) !important;}
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
	margin:2.3%;
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

.margin{margin-top:3.5%; margin-bottom:3.5%;}
.titleandprice{margin-bottom:0.5%;}
.popular-title, .popular-addr{overflow: hidden;text-overflow: ellipsis;word-wrap: break-word;display: -webkit-box;-webkit-line-clamp: 1; -webkit-box-orient: vertical;}


</style>

<script type="text/javascript">
const seq = '${dto.seq}';
const writer = '${dto.id}';

const sessionUserType = '${sessiondto.myrole}'; 
const sessionid = '${sessiondto.myid}';

	//writer
	function del(){
		if(confirm("게시글을 삭제하시겠습니까?")){
			location.href='joonggo_delete.do?writer=${dto.id}&seq=${dto.seq}';
		}
	}
	function update(){
		location.href='joonggo_updateform.do?writer=${dto.id}&seq=${dto.seq}';
	}
	function renewal(){
		$.ajax({
			url:"renewal.do?writer=${dto.id}&seq=${dto.seq}",
			method: "post",
			success:function(data){ 
				if(data.data === '성공'){
					location.href='joonggo_selectone.do?seq=${dto.seq}';
				}else if(data.data === '초과'){
					alert('갱신 횟수 5회 초과하였습니다.');	
				}else if(data.data === '실패'){
					alert('최신글 등록은 하루 1회만 가능합니다.');
				}else{
					location.href="error.do";
				}
			}
		})
	}
	
	//admin
	function adminDel(){
		if(confirm("게시글을 삭제하시겠습니까?")){
			location.href='joonggo_admindelete.do?seq=${dto.seq}';
			//컨트롤러에서 관리자인지검사필요
		}
	}
	
	
	//general user
	function report(){
		$.ajax({
			url:"confirmsession.do",
			method: "post",
			success:function(data){ 
				if(data.data === true){
					popup("joonggo_reportform.do?seq=${dto.seq}&writer=${dto.id}&reportid=${sessiondto.myid}", "신고하기",450,520);
				}else{
					alert('로그인이 필요합니다.');
					location.href='loginform.do';
				}
			}
		})
		
		

	}

	function addheart(ele){
		
		$.ajax({
			url:"joonggo_addheart.do?seq=${dto.seq}&sessionid=${sessiondto.myid}",
			method: "post",
			success:function(data){ 
				if(data.data === false){
					alert('로그인이 필요합니다.');
					location.href='loginform.do';
				}else if(data.data === 'different'){
					location.href="error.do";
				}else{
					if(data.data === '성공'){
						ele.children[2].innerText = parseInt(ele.children[2].innerText) + 1;
						ele.children[0].classList.remove('far');
						ele.children[0].classList.add('fas');
						ele.setAttribute('onclick', 'rmheart(this)');
						
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
			url:"joonggo_rmheart.do?seq=${dto.seq}&sessionid=${sessiondto.myid}",
			method: "post",
			success:function(data){ 
				if(data.data === false){
					alert('로그인이 필요합니다.');
					location.href='loginform.do';
				}else if(data.data === 'different'){
					location.href="error.do";
				}else{
					if(data.data === '성공'){
						ele.children[2].innerText = parseInt(ele.children[2].innerText) - 1;
						ele.children[0].classList.remove('fas');
						ele.children[0].classList.add('far');
						ele.setAttribute('onclick', 'addheart(this)');
						
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
	
	function popup(url, name, width, height){
	    var _width = width;
	    var _height = height;
	 
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
	 
	    window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top +',status=no, toolbar=no, scrollbars=no, resizable=no');
	}
	
</script>

</head>
<body>

	<br>

	<div class="container-fluid" id="mainbody">
	
	    <div class="row">
	        <div class="col-12">
	        	<div class="categorydiv" style="font-size:16px;">
	        		<span class="bold" style="color:#d49466;">카테고리 > </span><span id=category>${dto.category }</span>
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
							<span id="report" onclick="report()" style="display: none;"><span class="fas fa-exclamation-triangle h-100 fa-lg gray"></span></span>
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
		        				//var phone = '${dto.phone}'.split('-');
		        				//document.getElementById('addrMasking').append(email[0].substring(0,2)+'*****@'+email[1] + ' | ' +  phone[0] +'-'+ phone[1].substring(0,2)+'**-'+phone[2].substring(0,2)+'**');
	        					var email = '${dto.email}'.split('@');
		        				var phone = '${dto.phone}'.substring(0,3) + '-' + '${dto.phone}'.substring(3,5)+ '**-' + '${dto.phone}'.substring(7,9) + '**'; 
		        				document.getElementById('addrMasking').append(email[0].substring(0,2)+'*****@'+email[1] + ' | ' +  phone);
	        				}
	        				
	        				function seeAddr(){
	        					$.ajax({
	        						url:"confirmsession.do",
	        						method: "post",
	        						success:function(data){
	        							if(data.data){
				        					var seeAddr = document.getElementById('seeAddr');
				        					seeAddr.style.setProperty('display','block');
				        					$(seeAddr).animate({opacity:'1'},200);
	        							}else{
	        								alert('로그인이 필요합니다.');
	        								location.href='loginform.do';
	        							}
	        						}
	        					});
	        				}
	        			
	        			</script>
	        		<br>
	        		
	        		
	        	<!-- 유저별 메뉴 -->
	        		<div>
	        			<div id="user" style="text-align: center; display:none;">
	        				<button id="sharebtn" onclick="seeLink();" type="button" class="btn-share"><span class="align-middle far fa-share-square fa-lg"></span></button>
	        			
	        				<span class="align-middle">
		        				<button type="button" class="w-25" id="btn-heart" onclick="addheart(this);">
		        					<span id="heartimg" class="align-middle far fa-heart fa-lg"></span><br>
		        					<span id="heart" class="align-top heart">${dto.heart }</span>
		        				</button>
	        				</span>
	        				
	        				<script type="text/javascript">
	        				if(sessionid != '' && sessionUserType != 'ADMIN' && sessionid != writer){
	        					$.ajax({
		        					url:"joonggo_confirmheart.do?seq=${dto.seq}&sessionid=${sessiondto.myid}", 
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
	        					<button id="chatbtn" onclick="" type="button" class="btns"><span class="align-middle fas fa-comments-dollar fa-lg"></span><span class="align-middle"> 구매 채팅</span></button>
	        				</span>
	        			</div>
	        			
	        			<div id="owner" style="text-align: right; display:none;">
	        				<button id="sharebtn" onclick="seeLink();" type="button" class="btn-share"><span class="align-middle far fa-share-square fa-lg"></span></button>
	        				<button class="btn-del w-25" type="button" onclick="del();"><span class="align-middle fas fa-trash-alt fa-lg"></span><span class="align-middle"> 삭제</span></button>
	        				<button id="renewbtn" class="btn-update w-25" type="button" onclick="renewal();"><span class="align-middle fas fa-arrow-up fa-lg"></span><span class="align-middle"> 위로</span></button>
	        				<button class="btn-update w-25" type="button" onclick="update();"><span class="align-middle fas fa-pencil-alt fa-lg"></span><span class="align-middle"> 수정</span></button>
	        			</div>
	        			
	        			<div id="admin" style="text-align: right; display:none;">
	        				<button id="admindel" onclick="adminDel()" class="btn-del w-25" type="button"><span class="align-middle fas fa-trash-alt fa-lg"></span><span class="align-middle"> 글 삭제</span></button>
	        			</div>
	        		</div>
	        		</div>
	        		
	        		<script type="text/javascript">
	        			switch(true){
						case (sessionUserType === 'admin') : document.getElementById('admin').style.display = 'block'; break;
						case (sessionid === writer) : document.getElementById('owner').style.display = 'block';
													  if(trade === 'N'){
														  document.getElementById('renewbtn').classList.remove('btn-update');
														  document.getElementById('renewbtn').classList.add('btns-n');
														  document.getElementById('renewbtn').setAttribute('onclick','');
													  }
													  break; 
						default : document.getElementById('user').style.display = 'block';
			 		  			  document.getElementById('report').style.display = 'block';  
								  if(trade === 'N'){
									  var btnheart = document.getElementById('btn-heart');
									  var btnchat = document.getElementById('chatbtn');
									  
									  btnheart.classList.add('btn-heart-n');
									  btnheart.setAttribute('onclick','');
									  document.querySelector('#btn-heart > #heart').classList.remove('heart');
									  document.getElementById('heartimg').style.setProperty('color','white');
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
	    <div class="row"">
	    	<div class="col">
	    		<div style="padding:2%; padding-top:0;">
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
	    		<div style="padding: 2%; padding-top:1.5%;" id="content">
					${dto.content }
				</div>
	    	</div>
	    </div>
	    
<!-- 태그 -->
	    <div class="row gray"><div class="col"><div style="padding-left:2%;padding-right:2%;" id="tag"></div></div></div>
	    	<script type="text/javascript">
	    		document.getElementById('tag').innerHTML = '${dto.tag}'.split(',').join("\u00a0\u00a0\u00a0");
	    	</script>
		<div class="row"><div class="col"><div style="padding-left: 2%; padding-right:2%;"><hr class="hr" style="height: 1px;"></div></div></div>
		
		
<!--  추천매물 -->
		<br><br><br>
		<div class="row">	
			<div class="col">
			<div style="padding-left: 2%; padding-right:2%;">
			<div class="row">
				<div class="col-8">
					<h3>이런 매물은 어떠세요?</h3>
					<br>
				</div>
				<div class="col-4" style="text-align: right;">
					<h5><a href="joonggo_list.do?keyword=">중고 메인 <span></span></a></h5>
				</div>
			</div>

			</div>
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
				
 				function getCurrent(callback){
 					
 					return new Promise(function(resolve, reject){
 						navigator.geolocation.getCurrentPosition(function(pos) {
 						    resolve(pos);
 						})
 					});
 				}
 				
				function getaddress(ele, place){
 					
 					return new Promise(function(resolve, reject){
 						geocoder.addressSearch(place, (result, status) => {
 							if (status === kakao.maps.services.Status.OK) {
 								var x = result[0].x;
 								var y = result[0].y;
 								var distance = computeDistance(latitude, longitude, y, x);
 								//$(ele).find('.place').html(result[0].address_name);
 								$(ele).find('.distance').html(distance + ' km');
 							}
 						})
 					});
 				}
				
 				function computeDistance(lat1,lng1,lat2,lng2) {
 					
 					function degreesToRadians(degrees) {
 					    radians = (degrees * Math.PI)/180;
 					    return radians;
 					}
 					
 				    var startLatRads = degreesToRadians(lat1);
 				    var startLongRads = degreesToRadians(lng1);
 				    var destLatRads = degreesToRadians(lat2);
 				    var destLongRads = degreesToRadians(lng2);

 				    var Radius = 6371; //지구의 반경(km)
 				    var distance = Math.acos(Math.sin(startLatRads) * Math.sin(destLatRads) + 
 				                    Math.cos(startLatRads) * Math.cos(destLatRads) *
 				                    Math.cos(startLongRads - destLongRads)) * Radius;

 				    return distance.toFixed(2);
 				}
		
 				$.ajax({
					url:"getpopularhit.do",
					data:{"seq":${dto.seq}},
					method: "post",
					success:function(datalist){ 
						var list = $.parseJSON(datalist.data);	
						var popular_hit_list = document.getElementById('popular-hit-list');
						
						list.forEach( data => {
							placelist.push(data.place);
							var hitdata = 
								'<div class="popular-hit-ele col-lg-4 col-6" style="margin-bottom:10px;">'+
								'<div style="cursor:pointer;" onclick="location.href=`joonggo_selectone.do?seq='+ data.seq +'`" >'+		
								'<div class="popularimgdiv" style="height:270px;">'+
								'<div style="height:70%; border-radius: 8px; background-image:url('+ data.imglist.split(',')[0] +'); background-position: center; background-size: cover;">'+
								'</div>'+
								'<div style="height:29%; width:100%;">'+
								'<div class="popular-title" style="margin-top:5px; font-size:18px;">'+ data.title +'</div>'+
								'<div class="price bold" style="font-size:15px;"><span>'+ data.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'</span> 원<div>'+
								'<div class="popular-addr">'+
								'<span class="place" style="color:gray;">'+data.place+'</span>&nbsp;&nbsp;'+
								'<span class="distance" style="color:#ff8a3d;"></span>'+
								'</div></div></div></div></div>';
								
							popular_hit_list.innerHTML += hitdata;
						});
						
						getCurrent().then(function(data){
							latitude = data.coords.latitude;
							longitude = data.coords.longitude;
							var children = document.getElementsByClassName('popular-hit-ele');
							
							for(var i = 0 ; i < placelist.length; i++){
								getaddress(children[i], placelist[i]).then(function(result){});
							}
						}); 
						
					},
					error: function(){
						toastr.options.positionClass = "toast-top-right";
						toastr.warning("통신 실패");
					}
				}); 
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
				//document.getElementById('개인정보').innerHTML = '${dto.email}'+'<br>'+'${dto.phone}';
				document.getElementById('개인정보').innerHTML = '${dto.email}'+'<br>'+'${dto.phone}'.substring(0,3) + '-' + '${dto.phone}'.substring(3,7) + '-' + '${dto.phone}'.substring(7,11);
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
	
	<script>
	    function share() {
	      var url = encodeURI(encodeURIComponent(myform.url.value));
	      var title = encodeURI(myform.title.value);
	      var shareURL = "https://share.naver.com/web/shareView?url=" + url + "&title=" + title;
	      document.location = shareURL;
	    }
  	</script>

	<!-- link -->
	<div id="seeLink" style="display:none;" class="shadow-sm">
		<div style="background-color: rgb(242,242,242); padding:30px; padding-top:15px; padding-bottom:15px;">
				<span>공유하기</span>
				<span style="cursor: pointer; float:right;" onclick="linkclear()" class="fas fa-times fa-lg"></span>
		</div>
		<br>
		<div class="row">
			<div class="col-12">
				<a id="kakao-link-btn" href="javascript:sendLink()">
					<img style=" margin-right:10px;"  src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
				</a>
				<a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=http://oracleksk.p-e.kr/index.html&title=[캠핑트립-중고거래] ${dto.title}', 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=580,width=450');return false;" target="_blank" alt="Share on Naver" > <img style="height:65px;"src="http://oracleksk.p-e.kr/image/icon/naver_square_40x40.png"></a>
<!-- 				<span>
					<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
					<script type="text/javascript">
					new ShareNaver.makeButton({"type": "g", "title":"[캠핑트립-중고거래]${dto.title}", "url":window.location.href});
					</script>
				</span> -->

			</div>
		</div>
		<br>
		<div class="row" style="margin-top:30px; margin-bottom:30px;">
			<div class="col">
				<input id="clip" type="text" style="padding:4px; width:88%; outline: none; color:gray; border:1px solid lightgray;" readonly="readonly" value="">
				&nbsp;<span onclick="clip()" style="cursor:pointer;" class="fas fa-paperclip fa-lg"></span>
			</div>
		</div>
	</div>
	        				
	<script type="text/javascript">
		document.getElementById('clip').value = window.location.href;
	
		function seeLink(){
			document.getElementById('seeLink').style.display="block";
		}
		function linkclear(){
			document.getElementById('seeLink').style.display="none";
		}
		function clip(){
			var textarea = document.getElementById('clip');
			textarea.select();
			document.execCommand("copy");
			toastr.options.positionClass = "toast-top-right";
			toastr.options.timeOut = 500;
			toastr.success("클립보드에 저장되었습니다");
		}
		
	
		Kakao.init('b1a06c511e7475a92c07a62d70ae0304')
		Kakao.Link.createDefaultButton({
		  container: '#kakao-link-btn',
		  objectType: 'feed',
		  content: {
		    title: '[캠핑트립] 중고상품 바로가기\n'+'${dto.title}',
		    description: '${dto.tag}',
		    imageUrl: '${dto.imglist}'.split(",")[0],
		    link: {
		      mobileWebUrl: window.location.href,
		      webUrl: window.location.href
		    }
		  },
		  social: {
		    likeCount: ${dto.heart},
		  },
		  buttons: [
		    {
		      title: '웹으로 보기',
		      link: {
		        mobileWebUrl: window.location.href,
		        webUrl: window.location.href
		      }
		    },
		    {
		      title: '앱으로 보기',
		      link: {
		        mobileWebUrl: window.location.href,
		        webUrl: window.location.href
		      }
		    }
		  ]
		});
	</script>
	




<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>


















































<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	String[] categories = {"캠핑 > 텐트/타프/매트","캠핑 > 테이블/의자/가구","캠핑 > 캠핑카/카라반/트레일러","캠핑 > 기타 캠핑용품","여행 > 가방/캐리어/용품","여행 > 등산용품","여행 > 낚시용품","자전거","스포츠/레저","홈/생활용품","디지털/가전","의류/잡화","귀금속/주얼리/악세사리","상품권/티켓/쿠폰","기타 잡화","먹거리/무료나눔"};
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 수정하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

<!-- summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


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

@media screen and (max-width: 767px) { #mainbody { font-size: 14px; } .title{font-size: 13pt;} }
@media screen and (min-width: 768px) and (max-width: 991px) { #mainbody { font-size: 16px; } .title{font-size: 14pt;} }
@media screen and (min-width: 992px) and (max-width: 1199px) { #mainbody { font-size: 16px; } .title{font-size: 15pt;} #mainbody > div {margin-left:10%; margin-right:10%;}}
@media screen and (min-width: 1200px) { #mainbody { font-size: 18px; } .title{font-size: 16pt;} .container{width:893px;}}

body{background-color: #f8f9fa;}
#mainbody{font-family: NanumBarunGothic; }
.mainbody-inner{background-color: #FFF; padding: 5%;  border-radius:8px;}
.red{color:red;}
.green{color:rgb(1, 176, 3);}
.gray{color:gray;}
.lightgray{color:lightgray;}
.star{color:rgb(0, 191, 121); margin-left: 1%; font-weight: bold;}
.message{display:none; margin-top: 1.5%;}
.title{margin-bottom: 1%;}
#maintitle{ color:#ff8a3d}


#address{display:none; margin-top: 1%;}
.addr-regist-btn{background-color: lightgray; border: solid 1px lightgray; border-radius: 5px; padding:1%; width:100px; color: white; height: auto; font-weight: bold; margin-right: 1%;}

#addr-regist-list{margin-top: 2%;}
.geocoder-btn{background-color: rgb(74, 231, 154); border: solid 1px rgb(74, 231, 154); border-radius: 20px; padding:1%; padding-left:2%; padding-right:2%; color: white; height: auto; font-weight: bold; margin-right: 2%;}
.direct-btn{background-color: rgb(74, 231, 154); border: solid 1px rgb(74, 231, 154); border-radius: 20px; padding:1%; padding-left:2%; padding-right:2%;  color: white; height: auto; font-weight: bold; margin-right: 2%;}

.tag-span{display:inline-block; background-color: rgb(74, 231, 154); border: solid 1px rgb(74, 231, 154); border-radius: 20px; padding-left:2%; padding-right:2%; padding-top:2px; padding-bottom:2px; color: white; font-weight: bold; margin-right: 1%;}


#cancelbtn{background-color: white; border: solid 1px gray; border-radius: 5px; padding: 2%; padding-right:3%; padding-left:3%; color :gray; font-weight: bold; margin-right:10px;}
#submitbtn{background-color: white; border: solid 1px #ff8a3d; border-radius: 5px; padding: 2%; padding-right:3%; padding-left:3%; color :#ff8a3d; font-weight: bold;}
#submitbtn:hover{background-color: #ff8a3d; border: solid 1px #ff8a3d; color: white; transition: all 0.3s;}
#title, #select, #tag {width: 100%; border:none;  outline: none;}
#select-trade{border: 1px solid gray !important; outline: none; border-radius: 5px;}
.group{margin-bottom: 3%;}
.check{margin-right: 0.5%;}
.label{margin-right: 1.5%;}


.border{border:1px solid darkgray !important; padding:1.5%; margin-top:1%; margin-bottom: 1%;}
.border-radius{border:1px solid gray; padding:1.5%; border-radius: 5px; outline: none;}

.rotation{
	animation: rotate_image 2s linear infinite;
}
@keyframes rotate_image{
	100%{
		transform: rotate(360deg);
	}
}
#fixed{
  position: fixed;
  top: 50%;
  left:50%;
  transform: translate(-50%, -50%);
  margin: 0 auto;
}

</style>

<script type="text/javascript">
	function checkbox(ele){
		var check = ele.checked;
		if(ele.parentNode.previousElementSibling.innerText.includes('배송')){
			var addr = document.getElementById('address');
			if(ele.value === 'D'){
				if(check){
					addr.style.display = 'block';
				}else{
					addr.style.display = 'none';
					document.getElementById('addr-regist-list').innerHTML = '';
					document.querySelector('input[name=place]').value = '';
				}
			}
			if(check) ele.parentNode.nextElementSibling.style.display = 'none';
			return;
		}
		var childs = ele.parentNode.childNodes;
		childs.forEach(child=>{
			child.checked = false;
		});
 		ele.checked = check; 
 		if(check) ele.parentNode.nextElementSibling.style.display = 'none';
	}

	function insertForm(){
		//------------insert 유효성 검사--------------
		
		var msg = document.getElementsByClassName('message');

		var price = document.getElementById('price');
		if(price.value == '' || price.value == null){
			msg[0].innerHTML='판매가격을 입력해주세요'; 
			msg[0].style.display = 'block'; 
		}
		var qualities = document.getElementsByName('quality');
		if(!qualities[0].checked && !qualities[1].checked && !qualities[2].checked){
			msg[1].style.display = 'block';
		}
		var deliveries = document.getElementsByClassName('delivery');
		if(!deliveries[0].checked && !deliveries[1].checked){
			msg[2].style.display = 'block';
		}
				
		for(var i = 0; i < msg.length; i++){
			if(msg[i].style.getPropertyValue('display') === 'block'){
				return false;
			}
		}
		
		document.querySelector('input[name=price]').value = document.getElementById('price').value.replace(/,/g,'');
		console.log('가격 : ' + document.querySelector('input[name=price]').value);
		
		document.querySelector('input[name=delivery]').value =
			deliveries[0].checked && deliveries[1].checked? 'A' : deliveries[0].checked? 'D' : 'C';
		console.log('배송방법 : ' + document.querySelector('input[name=delivery]').value);
		
		var addrlist = document.getElementById('addr-regist-list').children;
		if(deliveries[0].checked && addrlist.length === 0){
			alert('직거래 장소를 추가해주세요.');
			return false;
		}
		
		if(addrlist.length > 0){
			document.querySelector('input[name=place]').value = Array.from(addrlist).reduce((a,k)=>{
				return a + k.innerHTML + ',';
			},'').slice(0,-1);
		}
		console.log('거래장소 : ' + document.querySelector('input[name=place]').value);
		
		var cate = document.getElementById('select');
		if(cate.value == ''){
			alert('카테고리를 선택하세요.');
			return false;
		}
		
		var title = document.getElementById('title');
		var titleval = title.value.trim();
		if(titleval == '' || titleval == null){
			alert('제목을 입력하세요.');
			title.value = '';
			title.focus();
			return false;
		}
		
		var tags = document.getElementsByClassName('tag-span');
		if(tags.length === 0){
			alert('태그를 입력하세요.');
			tag.focus();
			return false;
		}
		
		var agree = document.getElementById('agree1');
		document.querySelector('input[name=agree]').value = agree.checked? 'Y':'N';  
		
		document.querySelector('input[name=tag]').value = Array.from(tags).reduce((a,k)=>{
			return a + k.innerHTML + ',';
		}, '').slice(0,-1);
		console.log('태그val : ' + document.querySelector('input[name=tag]').value);
		 
		var content = document.getElementById('summernote');
		if(isVoid(content.value)){
			alert("내용을 작성해주세요.");
			return false;
		}
		
		if(content.value.indexOf('img') === -1){
			alert("최소 한개 이상 상품이미지를 등록해주세요.");
			return false;
		}
		
		//썸네일리스트저장
		let totalimglist = [];
		var imglist = content.value.split('src="');
		for(var i = 1; i < imglist.length; i++){
			totalimglist.push(imglist[i].split('"')[0]);
		}
		document.querySelector('input[name=imglist]').value = totalimglist.join(',');

		
		var loading = document.getElementById('loading');
		document.body.style.setProperty('pointer-events','none');
    	document.body.style.setProperty('opacity', '0.7');
    	loading.style.display = 'block';
    	loading.classList.add('rotation');
    	
    	
    	setTimeout(()=>{
    		document.form.submit(); //javascript submit
    	},800);
	}
	
	
	function isVoid(value){
		return value.replace(/<br>|<p>|<\/p>|&nbsp;| /g, '') === '';
	}
	
	
	document.addEventListener("DOMContentLoaded", ()=>{
		//key 이벤트
 		document.getElementById('price').onkeyup = function(){
 			this.value = this.value.replace(/,/g,'');
 			this.value = this.value.replace(/(^0+)|[^0-9]/g,'');
			var	val = parseInt(this.value);
			var msg = document.getElementsByClassName('message')[0];
			
			switch(true){
			case (isNaN(val)): msg.innerHTML='판매가격을 입력해주세요'; msg.style.display = 'block'; break;
			case (val < 2000): msg.innerHTML='가격은 2000원 이상 입력해 주세요'; msg.style.display = 'block'; break;
			default : msg.style.display = 'none'; break;
			}
			this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
	});
	
</script>


</head>
<body>
	<br>
	<div class="container" id="mainbody">
		<div class="mainbody-inner shadow-lg">
	<!-- 폼 시작 -->
		<form action="joonggo_update.do" method="post" name="form">
		
		<input type="hidden" value="${dto.id }" name="id">
		<input type="hidden" value="" name="imglist">
		<input type="hidden" value="" name="tag">
		<input type="hidden" value="" name="place">
		<input type="hidden" value="" name="delivery">
		<input type="hidden" value="" name="agree">
		<input type="hidden" value="" name="price">
		<input type="hidden" value="${dto.seq }" name="seq">
		
		
		<div class="row">
			<div class="col title" id="maintitle"><i class="fas fa-pencil-alt fa-lg"></i><span> 상품 수정하기</span></div>
			<div class="col">
				<button type="button" id="submitbtn" onclick="insertForm()" style="float:right;"><span class="align-middle">수정</span></button>
				<button type="button" id="cancelbtn" onclick="location.href='joonggo_selectone.do?seq=${dto.seq}'" style="float:right;"><span class="align-middle">취소</span></button>
			</div>
		</div>
		<div class="row">
			<div class="col"><hr></div>
		</div>
		
	<!-- 카테고리 -->
		<div class="row">
			<div class="col">
				<select name="category" id="select" class="border" style="margin-top:0;">
					<option value="">카테고리를 선택해주세요</option>
					<%
						for(String s : categories){
					%>
						<option value="<%=s %>"><%=s %></option>
					<%
						}
					%>
				</select>
				
				<script type="text/javascript">
					var selectedCategory = '${dto.category}';
					var selectlist = document.getElementById('select').children;
					for(var i = 0; i < selectlist.length; i++){
						if(selectlist[i].value === selectedCategory){
							selectlist[i].selected = true;
							break;
						}
					}
				</script>
			</div>
		</div>
		
	<!-- 상품명 -->
		<div class="row">
			<div class="col">
				<input type="text" name="title" placeholder="상품명을 입력하세요" id="title" class="border" autocomplete="off" maxlength="50">
				<script type="text/javascript">
					document.getElementById('title').value = '${dto.title}';					
				</script>
			</div>
		</div>
		
	<!-- 가격~배송정보 -->
		<div class="border" style="padding:5%;">
		<div class="group">
            <div class="title"><span>거래 상태</span><span class="star">*</span></div>
            <div>
				<select name="trade" id="select-trade" class="border" style="margin-top:0;">
					<option value="Y">판매중</option>
					<option value="T">예약중</option>
					<option value="N">거래완료</option>
				</select>
				
				<script type="text/javascript">
					var selectedtrade = '${dto.trade}';
					var tradelist = document.getElementById('select-trade').children;
					for(var i = 0; i < tradelist.length; i++){
						if(tradelist[i].value === selectedtrade){
							tradelist[i].selected = true;
							break;
						}
					}
				</script>
				
        	</div>
       	</div>
		<div class="group">
            <div class="title"><span>판매 가격</span><span class="star">*</span></div>
            <div>
            	<input type="text" placeholder="가격을 입력해주세요" class="border-radius" id="price" autocomplete="off"/><span class="won">&nbsp;원</span>
            	<div class="message red">판매 가격을 입력해 주세요.</div>
            	
            	<script type="text/javascript">
            		document.getElementById('price').value = '${dto.price}'.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	</script>
            	
        	</div>
       	</div>
        <div class="group">
        	<div class="title"><span>상품 상태</span><span class="star">*</span></div>
			<div>
				<input id="quality1" type="checkbox" name="quality" onclick="checkbox(this)" class="check align-middle checkquality" value="A"><label for="quality1" class="label align-middle"> 미개봉 </label>
				<input id="quality2" type="checkbox" name="quality" onclick="checkbox(this)" class="check align-middle checkquality" value="B"><label for="quality2" class="label align-middle"> 거의 새 것 </label>
				<input id="quality3" type="checkbox" name="quality" onclick="checkbox(this)" class="check align-middle checkquality" value="C"><label for="quality3" class="label align-middle"> 사용감 있음 </label>
			</div>
			<div class="message red"> 상품 상태를 선택해주세요</div>
			
			<script type="text/javascript">
				var checkedstatus = '${dto.quality}';
				var qualitylist = document.getElementsByClassName('checkquality');
				
				for(var i = 0; i < qualitylist.length; i++){
					if(qualitylist[i].value === checkedstatus){
						qualitylist[i].checked = true;
						break;
					}
				}
			</script>
			
		</div>
    	<div class="group">
    		<div class="title"><span>배송 방법</span><span class="star">*</span></div>
			<div>
				<input id="delivery0" type="checkbox" onclick="checkbox(this)" class="check align-middle delivery" value="D"><label for="delivery0" class="label align-middle"> 직거래 </label>
				<input id="delivery1" type="checkbox" onclick="checkbox(this)" class="check align-middle delivery" value="C"><label for="delivery1" class="label align-middle"> 택배 거래 </label>
				
				<!-- 주소검색 -->
				<div id="address">
					<button type="button" class="addr-regist-btn" value="내 위치" onclick="addgeolocation(this)">내 위치</button>
					<input type="button" class="addr-regist-btn" value="직접 추가" onclick="adddirectlocation()">
					<div id="addr-regist-list">
						<!-- 주소 -->
						<!-- <input type="button" class="addr-btn" value="직접 추가" onclick=""> -->
					</div>
					
					<script type="text/javascript">
						var selecteddelivery = '${dto.delivery}';
						var deliverylist = document.getElementsByClassName('delivery');
						
						if(selecteddelivery === 'A'){
							deliverylist[0].checked = true;
							deliverylist[1].checked = true;
						}else{
							for(var i = 0; i < deliverylist.length; i++){
								if(deliverylist[i].value === selecteddelivery){
									deliverylist[i].checked = true;
									break;
								}
							}
						}
						
						//직거래가 선택되었을때
						if(deliverylist[0].checked){
							document.getElementById('address').style.display = 'block';
							var placelist = '${dto.place}'.split(',');
							for(var i = 0; i < placelist.length; i++){
								var btn = document.createElement('button');
		 						btn.classList.add('direct-btn');
		 						btn.setAttribute('onclick', 'this.remove()');
					            btn.innerHTML = placelist[i];
					            document.getElementById('addr-regist-list').append(btn);
							}
						}
					
					</script>
					
					<!-- 지오코더 -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1a06c511e7475a92c07a62d70ae0304&libraries=services"></script>
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script type="text/javascript">
					
					var geocoder = new kakao.maps.services.Geocoder();
					var callback = function(result, status){
						if(status === kakao.maps.services.Status.OK){
							console.log(result);
							
							let addr;
	 						if(result[1]){
	 							addr = result[1].region_1depth_name + ' ' + result[1].region_2depth_name + ' ' + result[1].region_3depth_name;	
	 						}else{
	 							addr = result[0].region_1depth_name + ' ' + result[0].region_2depth_name + ' ' + result[0].region_3depth_name;	
	 						}
	 						
	 	 					var btn = document.createElement('button');
		 					btn.classList.add('geocoder-btn');
		 					btn.setAttribute('onclick', 'this.remove()');
					        btn.innerHTML = addr;
					        document.getElementById('addr-regist-list').append(btn);
						}
					};
					
					function addgeolocation(input){
						if(document.getElementById('addr-regist-list').children.length === 1){
							return;
						}
						
						let latitude, longitude;
						input.innerHTML = '<span id="loading-geocoder" class="align-middle fas fa-spinner fa-lg" style="color:white;"></span>';
						document.getElementById('loading-geocoder').classList.add('rotation');
						
						setTimeout(()=>{
							navigator.geolocation.getCurrentPosition(function(pos) {
							    latitude = pos.coords.latitude;
							    longitude = pos.coords.longitude;
								
								geocoder.coord2RegionCode(longitude, latitude, callback);
								
								input.innerHTML = '내 위치';
							});
						}, 400);
					}
					
					function adddirectlocation(){
						if(document.getElementById('addr-regist-list').children.length === 1){
							return;
						}
						
					    new daum.Postcode({
					        oncomplete: function(data) {
					        	console.log(data);
					        	
		 						let addr;
		 						if(data.autoJibunAddress){addr = data.autoJibunAddress;}
		 						else if(data.jibunAddress){addr = data.jibunAddress;}
		 						else if(data.roadAddress){addr = data.roadAddress;}
		 						geocoder.addressSearch(addr, callback2);
					        }
					    }).open();
					}
						
					var callback2 = function(result, status) {
					    if (status === kakao.maps.services.Status.OK) {
					    	geocoder.coord2RegionCode(result[0].x, result[0].y, callback);
					    }
					};
						
					
					
					
					
					
					
					
					
					</script>
					
				</div>
			
			</div>
			<div class="message red"> 배송 방법을 선택해주세요</div>
        </div>
        <div class="group">
			<div class="title"><span>판매자 정보</span></div>
			<div class="seller">
				<span class="info">${dto.email}</span>&nbsp;&nbsp;<span class="lightgray">|</span>&nbsp;&nbsp;<span class="info">${dto.phone}</span>
				<div>
					<input id="agree1" type="checkbox" class="check align-middle" value="Y"><label for="agree1" class="label align-middle">휴대전화번호 노출 동의</label>
				</div>
				
				<script type="text/javascript">
					var agreeselected = '${dto.agree}';
					if(agreeselected === 'Y'){
						document.getElementById('agree1').checked = true;
					}
				</script>
				
				
				<div class="gray">판매자 정보는 판매기간 동안 멤버에게만 보입니다.</div>
				<!---->
				<p class="green">본인인증이 완료되었습니다.</p>
				<!---->
			</div>
		</div>
			<div>
				<p class="notice_text">
					📢 거래에 관한 의무와 책임은 각 판매자에게 있습니다.
 				<!--	<br> [AD] [로또리치] 로또 1등 당첨번호 받기! ▶ 
					<a href="https://vvd.bz/2wk" target="_blank" class="link">https://vvd.bz/2wk</a>  -->
					<br>
					💬 기타문의 → <a href="#" target="_blank">캠핑트립 고객센터</a>
				</p>
			</div>
		</div>
		
	<!-- summernote -->
		
		<div class="row">
			<div class="col">
				<!-- 에디터 -->
				<div style="margin-top: 1%; margin-bottom: 1%;">
				<textarea class="summernote" name="content" id="summernote">${dto.content }</textarea>
				</div>
				<script type="text/javascript">
					$(document).ready(function(){
						$(".summernote").summernote({
							placeholder: '내용을 작성하세요.',
							height: 400,
							popover: {//팝오버 설정
					    		image: [], //이미지 삭제
					    		link: [],  //링크 삭제
					    		air: []
					    	},
				            callbacks : { 
				            	onImageUpload : function(files, editor, welEditable) {
							            // 파일 업로드(다중업로드를 위해 반복문 사용)
							            for (var i = files.length - 1; i >= 0; i--) {
							            uploadSummernoteImageFile(files[i],
							            this);
				            		}
				            	}
				            }
						});
					});
					
			        function uploadSummernoteImageFile(file, el) {
						data = new FormData();
						data.append("file", file);
						$.ajax({
							data : data,
							type : "POST",
							url : "uploadSummernoteImageFile.do",
							contentType : false,
							enctype : 'multipart/form-data',
							processData : false,
							success : function(data) {
								$(el).summernote('editor.insertImage', data.url);
							}
						});
					}
			        
			        $("#summernote").on("summernote.enter", function(we, e) {
			            $(this).summernote("pasteHTML", "<br><br>");
			            e.preventDefault();
			        });
			        
			        
					
				</script>
			</div>
		</div>
		
	<!--  -->	
		
		
	<!-- 태그 -->
		<div class="row">
			<div class="col">
				<div class="border" id="tagcol">
					<input class="align-middle" type="text" placeholder="" style="width: auto; height:35px;" id="tag" autocomplete="off" maxlength="10">
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			var taglist = '${dto.tag}'.split(',');
			for(var i = 0; i < taglist.length; i++){
				var span = document.createElement('span');
				span.classList.add('tag-span');
				span.innerHTML = taglist[i];
				document.getElementById('tagcol').insertBefore(span, document.getElementById('tag'));
				
			}
		
		
		
			let backspace = false;
			
	 		document.getElementById('tag').onkeyup = function(event){
	 			if(event.keyCode === 32 || event.keyCode === 13){
	 				if(this.value.trim() === ''){
	 					this.value = ''; 
	 					backspace = true;
	 				}else{
	 					var spans = document.getElementsByClassName('tag-span');
	 					if(spans.length === 5){
	 						this.value = '';
	 						backspace = true;
	 					}else{
	 						var span = document.createElement('span');
	 						span.classList.add('tag-span');
	 						span.innerHTML = '#'+this.value.replace(/ /g,'');
	 						document.getElementById('tagcol').insertBefore(span, this);
	 						this.value = ''; 
	 						this.setAttribute('placeholder','');
	 						backspace = false;
	 					}
	 				}
	 			}else if(event.keyCode === 8){
	 				if(this.value == ''){
	 					if(!backspace){
	 						backspace = true;
	 					}else{
	 						backspace = false;
	 						if(this.previousElementSibling){
	 							this.previousElementSibling.remove();
	 						}
	 						if(!this.previousElementSibling){
	 							this.setAttribute('placeholder','태그를 입력해주세요.');
	 						}
	 					}
	 				}
	 			}else{
	 				backspace = false;
	 			}
			}
	 		
	 		$('input[type="text"]').keydown(function() {
	 			if (event.keyCode === 13) {
	 			    event.preventDefault();
	 			};
	 		});
		
		</script>
	<!--  -->
	
		</form>
	<!-- 폼 종료 -->
		
		<div id="fixed">
			<span id="loading" class="align-middle fas fa-spinner fa-2x" style="display:none; color:black; z-index: 999;"></span>
		</div>
		
		</div>
	</div>
	<br>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>


</html>


























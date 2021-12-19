<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 물품등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

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

@media screen and (max-width: 767px) { #mainbody { font-size: 11pt; } .title{font-size: 13pt;} }
@media screen and (min-width: 768px) and (max-width: 991px) { #mainbody { font-size: 12pt; } .title{font-size: 14pt;} }
@media screen and (min-width: 992px) and (max-width: 1199px) { #mainbody { font-size: 13pt; } .title{font-size: 15pt;} #mainbody > div {margin-left:10%; margin-right:10%;}}
@media screen and (min-width: 1200px) and (max-width: 1399px) { #mainbody { font-size: 13pt; } .title{font-size: 16pt;} #mainbody > div {margin-left:10%; margin-right:10%;}}
@media screen and (min-width: 1400px) { #mainbody { font-size: 14pt; } .title{font-size: 18pt;} #mainbody > div {margin-left:10%; margin-right:10%;} }

body{background-color: #f8f9fa;}
#mainbody{font-family: NanumBarunGothic; }
.mainbody-inner{background-color: #FFF; padding: 5%;}
.red{color:red;}
.green{color:rgb(1, 176, 3);}
.gray{color:gray;}
.lightgray{color:lightgray;}
.star{color:rgb(0, 191, 121); margin-left: 1%; font-weight: bold;}
.message{display:none; margin-top: 1.5%;}
.title{margin-bottom: 1%;}


#address{display:none; margin-top: 1%;}
.addr-regist-btn{background-color: lightgray; border: solid 1px lightgray; border-radius: 5px; padding:1%; padding-right: 3%; padding-left: 3%; color: white; height: auto; font-weight: bold; margin-right: 1%;}

#addr-regist-list{margin-top: 1%;}
.addr-btn{background-color: rgb(74, 231, 154); border: solid 1px rgb(74, 231, 154); border-radius: 15px; padding:1%; color: white; height: auto; font-weight: bold; margin-right: 1%;}

#submit{background-color: rgb(0, 191, 121); border: solid 1px rgb(0, 191, 121); border-radius: 5px; padding: 2%; padding-right:3%; padding-left:3%; height: auto; color : white; font-weight: bold;}
#title, #select, #tag{width: 100%; border: none; outline: none;}
.group{margin-bottom: 3%;}
.check{margin-right: 0.5%;}
.label{margin-right: 1.5%;}


.border{border:1px solid gray; padding:1.5%; margin-top:1%; margin-bottom: 1%;}
.border-radius{border:1px solid gray; padding:1.5%; border-radius: 5px; outline: none;}
</style>

<script type="text/javascript">
	function checkbox(ele){
		var check = ele.checked;
		if(ele.parentNode.previousElementSibling.innerText.includes('배송')){
			var addr = document.getElementById('address');
			if(ele.value === 'direct'){
				if(check){
					addr.style.display = 'block';
				}else{
					addr.style.display = 'none';
				}
			}else{
				addr.style.display = 'none';
			}
		}
		var childs = ele.parentNode.childNodes;
		childs.forEach(child=>{
			child.checked = false;
		});
 		ele.checked = check; 
 		if(check) ele.parentNode.nextElementSibling.style.display = 'none';
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
	
	function insertForm(){
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
		var deliveries = document.getElementsByName('delivery');
		if(!deliveries[0].checked && !deliveries[1].checked){
			msg[2].style.display = 'block';
		}
		
		for(var i = 0; i < msg.length; i++){
			if(msg[i].style.getPropertyValue('display') === 'block'){
				return false;
			}
		}
		var title = document.getElementById('title');
		var titleval = title.value.trim();
		if(titleval == '' || titleval == null){
			alert('제목을 입력하세요.');
			title.value = '';
			title.focus();
			return false;
		}
		var tag = document.getElementById('tag');
		var tagval = tag.value.trim();
		if(tagval == '' || tagval == null){
			alert('태그를 입력하세요.');
			tag.value = '';
			tag.focus();
			return false;
		}
		
		
		
		alert('test');
		return false;
	}
	
</script>


</head>
<body>
	<br><br>
	<div class="container" id="mainbody">
		<div class="mainbody-inner">
		<form action="insert.do" method="post" onsubmit="return insertForm()">
		
		<div class="row">
			<div class="col title"><span>상품 등록하기</span></div>
			<div class="col"><input type="submit" id="submit" value="등록" style="float:right;"></div>
		</div>
		<div class="row">
			<div class="col"><hr></div>
		</div>
		
	<!-- 카테고리 -->
		<div class="row">
			<div class="col">
				<select name="category" id="select" class="border">
					<option value="camping">캠핑 관련 용품</option>
					<option value="etc">기타</option>
				</select>
			</div>
		</div>
		
	<!-- 상품명 -->
		<div class="row">
			<div class="col">
				<input type="text" name="title" placeholder="상품명을 입력하세요" id="title" class="border">
			</div>
		</div>
		
	<!-- 가격~배송정보 -->
		<div class="border" style="padding:5%;">
		<div class="group">
            <div class="title"><span>판매 가격</span><span class="star">*</span></div>
            <div>
            	<input type="text" placeholder="가격을 입력해주세요" class="border-radius" name="price" id="price" autocomplete="off"/><span class="won">&nbsp;원</span>
            	<div class="message red">판매 가격을 입력해 주세요.</div>
        	</div>
       	</div>
        <div class="group">
        	<div class="title"><span>상품 상태</span><span class="star">*</span></div>
			<div>
				<input id="quality1" type="checkbox" name="quality" onclick="checkbox(this)" class="check align-middle" value="a"><label for="quality1" class="label align-middle"> 미개봉 </label>
				<input id="quality2" type="checkbox" name="quality" onclick="checkbox(this)" class="check align-middle" value="b"><label for="quality2" class="label align-middle"> 거의 새 것 </label>
				<input id="quality3" type="checkbox" name="quality" onclick="checkbox(this)" class="check align-middle" value="c"><label for="quality3" class="label align-middle"> 사용감 있음 </label>
			</div>
			<div class="message red"> 상품 상태를 선택해주세요</div>
		</div>
    	<div class="group">
    		<div class="title"><span>배송 방법</span><span class="star">*</span></div>
			<div>
				<input id="delivery0" type="checkbox" name="delivery" onclick="checkbox(this)" class="check align-middle" value="direct"><label for="delivery0" class="label align-middle"> 직거래 </label>
				<input id="delivery1" type="checkbox" name="delivery" onclick="checkbox(this)" class="check align-middle" value="courier"><label for="delivery1" class="label align-middle"> 택배 거래 </label>
			
				<!-- 주소검색 -->
				<div id="address">
					<input type="button" class="addr-regist-btn" value="내 위치" onclick="">
					<input type="button" class="addr-regist-btn" value="직접 추가" onclick="">
					<div id="addr-regist-list">
						<!-- 주소 -->
						<!-- <input type="button" class="addr-btn" value="직접 추가" onclick=""> -->
					</div>
				</div>
			
			</div>
			<div class="message red"> 배송 방법을 선택해주세요</div>
        </div>
        <div class="group">
			<div class="title"><span>판매자 정보</span></div>
			<div class="seller">
				<span class="info">12343234@naver.com</span>&nbsp;&nbsp;<span class="lightgray">|</span>&nbsp;&nbsp;<span class="info">010-9922-5401</span>
				<div>
					<input id="agree1" type="checkbox" name="agree" class="check align-middle"><label for="agree1" class="label align-middle">휴대전화번호 노출 동의</label>
				</div>
				<div class="gray">판매자 정보는 판매기간 동안 멤버에게만 보입니다.</div>
				<!---->
				<p class="green">본인인증이 완료되었습니다.</p>
				<!---->
			</div>
		</div>
			<div>
				<p class="notice_text">
					📢 거래에 관한 의무와 책임은 각 판매자에게 있습니다.
					<br> [AD] [로또리치] 로또 1등 당첨번호 받기! ▶ 
					<a href="https://vvd.bz/2wk" target="_blank" class="link">https://vvd.bz/2wk</a> 
					<br>
					💬 기타문의 → <a href="#" target="_blank"></a>
				</p>
			</div>
		</div>
		
	<!-- 스마트에디터 -->
		
		
		
	<!-- 태그 -->
		<div class="row">
			<div class="col">
				<input type="text" name="tag" placeholder="태그를 입력해주세요(최대 5개)" style="" id="tag" class="border">
			</div>
		</div>
		
		</form>
		
		</div>
	</div>
</body>
</html>


























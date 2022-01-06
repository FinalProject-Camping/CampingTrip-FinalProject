<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

@media screen and (max-width: 767px) { #mainbody { font-size: 14px; } .title{font-size: 13pt;} }
@media screen and (min-width: 768px) and (max-width: 991px) { #mainbody { font-size: 16px; } }
@media screen and (min-width: 992px) and (max-width: 1199px) { #mainbody { font-size: 16px; }  #mainbody > div {margin-left:10%; margin-right:10%;}}
@media screen and (min-width: 1200px) { #mainbody { font-size: 18px; } .title{font-size: 16pt;} .container{width:893px;}}

#mainbody{font-family: NanumBarunGothic;}
.title{overflow: hidden;text-overflow: ellipsis;word-wrap: break-word;display: -webkit-box;-webkit-line-clamp: 1; -webkit-box-orient: vertical;}
</style>

<script type="text/javascript">
	var list = ${list};
	var length = list.length;
	
	
	document.addEventListener("DOMContentLoaded", ()=>{
		var doc = document.getElementById('list');			
		list.forEach( data => {
						
			var hitdata = 
				'<div class="col-lg-4 col-6" style="margin-bottom:30px;">'+
				'<div style="cursor:pointer;" onclick="location.href=`selectone.do?seq='+ data.seq +'`" >'+		
				'<div class="img-thumbnail" style="height:270px;">'+
				'<div style="height:70%; border-radius: 8px; background-image:url('+ data.imglist.split(',')[0] +'); background-position: center; background-size: cover;">'+
				'</div>'+
				'<div style="height:29%; width:100%;">'+
				'<h5 class="title" style="margin-top:5px;">'+ data.title +'</h5>'+
				'<div><b><span>'+ data.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'</span> 원</b></div>'+
				'<div>'+
				'<span class="place"></span>&nbsp;&nbsp;'+
				'<span class="distance" style="color:#ff8a3d;"></span>'+
				'</div></div></div></div></div>';
				
			doc.innerHTML += hitdata;
			
		});
		
		
	})
	


</script>

</head>
<body>
	<br><br>

	<div class="container" id="mainbody">
		<div class="row">
			<div class="col">
				<h3>${id } 님의 매물</h3><br><br>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				판매물품(<span>${size } 건</span>)
			</div>
		</div>
		
		<div class="row"><div class="col"><hr></div></div>
		
		<div class="row" id="list">
		
		
		</div>
	</div>
	
</body>
</html>



































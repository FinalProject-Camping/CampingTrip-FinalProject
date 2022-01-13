<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="resources/css/webfont.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

<style type="text/css">
@media screen and (max-width: 767px) { #mainbody { font-size: 20px; } .title{font-size: 20px !important;}.img{height:320px !important;} }
@media screen and (min-width: 768px) and (max-width: 991px) { #mainbody { font-size: 22px; } .title{font-size: 22px !important;}  .img{height:400px !important;}}
@media screen and (min-width: 992px) and (max-width: 1199px) { #mainbody { font-size: 16px; } #mainbody{width:781px;}}
@media screen and (min-width: 1200px) { #mainbody { font-size: 18px; } .title{font-size: 16pt;} #mainbody{width:829px;}}

#mainbody{font-family: NanumBarunGothic;}
.title{overflow: hidden;text-overflow: ellipsis;word-wrap: break-word;display: -webkit-box;-webkit-line-clamp: 1; -webkit-box-orient: vertical; margin-top:5px; font-size:18px;}
#mainbody{min-height: 1000px;}
.col-4{padding:0;}

.menu{border-bottom: 5px solid white; text-align: center; padding-bottom:16px; padding-top:16px; cursor:pointer;}
.menu-n{border-bottom: 5px solid white; text-align: center; padding-bottom:16px; padding-top:16px; color:gray;}
.menu-active{
	border-bottom: 5px solid #d49466;
	transition: border-bottom 0.4s;
}
.hearthit{font-size:15px; color:gray;}
.list{display:none;}
.list-active{display:flex;}
.opacity-n{opacity:0;}
</style>



</head>
<body>
	<br><br>

	<div class="container-fluid" id="mainbody">
		<div class="row">
			<div class="col">
				<h3><span style="color:#d49466; font-family: EliceDigitalBaeum_Bold;">${id }</span> 님의 중고매물</h3><br>
			</div>
		</div>
		
		<div class="row" style="margin-left:0; margin-right:0;  font-family: EliceDigitalBaeum_Bold;">
			<div class="col-4">
				<div class="menu menu-active">판매중인 물품(<span id="y"></span> 건)</div>
			</div>
			<div class="col-4">
				<div class="menu">거래완료 물품(<span id="n"></span> 건)</div>
			</div>
		</div>
		
		<div class="row"><div class="col"><hr style="color:gray; margin-top:0;"></div></div>
		
		<div class="row list list-active" id="list-y">
		
		</div>
		
		<div class="row list opacity-n" id="list-n">
		
		</div>
	</div>
	
	<script type="text/javascript">
	var list = ${list};
	
	
	document.addEventListener("DOMContentLoaded", ()=>{
		var list_y = document.getElementById('list-y');			
		var list_n = document.getElementById('list-n');
		var size = ${size};
		let n = 0; 
		
		
		list.forEach( data => {
						
			var html = 
				'<div class="col-lg-4 col-6" style="margin-bottom:30px;">'+
				'<div style="cursor:pointer;" onclick="location.href=`joonggo_selectone.do?seq='+ data.seq +'`" >'+		
				'<div class="img img-thumbnail" style="height:270px;">'+
				'<div style="height:70%; border-radius: 8px; background-image:url('+ data.imglist.split(',')[0] +'); background-position: center; background-size: cover;">'+
				'</div>'+
				'<div style="height:29%; width:100%;">'+
				'<div class="title">'+ data.title +'</div>'+
				'<div><b><span>'+ data.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'</span> 원</b></div>'+
				'<div class="hearthit">좋아요 '+ data.heart +' &nbsp;&nbsp;&nbsp;조회 '+ data.hit +'</div>'+
				'<div></div></div></div></div></div>';
			
			if(data.trade !== 'N'){
				list_y.innerHTML += html;
			}else{
				list_n.innerHTML += html; n++;
			}
		});
		
		document.getElementById('y').innerHTML = size - n;
		document.getElementById('n').innerHTML = n == 0? '-' : n;
		if(n === 0){
			$('#n').parent().removeClass('menu').addClass('menu-n');
		}
		
		$('.menu').on('click', function(){
			var idx = $(this).parent().index();
			var currentIdx = $('.menu-active').eq(0).parent().index();
			
			if( idx !== currentIdx ){
				$('.menu').eq(currentIdx).removeClass('menu-active');
				$('.menu').eq(idx).addClass('menu-active');
				
				$('.list').eq(currentIdx).removeClass('list-active').css('opacity','0');
				$('.list').eq(idx).addClass('list-active').animate({opacity:'1'},400);
			}
		})
		
	})
	


</script>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>



































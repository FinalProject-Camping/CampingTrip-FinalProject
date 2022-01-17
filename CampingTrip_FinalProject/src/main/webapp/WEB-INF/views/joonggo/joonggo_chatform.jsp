<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="resources/css/webfont.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

<style type="text/css">
body{font-family: NanumBarunGothic;}

.chat-header{
	width:100%;
	background-color: #d49466;
	color:white;
	font-size:20px;
	padding:10px 0px 10px 0px;
}
.chat-body{
	width : 100%;
	height: 500px;
	padding:10px;
	overflow-y: auto;
	overflow-x: hidden;
}
.chat-footer{
}
hr{
	margin:0;
}
.left{
	margin-left:40px;
	border-top-left-radius: 0px !important;
	border-radius: 22px;
	background-color: lightgray;
	padding: 10px;
	max-width: 70%;
	height: auto;
	word-break:break-all;
	float:left;
	margin-top:5px;
	margin-bottom:5px;
}
.left-div{
	float:left;
	height:100%; 
	width:20%; 
	position:relative;
}

.time-left{
	position:absolute; 
	top:100%; 
	left:0%; 
	font-size:70%; 
	transform: translate(0%, -100%);
}

.right{
	border-bottom-right-radius: 0px !important;
	border-radius: 22px;
	background-color: lightgray;
	padding: 10px;
	max-width: 70%;
	height:auto;
	float:right;
	word-break: break-all;
	margin-top:5px;
	margin-bottom:5px;
	margin-right:5px;
}
.right-div{
	float:right;
	height:100%; 
	width:20%; 
	position:relative;
}
.time-right{
	position:absolute; 
	top:100%; 
	right:0%;
	font-size:70%; 
	transform: translate(0, -100%);
}
.date{
	margin:0 auto; 
	margin-top:5px;
	margin-bottom:5px;
	font-size:90%; 
	text-align:center; 
	color:black; 
	width:150px;  
	padding-top:3px;
	padding-left:10px; 
	padding-right:10px; 
	background-color:lightgray; 
	border-radius:20px;
}

</style>

</head>
<body>
	<div class="chat-header">
		&nbsp;&nbsp;${writer_fix}
		<c:set var="userid_" value="${userid}"></c:set>
		<c:set var="writer_fix" value="${writer_fix}"></c:set>
		<c:choose>
			<c:when test="${userid_ ne writer_fix}">
				<span style="float:right;"><span onclick="report()" style="cursor: pointer; color:white; margin-right: 10px;" class="fas fa-exclamation-triangle h-100 fa-lg"></span></span>
			</c:when>
		</c:choose>
	</div>
		<div class="chat-body">
		
		</div>
		
	<div><hr></div>
		
	<div class="container-fluid">
		<div class="chat-footer">
			<form class="box" action="javascript:sendmessage(document.getElementById('content').value)">
			<div style="position: relative; width:100%; ">
				<input autocomplete="off" id="content" type="text" placeholder="메세지를 입력하세요." style="border-radius:18px; outline:none; border:none; width:89%; height:65px; resize: none;">
				<button type="submit" style="float:right; position:absolute; top:0%; left:90%; width:10%; height:65px; outline:none; border:none; background-color:white; color:darkgray;"><span class="align-middle fas fa-paper-plane fa-lg"></span></button>
			</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		var userid = '${userid}';
		var writer = '${writer_fix}';
		var roomseq;
		let currdate = '';
		let finalseq;
	
		var createLeft = (content, date, sender) => {
			var html = 
				'<div class="row">' +
				'<div><span class="fas fa-user-circle fa-2x"></span><span> '+ sender +'</span></div><br>' +
				'<div class="col-12">' +
				'<div class="left">'+content+'</div>' +
				'<div class="left-div"><span class="time-left">'+date+'</span></div>' +
				'</div></div>';
			return html;
		}
		
		var createRight = (content, date) => {
			var html = 
				'<div class="row">' +
				'<div class="col-12">' +
				'<div class="right">'+content+'</div>' +
				'<div class="right-div"><span class="time-right">'+date+'</span></div>'
				'</div></div>';
			return html;
		}
		
		var getTime = (chattime) => {
			var time = chattime.substring(0, chattime.lastIndexOf(':'));
			var times = chattime.split(':');
			if(parseInt(times[0]) >= 12){
				var t = parseInt(times[0])%12 === 0? 12 : parseInt(times[0])%12;
				times[0] = '오후 ' + t;
			}else{
				var t = parseInt(times[0]) === 0? 12 : parseInt(times[0]); 
				times[0] = '오전 ' + t;
			}
			return times[0] + ':' + times[1]; 
		}
		
		function dateFormat(date) {
	        let month = date.getMonth() + 1;
	        let day = date.getDate();
	        let hour = date.getHours();
	        let minute = date.getMinutes();
	        let second = date.getSeconds();

	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;
	        hour = hour >= 10 ? hour : '0' + hour;
	        minute = minute >= 10 ? minute : '0' + minute;
	        second = second >= 10 ? second : '0' + second;

	        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
		}
		
		var longpolling = ()=> {
			$.ajax({
				url:"longpolling.do",
				data:{"roomseq":roomseq,
					  "userid":userid,
					  "finalseq": parseInt(finalseq)},
				method: "post",
				async: true,
				success:function(data){ 
					if(data.data === true){
						
						var datalist = $.parseJSON(data.list);
						
						datalist.forEach(chat => {
							
							finalseq = chat.chatseq;
							
							var chatdate = dateFormat(new Date(chat.senddate)).split(' ')[0];
							var chattime = getTime(dateFormat(new Date(chat.senddate)).split(' ')[1]);
							if(chatdate != currdate){
								$('.chat-body').append('<div class="date">'+chatdate+'</div>')
								currdate = chatdate;
							}
							
							if(chat.sender === null || chat.sender === 'exit'){
								$('.chat-body').append('<div style="text-align:center; color:gray; width:100%;">'+chat.content+'</div>')
								if(chat.sender === 'exit'){
									document.getElementById('content').readOnly = true;
									longpolling = null;
								}
							}else if(chat.sender === '${userid}'){
								$('.chat-body').append(createRight(chat.content, chattime))
							}else{
								console.log(chat.sender);
								$('.chat-body').append(createLeft(chat.content, chattime, chat.sender))
							}
							
						});
						//포커스
						document.querySelector('.chat-body').scrollTop = document.querySelector('.chat-body').scrollHeight;
						longpolling();
						
					}else{
						location.href='error.do';
					}
				}
			})
		}
		
		function sendmessage(val){
			var trimVal = val.trim();
			if(trimVal === ''){return;}
			
			$.ajax({
				url:"joonggo_sendmessage.do",
				data:{"roomseq":roomseq,
					  "sender":userid,
					  "content":trimVal},
				method: "post",
				success:function(data){ 
					if(data.data === true){
						document.querySelector('#content').value = '';
					}else{
						location.href='error.do';
					}
				}
			})
		}
	
		$(function(){
			var list = ${list};
			
			
			list.forEach(chat => {
				
				finalseq = chat.chatseq;
				
				var chatdate = dateFormat(new Date(chat.senddate)).split(' ')[0];
				var chattime = getTime(dateFormat(new Date(chat.senddate)).split(' ')[1]);
				if(chatdate != currdate){
					$('.chat-body').append('<div class="date">'+chatdate+'</div>')
					currdate = chatdate;
				}
				
				if(chat.sender === null || chat.sender === 'exit'){
					$('.chat-body').append('<div style="text-align:center; color:gray; width:100%;">'+chat.content+'</div>')
					roomseq = chat.roomseq;
					console.log(roomseq);
					if(chat.sender === 'exit'){
						document.getElementById('content').readOnly = true;
					}
					
				}else if(chat.sender === '${userid}'){
					$('.chat-body').append(createRight(chat.content, chattime))
				}else{
					$('.chat-body').append(createLeft(chat.content, chattime, chat.sender))
				}
				
			});
			
			//포커스
			document.querySelector('.chat-body').scrollTop = document.querySelector('.chat-body').scrollHeight;
			console.log(finalseq);
			
			longpolling();
		})
		
		
		function report(){
			$.ajax({
				url:"confirmsession.do",
				method: "post",
				success:function(data){ 
					if(data.data === true){
						popup("joonggo_reportform.do?seq=${joonggoseq}&writer=${writer_fix}&reportid=${userid}", "신고하기",450,520);
					}else{
						alert('로그인이 필요합니다.');
						location.href='loginform.do';
					}
				}
			})
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
	
</body>
</html>
































<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  


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
.container-fluid{padding:0;}
.chat-header{
	height:50px;
	width:100%;
	background-color: #d49466;
	color:white;
	font-size:20px;
}
</style>

</head>
<body>

	<div class="container-fluid">
		<div class="chat-header">
				${writer }님과의 채팅
		</div>
		
		<div class="chat-body">
				<div class="row" style="">
					<div class="col-12" style="" >
						<div style='width:100%; height:500px; background-color: rgb(99, 170, 255); padding:5px;'>
							ㅇ라ㅓㅣㄴ아러먀ㅣㅈ더리나어랴미더리ㅓㄴ야ㅣ러ㅣㄴ야러미냥러ㅣㅁ야너림냥러ㅣㄴ아러ㅣ냐더sdfslkdfjlskdfjsldifslieflsiesfldkflasdfsdfsefse
						</div>
					</div>
				</div>
		
		
		
		
		</div>
	
		<div class="chat-footer">
				<div class="row" style="--bs-gutter-x: 0; height: 100%;">
						<div class="col-10"><textarea style="border:none; display:block; outline:none; width:100%; height:100%; resize: none;"></textarea></div>
						<div class="col-2">
							<button type="button" style="outline:none; border:none; width:100%; height:100%; background-color: rgb(99, 170, 255); color:white;"><span class="fas fa-paper-plane fa-2x"></span></button>
						</div>
				</div>	
		
		</div>
	
	</div>
</body>
</html>
































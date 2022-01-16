<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.center{
	margin: 8em auto;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" charset="UTF-8"></script>	

	<link rel="stylesheet" type="text/css" href="resources/css/webfont.css">
	<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>
	

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script type="text/javascript">
var preUrl;
//페이지 뜨자마자 부르는 스크립트 선언
	 $(function(){
		//$("#loginChk").hide();
		
		 preUrl = document.referrer;
		 console.log(preUrl);
	}); 
	
	
	function login(){
		var memberid = $("input[name=memberid]").val();
		var memberpw = $("input[name=memberpw]").val();
		//로그인 정보를 객체에 담아서 넘긴다
		var loginVal = {
				"myid":memberid,
				"mypw":memberpw
		};

		
		if(memberid == null || memberid == "" || memberpw == null || memberpw == ""){
			alert("ID 및 PW를 확인해 주세요");
		}else{
			$.ajax({
				type:"post",
				url:"ajaxlogin.do",
				data: JSON.stringify(loginVal),
				contentType:"application/json",
				dataType:"json",
				success:function(msg){
				
					if(msg.check==true){
						alert('로그인 성공했습니다.');
						//location.href="list.do";
						//location.href="/controller";
						if(preUrl != "" && preUrl != null){
							location.href=preUrl;
						}else{
							location.href="/controller";
						}
					}else{
						//$("#loginChk").show();
						//$("#login-validation").html("ID 혹은 PW가 잘못되었습니다.");
						alert("ID 혹은 PW가 잘못되었습니다.");
					}
				},
				error:function(){
					alert("통신 실패");
				}
			});
		}
		
		
		
	}
	

</script>
</head>
<body>
<!-- 세로배치 -->
	<div class="center" style="width:300px;">
		<h3 style="text-align:left; font-family: EliceDigitalBaeum_Bold;">로그인</h3>
		<br>
			<p id='login-validation'></p>
			<p>
			<input type="text" name="memberid" style="width:300px; height: 40px;"  placeholder='ID를입력하세요.'>
			</p>
			<input type="password" name="memberpw" style="width:300px; height: 40px;"  placeholder='PW를입력하세요.'>
			
			<p>
			<div style="text-align: right; font-size: 9pt; color:#000000;">
			<a href="findId.do" style="color:#000000;">아이디 찾기 | </a>
			<a href="findPw.do" style="color:#000000;">비밀번호 찾기</a>
			</div>
			</p>
			
			<div class="d-grid gap-2 col-15 mx-auto">
				<button class="btn text-white" style="background-color: #198754;" type="button" onclick='login();' value="login">로그인</button>
				<button id="loginChk" class="btn text-white" style="background-color: #d49466;" " type="button"  onclick="location.href='registerform.do'";>회원가입</button>
			</div>
			<br>
			<br>
			<img src="resources/img/join_event.gif" width='100%' alt="event_gif">
					
		</div>

</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
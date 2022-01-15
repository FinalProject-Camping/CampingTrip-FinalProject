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
	function ajaxFindPw(){
		var myid = $("#myid").val();
		var myname = $("#myname").val();
		var mybirth = $("#mybirth").val();
		var myphone = $("#myphone").val();
		//회원 정보를 객체에 담아서 넘긴다
		var findPwVal = {
				"myid":myid,
				"myname":myname,
				"mybirth":mybirth,
				"myphone":myphone
		};

		
		if(myid == null || myid == "" || myname == null || myname == "" || mybirth == null || mybirth == "" || myphone == null || myphone == ""){
			alert("입력정보를 빠짐없이 입력해주세요");
		}else{
			$.ajax({
				type:"post",
				url:"ajaxFindPw.do",
				data: JSON.stringify(findPwVal),
				contentType:"application/json",
				dataType:"json",
				success:function(msg){
				
					if(msg.check>0){
						//줄바꿈 \n
						alert('회원님의 비밀번호를 id와 동일하게 초기화 하였습니다. \n로그인 후 비밀번호를 변경하세요.');
						//id찾으면 메인으로 이동
						location.href="/controller";
					}else{
						alert("입력하신 정보에 해당하는 회원정보가 없습니다. 다시 확인해주세요.");
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
	<div class="center" style="width:300px;">
		<h3 style="text-align:left; font-family: EliceDigitalBaeum_Bold;">비밀번호찾기</h3>
		<br>
			<p>비밀번호를 초기화 합니다.</p>
			<p>
			<input type="text" id="myid" name="myid" style="width:300px; height: 40px;"  placeholder='아이디를 입력하세요'>
			<input type="text" id="myname" name="myname" style="width:300px; height: 40px;"  placeholder='이름을 입력하세요'>
			<input type="date"  min='1899-01-01' max='2000-13-13' id="mybirth"  name="mybirth"  class="birth"  
					style="float:left; width:170px; height: 40px; font-size: 10pt;" maxlength="8" required numberOnly   placeholder='가입시 입력한 생년월일을 입력하세요'>
			<input type="text" id="myphone"   name="myphone" style="width:300px; height: 40px;"  placeholder='가입시 입력한 휴대전화 번호를 입력하세요'>
			</p>
			
			
			<div class="d-grid gap-2 col-15 mx-auto">
				<button class="btn text-white" style="background-color: #198754;" type="button" onclick="ajaxFindPw();" value="login">비밀번호초기화</button>
			</div>
			<br>
			<br>
			
			<img src="resources/img/join_event.gif" width='100%' alt="event_gif">
					
		</div>

</body>

<script type="text/javascript">
//생년월일 max값 현재날짜로 설정하는
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("mybirth").setAttribute("max", today);

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
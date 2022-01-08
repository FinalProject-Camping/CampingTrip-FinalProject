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
<script type="text/javascript">
	$(function(){
		$("#loginChk").hide();
	});
	
	
	function login(){
		var memberid = $("#memberid").val().trim();
		var memberpw = $("#memberpw").val().trim();
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
						location.href="/controller";
					}else{
						$("#loginChk").show();
						$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
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

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
<!--
	<h2>LOGIN</h2>
	
 	<table>
		<tr>
			<th>ID</th>
			<td><input type="text" id="memberid"/></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" id="memberpw"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="login" onclick="login();"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="loginChk"></td>
		</tr>
	</table>
	 -->
	
	<div class="center" style="width:300px;">
		<h3 style="text-align:left;">로그인</h3>
		<br>
			<p>
			<input type="text" name="memberid" style="width:300px; height: 30px;">
			</p>
			<input type="password" name="memberpw" style="width:300px; height: 30px;">
			
			<!-- id찾기, 비밀번호 찾기 만들어야함 -->
			<div style="text-align: right; font-size: 8pt; color:#000000;">
			<a href="idfound();" style="color:#000000;">아이디 찾기 | </a>
			<a href="pwfound();" style="color:#000000;">비밀번호 찾기</a>
			</div>
			
			<div class="d-grid gap-2 col-15 mx-auto">
				<button class="btn text-white" style="background-color: #008000;" type="button" onclick='login();' value="login">로그인</button>
				<button id="loginChk" class="btn text-black" style="background-color: lightgrey;" " type="button"  onclick="registForm();">회원가입</button>
			</div>

		</div>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
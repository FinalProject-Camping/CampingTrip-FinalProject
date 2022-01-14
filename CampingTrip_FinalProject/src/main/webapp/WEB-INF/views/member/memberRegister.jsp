<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<!-- Bootstrap CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" charset="UTF-8"></script>	

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script type="text/javascript">

	function indexForm(){
		location.href="logincontroller.jsp?command=index";
	}
	/* 
	function reregistForm(){
		var chk = document.getElementsByName("myid")[0].title;
		var pw = $('#pw').val();
		var repw = $('#repw').val();
		var phone = $('#myphone').val();
		if(chk=="n"){
			alert("아이디 중복확인이 필요합니다.");
			document.getElementsByName("myid")[0].focus();
		}else if(pw.trim()=="" || pw==null || repw.trim()=="" || repw==null || phone.trim()=="" || phone==null){
			alert("필수정보를 모두 입력하세요.");
		}else if(phone.length < 11){
			alert("휴대폰 번호를 확인하세요.");
		}else if($('#id-validate').css('display') == 'block'  || $('#pw-validate').css('display') == 'block'){
			alert("올바른 입력 정보가 아닙니다.")
		}else{
			location.href="logincontroller.jsp?command=reregistform";			
		}
		
	}
	 */
	function idChk(){
		var inputId = $('#myid').val();
		if(inputId.trim()==" " || inputId==null ){
			alert("아이디를 입력해주세요");
		}else{
			//console.log(inputId);
			//console.log(JSON.stringify(inputId),);
			//var target = "logincontroller.jsp?command=idchk&id="+doc.value.trim();
			//open(target,"","width=200,height=200");
			$.ajax({
				type:"post",
				url:"ajaxIdChk.do",
				data: inputId,//JSON.stringify(inputId),
				contentType:"application/json",
				dataType:"json",
				success:function(msg){
					
					if(msg.check==true){
						alert("사용가능한 아이디입니다.");
						$('#myid').attr('title','y');
						$('#id-validate').css('display','none');
						//location.href="list.do";
					}else{
						alert("사용하실 수 없는 아이디입니다.");
						$('#myid').attr('title','n');
						$('#id-validate').css('display','block');
						//$("#loginChk").show();
						//$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
					}
				},
				error:function(){
					alert("통신 실패");
				}
			});
		}
	}
	//ajax ee
	
	
	
	
	function idChkConfirm(){
		var chk = document.getElementsByName("myid")[0].title;
		if(chk=="n"){
			alert("아이디 중복확인이 필요합니다.");
			document.getElementsByName("myid")[0].focus();
		}
	}
	
	
	
	//비밀번호, 비밀번호재확인 비교
	function keyevent() {
		//비밀번호
		var mypw = $("#pw").val();
		var repw = $("#repw").val();
		
		if(mypw != repw){
			$('#pw-validate').css('display','block');
		}else{
			$('#pw-validate').css('display','none');
		}
	}
	
	
	
	//중복확인 버튼 활성화 조건: 아이디란이 비어있거나 공백을 입력하면 활성화 되지 않는다
	function idevent(obj){
		var myid = $("#myid").val();
		
		if(myid != null && myid != ""){
			$('#idchkbtn').removeAttr('disabled');
		}else{
			$('#idchkbtn').attr('disabled','disabled');
		}

		//아이디 수정 시 다시 중복확인
		$('#myid').attr('title','n');
	}
	
	
	
	
//회원가입 ajax 컨트롤러를 실행해주는 함수(/ajaxInsertMember.do)
	function ajaxJoin(){
		//validation check
		//디비에 조건 수정하기
		
		//아이디 체크
		if($('#myid').val() =="" || $('#myid').val() ==null ){
			alert("아이디를 확인하세요.");
		}else if($('#myid').attr('title') =="n" ){
			alert("아이디 중복확인이 필요합니다.");
		//비밀번호 체크
		}else if($('#pw-validate').css('display') =='block' ||$('#pw-validate').css('display') != 'none' ){
			alert("비밀번호를 확인하세요.");
		}else if($('#pw').val() =="" || $('#pw').val() ==null ){
			alert("비밀번호를 확인하세요.");
		//휴대폰번호 체크
		}else if($('#myphone').val() =="" || $('#myphone').val() ==null ){
			alert("휴대폰번호를 확인하세요.");
		//이름 체크
		}else if($('#myname').val() =="" || $('#myname').val() ==null ){
			alert("이름을 확인하세요.");
		//생년월일 체크
		}else if($('#mybirth').val() =="" || $('#mybirth').val() ==null ){
			alert("생년월일을 확인하세요.");
		//이메일 체크
		}else if($('#myemail').val() =="" || $('#myemail').val() ==null ){
			alert("이메일을 확인하세요.");
		//주소 체크
		}else if($('#myaddr').val() =="" || $('#myaddr').val() ==null){
			alert("주소를 확인하세요.");
		}else{
				var myid = $('form[name=memberInfoForm]').find('[name=myid]').val();
				var mypw = $('form[name=memberInfoForm]').find('[name=mypw]').val();
				var myphone = $('form[name=memberInfoForm]').find('[name=myphone]').val();
				var myname = $('form[name=memberInfoForm]').find('[name=myname]').val();
				var mybirth = $('form[name=memberInfoForm]').find('[name=mybirth]').val();
				var mysex = $('form[name=memberInfoForm]').find('input[name=mysex]:checked').val();
				var myemail = $('form[name=memberInfoForm]').find('[name=myemail]').val();
				var myaddr = $('form[name=memberInfoForm]').find('[name=myaddr]').val();
				var myrole = $('form[name=memberInfoForm]').find('[name=myrole]').val();
				const mbrInfo = {
						myid: myid,
						mypw: mypw,
						myphone: myphone,
						myname: myname,
						mybirth: mybirth,
						mysex: mysex,
						myemail: myemail,
						myaddr: myaddr,
						myrole: myrole
				}

				
				$.ajax({
					type:"post",
					url:"ajaxMemberInsert.do",
					data:JSON.stringify(mbrInfo),
					contentType:"application/json",
					dataType:"json",
					success:function(msg){
						//alert(JSON.stringify(msg));
						if(msg.check==true){
							alert("회원가입에 성공하였습니다.");
							location.href="loginform.do";
						}else{
							alert("회원가입에 실패하였습니다. 다시 시도해주세요.");
							location.href="registerform.do";
						}
					},
					error:function(){
						alert("통신 실패");
					}
				});	
			}
	}

	
	//전화번호에 숫자만 입력되도록
	$(document).on("keyup", "input[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );})
	
	
</script>



</head>
<style type="text/css">
.center{
	margin: 3em auto;
}
</style>


<body>
	<div class="center" style="width:300px;">
	
			<c:choose>
				<c:when test="${adminRole eq '관리자'}">
					<h3 style="text-align:left;">관리자 계정 추가</h3>
				</c:when>
				<c:otherwise>
					<h3 style="text-align:left;">회원가입</h3>
				</c:otherwise>
			</c:choose>
			
		<form name='memberInfoForm'  autocomplete="off">
			<br>
		
			<p>
			<div style="height:65px;">
				<div style="text-align:left; font-size: 12pt; width:40%; float:left; ">아이디</div>
				<div id="id-validate" class="validate-false" style="text-align:right; font-size: 8pt; color:red; display:none; width:60%; float:left; ">*이미 존재하는 ID 입니다</div>
					<input type="text" id="myid" onkeyup="idevent(this);" name="myid" title="n" style="float:left; width:210px; height: 40px; font-size: 10pt;">
					<input type="button" id="idchkbtn" value="중복확인" onclick="idChk();" style="float:right; width:80px; height: 40px; font-size: 10pt; " required disabled="true">
			</div>
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt;">비밀번호</div>
				<input type="password" id="pw" name="mypw" onkeyup="keyevent();" style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt; width:40%; float:left; ">비밀번호 재확인</div>
			<div id="pw-validate" class="validate-false" style="text-align:right; font-size: 8pt; color:red; display:none;  width:60%; float:left; ">*일치하지 않습니다</div>
				<input type="password" id="repw" onkeyup="keyevent();"  style="width:300px; height: 40px; font-size: 10pt;"	 required>
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt;">휴대전화</div>
				<input type="text" id="myphone" name="myphone" class="number"  style="width:300px; height: 40px; font-size: 10pt;" maxlength="11" required numberOnly >
			</p>
<!--
			<div class="d-md-flex justify-content-md-end">
			  <button class="btn text-white" style="background-color: #198754; width:100px;" type="button" onclick="reregistForm();">다음</button>
			</div>
-->
			<p>
			<div style="text-align:left; font-size: 12pt;">이름</div>
				<input type="text" placeholder="이름을 입력하세요." id='myname' name="myname"  style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			
			<p>
			<div>
				<div style="width:60%; height:50px; float:left;">
					<div style="float:left; text-align:left; font-size: 12pt; width:100%; display:inline-block;">생년월일</div>
					<input type="date"  min='1899-01-01' max='2000-13-13' id="mybirth"  name="mybirth"  class="birth" 
					style="float:left; width:100%; height: 40px; font-size: 10pt;" maxlength="8" required numberOnly>
				</div>
				<div style="float:right; text-align:left; font-size: 12pt; width:35%;">성별</div>
				<div style="width:35%; height:50px; float:left; margin-top:10px;" align="center" >
					<input type="radio" name="mysex" value="남성" checked='checked'>남 &nbsp;&nbsp;
					<input type="radio" name="mysex" value="여성">여
				</div>
			</div>
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt;">이메일</div>
				<input type="text" placeholder="example@naver.com" id="myemail" name="myemail"  style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt;">주소</div>
				<input type="text" name="myaddr" id="myaddr" style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			
			<p>
			<c:choose>
				<c:when test="${adminRole eq '관리자'}">
					<input type="hidden" name="myrole" value="관리자">
				</c:when>
				<c:otherwise>
					<div style="text-align:left; font-size: 12pt;">회원구분</div>
					<div style="width:100%; height:50px; float:left; margin-top:10px;" align="center" >
						<input type="radio" name="myrole" value="사용자" checked='checked'>사용자 &nbsp; &nbsp;
						<input type="radio" name="myrole" value="판매자">판매자
					</div>
				</c:otherwise>
			</c:choose>
			</p>
		</form>
			<br>
			
			<p>
			<div class="d-md-flex justify-content-md-end" style="float:right; display:inline-block;">
				<button  class="btn text-white" style="background-color:#198754; width:100px;" onclick="ajaxJoin();">가입하기</button>
			</div>
			</p>
			
			<br>
			<br>
			<br>

	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
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
</html>
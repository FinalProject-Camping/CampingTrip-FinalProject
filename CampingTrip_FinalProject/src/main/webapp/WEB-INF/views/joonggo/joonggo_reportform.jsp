<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
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

body{font-family: NanumBarunGothic;}
.gray{color:gray;}
.bold{font-weight: bold;}
.btn-del{background-color: #FFFFFF; border: solid 1px gray; color : gray; border-radius: 5px; padding-right:3%; padding-left:3%; font-weight: bold; height: 40px;}
.btn-del:hover{
	transition: all 0.3s;
	border: solid 1px gray;
	background-color: gray;
	color : white;
}
#report-select, #report-textarea {border: 2px solid darkgray; border-radius: 5px; outline: none;}
#report-textarea{margin-bottom: 16px;}
</style>

<script type="text/javascript">

	function report(){
		var select = document.getElementById('report-select');
		var value = select.options[select.selectedIndex].value;
		var reason = document.getElementById('report-textarea');
		if(value === "2"){
			var trimVal = reason.value;
			if(trimVal === '' || trimVal === null){
				alert("사유를 입력하세요.");
				reason.value = '';
				return false;
			}
		}else{
			reason.value = select.options[value].innerHTML;
		}
		
        var form = $("form")[0];        
        var formData = new FormData(form);

        $.ajax({
            cache : false,
            url : "joonggo_report.do",
            processData: false,
            contentType: false,
            type : 'POST', 
            data : formData, 
            success : function(data) {
                
            },
            error : function(xhr, status) {
                alert("오류");
            }
        });
	}
	
	document.addEventListener("DOMContentLoaded", ()=>{
		document.getElementById('report-select').addEventListener("change", function(){
			if(this.value === "2"){
				document.getElementById('report-textarea').value = '';
				document.getElementById('report-textarea').style.display = 'block';
			}else{
				document.getElementById('report-textarea').style.display = 'none';
			}
		});
	});


</script>

</head>
<body>
	<div class="container">
	
		<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		
			<!-- hidden -->
			<input type="hidden" name="seq" value="${seq }"> 
			<input type="hidden" name="reportid" value="${reportid }">
			<input type="hidden" name="writer" value="${writer }">

			<div>
				<br>
				<h5 class="bold" style="color:gray;"><span></span>신고 사유 선택</h5>
			</div>
			<div class="">
				<br> 
				<select id="report-select" class="select w-100">
					<option value="0" selected>상품 도배 행위, 광고성 게시글, 허위 게시글</option>
					<option value="1">욕설/반말/부적절한 언어</option>
					<option value="2">직접 입력</option>
				</select> 
				<br>
				<br>
				<textarea id="report-textarea" name="reason" style="width: 100%; height: 200px; resize: none; display: none;"></textarea>

				<!-- 자료첨부 -->
				자료 첨부: <br><input type="file" id="file" name="file" accept="image/*" multiple>
				
				<br>
				<span class="gray">*허위 신고인 경우, 서비스 활동이 제한될 수 있습니다.</span><br><br>
			</div>
			<div style="text-align:center;">
				<input type="button" class="btn-del" value="신고" onclick="report(); return false;">
			</div>
			
		</form>

	</div>
</body>
</html>































<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소등록하기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.room_row {
	display: flex;
	margin-top: 5px;
	margin-bottom: 5px;
	
}
.title{
	font-family:'EliceDigitalBaeum_Bold';
	font-size:30px;
}
.title_style{
	
	background-color:#006bff7a;
	color:white;
}
.room_column {
	width: 100px;
	font-weight:bold;
}

.room_value {
	width: 400px;
}

input {
	width: 100%;
}

textarea {
	width: 100%;
	height: 150px;
	resize: none;
}
.input-multiple-image{
	width:300px;
}
#multiple-container {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	max-height:200px;
	overflow:auto;
}

.image {
	display: block;
	width: 100%;
}

.image-label {
	position: relative;
	bottom: 22px;
	left: 5px;
	color: white;
	text-shadow: 2px 2px 2px black;
}
.btn2 {
  display: inline-block;
  background: black;
  text-transform: uppercase;
  font-weight: 500;
  font-style: normal;
  font-size: 15px;
  font-weight:bold;
  letter-spacing: 0.3em;
  color: white;
  padding: 10px 30px 10px;
 background:black;
  text-decoration: none;
  margin: 0.625rem;
  border: none;
  border: 1px solid rgba(223,190,106,0.3);
  border-radius:5px;
}

	.file_element{
		display:flex;
		margin-bottom:5px;
	}
	.fwidth{
		width:80%;
	}
	.file_delete{
		margin-left:10px;
		padding-top:8px;
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	#addfile{
		color:black;
	}
	.file-group{
		display:flex;
		margin-bottom:5px;
	}
	.file-btn{
		display:inline-block;
		margin-bottom:20px;
	}
</style>
<script type="text/javascript">
	function sendData(){
		//console.log(document.getElementById("input-multiple-image").value);
		console.log($("#multiple-container img").attr("src"));
		console.log($(".room_element").length);
		Number.prototype.format = function(){
		    if(this==0) return 0;
		 
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		 
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		 
		    return n;
		};
		 
		// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if( isNaN(num) ) return "0";
		 
		    return num.format();
		};

		var rPrice=(document.getElementById("room_price").value).format();
		var src="";
		if(!$("#multiple-container img").attr("src")){
			src="/resources/img/room_default.png";
		}else{
			src=$("#multiple-container img").attr("src");
		}
		
		$("#room_list",opener.document).prepend(
			"<div class='room_element col-md-6 d-flex'>"
			+"<div class='room_image'>"
			+"<img class='image-thumbnail' src='"+
			src
			+"'>"
			+"</div>"
			+"<div class='room_content'>"
			+"<div class='room_name'>"+document.getElementById("room_name").value+"</div><br>"
			+"<span class='room_price'>￦"+rPrice+"</span><br>"
			+"</div></div>"		
		);
		$(".room_value").each(function(){
			$("#room_form",opener.document).prepend($(this).clone());	
		});
		
		window.close();
	}
	function clone(){
		var test = $('#test').clone();
		$('#test').append(test);
	}
	//file 추가,삭제 함수
	function addFile(){
		var cnt = $(".room_element",opener.document).length;
		var str="<div class='file-group'><input type='file' class='form-control input-multiple-image' name='room_image"+cnt+"'><a href='#this' class='file_delete' name='file-delete'>삭제</a></div>";
		$("#file-list").append(str);
		$("a[name='file-delete']").on("click",function(e){
			e.preventDefault();
			deleteFile($(this));
		});
		$(".input-multiple-image").each(function(){
	 		console.log("hey");
	 		$(this).on("change", function(e){
	 	 		 readMultipleImage(e.target)
	 	 	});
		});
	}
	function deleteFile(obj){
		obj.parent().remove();
	}
	//미리보기
	function readMultipleImage(input) {
	    const multipleContainer = document.getElementById("multiple-container")
	    
	    // 인풋 태그에 파일들이 있는 경우
	    if(input.files) {
	        // 이미지 파일 검사 (생략)
	        console.log(input.files)
	        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
	        const fileArr = Array.from(input.files)
	        const $colDiv1 = document.createElement("div")
	        const $colDiv2 = document.createElement("div")
	        $colDiv1.classList.add("column")
	        $colDiv2.classList.add("column")
	        fileArr.forEach((file, index) => {
	            const reader = new FileReader()
	            const $imgDiv = document.createElement("div")   
	            const $img = document.createElement("img")
	            $img.classList.add("image")
	            const $label = document.createElement("label")
	            $label.classList.add("image-label")
	            $label.textContent = file.name
	            $imgDiv.appendChild($img)
	            $imgDiv.appendChild($label)
	            console.log(($img.naturalWidth)+","+($img.naturalHeight))
	            reader.onload = e => {
	                $img.src = e.target.result
	                
	                $imgDiv.style.width = "200px"//($img.naturalWidth) * 0.2 + "px"
	                $imgDiv.style.height = "150px"//($img.naturalHeight) * 0.2 + "px"
	            }
	            
	            console.log(file.name)
	            if(index % 2 == 0) {
	                $colDiv1.appendChild($imgDiv)
	            } else {
	                $colDiv2.appendChild($imgDiv)
	            }
	            
	            reader.readAsDataURL(file)
	        })
	        multipleContainer.appendChild($colDiv1)
	        multipleContainer.appendChild($colDiv2)
	   	 	}
		}
	function validChk(){
		if(!$("input[name=room_name]").val()){
			alert("숙소명을 입력해주세요");
			$("input[name=room_name]").focus();
		}else if(!$("input[name=room_price]").val()){
			alert("가격을 입력해주세요");
			$("input[name=room_price]").focus();
		}else if(!$("input[name=guest_number]").val()){
			alert("숙박인원을 입력해주세요");
			$("input[name=guest_number]").focus();
		}else if(!$("textarea[name=room_content]").val()){
			alert("상세설명을 입력해주세요");
			$("textarea[name=room_content]").focus();
		}else{
			sendData();
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div class="room_row mt-3 mb-3 title_style row">
			<span class="title">숙소 등록하기</span>
		</div>
		<form>
			<div class="room_row row">
				<div class="room_column">숙소이름</div>
				<div class="room_value">
					<input type="text" name="room_name" id="room_name" required>
				</div>
			</div>
			<div class="room_row row">
				<div class="room_column">숙박가격</div>
				<div class="room_value">
					<input type="text" name="room_price" id="room_price" required>
				</div>
			</div>
			<div class="room_row row">
				<div class="room_column">숙박인원</div>
				<div class="room_value">
					<input type="text" name="guest_number" id="guest_number" required>
				</div>
			</div>
			<div class="room_row row">
				<div class="room_column">상세설명</div>
				<div class="room_value">
					<textarea name="room_content" id="room_content" required></textarea>
				</div>
			</div>
			<div class="room_row row">
				<div class="room_column">사진추가</div>
				<div class="room_value" id="test">
					<div class="form-group wrap-input2" id="file-list">
							<span class="file-btn"><a id="addfile" href="#this" onclick="addFile()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg></a></span>
					</div>
				</div>
			</div>
			<div id="multiple-container"></div>
			
		</form>
		<div class="row mt-5">
			<div class="col-md-12 d-flex justify-content-center">
					<button class="btn2" onclick="validChk()">등록</button>
					<button class="btn2" onclick="window.close()">취소</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function readMultipleImage(input) {
    const multipleContainer = document.getElementById("multiple-container")
    
    // 인풋 태그에 파일들이 있는 경우
    if(input.files) {
        // 이미지 파일 검사 (생략)
        console.log(input.files)
        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
        const fileArr = Array.from(input.files)
        const $colDiv1 = document.createElement("div")
        $colDiv1.classList.add("column")
        fileArr.forEach((file, index) => {
            const reader = new FileReader()
            const $imgDiv = document.createElement("div")   
            const $img = document.createElement("img")
            $img.classList.add("image")
            const $label = document.createElement("label")
            $label.classList.add("image-label")
            $label.textContent = file.name
            $imgDiv.appendChild($img)
            $imgDiv.appendChild($label)
            console.log(($img.naturalWidth)+","+($img.naturalHeight))
            reader.onload = e => {
                $img.src = e.target.result
                $img.style.object-fit="cover"
                $imgDiv.style.width = "200px"//($img.naturalWidth) * 0.2 + "px"
                $imgDiv.style.height = "150px"//($img.naturalHeight) * 0.2 + "px"
                $imgDiv.style.overflow="hidden"
            }
            
            $colDiv1.appendChild($imgDiv)
            
            
            reader.readAsDataURL(file)
        })
        multipleContainer.appendChild($colDiv1)
   	 	}
	}
	//const inputMultipleImage = document.getElementById("input-multiple-image")
	//inputMultipleImage.addEventListener("change", e => {
 	//   readMultipleImage(e.target)
 	$(".input-multiple-image").each(function(){
 		console.log("hey");
 		$(this).on("change", function(e){
 		 readMultipleImage(e.target)
 		})
	})
</script>
</body>
</html>
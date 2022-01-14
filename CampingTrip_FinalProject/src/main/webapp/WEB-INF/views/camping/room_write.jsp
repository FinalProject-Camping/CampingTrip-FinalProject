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
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style type="text/css">
.room_row {
	display: flex;
	width: 600px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.room_column {
	width: 100px;
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
	height:200px;
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
</style>
<script type="text/javascript">
	function sendData(){
		//console.log(document.getElementById("input-multiple-image").value);
		console.log($("#multiple-container img").attr("src"));
		console.log($(".room_element").length);
		$("#room_list",opener.document).prepend(
			"<div class='room_element col-md-6 d-flex'>"
			+"<div class='room_image'>"
			+"<img class='image-thumbnail' src='"+$("#multiple-container img").attr("src")+"'>"
			+"</div>"
			+"<div class='room_content'>"
			+"객실명 : "+document.getElementById("room_name").value+"<br>"
			+"객실가격 : "+document.getElementById("room_price").value+"<br>"
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
		var str="<div class='file-group'><input type='file' class='input-multiple-image' name='room_image"+cnt+"'><a href='#this' name='file-delete'>삭제</a></div>";
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
</script>
</head>
<body>
	<div class="container">
		<div class="room_row mt-5 mb-3">
			<h4>숙소 등록하기</h4>
		</div>
		<form>
			<div class="room_row">
				<div class="room_column">객실이름</div>
				<div class="room_value">
					<input type="text" name="room_name" id="room_name" required>
				</div>
			</div>
			<div class="room_row">
				<div class="room_column">객실가격</div>
				<div class="room_value">
					<input type="text" name="room_price" id="room_price" required>
				</div>
			</div>
			<div class="room_row">
				<div class="room_column">객실인원</div>
				<div class="room_value">
					<input type="text" name="guest_number" id="guest_number" required>
				</div>
			</div>
			<div class="room_row">
				<div class="room_column">객실설명</div>
				<div class="room_value">
					<textarea name="room_content" id="room_content" required></textarea>
				</div>
			</div>
			<div class="room_row">
				<div class="room_column">사진추가</div>
				<div class="room_value" id="test">
					<div class="form-group wrap-input2" id="file-list">
							<a href="#this" onclick="addFile()">이미지추가</a>
					</div>
				</div>
			</div>
			<div id="multiple-container"></div>
			
		</form>
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
					<button class="btn2" onclick="sendData()">등록</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고내역</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

<style type="text/css">
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


/* 테이블 */
table {
	/* 테이블 화면 중앙으로 정렬 */
	margin: auto;
	width: 80%;
	border-collapse: collapse;
	line-height: 1.5;
}

h3 {
	font-family: 'EliceDigitalBaeum_Bold';
}

tr > th {
	font-size:17px;
}
tr > td {
	font-size:17px;
}
</style>

</head>
<body>
	<div class="container-fluid">

		<div class="col-md-14" id="contentDiv">
		<br><br><br><br>
			<div class="row justify-content-center">
					<br><br><br>
					<h3 class="mb-3" style="font-weight: bold;">${dto.writer }님 신고접수내역 상세</h3>
					<br>

					<table class="table">
						<tr>
							<th class="grey lighten-2" scope="row" style="width:200px;">신고번호</th>
							<td>${dto.reportseq }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">신고자(reportid)</th>
							<td>${dto.reportid }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">신고내용</th>
							<td>${dto.reportcontent }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">글 작성자</th>
							<td>${dto.writer }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고내역</title>
</head>
<body>
	<table border="1">
		<tr>
			<th class="grey lighten-2" scope="col">신고번호</th>
			<td>${reportseq }</td>
		</tr>
		<tr>
			<th class="grey lighten-2" scope="row">날짜</th>
			<td>${reportdate }</td>
		</tr>
		<tr>
			<th class="grey lighten-2" scope="row">신고자(reportid)</th>
			<td>${reportid }</td>
		</tr>
		<tr>
			<th class="grey lighten-2" scope="row">내용</th>
			<td>${reportcontent }</td>
		</tr>
		<tr>
			<th class="grey lighten-2" scope="row">증빙자료</th>
			<td><img src="${filepath }"></td>
		</tr>
		<tr>
			<th class="grey lighten-2" scope="row">글 작성자</th>
			<td>${writer }</td>
		</tr>
	</table>
</body>
</html>
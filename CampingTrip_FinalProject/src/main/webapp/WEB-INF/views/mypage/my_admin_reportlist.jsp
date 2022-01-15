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
${myid }님의 신고내역
	<table border="1">
		<colgroup>
			<col width="170">
			<col width="1200">
			<col width="1200">
			<col width="1000">
			<col width="1000">
			<col width="1000">
			<col width="1000">
		</colgroup>
		<thead>
			<tr>
				<th>신고번호</th>
				<th>날짜</th>
				<th>신고자(reportid)</th>
				<th>내용</th>
				<th>myno</th>
				<th>myid</th>
				<th>report writer</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="7" align="center">---------- 신고내역이 없습니다 ----------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<th>${dto.report.reportseq }</th>
							<td>${dto.report.reportdate }</td>
							<td>${dto.report.reportid }</td>
							<td><a href="admin_reportdetail.do?report.reportseq=${report.reportseq }">${dto.report.reportcontent }</a></td>
							<td>${dto.myno }</td>
							<td>${dto.myid }</td>
							<td>${dto.report.writer }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>
<%@page import="edu.spring.ex02.controller.songgyu.lecturelista"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="l" items="${list}">
				<tr>
					<td>${l.bno}</td>
					<td><a href="/ex02/songgyu/lecture?bno=${l.bno}&address=${l.address}">${l.title}</a></td>
					<td>${l.name}</td>
				</tr>
			</c:forEach>


		</tbody>
	</table>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Insert title here</title>
<style>

</style>

<!-- 1. Bootstrap CSS -->
<link rel="stylesheet" 
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- 2. jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 사용 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 3. Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery 3.2.1 라이브러리 사용 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body style="font-family:배달의민족 주아;">
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
	<ul class="nav nav-pills">
		<li class="list-group-item list-group-item-action "><a href="register">회원 가입</a></li>
	</ul>
	</div>
</nav>
<div class="container">
<H1 class="text-center text-info"> 회원 메인 페이지 </H1>
<hr/>
<div class="container">
<!-- ////////////////////////////////////////////////////////////////////////////// -->
	<form class="form-group form-inline" action="search" method="get">
	<select class="form-control" name="type">
		<option value="1">아이디</option>
		<option value="2">비밀번호</option>
		<option value="3">이메일</option>
		<option value="4">아이디+비밀번호</option>
	</select>
	<input class="form-control" type="text" name="keyword" placeholder="검색어" />
	<input class="form-control" type="submit" value="검색" />
	</form>
</div>
<!-- ////////////////////////////////////////////////////////////////////////////// -->
<table class="table table-bordered table-hover" >
	<thead>
		<tr class="info text-danger border border-dark">
			<th class="text-center">아이디</th>
			<th class="text-center">비밀번호</th>
			<th class="text-center">이메일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="m" items="${MemberList}">
		<tr class="danger text-success text-center">
			<td><a href="detail?userid=${m.userid}">${m.userid}</a></td>
			<td>${m.password}</td>
			<td>${m.email}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</body>
</html>
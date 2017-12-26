<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
<div class="container">
<h1 class="text-center text-info">상세 보기 페이지</h1>
<div class="container">
	<ul class="list-inline">
		<li class="list-group-item list-group-item-action"><a href="update?userid=${Member.userid}">수정 하기</a></li>
		<li class="list-group-item list-group-item-action"><a href="list">메인으로 돌아가기</a></li>
	</ul>
</div>
<form class="form-group">
	<label class="text-info" for="userid">아이디</label><br/>
	<input class="form-control" type="text" name="userid" id="userid" value="${Member.userid}" readonly /><br/><br/>
	<label class="text-info" for="text">비밀번호</label><br/>
	<input class="form-control" type="text" name="password" id="password" value="${Member.password}" readonly><br/><br/>
	<label class="text-info" for="email">이메일</label><br/>
	<input class="form-control" type="text" name="email" id="email" value="${Member.email}" readonly><br/><br/>
</form>
</div>
</body>
</html>















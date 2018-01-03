<%@page import="edu.spring.ex02.domain.taejun.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
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
<div class="container" style="font-family:배달의민족 주아;">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
			
			<a class="navbar-brand" href="/ex02">홈페이지</a></div>
			
		
			
		</div>
	</nav>

<div class="container">
<h1 class="text-center text-info">게시글 수정 페이지</h1>
<div class="container">
	<ul class="list-inline">
		<li class="list-group-item list-group-item-action"><a href="list">메인으로 돌아가기</a></li>
		<li class="list-group-item list-group-item-action"><a href="delete?bno=${board.bno}">삭제하기</a></li>
	</ul>
</div>
<form action="update" method="post" class="form-group">
	<label class="text-info" for="bno">번호</label><br/>
	<input class="form-control" type="number" name="bno" id="bno" value="${board.bno}" readonly /><br/><br/>
	<label class="text-info" for="title">제목</label><br/>
	<input class="form-control" type="text" name="title" id="title" value="${board.title}" required/><br/><br/>
	<label class="text-info" for="content">내용</label><br/>
	<textarea class="form-control" name="content" rows="20" cols="40" required>${board.content}</textarea><br/><br/>
	<label class="text-info" for="userid">작성자</label><br/>
	<input class="form-control" type="text" name="userid" id="userid" value="${board.userid}" readonly><br/><br/>
	<label class="text-info" for="regdate">작성 시간</label><br/>
	<fmt:formatDate var="regdate" value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	<input class="form-control" type="text" id="regdate" value="${regdate}" /><br/><br/>
	<input class="btn btn-success" type="submit" value="수정!" />
</form>
</div>
</body>
</html>















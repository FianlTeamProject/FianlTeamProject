<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1 class="text-center text-info" >새 글 작성 페이지</h1>
<form action="register" method="post" class="form-group">
	<label for="title">글 제목</label><br/>
	<input class="form-control" type="text" name="title" id="title" placeholder="글 제목을 입력하세요..." required /><br/><br/>
	<label for="content">글 내용</label><br/>
	<textarea class="form-control" rows="20" cols="40" name="content" id="content" placeholder="글 내용을 입력하세요..." required></textarea><br/><br/>
	<label for="userid">아이디</label><br/>
	<input class="form-control" type="text" name="userid" id="userid" required /><br/><br/>
	<input class="btn btn-success" type="submit" value="작성 완료" />
</form>
</div>
</body>
</html>
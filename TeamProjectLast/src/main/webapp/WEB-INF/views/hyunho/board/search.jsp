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
<body>
<div class="container" style="font-family:배달의민족 주아;" >
<H1 class="text-center text-info"> 게시판 메인 페이지 </H1>
<div class="container">
	<ul class="list-inline">
		<li class="list-group-item list-group-item-action "><a href="register">새 글 작성</a></li>
	</ul>
</div>
<hr/>
<div class="container">
<!-- ////////////////////////////////////////////////////////////////////////////// -->
	<form class="form-group form-inline" action="search" method="get">
	<select class="form-control" name="searchType">
		<option value="1">작성자</option>
		<option value="2">제목</option>
		<option value="3">제목+내용</option>
	</select>
	<input class="form-control" type="text" name="searchKeyword" placeholder="검색어" />
	<input class="form-control" type="submit" value="검색" />
	</form>
</div>
<!-- ////////////////////////////////////////////////////////////////////////////// -->
<table class="table table-bordered table-hover" >
	<thead>
		<tr class="info text-danger border border-dark">
			<th class="text-center">글번호</th>
			<th class="text-center">제목</th>
			<th class="text-center">작성자</th>
			<th class="text-center">작성시간</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${boardList}">
		<tr class="danger text-success text-center">
			<td>${board.bno}</td>
			<td><a href="detail?bno=${board.bno}">${board.title}</a></td>
			<td>${board.userid}</td>
			<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<ul id="pagination" class="pagination">
	<c:if test="${pageMaker.prev}">
		<!-- 이전 버튼은 (startPage - 1) -->
		<li><a class="page-link" href="${pageMaker.startPage-1}">◀이전</a></li>
	</c:if>
	<c:forEach var="num" 
	begin="${pageMaker.startPage}" 
	end="${pageMaker.endPage}" >
		<li><a class="page-link" href="${num}">${num}</a></li>
	</c:forEach>
	
	<c:if test="${pageMaker.next}">
		<!-- 다음 버튼은 (endPage + 1) -->
		<li><a class="page-link" href="${pageMaker.endPage+1}">다음▶</a></li>
	</c:if>
</ul>

<form id="pageForm" action="search" method="get" >
	<input type="hidden" name="page" id="page" value="${pageMaker.criteria.page}" />
	<input type="hidden" name="perPage" id="perPage" value="${pageMaker.criteria.numsPerPage}" />
	<input type="hidden" name="searchType" id="searchType" value="${param.searchType}" />
	<input type="hidden" name="searchKeyword" id="searchKeyword" value="${param.searchKeyword}" />
</form>
</div>

<script>
$(function(){
	$('#pagination li a').click(function(){
		
		// <a> 태그의 기본 동작(페이지 이동)을 막아버림
		event.preventDefault();
		
		// 이동할 페이지
		var target = $(this).attr('href');
		// 서브밋할 폼의 값을 바꿔줌.
		$('#page').val(target);		
		// 서브밋
		$('#pageForm').submit();
	});
});
</script>

</body>
</html>
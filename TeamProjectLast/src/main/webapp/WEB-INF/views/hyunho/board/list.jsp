<%@page import="edu.spring.ex02.domain.taejun.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
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
			<ul class="nav navbar-nav navbar-right">
				<%
				try{
					Member loginResult = (Member) session.getAttribute("loginResult");
					if(loginResult!=null) {
						out.print("<li><a href=\"/ex02/TaeJun/member/info\"><span class=\"glyphicon glyphicon-user\"></span>"+loginResult.getMid()+"</li>");
						out.print("<li><a href=\"/ex02/logout\"></span> 로그아웃</a></li>");
					}else {
						out.print("<li><a href=\"/ex02/TaeJun/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
						out.print("<li><a href=\"/ex02/TaeJun/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
					}
				} catch (NullPointerException e) {
					out.print("<li><a href=\"/ex02/TaeJun/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
					out.print("<li><a href=\"/ex02/TaeJun/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
				}
				%>	
			</ul>
		
			
		</div>
	</nav>

<div class="jumbotron"  >
<H1 class="text-center text-info"> 토론 게시판 </H1>

<hr/>
<div class="container">
<!-- ////////////////////////////////////////////////////////////////////////////// -->
	<!-- 
	<form class="form-group form-inline" action="search" method="get">
	<select class="form-control" name="searchType">
		<option value="1">아이디</option>
		<option value="2">비밀번호</option>
		<option value="3">이메일</option>
		<option value="4">아이디+비밀번호</option>
	</select>
	<input class="form-control" type="text" name="searchKeyword" placeholder="검색어" />
	<input class="form-control" type="submit" value="검색" />
	</form>
	 -->
</div>
<!-- ////////////////////////////////////////////////////////////////////////////// -->
<table class="table table-bordered table-hover" >
	<thead>
		<tr class="info text-danger border border-dark">
			<th class="text-center">글번호</th>
			<th class="text-center">제목</th>
			<th class="text-center">아이디</th>
			<th class="text-center">작성날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${boardList2}">
            <tr>
                <td class="text-center">${board.bno}</td>
                <td class="text-center">
                    <a href="detail?bno=${board.bno}">${board.title}</a>
                </td>
                <td class="text-center">${board.userid}</td>
                <td class="text-center">
                    <fmt:formatDate var="regdate" value="${board.regdate}" pattern="yyyy/MM/dd HH:mm:ss"/> ${regdate}
                </td>
            </tr>
        </c:forEach>
	</tbody>
</table>
<div class="text-center">
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
</div>
<form id="pageForm" action="list" method="get" >
	<input type="hidden" name="page" id="page" value="${pageMaker.criteria.page}" />
	<input type="hidden" name="perPage" id="perPage" value="${pageMaker.criteria.numsPerPage}" />
</form>
</div>
<div class="container">
	<ul class="list-inline">
		<li class="list-group-item list-group-item-action "><a href="register">새 글 작성</a></li>
	</ul>
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









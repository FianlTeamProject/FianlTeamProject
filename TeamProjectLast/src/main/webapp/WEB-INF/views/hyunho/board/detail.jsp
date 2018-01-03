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
			
			
						<ul class="nav navbar-nav">
				<li><a href="/ex02/hyunho/board/list">게시판</a></li>
			</ul>
			
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

<div class="jumbotron">
<h1 class="text-center text-info">상세 보기 페이지</h1>
<div class="container">
	<ul class="list-inline">
		<li class="list-group-item list-group-item-action"><a href="update?bno=${board.bno}">수정 하기</a></li>
		<li class="list-group-item list-group-item-action"><a href="list">메인으로 돌아가기</a></li>
	</ul>
</div>
<form class="form-group">
	<label class="text-info" for="bno">번호</label><br/>
	<input class="form-control" type="number" name="bno" id="bno" value="${board.bno}" readonly /><br/><br/>
	<label class="text-info" for="title">제목</label><br/>
	<input class="form-control" type="text" name="title" id="title" value="${board.title}" readonly /><br/><br/>
	<label class="text-info" for="content">내용</label><br/>
	<textarea class="form-control" name="content" rows="10" cols="40" readonly >${board.content}</textarea><br/><br/>
	<label class="text-info" for="userid">작성자</label><br/>
	<input class="form-control" type="text" name="userid" id="userid" value="${board.userid}" readonly><br/><br/>
	<label class="text-info" for="regdate">작성 시간</label><br/>
	<fmt:formatDate var="regdate" value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	<input class="form-control" type="text" id="regdate" value="${regdate}" />
</form>

<hr/>
<h2>댓글</h2>
<hr/>

<form class="form-group">
<textarea class="form-control" id="rtext" rows="5" cols="50" name="rtext"></textarea><br/><br/>
<input class="form-control" id="replier" name="replier" >
<input class="form-control" type="hidden" id="bno"  name="bno" value="${board.bno}" readonly/>
<button class="btn btn-info" id="btn-insert">확인</button>
</form>
<div id="replies">
	
</div>

<script>
$(function(){
	function getAllReplies(){
		$.getJSON('/ex02/replies/all/' + ${board.bno}, 
		function(data){// 매개변수 data : Ajax 요청에 대한 응답으로 온 데이터
			
			var replyList = '';
			$(data).each(function(){
				replyList += '<div class="reply-item" data-rno=' + this.rno + '>'
						  + '<input type="hidden" id="rno" value="' + this.rno + '" readonly />'
						  + '<input type="text" style="background-color: silver;" class="form-control" id="rtext" value="' + this.rtext + '" />'
						  + '<input type="text" id="replier" value="' + this.replier + '" readonly />'
						  + '<button class="btn-update" >수정</button>'
						  + '<button class="btn-delete" >삭제</button>'
						  + '</div>';
			});
			$('#replies').html(replyList);
			
		});
	}// end function getAllReplies()
	getAllReplies();
	
	$('#btn-insert').click(function(){
		var rtext = $('#rtext').val();
		var replier = $('#replier').val();
		var bno = $('#bno').val();
		
		$.ajax({
			type: 'post',
			url: '/ex02/replies',
			headers:{
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'POST'
			},
			data: JSON.stringify({
				'bno' : bno,
				'rtext' : rtext,
				'replier' : replier
			}),
			success: function(result){
				if(result === 1){
					
					getAllReplies();
				}else{
				}
			}
		});
		
	});
	
	$('#replies').on('click' , '.reply-item .btn-update' , 
			function(){
				var rno = $(this).prevAll('#rno').val();
				var rtext = $(this).prevAll('#rtext').val();
				
				$.ajax({
					type: 'PUT',
					url : '/ex02/replies/'+rno,
					headers: {	
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'PUT'
					},
					data: JSON.stringify({
						'rtext' : rtext
					}),
					success : function(result){
						if(result === 'success'){
							getAllReplies();
						}else{
						}
					}
				});
			});
				
				$('#replies').on('click' , '.reply-item .btn-delete' , 
						function(){
							var rno = $(this).prevAll('#rno').val();
							$.ajax({
								type: 'DELETE',
								url : '/ex02/replies/'+rno,
								headers: {	
									'Content-Type' : 'application/json',
									'X-HTTP-Method-Override' : 'DELETE'
								},
								data: JSON.stringify({
									'rtext' : rtext
								}),
								success : function(result){
									if(result === 'success'){
										getAllReplies();
									}else{
									}
								}
							});
				});

	
});
</script>
</body>
</html>















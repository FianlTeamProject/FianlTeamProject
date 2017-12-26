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
<input class="form-control" id="replier" name="replier" value="${board.userid}">
<input class="form-control" type="hidden" id="bno" name="bno" value="${board.bno}" readonly/>
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
				replyList += '<div class="form-group" id="reply-item" data-rno=' + this.rno + '>'
						  + '<input type="hidden" class="form-control" id="rno" value="' + this.rno + '" readonly />'
						  + '<input type="text" class="form-control" id="rtext" value="' + this.rtext + '" />'
						  + '<input type = "text" value = " 작성자 "/>'
						  + '<input type="text" id="replier" value="'  + this.replier + '" readonly />'
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
					alert("댓글 입력 성공");
					getAllReplies();
				}else{
					alert("댓글 입력 실패");
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















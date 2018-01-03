<%@page import="edu.spring.ex02.domain.taejun.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
  
  
	<title>Main Page</title>
</head>
<body>
<div class="container-fluid">
<div class="container">
	<nav class="navbar navbar-inverse navbar-fixed-top">
	
		<div class="container-fluid">
		
			<div class="navbar-header">
			
			<a class="navbar-brand" href="/ex02">홈페이지</a></div>
			
			<ul class="nav navbar-nav navbar-right">
				
				<%
				String userId;
				try{
					Member loginResult = (Member) session.getAttribute("loginResult");
					if(loginResult!=null) {
						userId=loginResult.getMid();
						out.print("<li><a href=\"\"><span class=\"glyphicon glyphicon-user\"></span>"+loginResult.getMid()+"</li>");
						out.print("<li><a href=\"/ex02/logout\"></span> 로그아웃</a></li>");
					}else {
						userId="손님";
						out.print("<li><a href=\"/ex02/TaeJun/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
						out.print("<li><a href=\"/ex02/TaeJun/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
					}
				} catch (NullPointerException e) {
					userId="손님";
					out.print("<li><a href=\"/ex02/TaeJun/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></li>");
					out.print("<li><a href=\"/ex02/TaeJun/member/login\"><span class=\"glyphicon glyphicon-log-in\"></span> 로그인</a></li>");
				}
				%>
				
			</ul>
			
		</div>
	</nav>

	<div class="jumbotron">
		<h1 align="center">::MainPage::</h1>
	</div>
	
	<div class="row content"> <!-- 로그인  페이지 시작 -->
		<div class="col-sm-3 sidenav">
			<div style="margin-top: 10%;">
		<%
				try{
					Member loginResult = (Member) session.getAttribute("loginResult");
					
					if(loginResult!=null) {
						userId=loginResult.getMid();
						out.print("<li><a href=\"\"><span class=\"glyphicon glyphicon-user\"></span>"+loginResult.getMid()+"</li>");
						out.print("<li><a href=\"/ex02/logout\"></span> 로그아웃</a></li>");
					}else {
						out.print("	<form method=\"post\">\r\n" + 
								"		<div class=\"input-group form-group \" id=\"idtbl\" >\r\n" + 
								"			<span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-user\"></i></span>\r\n" + 
								"			<input id=\"mid\" type=\"text\" class=\"form-control\" name=\"mid\" required placeholder=\"User ID\">\r\n" + 
								"		</div>\r\n" + 
								"		\r\n" + 
								"		<div class=\"input-group form-group\" id=\"pwddiv\">\r\n" + 
								"			<span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-lock\"></i></span>\r\n" + 
								"			<input id=\"pwd\" type=\"password\" class=\"form-control\" name=\"pwd\" required placeholder=\"Password\">\r\n" + 
								"		</div>\r\n" + 
								"		<br>\r\n" + 
								"		<div class=\"input-group\" align=\"right\">\r\n" + 
								"			<input class=\"btn btn-default\" id=\"submit\" type=\"submit\" value=\"Login\" />\r\n" +
								"			<button style=\"margin-left: 35px\" class=\"btn btn-default\"><a href=\"/ex02/TaeJun/member/register\"><span class=\"glyphicon glyphicon-user\"></span> 회원가입</a></button>"+
								"		</div>\r\n" + 
								"	</form>");
						
						
						userId="손님";
					}
				} catch (NullPointerException e) {
					out.print("	<form method=\"post\">\r\n" + 
							"		<div class=\"input-group form-group \" id=\"idtbl\" >\r\n" + 
							"			<span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-user\"></i></span>\r\n" + 
							"			<input id=\"mid\" type=\"text\" class=\"form-control\" name=\"mid\" required placeholder=\"User ID\">\r\n" + 
							"		</div>\r\n" + 
							"		\r\n" + 
							"		<div class=\"input-group form-group\" id=\"pwddiv\">\r\n" + 
							"			<span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-lock\"></i></span>\r\n" + 
							"			<input id=\"pwd\" type=\"password\" class=\"form-control\" name=\"pwd\" required placeholder=\"Password\">\r\n" + 
							"		</div>\r\n" + 
							"		<br>\r\n" + 
							"		<div class=\"input-group\" align=\"right\">\r\n" + 
							"			<input class=\"btn btn-default\" id=\"submit\" type=\"submit\" value=\"Login\" />\r\n" +
							"		</div>\r\n" +
							"	</form>"+
							"<button> <a href=\"/ex02/TaeJun/member/register\"> <span class=\"glyphicon glyphicon-user\"> </span> 회원가입</a> </button>");
					userId="손님";
				}
				%>
				</div>
	
<input type="hidden" id="failput" name="failput" value="${fail}"/>

<script>
$(document).ready(function() {
	function failed() {
		var fail= $('#failput').val();
			if('fail'==fail){
				alert('로그인이 필요한 기능입니다.');
			}
	}
	failed();
});
</script>
			
			<div style="margin-top: 15%;" class="col-sm-9">
				채팅이 들어갈 공간
			</div>
		</div> <!-- 로그인 페이지 끝 -->
		
		
		<!-- 1번게시판 -->
<script>$(document).ready(function() {
	
	// 검색할 댓글의 게시글 번호
	// JQuery를 사용해서 AJax요청을 보내는 함수들 중에서
	// $.getJSON(url, data, callback)
	// 해당 url로 HTTP GET 방식의 ajax 요청을 보내고,	
	// JSON 객체를 로드하는 함수
	// url(필수) : 서버로 요청을 보내는 주소
	// data (선택): 요청과 함께 서버로 보내는 데이터. 생략 가능.
	// callback (선택): 응답을 받았을 때 처리할 일을 정의하는 콜백 함수
	function getOneboard() {
		$.ajax({
			url: '/ex02/TaeJun/board/list',
			success: function(res, status, xhr) {
				$('#oneboard').html(res);
			}
		});
	}//getOneboard();
	
	function getTwoBoard() {
		$.ajax({
			url: '/ex02/hyunho/board/list',
			success: function(res, status, xhr) {
				$('#twoboard').html(res);
			}
		});
	}//end getTwoBoard
	
	var thisPage = ${page};
	$('#'+thisPage).addClass("active");
	
});</script>
			<div class="col-sm-4">
				<div id="oneboard" class="well well-lg">
				<div align="center">
					<script>
						$(document).ready(function(){
						    $('[data-toggle="tooltip"]').tooltip(); 
						});
					</script>
					<button style="margin:7px 15px 17px 0;"
						type="button"
						class="btn btn-success"
						data-toggle="tooltip"
						data-placement="bottom"
						title=""
						data-original-title="QA 게시판입니다.">
						<font style="vertical-align: inherit;">
							<font style="vertical-align: inherit;"><a href="/ex02/TaeJun/board/list">1번 게시판.</a></font>
						</font>
					</button>
				</div>
					<table class="table table-striped table-hover">
							<thead>
								<tr>
									<td>번호</td>
									<td>제목</td>
									<td>작성자</td>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="board" items="${boardList}">
								<tr>
									<td>${board.bno}</td>
									<td><a href="/ex02/TaeJun/board/detail?bno=${board.bno}">${board.title}</a> [${board.replycnt }]</td>
									<td>${board.userid}</td>
								</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
				
			</div> <!-- 1번 게시판 -->
			
			
			
			<!-- 2번 게시판 시작 -->
			<div class="col-sm-4">
			<div id="twoboard" class="well well-lg">
				<div align="center">
					<script>
						$(document).ready(function(){
						    $('[data-toggle="tooltip"]').tooltip(); 
						});
					</script>
					<button style="margin:7px 15px 17px 0;"
						type="button"
						class="btn btn-success"
						data-toggle="tooltip"
						data-placement="bottom"
						title=""
						data-original-title="토론 게시판입니다.">
						<font style="vertical-align: inherit;">
							<font style="vertical-align: inherit;"><a href="/ex02/hyunho/board/list">2번 게시판.</a></font>
						</font>
					</button>
				</div>
					<table class="table table-striped table-hover">
							<thead>
								<tr>
									<td>번호</td>
									<td>제목</td>
									<td>작성자</td>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="board2" items="${boardList2}">
								<tr>
									<td>${board2.bno}</td>
									<td><a href="/ex02/hyunho/board/detail?bno=${board2.bno}">${board2.title}</a></td>
									<td>${board2.userid}</td>
								</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
				
			</div>
			</div> <!-- 2번 게시판 -->
			
			
			
			<div class="col-sm-4">
				게시판 3번이 들어갈 div
			</div> <!-- 3번 게시판 -->
			
			
		</div> <!-- 미리보기용인거시야 -->
	</div>
	<footer class="container-fluid text-center">
  		<p>Footer Text</p>
	</footer>
</div>
</body>
</html>

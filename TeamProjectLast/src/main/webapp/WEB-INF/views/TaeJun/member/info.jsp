<%@page import="edu.spring.ex02.domain.taejun.*"%>
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
<title>::Information::</title>
<style>
	select { 
		width: 100px; /* 원하는 너비설정 */
		padding: .10em .3em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */  
		border: 1px solid #999; 
		border-radius: 10px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
</style>
</head>
<body>

<div class="container">
	<nav class="navbar navbar-inverse navbar-fixed-top">
	
		<div class="container-fluid">
		
			<div class="navbar-header">
			
			<a class="navbar-brand" href="/ex02">홈페이지</a></div>
			<ul class="nav navbar-nav">
				
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
		<h1 align="center">::[ <%try{Member loginResult = (Member) session.getAttribute("loginResult"); out.print(loginResult.getMid());}catch(NullPointerException e){} %> ]님의 정보 ::</h1>
		<h3 align="right"><%try{Member loginResult = (Member) session.getAttribute("loginResult"); out.print(loginResult.getEmail());}catch(NullPointerException e){} %></h3>	
	</div>
	<div id="oneboard" align="center">
		<form method="post">
			<div class="input-group form-group" id="pwddiv">
				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input id="pwd" type="password" class="form-control" name="pwd" required placeholder="Password">
			</div>
			<br>
			<div class="input-group" align="right">
				<input class="btn btn-default" id="submit" type="submit" value="정보 수정" />
			</div>
		</form>
	</div>
	<input type="hidden" id="failput" name="failput" value="${fail}"/>
</div>

<script>
$(document).ready(function() {
	function failed() {
		var fail= $('#failput').val();
			if('fail'==fail){
				alert('로그인이 필요한 기능입니다.');
			}
	}
	failed();
	
	function failed2() {
		var fail= $('#failput').val();
			if('fail2'==fail){
				alert('비밀번호를 확인해주세요.');
			}
	}
	failed2();
});
</script>
</body>
</html>
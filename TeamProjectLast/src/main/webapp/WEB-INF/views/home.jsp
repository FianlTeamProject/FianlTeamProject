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
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
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

	<div class="row content"> <!-- 로그인  페이지 시작 -->
		<div class="col-sm-3 sidenav">
			<P> ${serverTime}. </P>
			<form method="post">
				<div class="input-group form-group " id="idtbl" >
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					<input id="mid" type="text" class="form-control" name="mid" required placeholder="User ID">
				</div>
				
				<div class="input-group form-group" id="pwddiv">
					<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					<input id="pwd" type="password" class="form-control" name="pwd" required placeholder="Password">
				</div>
				<br>
				<div class="input-group" align="center">
					<input class="btn btn-default" id="submit" type="submit" value="Login" />
				</div>
			</form>
			
			<div class="col-sm-9">
				채팅이 들어갈 공간
			</div>
		</div> <!-- 로그인 페이지 끝 -->
		
		
		<div class="col-sm-9"> <!-- 게시판 템플릿 -->
			<div class="col-sm-4">
				게시판 1번이 들어갈 div
			</div> <!-- 1번 게시판 -->
			
			
			
			<div class="col-sm-4">
				게시판 2번이 들어갈 div
			</div> <!-- 2번 게시판 -->
			
			
			
			<div class="col-sm-4">
				게시판 3번이 들어갈 div
			</div> <!-- 3번 게시판 -->
			
			
		</div> <!-- 미리보기용인거시야 -->
	</div> <!-- 팜플렛 끝 -->
	
	<footer class="container-fluid text-center">
  		<p>Footer Text</p>
	</footer>
</div>
</body>
</html>

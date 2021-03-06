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
<title>::Answer::</title>
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

<script type="text/javascript">
        var sel_file;
 
        $(document).ready(function() {
            $("#input_img").on("change", handleImgFileSelect);
        }); 
 
        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("미리보기는 이미지만 지원합니다.");
                    return;
                }
 
                sel_file = f;
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
 
</script>

<div class="container">
	<nav class="navbar navbar-inverse navbar-fixed-top">
	
		<div class="container-fluid">
		
			<div class="navbar-header">
			
			<a class="navbar-brand" href="/ex02">홈페이지</a></div>
			<ul class="nav navbar-nav">
				<li><a href="/ex02/TaeJun/board/write">새 글 작성</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<form class="navbar-form navbar-left" action="/ex02/TaeJun/board/search" method="get">
				<select class="selectpicker" name="searchType">
					<option value="1">작성자</option>
					<option value="2">제목</option>
					<option value="3">제목+내용</option>
				</select>
				
				<div class="form-group">
					<input type="text" class="form-control" name="searchWord" required placeholder="Search">
				</div>
				
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				
				<%
				String userId;
				try{
					Member loginResult = (Member) session.getAttribute("loginResult");
					if(loginResult!=null) {
						userId=loginResult.getMid();
						out.print("<li><a href=\"/ex02/TaeJun/member/info\"><span class=\"glyphicon glyphicon-user\"></span>"+loginResult.getMid()+"</li>");
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
		<h1 align="center">::답글작성 페이지::</h1>
	</div>
	
	<div class="panel panel-default">
			<form action="answer-result" method="get" enctype="multipart/form-data">
				<input type="hidden" id="bno" name="bno" value="${board.bno }">
	    		<div class="panel-heading">
					<div class="form-group" align="center">
						<label for="title">질문 내용</label>
						<div class="well well-lg">
						${board.content }
						</div>
					</div>
	    		</div>
	    	
	    		<div class="panel-body">
					<div class="form-group">
						<label for="content">답변 내용:</label>
						<textarea class="form-control" rows="14" id="content" name="content" required></textarea>
					</div>
	    		</div>
	    		
	    		<div class="panel-body">
	    			<div class="form-group" align="right">
		    			<label for="userid">작성자 :</label>
		    			<input type="text" class="form-control" id="userid" value="${member.mid }" name="userid" required readonly/>
		    		</div>
	    		</div>
	    		
	    		<div class="panel-body">
	    			   <div class="form-group">
				    <input type="file" name="uploadFiles" id="input_img"
				        placeholder="파일 선택" /> <!-- multiple 속성을 넣으면 다중 업로드 가능-->
				       </div>
	    		</div>
	    		
	    		<div class="panel-body">
	    			<div class="img_warp">
	    				<img id="img">	    			
	    			</div>
	    		</div>
	    		
	    		<div align="center">
	    			<input type="submit" class="btn btn-default" value="WRITE"/>
	    		</div>
	    		<br>
    		</form>
		</div>
	
</div>
</body>
</html>
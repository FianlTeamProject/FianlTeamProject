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
	
	.img_wrap {
		width: 300px;
		margin-top: 50px;
	}
	.img_wrap img {
		max-width: 100%;
	}
</style>

<script type="text/javascript">
 
        // 이미지 정보들을 담을 배열
        var sel_files = [];
        
        $(document).ready(function() {
            $("#input_imgs").on("change", handleImgFileSelect);
        }); 
 
        function fileUploadAction() {
            console.log("fileUploadAction");
            $("#input_imgs").trigger('click');
        }
 
        function handleImgFileSelect(e) {
 
            // 이미지 정보들을 초기화
            sel_files = [];
            $(".imgs_wrap").empty();
 
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            var index = 0;
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                	var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                    $(".imgs_wrap").append(html);
                    index++;
 
                }
                reader.readAsDataURL(f);
                
            });
        }
</script>
<script type="text/javascript">
 
   function deleteImageAction(index) {            
            console.log("index : "+index);
            sel_files.splice(index, 1);
 
            var img_id = "#img_id_"+index;
            $(img_id).remove();
 
            console.log(sel_files);
        }        
</script>

<title>::WRITE::</title>
</head>
<body>

<div class="container">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
			
			<a class="navbar-brand" href="/ex02">홈페이지</a></div>
			<ul class="nav navbar-nav">
				<li><a href="/ex02/board/write">새 글 작성</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<form class="navbar-form navbar-left" action="/ex02/TaeJun/board/search" method="get">
					<select name="searchType">
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
		<h1 align="center">::질문/답변 게시판 [글 쓰기]::</h1>
	</div>
	
	<div class="panel panel-default">
			<form method="post" enctype="multipart/form-data">
	    		<div class="panel-heading">
					<div class="form-group" align="center">
						<label for="title">글 제목:</label>
						<input type="text" class="form-control" id="title" name="title" required/>
					</div>
	    		</div>
	    		
	    		<div class="panel-body">
					<div class="form-group">
						<label for="content">글 내용:</label>
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
	    			   <div class="input_wrap">
	    			   <a href="javascript:" onclick="fileUploadAction();" class="my_button"></a>
				    <input type="file" name="uploadFiles" id="input_imgs" placeholder="파일 선택" multiple /> <!-- multiple 속성을 넣으면 다중 업로드 가능-->
				    	</div>
				       </div>
	    		</div>
	    		
	    		<div class="panel-body">
	    			<div>
        				<h2><b>이미지 미리보기</b></h2>
    				</div>
				    <div>
				        <div class="imgs_wrap">
				            <img id="img" />
				        </div>
				    </div>
	    		</div>
	    		
	    		<div align="center">
	    			<input type="submit" class="btn btn-default" value="WRITE"/>
	    		</div>
	    		<br>
    		</form>
		</div>




</body>
</html>
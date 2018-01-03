<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>

.container { position: relative; width: 100%; height: 100%; text-align: center;
    vertical-align: middle; }
.box1 { position: absolute; bottom: 300px; left: 33%;}
.box2 { position: absolute; bottom: 200px; left: 33%; }
.box3 { position: absolute; bottom: 100px; left: 33%; }

img{width: 600px;
height: 400px;}

</style>

</head>
<body>

<h1 align="center">집중하시기 바랍니다</h1>
<br>
<br>
<div name="board" id="board" width="600" height="400" class="container">
<iframe id="gangnamStyleIframe" align="middle" width="600" height="400" src="https://www.youtube.com/embed/${address}?rel=0&enablejsapi=1" frameborder="0" allowfullscreen></iframe>
</div>
 
    <script type="text/javascript">
    
    
    
    
        /**
         * Youtube API 로드
         */
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
 
        /**
         * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
         * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
         * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
         */
        var player;
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('gangnamStyleIframe', {
//                height: '315',            // <iframe> 태그 지정시 필요없음
//                width: '560',             // <iframe> 태그 지정시 필요없음
//                videoId: '9bZkp7q19f0',   // <iframe> 태그 지정시 필요없음
//                playerVars: {             // <iframe> 태그 지정시 필요없음
//                    controls: '2'
//                },
                events: {
                    'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                    'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                }
            });
        }
        function onPlayerReady(event) {
            console.log('onPlayerReady 실행');
 
            // 플레이어 자동실행 (주의: 모바일에서는 자동실행되지 않음)
            event.target.playVideo();
        }
        var playerState;
        function onPlayerStateChange(event) {
            playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                    event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                    event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                    event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                    event.data == -1 ? '시작되지 않음' : '예외';
 
            
           
            
            if (event.data === 0) {
            	
            	var iframes = document.querySelectorAll('iframe');
            	for (var i = 0; i < iframes.length; i++) {
            	    iframes[i].parentNode.removeChild(iframes[i]);
            	}
            	
            	var img = document.createElement('img');
            	img.src = '/ex02/resources/images/image/answp1.png';
            	document.getElementById('board').appendChild(img);
            	
            	var txt = "<input type=checkbox name=group value=a class=box1 id=bo1 onclick=oneCheckbox(this)>";
           	    var txt1 = "<input type=checkbox name=group value=b class=box2 id=bo2 onclick=oneCheckbox(this)>";
           	    var txt2 = "<input type=checkbox name=group value=c class=box3 id=bo3 onclick=oneCheckbox(this)>";
                var txt3 = "<input type='button' onclick='qqqq()' value='제출'/>";

           	 document.getElementById("board").innerHTML += txt+txt1+txt2+txt3;
           	 
            }
           
            
            console.log('onPlayerStateChange 실행: ' + playerState);
        }
        
        
       	function  qqqq(){
        	console.log(document.getElementsByName("group").length);
        	 
            //check를 가진 값의 이름을 가져오기
            var size = document.getElementsByName("group").length;
            for(var i = 0; i < size; i++){
                console.log(document.getElementsByName("group")[i].value);
            }
         
            //check이름을 가진 check중에서 체크된 것만 값 가져오기
            var size = document.getElementsByName("group").length;
            for(var i = 0; i < size; i++){
                if(document.getElementsByName("group")[i].checked == true){
                    console.log(document.getElementsByName("group")[i].value+"(체크)");
                    
                 if(document.getElementsByName("group")[2].checked){
                	 alert("경축");
                 }else{
                	 alert("응 틀렸어");
                 }  
                 
                }

        	}}; 
        	
        	function oneCheckbox(a){
                var obj = document.getElementsByName("group");
                for(var i=0; i<obj.length; i++){
                    if(obj[i] != a){
                        obj[i].checked = false;
                    }
                }
            }

        
    </script>
    
   <!-- 유튜브 썸네일 <img src="http://img.youtube.com/vi/yMFUmKJGr80/1.jpg"/> --> 
    
    

    
</body>
</html>
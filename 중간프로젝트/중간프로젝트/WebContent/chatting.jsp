<%@page import="java.util.List"%>
<%@page import="dto.ChatDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.CrewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
System.out.println(seq);


session.setAttribute("crewseq", seq);


CrewDao dao = CrewDao.getInstance();
MemberDto mem = (MemberDto)session.getAttribute("login");


List<ChatDto> list = dao.getChat(seq);
System.out.println(list.size());



Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy / MM / dd / HH:mm:ss");
String datestr = sdf.format(cal.getTime());
System.out.println(datestr);
//boolean isS = dao.chat(crewseq, name, date, content);

String str = "";
for(ChatDto dto : list){
			if(dto.getName().equals(mem.getName())){
			str += "나 : " + dto.getContent() + "\n";	
			} else {
			str += dto.getName() + " : " + dto.getContent() + "\n";
			}				
	}	
System.out.println("str: " + str);

%>      


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CREW Chatting</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<style type="text/css">
	#messageWindow{
		background: white;
		color: black;
	}
	#inputMessage{
		width:500px;
		height:30px;
	}
	#btn-submit{
		background: white;
		border : 1px solid gray;
		width:60px;
		height:30px;
	}
</style>
</head>
<body>

	<fieldset>
<%-- 	<% for(int i = 0; i < list.size(); i++) { %>--%>
 	<input type="hidden" id="str" value="<%=str%>">
 <%-- 	<% } %> --%>
 		<textarea id="messageWindow" rows="30" cols="70" readonly></textarea>
		<br><br>
		<input id="inputMessage" type="text">
<!-- 		onclick="send()" -->
		<input id="btn-submit" type="submit" value="전송" >
	</fieldset>
</body>
<script type="text/javascript">
	
	// 디비데이터 전체 textarea에 넣기
	var textarea = document.getElementById("messageWindow");
	//var webSocket = new WebSocket('ws://ec2-13-125-250-66.ap-northeast-2.compute.amazonaws.com:8080/DevEricServers/webChatServer');
 	var webSocket = new WebSocket('ws://localhost:8090/AAAAATEST/webChatServer');
	var inputMessage = document.getElementById('inputMessage');
	
	
	webSocket.onerror = function(e){
		onError(e);
	};
	webSocket.onopen = function(e){
		onOpen(e);
	};
	webSocket.onmessage = function(e){
		onMessage(e);
	};
	
	
	function onMessage(e){
		textarea.value += event.data + "\n"; // 님이 입장하셨습니다 등.
		//alert(e.data);
	}
	
	function onOpen(e){
		var str = document.getElementById('str').value;
		<%-- var text = "<%=str%>"; --%>
		//alert(str);
		textarea.value += "==== 크루채팅방에 오신것을 환영합니다 ===\n";
		textarea.value += str;
		
	}
	
	function onError(e){
		alert(e.data);
	}
	
	function send(){
		textarea.value += "나 : " + inputMessage.value + "\n";
		/* let data = {
				"seq" : seq,
				"name" : name,
				"date" : date,
				"content" : textarea.value
		};
		
		let jsonData = JSON.stringfy(data);
		webSocket.send(jsonData); */
		webSocket.send(inputMessage.value);
		inputMessage.value = "";
	}
	
</script>

<script type="text/javascript">
	$(function(){
		$('#btn-submit').click(function(){

		 	send();
		});
		
		
		$('#inputMessage').keydown(function(key){
			if(key.keyCode == 13){
				$('#inputMessage').focus();
				send();
			}
		});
	});
</script>
</html>
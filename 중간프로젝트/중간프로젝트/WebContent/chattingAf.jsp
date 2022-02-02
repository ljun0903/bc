<%@page import="dao.CrewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
String sseq = request.getParameter("seq");
String name = request.getParameter("name");
String date =  request.getParameter("date");
String content = request.getParameter("content");
int seq = Integer.parseInt(sseq);

CrewDao dao = CrewDao.getInstance();

System.out.println(seq + name + date + " " + content);

boolean isS = dao.chat(sseq, name, date, content);
    if(isS){
    	
    %>
<script>
alert('성공');
</script>
<% 
} else {
%>
<script>
alert('실패');
</script>  
<% 
}
%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
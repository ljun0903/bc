<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- /////////////////////////////////////////////////////////////////////////// -->
    <%@ include file="head.jsp" %>
<%@page import="dto.MemberDto"%>


<%
MemberDto mem = (MemberDto)session.getAttribute("login");
if(mem == null){
%>  
	<script>
	alert("로그인 해 주십시오");
	location.href = "login.jsp";
	</script>	
<%
}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>querybbswrite.jsp</title>

 <style type="text/css">
 th {
 background-color: #1E3269;
 color: white;
 }
 </style>
</head>
<body>

<form action="clientquerybbswriteAf.jsp" method="post">
<div align="center">
<table border="1">
<col width="200"><col width="400">

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" size="50px" value="<%=mem.getId() %>" readonly>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50px">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50px" name="content"></textarea>
	</td>
</tr>
</table>
    	<button type="submit">글 작성</button>
</div>
</form>
</body>
</html>
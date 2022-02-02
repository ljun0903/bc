<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>   

<%
int bbsid = Integer.parseInt(request.getParameter("bbsid"));
System.out.println("bbsid : "+bbsid);
%>
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/basic.css">
<head>
<meta charset="UTF-8">
<title>crewbbswrite.jsp</title>
</head>
<body>

<h1>글추가</h1>

<div align="center">

<form action="crewbbsupload.jsp" method="post" enctype="multipart/form-data">

<table border="1">
<col width="200"><col width="400">

<tr>
	<th>아이디</th>
	<td>
		<%=mem.getId() %>
		<input type="hidden" name="id" value="<%=mem.getId() %>" >
		<input type="hidden" name="bbsid" value="<%=bbsid %>" >
	</td>
</tr>
<tr>
	<th>닉네임</th>
	<td>
		<%=mem.getName() %>
		<input type="hidden" name="name" value="<%=mem.getName() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50px">
	</td>
</tr>
<tr>
	<th>이미지</th>
	<td>
		<input type="file" name="fileload" size="50px">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50px" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="글쓰기">
	</td>
</tr>
</table>
</form>
</div>


</body>
</html>










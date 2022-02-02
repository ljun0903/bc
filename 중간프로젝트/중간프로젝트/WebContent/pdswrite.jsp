<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
   
<%
String Spdsnum = request.getParameter("pdsnum");
int pdsnum = Integer.parseInt(Spdsnum);
System.out.println("pdsnum : "+pdsnum);
%>   
    
<!DOCTYPE html>

<html>
 <link rel="stylesheet" href="css/basic.css">
<head>

<meta charset="UTF-8">
<title>pdswrite.jsp</title>
</head>
<body>

<h2>자료 올리기</h2>

<form action="pdsupload.jsp" method="post" enctype="multipart/form-data">

<div align="center">

<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td>
		<%=mem.getId() %>
		<input type="hidden" name="id" value="<%=mem.getId() %>">
		<input type="hidden" name="pdsnum" value="<%=pdsnum%>">
	</td>
</tr>
<tr>
	<th>닉네임</th>
	<td>
		<%=mem.getName() %>
		<input type="hidden" name="name" size="50px" value="<%=mem.getName() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">
	</td>
</tr>
<tr>
	<th>파일 업로드</th>
	<td>
		<input type="file" name="fileload" style="width: 400px">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="올리기">
	</td>
</tr>

</table>


</div>

</form>



</body>
</html>








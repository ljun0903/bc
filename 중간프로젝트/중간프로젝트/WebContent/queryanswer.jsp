<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="head.jsp" %>
<%@page import="dao.QueryBbsDao"%>
<%@page import="dto.QueryBbsDto"%>
<%@page import="dto.MemberDto"%>


<%
int seq = Integer.parseInt( request.getParameter("seq") );

QueryBbsDto bbs = QueryBbsDao.getInstance().getBbs(seq);
System.out.println(bbs);
%> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
 <style type="text/css">
 th {
 background-color: #1E3269;
 color: white;
 }
 </style>
<body>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>
<div align="center">
<form action="queryanswerAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=bbs.getSeq() %>">

<table border="1">
<col width="200"><col width="400">

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" size="50px" value="<%=bbs.getId() %>" readonly>
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
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="글쓰기">
	</td>
</tr>

</table>

</form>
</div>
</body>
</html>









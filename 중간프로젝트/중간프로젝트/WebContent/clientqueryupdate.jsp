<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<%@page import="dto.QueryBbsDto"%>
<%@page import="dao.QueryBbsDao"%>
<%@page import="dto.MemberDto"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>querybbsupdate</title>

 <style type="text/css">
 th {
 background-color: #1E3269;
 color: white;
 }
 </style>

</head>
<body>


<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

QueryBbsDao dao = QueryBbsDao.getInstance();
QueryBbsDto bbs = dao.getBbs(seq);
%>

<%-- <%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin;
%> --%>

<div align="center">

<form action="clientqueryupdateAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=seq %>">
			
<table border="1">
<col width="200"><col width="500"> 

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="60" 
			value="<%=mem.getId() %>"> 		
	</td>	
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="60" value="<%=bbs.getTitle() %>">		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="60" name="content"><%=bbs.getContent() %></textarea>		
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="글수정">
	</td>
</tr>

</table>
	
</form>
	
</div>
<form action="clientquerybbs.jsp">
	<div align="center" style="margin-top: 30px">
		<input type="submit" value="글 목록">
	</div>
</form>

	


</body>
</html>
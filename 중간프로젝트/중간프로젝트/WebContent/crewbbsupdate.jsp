<%@page import="dto.MemberDto"%>
<%@page import="dto.CrewBbsDto"%>
<%@page import="dao.CrewBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>crewbbsupdate</title>

</head>
<body>


<h1>글 수정</h1>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

int bbsid = Integer.parseInt(request.getParameter("bbsid"));

CrewBbsDao dao = CrewBbsDao.getInstance();
CrewBbsDto bbs = dao.getCrewBbs(seq);
%>

<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin;
%>

<div align="center">

<form action="crewbbsupload.jsp" method="post">
<input type="hidden" name="seq" value="<%=seq %>">
			
<table border="1">
<col width="200"><col width="500"> 


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
	<th>이미지</th>
	<td>
		<input type="file" name="fileload" size="50px">
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
	<td colspan="2">
		<input type="submit" value="글수정">
	</td>
</tr>

</table>

</form>

</div>

<a href="myGroupBbs.jsp?seq=<%=bbsid%>">글목록</a>

</body>
</html>
<%@page import="dto.MemberDto"%>
<%@page import="pds.PdsDto"%>
<%@page import="pds.PdsDao"%>
<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />


<title>pdsupdate</title>

</head>
<body>


<h1>글 수정</h1>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

String Spdsnum = request.getParameter("pdsnum");
int pdsnum = Integer.parseInt(Spdsnum);
System.out.println("pdsupdate.jsp pdsnum : "+pdsnum);

PdsDao pds = PdsDao.getInstance();
PdsDto Pds = pds.getPds(seq);


%>



<div align="center">

<form action="pdsupload.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=seq %>">
			
<table border="1">
<col width="200"><col width="500"> 


<tr>
	<th>닉네임</th>
	<td>
		<%=mem.getName() %>
		<input type="hidden" name="name" size="50px" value="<%=mem.getName() %>">
		<input type="hidden" name="id" value="<%=mem.getId() %>">
		<input type="hidden" name="pdsnum" value="<%= pdsnum %>"> 	
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="60" value="<%=Pds.getTitle() %>">		
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
		<textarea rows="10" cols="60" name="content"><%=Pds.getContent() %></textarea>		
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

<a href="myFreeBbs.jsp?pdsnum=<%=pdsnum %>">글목록</a>

</body>
</html>
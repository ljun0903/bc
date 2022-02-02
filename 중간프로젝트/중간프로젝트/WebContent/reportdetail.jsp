<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="head.jsp" %>
<%@page import="dto.QueryBbsDto"%>
<%@page import="dao.QueryBbsDao"%>
<%@page import="dao.ReportBbsDao"%>
<%@page import="dto.ReportBbsDto"%>
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

<%

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

ReportBbsDao dao = ReportBbsDao.getInstance();
ReportBbsDto re = dao.getreport(seq);
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
</head>
<body>

<div align="center">
<table border="1">
<col width="100"><col width="100">
<tr>
	<th>신고글</th>
	<td>
		<input type="text" name="title" size="50px" value="<%=re.getTitle() %>" readonly>
	</td>
</tr>
<tr>
	<th>게시글 작성자</th>
	<td>
		<input type="text" name="id" size="50px" value="<%=re.getId() %>" readonly>
	</td>
</tr>
<tr>
	<th>신고자</th>
	<td>
		<input type="text" name="reporter" size="50px" value="<%=re.getReporter() %>" readonly>
	</td>
</tr>
<tr >
	<th>내용</th>
	<td>
		<textarea rows="11" cols="52" readonly="readonly"><%=re.getReportcontent() %></textarea>
	</td>
</tr>
</table>
</div>
	<div align="center" style="margin-top: 10px">
		<button type="button" onclick="location.href='reportbbslist.jsp'">글목록</button>
	</div>
</body>
</html>
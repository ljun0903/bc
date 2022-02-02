<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.QueryBbsDto"%>
<%@page import="dao.QueryBbsDao"%>
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
<title>Insert title here</title>

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
QueryBbsDto re = dao.getBbs(seq);
%>
<form action="reportAf.jsp" method="post">
<div align="center" >
<table border="1">
<col width="150"><col width="100">
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
	<th>게시글 번호</th>
	<td>
		<input type="text" name="bbsnum" size="50px" value="<%=re.getSeq() %>" readonly>
	</td>
	</tr>
	<tr>
	<th>게시판 번호</th>
	<td>	
		<input type="text" name="del" value=2 >	
	</td>
</tr>
<tr>
	<th>신고자</th>
	<td>
		<input type="text" name="reporter" size="50px" value="<%=mem.getId() %>" readonly>
	</td>
</tr>
<tr>
	<th>신고</th>
	<td>
		<input type="radio" name="reason" value="광고" checked="checked">광고
		<input type="radio" name="reason" value="음란성">음란성
		<input type="radio" name="reason" value="욕설">욕설
		<input type="radio" name="reason" value="도배성 글">도배성 글
		<input type="radio" name="reason" value="기타">기타
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="11" cols="52" readonly="readonly" name="reportcontent" value="<%=re.getContent() %>" ><%=re.getContent() %></textarea>
		<%-- <input type="text" name="reportcontent" value="<%=re.getContent() %>"> --%>
		<input type="hidden" name="seq" value="<%=sseq %>">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="신고하기" >
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>
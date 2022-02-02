<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@page import="dto.QueryBbsDto"%>
<%@page import="dao.QueryBbsDao"%>
<%@page import="dto.MemberDto"%>

<%-- 
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
%>  --%>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
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
QueryBbsDao dao = QueryBbsDao.getInstance();
dao.readcount(seq);

QueryBbsDto dto = dao.getBbs(seq);

%>

<div align="center">

<table border="1">
<colgroup>
	<col style="width: 200px">
	<col style="width: 400px">
</colgroup>
<%
//////////////////////////////////////////////////////////////////// 관리자 또는 글쓴이만 접근가능
if(dto.getId().equals(mem.getId()) || dto.getId().equals("aaa")){
%>
<tr>
	<th>작성자</th>
	<td>
		<input type="text" value="<%=dto.getId() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=dto.getReadcount() %></td>
</tr>
<tr>
	<th>정보</th>
	<td><%=dto.getRef() %>-<%=dto.getStep() %>-<%=dto.getDepth() %></td>
</tr>
<tr>
	<th>내용</th>
	<td>
	<textarea rows="15" cols="90" readonly="readonly"><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>

<br>
<button type="button" onclick="location.href='clientquerybbs.jsp'">글목록</button>
<button type="button" onclick="updateBbs(<%=dto.getSeq() %>)">수정</button>
<button type="button" onclick="deleteBbs(<%=dto.getSeq() %>)">삭제</button>

<%
}else{
%>
<script type="text/javascript">
alert("접근권한이 없습니다")
/////////////////////////////////////////////////////////////////////////
location.href = "main.jsp";
</script>
<%
}
%>

</div>

<script type="text/javascript">
function updateBbs( seq ) {
	location.href = "clientqueryupdate.jsp?seq=" + seq;
}
function deleteBbs( seq ) {
	location.href = "clientquerydelete.jsp?seq=" + seq;
}
/* function report( seq ) {
	location.href = "reportquery.jsp?seq=" + seq;
} */
function report( seq ) {
	openWin = window.open("reportquery.jsp?seq=" +seq,
			"childForm", "width=550, height=430, resizable = no, scrollbars = no");
}
 
</script>
<script type="text/javascript">

</script>


</body>
</html>
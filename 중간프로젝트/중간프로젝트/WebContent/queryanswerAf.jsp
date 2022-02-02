
<%@page import="dto.QueryBbsDto"%>
<%@page import="dao.QueryBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>    

<%
int seq = Integer.parseInt( request.getParameter("seq") );

String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 th {
 background-color: #1E3269;
 color: white;
 }
 </style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<%
QueryBbsDao dao = QueryBbsDao.getInstance();

boolean isS = dao.answer(seq, new QueryBbsDto(id, title, content));
if(isS){
%>
	<script type="text/javascript">
	alert('답글입력');
	location.href = "querybbslist.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert('답글입력 실패');
	location.href = "managerpage.jsp";
	</script>
<%
}
%>

</body>
</html>







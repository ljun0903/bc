<%@page import="dao.QueryBbsDao"%>
<%@page import="dao.QueryBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>querybbsupdateAf.jsp</title>
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
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

String title = request.getParameter("title");
String content = request.getParameter("content");

QueryBbsDao dao = QueryBbsDao.getInstance();
boolean isS = dao.updateBbs(seq, title, content);

if(isS == true){
	%>
	<script type="text/javascript">
	alert("글 수정 성공");
	location.href = "querybbslist.jsp";
	</script>	
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("글 수정 실패");
	location.href = "querybbslist.jsp";
	</script>
	<%
}	
%>

</body>
</html>






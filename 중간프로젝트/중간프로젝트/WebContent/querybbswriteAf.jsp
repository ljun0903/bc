<%@page import="dto.QueryBbsDto"%>
<%@page import="dao.QueryBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

System.out.println("id:"+ id);
System.out.println("title:"+ title);
System.out.println("content:"+ content);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbswriteAf.jsp</title>
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

boolean isS = dao.writeBbs(new QueryBbsDto(id, title, content));
if(isS){
%>
	
	
	<script type="text/javascript">
	alert('글쓰기 성공');
	location.href = "querybbslist.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert('다시 작성해 주십시오');
	location.href = "querybbswrite.jsp";
	</script>
<%
}
%>

</body>
</html>








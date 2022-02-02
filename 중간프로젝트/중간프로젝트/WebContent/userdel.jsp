<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int seq = Integer.parseInt(request.getParameter("seq"));

MemberDao dao = MemberDao.getInstance();
MemberDto dto = dao.getId(seq);
boolean isS = dao.deleteUser(seq);

if(isS){
	%>
	<script type="text/javascript">
	alert("삭제 되었습니다");
	location.href='userlist.jsp';
	</script>	
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("삭제하지 못했습니다");
	location.href='userlist.jsp';
	</script>
	<%
}	
%>
</body>
</html>
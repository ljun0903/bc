<%@page import="dao.CrewBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsdelete.jsp</title>
</head>
<body>

<%
int seq = Integer.parseInt( request.getParameter("seq") );
System.out.println("seq:" + seq);

int bbsid = Integer.parseInt( request.getParameter("bbsid"));

CrewBbsDao dao = CrewBbsDao.getInstance();
boolean isS = dao.deleteCrewBbs(seq);

if(isS){
	%>
	<script type="text/javascript">
	alert("삭제하였습니다");
	location.href = 'conn.jsp?bbsid=<%=bbsid%>';
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("삭제되지 않았습니다");
	location.href = 'crewbbslist.jsp';
	</script>	
	<%
}
%>

</body>
</html>








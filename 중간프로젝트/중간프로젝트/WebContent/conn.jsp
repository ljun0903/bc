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
int seq = Integer.parseInt(request.getParameter("bbsid"));
%>	
<script type="text/javascript">

location.href = "myGroupBbs.jsp?seq=<%=seq%>";

</script>
</body>
</html>
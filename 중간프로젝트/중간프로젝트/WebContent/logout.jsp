<%@page import="dto.MemberDto"%>
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
	//request.setCharacterEncoding("UTF-8");
	 
	// session을 제거
	session.removeAttribute("login");
	
	// 페이지의 메인으로 이동
	response.sendRedirect("main.jsp");
	
	%>


</body>
</html>
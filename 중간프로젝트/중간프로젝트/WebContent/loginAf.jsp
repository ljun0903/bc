<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
%>    

<%
MemberDao dao = MemberDao.getInstance();

MemberDto dto = dao.login(new MemberDto(0 , id, null, pwd, null, 0 , null));

if(dto.getId().equals("aaa")){
	session.setAttribute("login", dto);
%>
	<script type="text/javascript">
	alert("관리자 <%=dto.getId() %>님");
	 location.href = "userlist.jsp";
	 </script>
<%
}else if(dto != null && !dto.getId().equals("")){

session.setAttribute("login", dto);

%>
	<script type="text/javascript">
	alert("안녕하세요 <%=dto.getName() %>님");

	  location.href = "main.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("id나 password를 확인하세요");
	location.href = "login.jsp;"
	</script>
<%
}
%>





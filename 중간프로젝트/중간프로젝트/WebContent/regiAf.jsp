<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<!-- DB에 추가 -->    
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String e_mail = request.getParameter("email");
String emailSelection = request.getParameter("emailSelection");
String email = e_mail + "@" + emailSelection;
String loc = request.getParameter("loc");

out.println(id + " " + pwd + " " + name + " " + email + " " + loc);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

out.println(id +" " + name + " " + pwd + " " + email + " " + loc);

MemberDao dao = MemberDao.getInstance();

MemberDto dto = new MemberDto(0 , id, name, pwd, email, 0 , loc);
boolean isS = dao.addMember(dto);
if(isS){
   %>
   <script type="text/javascript">
   alert("성공적으로 가입되었습니다");
   location.href = "login.jsp";
   </script>
   <%
}else{
   %>
   <script type="text/javascript">
   alert("다시 기입해 주십시오");
   location.href = "regi.jsp";
   </script>
   <%
}
%>


</body>
</html>








<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberUpdateAf.jsp</title>
</head>
<body>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String email1 = request.getParameter("email1");
String emailSelection = request.getParameter("emailSelection");
String email = email1 + "@" + emailSelection;
String pwd = request.getParameter("pwd");
String loc = request.getParameter("loc");

System.out.println(id + " " + name + " " + pwd + " " + email + " "+ loc);

MemberDao dao = MemberDao.getInstance();
boolean upChk = dao.memberUpdate(id, name, pwd, email, loc);

if(name == null || name.equals("") || email1 == null || email1.equals("") || pwd == null || pwd.equals("") || loc == "선택") {
	if(upChk == false){	// 변경안됨
		%>
		<script type="text/javascript">
		alert('수정에 실패하였습니다.');	
		location.href="memberUpdate.jsp";
		</script>
		<%
	}
}else{
	%>
	<script type="text/javascript">
	alert('회원정보가 수정되었습니다.');	
	location.href="myPage.jsp?name=<%=name%>";
	<%
	// 로그인 세션 재설정
	MemberDto dto = dao.newLogin(new MemberDto(mem.getSeq(), mem.getId(), name, pwd, email, mem.getAuth(), loc));
	
	session.removeAttribute("login");
	session.setAttribute("login", dto);
	
	System.out.println(mem.getSeq() + " " + mem.getId() + " " + name + " " + pwd + " " + email + " " + mem.getAuth() + " " + loc );%>
	</script>
	<%
};

%>

</body>
</html>
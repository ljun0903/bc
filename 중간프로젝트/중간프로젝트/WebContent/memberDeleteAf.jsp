<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="mypageside.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원 탈퇴</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/basic.css">

<style type="text/css">

span{
	font-size: x-large;
}
h2{
	text-indent: 20px;

}
</style>
</head>
<body>
<!-- 로그인 확인 -->

<%
String id = request.getParameter("id");
MemberDao dao = MemberDao.getInstance();

boolean del = dao.memberDeleteUp(id);

if(del==true){
	%>
	<script type="text/javascript">
	alert('회원탈퇴가 성공적으로 되었습니다.\n그동안 러닝메이트를 이용해주셔서 감사합니다.')
	<%session.removeAttribute("login");%>
	location.href="main.jsp";				
	</script>
	<%
}

System.out.println(id);

%>

<h2>회원탈퇴</h2>
<!-- <hr> -->
<header class="py-5">
            <div class="container px-lg-5">
                    <div class="m-4 m-lg-5">
                      <h1 class="display-5 fw-bold">회원 탈퇴가 완료되었습니다</h1>
                        <p class="fs-4">
	                        그동안 러닝메이트를 이용해주셔서 감사합니다.<br>
							더욱 더 노력하고 발전하는 러닝메이트가 되겠습니다.
                        </p>
                    </div>
            </div>
        </header>
</body>
</html>
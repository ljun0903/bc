<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/basic.css">

</head>
<body>

    <%
MemberDto mem = (MemberDto)session.getAttribute("login");%>
<%-- if(mem == null) {
%>
   <script>
   alert("로그인 해 주십시오");
   location.href = "login.jsp";
   </script>   
<%
   }

   %>  --%>
<div id="wrapper">

<div id="topNav" align="center">
<header>
<div id="loginMenu">
		<ul>				<% if(mem == null ) { %>
						<li><a class="menuLink" href="login.jsp">로그인</a></li>
                        <li><a class="menuLink" href="regi.jsp">회원가입</a></li>
                        <% } else { %>
                        <li><a class="menuLink" href="logout.jsp">로그아웃</a></li>
	                    <li><a class="menuLink" href="myPage.jsp?name=<%=mem.getName()%>">마이페이지</a></li>
	                    <li><a class="menuLink" href="#;"><%=mem.getName() %>님</a></li>
	                    
                        <% } %>
	
	</ul>
   </div>
   <div id="homeName">
   <span><a class="menuLink" href="main.jsp">RUNNING MATE</a></span>
   
   </div>
   
</header>   
<div id="topwrapper">
        <nav id="topMenu" >
                <ul>
                        <li><a class="menuLink" href="main.jsp">크루참여</a></li>
                        <li><a class="menuLink" href="myFreeBbs.jsp?pdsnum=1">자유게시판</a></li>
                        <li><a class="menuLink" href="myReviewBbs.jsp?pdsnum=2">인증게시판</a></li>
                        <li><a class="menuLink" href="clientquerybbs.jsp ">1:1문의</a></li>
                </ul>
        </nav>
        </div>
        
</div>

</div>
<script type="text/javascript">
function remove() {
   sessionStorage.clear();
 //  alert('그만해');

   /* session.removeAttribute("login");  */
   //session.invalidate();
   /* location.href = "main.jsp"; */
   
   //response.sendRedirect("myPage.jsp");
}

</script>

</body>

</html>
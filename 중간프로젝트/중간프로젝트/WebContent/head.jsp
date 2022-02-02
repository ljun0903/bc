<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="css/basic.css">

</head>
<body>

<div id="wrapper">

<div id="topNav" align="center">
<header>
<div id="loginMenu">
	<ul>
	                     <li><a class="menuLink" href="logout.jsp">로그아웃</a></li>
	                   
	                    <li><a class="menuLink" href="#;">관리자님</a></li>
                        
	
	</ul>
	</div>
		<div id="homeName">
	<span><a class="menuLink" href="main.jsp">RUNNING MATE</a></span>
	
	</div>
	
</header>	
<div id="topwrapper">
        <nav id="topMenu" >
                <ul>
                        <li><a class="menuLink" href="reportbbslist.jsp">신고게시판</a></li>
                        <li><a class="menuLink" href="userlist.jsp">회원관리</a></li>
                        <li><a class="menuLink" href="querybbslist.jsp">1:1문의</a></li>
                </ul>
        </nav>
        </div>
        
</div>

</div>
<!-- <script type="text/javascript">
function remove() {
	sessionStorage.clear();
//	alert('그만해');

	/* session.removeAttribute("login");  */
	//session.invalidate();
	location.href = "main.jsp";
	//response.sendRedirect("myPage.jsp");
}

</script> -->


</body>

</html>
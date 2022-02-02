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
MemberDto mem1 = (MemberDto)session.getAttribute("login");
if(mem1 == null) {
%>
	<script>
	alert("로그인 해 주십시오");
	location.href = "login.jsp";
	</script>	
<%
	}

	%>
<!-- Left Side -->
<aside>
<div id="leftsideMenu" class="ui sidebar inverted vertiacal menu">
	<ul>
 	  <li class="hov"><a href="myPage.jsp?name=<%=mem1.getName() %>" class="active" >마이페이지</a>
 	  	<ul>
 	  		<li><a href=" memberUpdate.jsp?name=<%=mem1.getName()%>">회원정보수정</a></li>
 	  		<li><a href=" memberDelete.jsp?name=<%=mem1.getName()%>">회원탈퇴</a></li>
 	  	</ul>
 	  </li>
      <li><a href="myCrew.jsp">참여중인 크루</a>
      	<!-- <ul>
      		<li><a>정기크루</a></li>
		    <li><a>일일크루</a></li>
      	</ul> -->
      </li>
      <li><a href="myCalendar.jsp<%-- ?name=<%=mem1.getName() %> --%>">나의 캘린더</a></li>
      <li><a href="#">나의 게시물</a>
      	<ul>
      		<li><a href="myFreeBbs.jsp?pdsnum=<%=1%>">자유게시판</a></li>
      		<li><a href="myReviewBbs.jsp?pdsnum=<%=2%>">인증게시판</a></li>
      		<li><a href="#;">그룹게시판</a></li>
      		<li><a href="myquery.jsp">문의게시판</a></li>
      	</ul>
      </li>
	</ul> 
	
</div>
</aside>
<script type="text/javascript">
function myPage() {
	//alert('check');
	location.href="myPage.jsp?name=<%=mem1.getName()%>";
}

</script>
</body>
</html>
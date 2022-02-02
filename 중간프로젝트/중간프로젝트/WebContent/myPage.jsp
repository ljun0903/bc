<%@page import="dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CalendarDao"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ include file="header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>마이페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/basic.css">

<style type="text/css">
h2,h5{
   text-indent: 20px;

}
h5{
   margin-bottom: 20px;
}
#delete, #modify{
   width: 130px;
}
#nameCheck{
   font-size: 5px;
}

#constraint1, #constraint2{
   font-size: 5px;
   color: #ff0000;
}
.form-group{
   margin-bottom: 20;

}
.main-top input{
   text-align : center;
   width: 500px;
   margin: 0 auto;
   /* margin-bottom: 10px; */
}

.main-top .fs-4{
   font-size: 15px;
}

</style>
</head>
<body>

<%if(mem == null) {
%>
	<script>
	alert("로그인 해 주십시오");
	location.href = "login.jsp";
	</script>	
<%
	}

	%>

<%

String name = request.getParameter("name");
MemberDao dao = MemberDao.getInstance();
MemberDto dto = dao.getMember(name);

System.out.println(name);
System.out.println(dto.getId());
System.out.println(dto.toString()); 


CalendarDao cal = CalendarDao.getInstance();
List<CalendarDto> list = cal.getCalendarList(name, "202106");

%>
<!-- Left Side -->
<aside>
<div id="leftsideMenu" class="ui sidebar inverted vertiacal menu">
	<ul>
 	  <li class="hov"><a href="myPage.jsp?name=<%=dto.getName() %>" class="active" >마이페이지</a>
 	  	<ul>
 	  		<li><a href=" memberUpdate.jsp?name=<%=dto.getName()%>">회원정보수정</a></li>
 	  		<li><a href=" memberDelete.jsp?name=<%=dto.getName()%>">회원탈퇴</a></li>
 	  	</ul>
 	  </li>
      <li><a href="mymyCrew.jsp">참여중인 크루</a>
      	<!-- <ul>
      		<li><a>정기크루</a></li>
		    <li><a>일일크루</a></li>
      	</ul> -->
      </li>
      <li><a href="mymyCalendar.jsp<%-- ?name=<%=mem1.getName() %> --%>">나의 캘린더</a></li>
      <li><a href="#">나의 게시물</a>
      	<ul>
      		<li><a href="mymyFreeBbs.jsp?pdsnum=<%=1%>">자유게시판</a></li>
      		<li><a href="mymyReviewBbs.jsp?pdsnum=<%=2%>">인증게시판</a></li>
      		<li><a href="mymyGroupBbs.jsp?pdsnum=<%=3%>">그룹게시판</a></li>
      		<li><a href="myquery.jsp">문의게시판</a></li>
      	</ul>
      </li>
	</ul> 
	
</div>
</aside>

<h2>회원정보</h2>
<!-- <p style="background-color: #E26B1B">단락색?</p> -->

<section class="pt-4">
<div class="container px-lg-5">
    <div class="p-4 p-lg-5 rounded-3 text-center"> 
          <div class="main-top">
              <h1 class="display-5 fw-bold">안녕하세요. <%=dto.getName() %>님!</h1><br>
             <p class="fs-4">
             아이디 &nbsp;<input type="text"  id="id" name="id" value="<%=dto.getId() %>" readonly disabled="disabled"><br>
              닉네임 &nbsp;<input type="text" id="name" name="name" maxlength="10" disabled="disabled" onkeydown="inputNameCheck()" value="<%=dto.getName() %>"><br>
             이메일 &nbsp;<input type="text" id="email" name="email" maxlength="50" disabled="disabled" value="<%=dto.getEmail() %>"><br>
         지역 &nbsp;&nbsp;<input type="text" id="loc" name="loc" disabled="disabled" value="<%=dto.getLoc() %>"><br>
                </p>
               <%-- <p class="fs-4">
                    아이디 : <%=dto.getId() %><br>
                닉네임 : <%=dto.getName() %><br>
                이메일 : <%=dto.getEmail() %><br>
                지역 : <%=dto.getLoc() %><br>
                </p> --%>
                <a class="btn btn-primary btn-lg" href="memberUpdate.jsp?name=<%=dto.getName()%>">수정</a><br>
               
      </div> 
   </div>
</div>
 <!-- Page Content-->
<%--             <div class="container px-lg-5">
                <!-- Page Features-->
                <div class="row gx-lg-5">
                   <div class="col-lg-6 col-xxl-4 mb-5">
                   <p class="fs-4">
                    <a class="btn btn-primary btn-lg" href="myFreeBbs.jsp?name=<%=mem.getName() %>&pdsnum=<%=1%>">참여중인크루</a>
               </p>
                   <p class="fs-4">
                    <a class="btn btn-primary btn-lg" href="mymyFreeBbs.jsp?pdsnum=<%=1%>">자유게시판</a>
               </p>
               <p class="fs-4">
               <a class="btn btn-primary btn-lg" href="mymyReviewBbs.jsp?pdsnum=<%=2%>">인증게시판</a>
               </p>
               <p class="fs-4">
               <a class="btn btn-primary btn-lg" href="mymyGroupBbs.jsp?seq=<%=1%>">1번 크루게시판</a>
               </p>
               <p class="fs-4">
               <a class="btn btn-primary btn-lg" href="mymyGroupBbs.jsp?seq=<%=2%>">2번 크루게시판</a>
               </p>
               <p class="fs-4">
               <a class="btn btn-primary btn-lg" href="mymyCalendar.jsp?name=<%=mem.getName()%>">캘린더</a>
                      </p>
                      </div>
                </div>
            </div> --%>
</section>
                    
                        <%--        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-collection"></i></div>
                                <h2 class="fs-4 fw-bold">나의 일정</h2>
                                <p class="mb-0"><% %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-cloud-download"></i></div>
                                <h2 class="fs-4 fw-bold">Free to download</h2>
                                <p class="mb-0">As always, Start Bootstrap has a powerful collectin of free templates.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-card-heading"></i></div>
                                <h2 class="fs-4 fw-bold">Jumbotron hero header</h2>
                                <p class="mb-0">The heroic part of this template is the jumbotron hero header!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-bootstrap"></i></div>
                                <h2 class="fs-4 fw-bold">Feature boxes</h2>
                                <p class="mb-0">We've created some custom feature boxes using Bootstrap icons!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-code"></i></div>
                                <h2 class="fs-4 fw-bold">Simple clean code</h2>
                                <p class="mb-0">We keep our dependencies up to date and squash bugs as they come!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-patch-check"></i></div>
                                <h2 class="fs-4 fw-bold">A name you trust</h2>
                                <p class="mb-0">Start Bootstrap has been the leader in free Bootstrap templates since 2013!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
 --%>
</body>
</html>
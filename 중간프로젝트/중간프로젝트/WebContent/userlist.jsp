<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="head.jsp" %>
<%@page import="dao.MemberDao"%>
<%-- <%@page import="dto.BbsDto"%> --%>
<%@page import="java.util.List"%>
<%-- <%@page import="dao.BbsDao"%> --%>
<%@page import="dto.MemberDto"%>

    
    <%
Object objLogin = session.getAttribute("login");
MemberDto mem = null;
if(objLogin == null){
	%>
	<script>
	alert("로그인 해 주십시오");
	location.href = "login.jsp";
	</script>	
	<%
}
mem = (MemberDto)objLogin;
%>

<%
String choice = request.getParameter("choice");
String search = request.getParameter("search");
if(choice == null){
	choice = "";
}
if(search == null){
	search = "";
}
%>

<%
MemberDao dao = MemberDao.getInstance();

// 페이지 번호
String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")){
	pageNumber = Integer.parseInt(sPageNumber);
}

List<MemberDto> list = dao.getuserPagingList(choice, search, pageNumber);

// 글의 총수
int len = dao.getAllUser(choice, search);
System.out.println("총 글의 수:" + len);

// 페이지 수
int userPage = len / 10;		// 24 / 10 -> 2
if((len % 10) > 0){
	userPage = userPage + 1;
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>

 <style type="text/css">
 th {
 background-color: #1E3269;
 color: white;
 }
 </style>
 
 <script type="text/javascript">
$(document).ready(function() {	
	let search = "<%=search %>";
	if(search == "") return;
	
	let obj = document.getElementById("choice"); 
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
});
</script>
</head>
<body>
<div class="table table-hover">
    <table class="table">
        <thead>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>이름</th>
                <th>이메일</th>
                <th>지역</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
		        <%
		if(list == null || list.size() == 0){
			%>
				<tr>
					<td colspan="3">가입된 아이디가 없습니다</td>
				</tr>
			<%
		}else{
			for(int i = 0;i < list.size(); i++){
				MemberDto Member = list.get(i);
			%>
            <tr>
			<th><%=i + 1 %></th>
				<td><%=Member.getId() %></td>
				<td><%=Member.getPwd() %></td>
				<td><%=Member.getName() %></td>
				<td><%=Member.getEmail() %></td>
				<td><%=Member.getLoc() %></td>
				<td><button onclick="del(<%=Member.getSeq() %>)">삭제</button></td>
					</tr>
			 <%
			 }
		 }
		 %>
		</tbody>
	    </table>
	    </div>
	    <div align="center">
	    <%
for(int i = 0;i < userPage; i++){
	if(pageNumber == i){	// 현재페이지		[1] 2 [3]
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
		</span>&nbsp;
		<%		
	}else{					// 그밖에 페이지
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt;color: #000;font-weight: bold;text-decoration: none;">
			[<%=i + 1 %>]
		</a>&nbsp;
		<%
	}
}
%>
</div>
<br>

<div align="center">

<select id="choice">
	<option value="ID">아이디</option>
	<option value="NAME">이름</option>
	<option value="LOC">지역</option>
</select>

<input type="text" id="search" value="<%=search %>">

<button type="button" onclick="searchBtn()">검색</button>

</div>

<script type="text/javascript">
function searchBtn() {

	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	
	
	location.href = "userlist.jsp?choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	
	location.href = "userlist.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

function del(seq) {
	location.href = "userdel.jsp?seq=" +seq;
}
</script>
</body>
</html>
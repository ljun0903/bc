<%@page import="dto.CrewBbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CrewBbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
CrewBbsDao dao = CrewBbsDao.getInstance();

// 페이지 번호
String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")){
	pageNumber = Integer.parseInt(sPageNumber);
}

//List<CrewBbsDto> list = dao.getCrewBbsList();
//List<BbsDto> list = dao.getBbsSearchList(choice, search);
List<CrewBbsDto> list = dao.getCrewBbsPagingList(bbsid, choice, search, pageNumber);

// 글의 총수
int len = dao.getAllCrewBbs(choice, search);
System.out.println("총 글의 수:" + len);

// 페이지 수
int bbsPage = len / 10;		// 24 / 10 -> 2
if((len % 10) > 0){
	bbsPage = bbsPage + 1;
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>crewbbslist</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

<h2>게시판</h2>


<div align="center">

<table border="1">
<col width="70"><col width="600"><col width="150"><col width="70"><col width="100">
<tr>
	<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
</tr>

<%
if(list == null || list.size() == 0){
	%>
		<tr>
			<td colspan="5">작성된 글이 없습니다</td>
		</tr>
	<%
}else{
	for(int i = 0;i < list.size(); i++){
		CrewBbsDto crewbbs = list.get(i);
	%>
		<tr>
			<th><%=i + 1 %></th>
			<td>
				<a href="crewbbsdetail.jsp?seq=<%=crewbbs.getSeq() %>">
						<%=crewbbs.getTitle() %>
				</a>
			</td>
			<td><%=crewbbs.getId() %></td>
			<td><%=crewbbs.getReadcount() %></td>
			<td><%=crewbbs.getRegdate() %></td>
		</tr>
	<%
	}
}
%>
</table>
<br><br>

<%
for(int i = 0;i < bbsPage; i++){
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
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="<%=search %>">

<button type="button" onclick="searchBtn()">검색</button>

</div>

<a href="crewbbswrite.jsp">글쓰기</a>
<a href="myCalendar.jsp">일정관리</a>
<a href="createcrew.jsp">크루생성</a>
<a href="datatest.jsp">데이터 테스트</a>

<script type="text/javascript">
function searchBtn() {
//	alert('searchBtn');
	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	
	/* if(search.trim() == ''){
		alert('검색어를 입력해 주십시오');
		return;
	} */
	
	location.href = "crewbbslist.jsp?choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	
	location.href = "crewbbslist.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

</script>


</body>
</html>









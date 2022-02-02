<%@page import="dto.CrewBbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CrewBbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%-- <%@ include file="header.jsp" %> --%>

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
//int seq = Integer.parseInt(request.getParameter("bbsid"));
int bbsid = Integer.parseInt(request.getParameter("seq"));

//겹친다..
System.out.println("bbsid: "+bbsid);

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
System.out.println("총 글의 수: " + len);

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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>그룹게시판</title>

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


<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/basic.css">

<style type="text/css">
table{
	width: 100%;
	border: 1px solid;
}

tr{
	text-align: center;
}

th,td{
	border: 1px solid;
	padding-left: 10px;
}

h2{
	text-indent: 20px;
}
</style>
</head>
<body>
<%
/* CrewBbsDao dao = CrewBbsDao.getInstance();
List<CrewBbsDto> list = dao.getCrewBbsList(); */

/* String name = mem.getName();

System.out.println(name); */


%>

<h2>그룹게시판</h2>
<header class="py-5">
	<div class="container px-lg-5">
		<table>
			<col width="30"><col width="500"><col width="40"><col width="40"><col width="80">
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
	for(int i = 0; i<list.size(); i++){
		CrewBbsDto crewbbs = list.get(i);
	%>
			<tr>
				<th><%=i + 1 %></th>
			<td>
				<a href="crewbbsdetail.jsp?seq=<%=crewbbs.getSeq() %>&bbsid=<%=bbsid%>">
						<%=crewbbs.getTitle() %>
				</a>
			</td>
			<td><%=crewbbs.getName() %></td>
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
<br>
<a href="crewbbswrite.jsp?bbsid=<%=bbsid%>">글쓰기</a>
	</div>
</header>

<div align="center">

<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" size="20" value="<%=search %>">

<button type="button" onclick="searchBtn()">검색</button>

</div>


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
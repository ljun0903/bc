<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--////////////////////////////////////////////////////////////////////////////////  -->
    <%@ include file="header.jsp" %>
<%@page import="dto.QueryBbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QueryBbsDao"%>
<%@page import="dto.MemberDto"%>


<%-- <%
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
%> --%>

<%!
// 댓글용
public String arrow(int depth){
	String rs = "<img src='./image/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	
	return depth==0?"":ts + rs;
}

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
QueryBbsDao dao = QueryBbsDao.getInstance();

// 페이지 번호
String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")){
	pageNumber = Integer.parseInt(sPageNumber);
}

List<QueryBbsDto> list = dao.getBbsPagingList(choice, search, pageNumber);

// 글의 총수
int len = dao.getAllBbs(choice, search);
System.out.println("총 글의 수:" + len);

// 페이지 수
int bbsPage = len / 10;	
if((len % 10) > 0){
	bbsPage = bbsPage + 1;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>1대1문의게시판</title>

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
		<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
	</tr>
</thead>
	<tbody>
<%
if(list == null || list.size() == 0){
	%>
		<tr>
			<td colspan="3">작성된 글이 없습니다</td>
		</tr>
	<%
}else{
	for(int i = 0;i < list.size(); i++){
		QueryBbsDto bbs = list.get(i);
	
		
		if(mem.getId().equals(bbs.getId())){	//지금 로그인한 아이디랑 게시글 작성자 아이디가 같으면 가져오기
	%>																
		<tr>
			<th><%=i + 1 %></th>
			<td>
				<%
				if(bbs.getDel() == 0){
					%>
					<%=arrow(bbs.getDepth()) %>
					<a href="clientquerybbsdetail.jsp?seq=<%=bbs.getSeq() %>">
						<%=bbs.getTitle() %>
					</a>
					<%
				}else{
					%>		
					<font color="#ff0000">삭제되었습니다</font> 
					<%
				}
				%>
			</td>
			<td><%=bbs.getId() %></td>
			<td><%=bbs.getReadcount() %></td>
		</tr>
	<%	
		}
	}
}
%>
</tbody>
</table>
</div>
<br><br>
<div align="center">
<%
for(int i = 0;i < bbsPage; i++){
	if(pageNumber == i){	
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
		</span>&nbsp;
		<%		
	}else{					
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
<!-- /////////////////////////////////////////////////////////////////////////////// -->
<a href="clientquerybbswrite.jsp">글쓰기</a>
</div>
<div align="center">

<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="<%=search %>">

<button type="button" onclick="searchBtn()">검색</button>

</div>

<script type="text/javascript">
function searchBtn() {

	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;


	location.href = "clientquerybbs.jsp?choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	
	location.href="clientquerybbs.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

</script>
</body>
</html>
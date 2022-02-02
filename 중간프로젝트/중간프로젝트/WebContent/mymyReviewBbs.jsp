<%@page import="pds.PdsDto"%>
<%@page import="pds.PdsDao"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="header.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>인증게시판</title>
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
String name = mem.getName();
System.out.println(name);

String Spdsnum = request.getParameter("pdsnum");
int pdsnum = Integer.parseInt(Spdsnum);
System.out.println(pdsnum);

PdsDao dao = PdsDao.getInstance();

List<PdsDto> list = dao.myPdsList(name, pdsnum);

%>

<h2>인증게시판</h2>
<header class="py-5">
	<div class="container px-lg-5">
		<table>
			<col width="70"><col width="600"><col width="150"><col width="70">
			<tr>
            	<th>번호</th><th>제목</th><th>조회수</th><th>작성일</th>
			</tr>
<%
if(list == null || list.size() == 0){
%>
			<tr>
				<td colspan="4">작성된 글이 없습니다</td>
			</tr>
<%
}else{ 
	for(int i = 0;i < list.size(); i++){
		PdsDto pds = list.get(i);
		%>
	<tr align="center" height="5">
		<th><%=i + 1 %></th>
		<td align="left">
			<a href="pdsdetail.jsp?seq=<%=pds.getSeq() %>&pdsnum=<%= pdsnum%>">
				<%=pds.getTitle() %>
			</a>
		</td>
		<td>
			<%=pds.getReadcount() %>
		</td>
		<td>
			<%=pds.getRegdate() %>
		</td>
	</tr>
	<%
	}
}%>
</table>

<br>
<!-- <a href="pdswrite.jsp">글쓰기</a> -->
</div>
</header>


<script type="text/javascript">
function filedownload(newfilename, seq) {
	location.href = 'filedown?newfilename=' + newfilename + '&seq=' + seq;
}

</script>

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



<script type="text/javascript">
$(document).ready(function() {	
	let search = "<%=search %>";
	if(search == "") return;
	
	let obj = document.getElementById("choice"); 
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
});
</script>

<div align="center">

<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="<%=search %>">

<button type="button" onclick="searchBtn()">검색</button>

</div>

<!-- <a href="pdswrite.jsp">글쓰기</a> -->

<script type="text/javascript">
function searchBtn() {

	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	

	location.href = "mymyFreeBbs.jsp?pdsnum=<%=pdsnum%>&name=<%=mem.getName()%>&choice=" + choice + "&search=" + search;	// 자기자신으로(리스트)
}

function goPage( pageNum ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	
	location.href = "mymyFreeBbs.jsp?pdsnum=<%=pdsnum%>&name=<%=mem.getName()%>&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

</script>




</body>
</html></html>
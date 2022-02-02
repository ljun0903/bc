<%@page import="pds.PdsDto"%>
<%@page import="java.util.List"%>
<%@page import="pds.PdsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>

	
<%


PdsDao dao = PdsDao.getInstance();
List<PdsDto> list = dao.getPdsList();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdslist.jsp</title>
</head>
<body>

<h2>  자유게시판</h2>

<div align="center">

<table border="1">
<col width="50"><col width="50"><col width="400"><col width="50">
<col width="200">

<tr>
	<th>번호</th><th>작성자</th><th>제목</th>
	<th>조회수</th><th>작성일</th>
</tr>

<%
for(int i = 0;i < list.size(); i++){
	PdsDto pds = list.get(i);
	
	String bgcolor = "";
	if(i % 2 == 0){
		bgcolor = "#DCDCDC";
	}else{
		bgcolor = "#fff";
	}
	%>
	<tr bgcolor="<%=bgcolor %>" align="center" height="5">
		<th><%=i + 1 %></th>
		<td><%=pds.getId() %></td>
		<td align="left">
			<a href="pdsdetail.jsp?seq=<%=pds.getSeq() %>">
				<%=pds.getTitle() %>
			</a>
		</td>

		<td><%=pds.getReadcount() %></td>
		<td><%=pds.getRegdate() %></td>
	</tr>
	<%
}
%>
<link rel="stylesheet" href="css/basic.css">
</table>
<br>
<a href="pdswrite.jsp">글쓰기</a>
</div>



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


<script type="text/javascript">
function searchBtn() {

	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	

	location.href = "pdslist.jsp?choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById("search").value;
	
	location.href = "pdslist.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

</script>


<script type="text/javascript">
function filedownload(newfilename, seq) {
	location.href = 'filedown?newfilename=' + newfilename + '&seq=' + seq;
}



</body>
</html>









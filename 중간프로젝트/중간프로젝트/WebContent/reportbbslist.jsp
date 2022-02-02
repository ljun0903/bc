<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="head.jsp" %>
<%@page import="dto.ReportBbsDto"%>
<%@page import="dao.ReportBbsDao"%>
<%@page import="java.util.List"%>
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
ReportBbsDao dao = ReportBbsDao.getInstance();

// 페이지 번호
String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")){
	pageNumber = Integer.parseInt(sPageNumber);
}

List<ReportBbsDto> list = dao.getReportBbsPagingList(choice, search, pageNumber);

// 글의 총수
int len = dao.getAllreport(choice, search);
System.out.println("총 글의 수:" + len);

// 페이지 수
int reportPage = len / 10;		// 24 / 10 -> 2
if((len % 10) > 0){
	reportPage = reportPage + 1;
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>신고게시판</title>

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
	<th>번호</th><th>신고글</th><th>신고자</th><th>게시글작성자</th><th>신고사유</th><th>게시판 넘버</th><th>삭제</th>
</tr>
 </thead>
        <tbody>
<%
if(list == null || list.size() == 0){
	%>
		<tr>
			<td colspan="7">신고된 글이 없습니다</td>
		</tr>
	<%
}else{
	for(int i = 0;i < list.size(); i++){
		ReportBbsDto report = list.get(i);
		
	%>
		<tr>
			<th><%=i + 1 %></th>
			<td><a href="reportdetail.jsp?seq=<%=report.getSeq() %>"><%=report.getTitle() %></a></td>
			<td><%=report.getReporter() %></td>
			<td><%=report.getId() %></td>
			<td><%=report.getReason() %></td>
			<td><%=report.getPdsnum() %>번 게시판</td>
			
			<%-- <td><button onclick="reportdel(<%=report.getBbsnum() %>)"  >삭제</button></td> --%>
			<td><button onclick="reportdel(<%=report.getBbsnum() %>, <%=report.getSeq() %>)"  >삭제</button></td>
		</tr>
	<%
	}
}
%>
</tbody>
</table>
<br><br>
</div>
<div align="center">
<%
for(int i = 0;i < reportPage; i++){
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

<script type="text/javascript">
 function reportdel(bbsnum, seq) {
	 
	location.href = "reportdel.jsp?bbsnum=" +bbsnum+ "&seq="+seq ;
}

/* function reportdel(bbsnum) {
	 
	location.href = "reportdel.jsp?bbsnum=" +bbsnum ;
}
 */
 function searchBtn() {
	
		let choice = document.getElementById('choice').value;
		let search = document.getElementById("search").value;
		
		
		location.href = "reportbbslist.jsp?choice=" + choice + "&search=" + search;
	}

 function goPage( pageNum ) {
		let choice = document.getElementById('choice').value;
		let search = document.getElementById("search").value;
		
		location.href = "reportbbslist.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
	}
 //////////////////////////////////////////////////////////////
 function repdel(seq) {
	 
		location.href = "rreportdel.jsp?seq=" +seq;
	}

 </script>

</body>
</html>
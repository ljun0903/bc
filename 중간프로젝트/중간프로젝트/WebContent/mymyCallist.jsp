<%@page import="dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CalendarDao"%>
<%@page import="util.CalUtil"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ include file="header.jsp" %>
<%-- <%@ include file="mypageside.jsp" %> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
// Date -> String
public String toDates(String mdate){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
	
	// 202106211611 -> 2021-06-21 16:11 
	String s = mdate.substring(0, 4) + "-"  // yyyy
			 + mdate.substring(4, 6) + "-"	// MM
			 + mdate.substring(6, 8) + " "  // dd
			 + mdate.substring(8, 10) + ":" // hh
			 + mdate.substring(10, 12) + ":00";	// mm:ss
	Timestamp d = Timestamp.valueOf(s);
			 
	return sdf.format(d);		 
}		
%>    

<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

String dates = year + CalUtil.two(month + "") + CalUtil.two(day + "");

CalendarDao dao = CalendarDao.getInstance();
List<CalendarDto> list = dao.getDayList(mem.getId(), dates);

for(int i = 0;i < list.size(); i++){
	CalendarDto c = list.get(i);
	System.out.println(c.toString());
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mymyCalist.jsp</title>
<style>
.table12_11 table {
	width:100%;
	margin:15px 0;
	border:0;
}
.table12_11 th {
	background-color:white;
	color:black
}
.table12_11,.table12_11 th,.table12_11 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table12_11 td a{
	color:black;
}

.table12_11 th,.table12_11 td {
	border: 1px solid #206bfe;
	border-width:1px 0 1px 0;
	border:2px outset #ffffff;
}
.table12_11 tr {
	border: 1px solid #ffffff;
}
.table12_11 tr:nth-child(odd){
	background-color:#b4dafe;
}
.table12_11 tr:nth-child(even){
	background-color:#ffffff;
}
/* th{
	text-indent: 10px
} */
</style>
<link rel="stylesheet" href="css/basic.css">
</head>
<body>

<h2><%=year %>년 <%=month %>월 <%=day %>일 일정</h2>

<hr>

<div align="center">

<table class=table12_11>
<col width="50px"><col width="400px"><col width="500px"><col width="100px">

<tr bgcolor="#09bbaa">
<th>번호</th><th>시간</th><th>제목</th><th>삭제</th>
</tr>

<%
for(int i = 0;i < list.size(); i++){
	CalendarDto dto = list.get(i);
	%>
	<tr>
		<td><%=i + 1 %></td>
		<td><%=toDates(dto.getRdate()) %></td>
		<td>
			<a href="mymyCaldetail.jsp?seq=<%=dto.getSeq() %>">
				<%=dto.getTitle() %>
			</a>
		</td>
		<td>
			<form action="mymyCaldelete.jsp" method="post">
				<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
				<input type="submit" value="일정삭제">
			</form>
		</td>	
	</tr>
	<%
}	
%>
</table>
</div>


</body>
</html>


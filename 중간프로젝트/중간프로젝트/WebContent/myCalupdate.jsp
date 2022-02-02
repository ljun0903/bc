<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="header.jsp" %>
<%@ include file="mypageside.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calupdate</title>
<link rel="stylesheet" href="css/basic.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
th{
	background-color: #00a2e8;
}
</style>

</head>
<body>

<%!
public String toDates(String mdate){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
	
	String s = mdate.substring(0, 4) + "-" 	// yyyy
			+ mdate.substring(4, 6) + "-"	// MM
			+ mdate.substring(6, 8) + " " 	// dd
			+ mdate.substring(8, 10) + ":"	// hh
			+ mdate.substring(10, 12) + ":00"; 
	Timestamp d = Timestamp.valueOf(s);
	
	return sdf.format(d);	
}

public String toOne(String msg){	// 08 -> 8
	return msg.charAt(0)=='0'?msg.charAt(1) + "": msg.trim();
}

%>

<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

CalendarDao dao = CalendarDao.getInstance();
CalendarDto dto = dao.getDay(seq);

String year = dto.getRdate().substring(0, 4);
String month = toOne(dto.getRdate().substring(4, 6));
String day = toOne(dto.getRdate().substring(6, 8));
String hour = toOne(dto.getRdate().substring(8, 10));
String min = toOne(dto.getRdate().substring(10, 12));

%>


<h1>일정 수정</h1>
<hr>

<div align="center">


<form action="myCalupdateAf.jsp" method="post">

<table class="table table-bordered" style="width: 65%">
<col width="200"><col width="500">

<tr>
	<th>아이디<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
	</th>
	<td>
		<input type="text" name="id" value="<%=dto.getId() %>" readonly="readonly">
	</td>
</tr> 
<tr>
	<th>닉네임</th>
	<td>
		<input type="text" name="name" value="<%=dto.getName() %>" readonly="readonly">
	</td>
</tr> 

<tr>
	<th>제목</th>
	<td>
		<input type="text" size="60" name="title" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<th>컬러 지정</th>
	<td>
		<input type="color" size="60" name="labelcol" value="<%=dto.getLabelcol()%>">
	</td>
</tr>
<tr>
	<th>일정</th>
	<td>
	
	<select name="year">
	<%
	for(int i = tyear - 5;i < tyear + 6; i++){
		%>
		<option <%=year.equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>	
	</select>년	
	
	<select name="month">
	<%
	for(int i = 1;i <= 12; i++){
		%>
		<option <%=month.equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>	
	</select>월
	
	<select name="day">
	<%
	for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
		%>
		<option <%=day.equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>	
	</select>일
	
	<select name="hour">
	<%
	for(int i = 0;i < 24; i++){
		%>
		<option <%=(hour + "").equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>	
	</select>시
	
	<select name="min">
	<%
	for(int i = 0;i < 60; i++){
		%>
		<option <%=(min + "").equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>	
	</select>분
	
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="60" name="content"><%=dto.getContent() %> </textarea>
	</td>
</tr>

<tr>
	<td colspan="2">
		<input type="button" value="수정" onclick="modify()">
	</td>
</tr>


</table>

</form>

</div>

<script type="text/javascript">
function modify() {
	var f = document.forms[0];
	f.submit();
}

</script>

<%
String url = String.format("%s?year=%s&month=%s", 
						"myCalendar.jsp", year, month);
%>
<%-- 
<a href="<%=url %>">일정보기</a> --%>

</body>
</html>


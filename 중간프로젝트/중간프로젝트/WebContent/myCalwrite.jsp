<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="header.jsp" %>
<%@ include file="mypageside.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/basic.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
/* th{
	background-color: #00a2e8;
} */
table, tr, th, td{
	border:groove;
	text-align: center;
	height: 40px;
}

td{
	font-size: 17px;
}

chk{
	color: #1E3269;
	background-color: white;
}
</style>

</head>
<body>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
%>

<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) + 1;
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR_OF_DAY);
int tmin = cal.get(Calendar.MINUTE);

cal.set(Calendar.MONTH, Integer.parseInt(month)-1);
%>

<h2>일정 추가</h2>
<br>
<div align="center">

<form action="myCalwriteAf.jsp" method="post">

<table>
<col width="200"><col width="500">
<%-- <tr>
	<th>아이디</th>
	<td>
		<%=mem.getId() %>
		<input type="hidden" name="id" value="<%=mem.getId() %>">
	</td>
</tr>
--%>
<tr>
	<th>닉네임</th>
	<td>
		<%=mem.getName() %>
		<input type="hidden" name="name" value="<%=mem.getName() %>">
		<input type="hidden" name="id" value="<%=mem.getId() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" size="60" name="title">
	</td>
</tr>
<tr>
	<th>색상 지정</th>
	<td>
		<input type="color" size="60" name="labelcol">
	</td>
</tr>
<tr>
	<th>일정</th>
	<td>
		<select name="year">
		<%
			for(int i = tyear - 5;i <= tyear + 5; i++){
				%>	
				<option <%=year.equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				
				<%
			}		
		%>		
		</select>년	
		
		<select name="month">
		<%
			for(int i = 1;i <= 12; i++){
				%>	
				<option <%=month.equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				
				<%
			}		
		%>		
		</select>월
		
		<select name="day">
		<%
			for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>	
				<option <%=day.equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>				
				<%
			}		
		%>		
		</select>일
		
		<select name="hour">
		<%
			for(int i = 1;i < 24; i++){
				%>	
				<option <%=(thour + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>				
				<%
			}		
		%>		
		</select>시
		
		<select name="min">
		<%
			for(int i = 0;i < 60; i++){
				%>	
				<option <%=(tmin + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>				
				<%
			}		
		%>		
		</select>분	
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="60" name="content"></textarea>
	</td>
</tr>

<tr>
	<td class="chk" colspan="2" align="center">
		<input size="50px" type="submit" value="등록 √ ">
	</td>
</tr>
</table>
</form>
</div>

<script type="text/javascript">



$(document).ready(function() {
	
	$("select[name='month']").change( setDay );	
});

function setDay() {
//	alert('setDay()');
	let year = $("select[name='year']").val();
	let month = $("select[name='month']").val();

	let lastday = (new Date(year, month, 0)).getDate();
//	alert(lastday);

	// 날짜 적용
	let str = '';
	for(i = 1;i <= lastday; i++){
		str += "<option value='" + i + "'>" + i + "</option>";
	}
	
	$("select[name='day']").html(str);
	
	$("select[name='day']").val("<%=day %>");
}


</script>



</body>
</html>









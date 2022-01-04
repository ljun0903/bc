<%@page import="java.util.Calendar"%>
<%@page import="bit.your.prj.util.CalendarUtil"%>
<%@page import="bit.your.prj.param.CalendarParam"%>
<%@page import="bit.your.prj.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
       <link href="css/calendar.css" rel="stylesheet" />
</head> 
<%
List<CalendarDto> list = (List<CalendarDto>)request.getAttribute("flist");
CalendarParam cal = (CalendarParam)request.getAttribute("cal");
Calendar calen = Calendar.getInstance();

int year = cal.getYear();
int month = cal.getMonth();
int dayOfWeek = cal.getDayOfWeek();
int lastDayOfMonth = cal.getLastDay(); 
int year2 = calen.get(Calendar.YEAR); //올해년도
int month2 = calen.get(Calendar.MONTH) + 1; //현재 달
int day = calen.get(Calendar.DATE);// 오늘날짜

//<< year--
String pp = String.format("<a href='%s?year=%d&month=%d'><img src='image/left.gif'></a>", 
								 "calist.do", year-1, month);

// < month-- 
String p = String.format("<a href='%s?year=%d&month=%d'><img src='image/prec.gif'></a>", 
								 "calist.do", year, month-1);

// > month++
String n = String.format("<a href='%s?year=%d&month=%d'><img src='image/next.gif'></a>", 
								 "calist.do", year, month+1);

// >> year++
String nn = String.format("<a href='%s?year=%d&month=%d'><img src='image/last.gif'></a>", 
		 						"calist.do", year+1, month);

%>

<h1 align="center">참여클래스 일정</h1>
<br>
<div>

<table style="width: 65%; margin-left: auto; margin-right: auto;">
<col width="auto">
<col width="auto">
<col width="auto">
<col width="auto">
<col width="auto">
<col width="auto">
<col width="auto">


<thead>
	
	
	
	<tr height="100px" >
		<td class="days2" colspan="7" >
		<img src="image/calendar.png" style="float: left;" onclick="location.href='calist.do?year=<%=year2 %>&month=<%=month2 %>'" onmouseover="this.src='image/calendar2.png'" onmouseout="this.src='image/calendar.png'">
			<%-- <%=pp %> --%><%=p %>&nbsp;
			<font style="position: relative; font-size: 55px; font-weight: bold;  text-align: center; top: 10px" >
				<%=String.format("%d년&nbsp;%d월", year, month) %>
			</font>			
			<%=n %><%-- <%=nn %> --%>
			&nbsp;
			
		</td>
	</tr>
	
	<tr height="50px">
		
		<th class="days3"><strong>일</strong></th>
		<th class="days3">월</th>
		<th class="days3">화</th>
		<th class="days3">수</th>
		<th class="days3">목</th>
		<th class="days3">금</th>
		<th class="days3">토</th>
		
	</tr>
</thead>

<tbody>

<tr height="100px">
<%

for(int i = 1;i < dayOfWeek; i++){
	out.println("<td class='nodays'>&nbsp;</td>");
}

for(int i = 1; i <= lastDayOfMonth; i++){
	if(i ==  day && month2 == month ){	// 오늘
		%>
		<td class="today"><%=i %><%=CalendarUtil.makeTable(year, month, i, list) %>
		</td>
		<%
	}
	else if( (i + dayOfWeek - 1) % 7 == 1){	// 일요일		
		%>
		<td class="sunday"><%=i %><%=CalendarUtil.makeTable(year, month, i, list) %>
		</td>
		<%
	}
	else if( (i + dayOfWeek - 1) % 7 == 0){	// 토요일		
		%>
		<td class="satday"><%=i %><%=CalendarUtil.makeTable(year, month, i, list) %>
		</td>
		<%
	}
	else{								// 평일
		%>
		<td class="otherday"><%=i %><%=CalendarUtil.makeTable(year, month, i, list) %>
		</td>
		<%		
	}
	if((i + dayOfWeek - 1) % 7 == 0 && i != lastDayOfMonth){
		%>	
		</tr><tr height="100px">
		<%
	}
}

for(int i = 0;i < (7 - (dayOfWeek + lastDayOfMonth - 1 )% 7)% 7 ; i++){
	out.println("<td class='nodays'>&nbsp;</td>");
}
%>
</tr>

</tbody>

</table>


</div>








    
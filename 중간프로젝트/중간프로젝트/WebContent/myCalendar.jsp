<%@page import="util.CalUtil"%>
<%@page import="dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CalendarDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@ include file="header.jsp" %>
<%@ include file="mypageside.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
public boolean nvl(String msg){
	return msg==null || msg.trim().equals("")?true:false;
}
/*
public String two(String msg){
	return msg.trim().length()<2?"0"+msg.trim():msg.trim();
}
*/

// 날짜, 일별일정
public String callist(int year, int month, int day){
	String str = "";
	
	str += String.format("&nbsp;<a href='myCallist.jsp?year=%d&month=%d&day=%d'>", year, month, day); 
	str += String.format("%2d", day);
	str += "</a>";
	
	return str;
}

// 일정추가
 public String showPen(int year, int month, int day){
	String str = "";
	
	String image = "<img src='image/pen.png' width='25px' height='25px'>";	
	str = String.format("<a href='myCalwrite.jsp?year=%d&month=%d&day=%d'>%s</a>", 
													year, month, day, image);
	return str;
} 

// 날짜별 리스트
public String makeTable(int year, int month, int day, List<CalendarDto> list){
	String str = "";
	
	// 2021 6 18	-> 20210618
	String dates = (year + "") + CalUtil.two(month + "") + CalUtil.two(day + "");
	
	str +="<table>";
		
	for(CalendarDto dto : list){
		if(dto.getRdate().substring(0, 8).equals(dates)){
			str += "<tr><div style='background-color:" + dto.getLabelcol()+"'><td style='width:500px; height:10px; padding: 0px; background-color: " + dto.getLabelcol() +";'>";
			str += "<a href='myCaldetail.jsp?seq=" + dto.getSeq() + "'>";
			str += "<font style='font-size:10px; color:white'>";
			str += dot3(dto.getTitle());
			str += "</font>";
			str += "</a>";
			str += "</td></div></tr>";			
		}		
	}		
	str +="</table>";
	
	return str;
}

// 일정의 제목이 길때 ...으로 처리하는 함수		CGV에서 6시까지 영화예약	 -> CGV에서 6...
public String dot3(String msg){
	String str = "";
	if(msg.length() >= 10){
		str = msg.substring(0, 10);
		str += "...";
	}else{
		str = msg.trim();
	}
	return str;
}

%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myCalendar.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/basic.css">
<style type="text/css">
th{
	background-color: white;
	color: black;	
}
td a{
	color: black;
}
h2{
	text-indent: 20px;
}
</style>

</head>
<body>

<h2>나의 캘린더</h2>
<br>
<%
	Calendar cal = Calendar.getInstance();

	cal.set(Calendar.DATE, 1);

	String syear = request.getParameter("year");
	String smonth = request.getParameter("month");
	
	System.out.println(syear);
	System.out.println(smonth);
	
	int year = cal.get(Calendar.YEAR);
	if(nvl(syear) == false){	// 파라미터로 넘어 온 데이터가 있는 경우
		year = Integer.parseInt(syear);
	}
	
	int month = cal.get(Calendar.MONTH) + 1;
	if(nvl(smonth) == false){
		month = Integer.parseInt(smonth);
	}
	
	if(month < 1){
		month = 12;
		year--;
	}
	if(month > 12){
		month = 1;
		year++;
	}
	
	cal.set(year, month - 1, 1);
	
	// 요일
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// << year--
	String pp = String.format("<a href='%s?year=%d&month=%d'><img src='image/left.gif' width='20px' height='20px'></a>", 
									 "myCalendar.jsp", year-1, month);
	
	// < month-- 
	String p = String.format("<a href='%s?year=%d&month=%d'><img src='image/prec.gif' width='50px' height='50px'></a>", 
									 "myCalendar.jsp", year, month-1);
	
	// > month++
	String n = String.format("<a href='%s?year=%d&month=%d'><img src='image/next.gif' width='50px' height='50px'></a>", 
									 "myCalendar.jsp", year, month+1);
	
	// >> year++
	String nn = String.format("<a href='%s?year=%d&month=%d'><img src='image/last.gif' width='20px' height='20px'></a>", 
			 						"myCalendar.jsp", year+1, month);
	
	CalendarDao dao = CalendarDao.getInstance();
														// 202106	
	List<CalendarDto> list = dao.getCalendarList(mem.getId(), year + CalUtil.two(month + ""));
	
	System.out.println(mem.getId());	
	System.out.println(mem.getName());
	System.out.println(list);													
	
%>

<div align="center">

<table class="table table-bordered" style="width: 65%">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="100"><col width="100">

<tr>
	<td colspan="7" align="center"> <!-- style="padding-top: 20px"> -->
		<%=pp %>&nbsp;&nbsp;<%=p %>&nbsp;&nbsp;
		&nbsp;&nbsp;
		<font color="black" style="font-size: 50px; font-family: fantasy">
			<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>		
		</font>
		&nbsp;&nbsp;
		<%=n %>&nbsp;&nbsp;<%=nn %>&nbsp;&nbsp;
	</td>
</tr>

<tr height="50">
	<th class="text-center">일</th> 
	<th class="text-center">월</th>
	<th class="text-center">화</th>
	<th class="text-center">수</th>
	<th class="text-center">목</th>
	<th class="text-center">금</th>
	<th class="text-center">토</th>
</tr>

<tr height="120" align="left" valign="top">
<%
// 윗쪽 빈칸
for(int i = 1;i < dayOfWeek; i++){
	%>
	<td style="background-color: #F2F2F2;">&nbsp;</td>
	<%
}

// 날짜
int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1;i <= lastday; i++){
	%>
	<td>
		<%=callist(year, month, i) %> <%=showPen(year, month, i) %> 
		<%=makeTable(year, month, i, list) %>	
	</td>	
	<%
	if( (i + dayOfWeek - 1)%7 == 0 && i != lastday){
		%>
		</tr><tr height="120" align="left" valign="top">
		<%	
	}	
}
// 밑의 빈칸
cal.set(Calendar.DATE, lastday);
int weekday = cal.get(Calendar.DAY_OF_WEEK);
for(int i = 0;i < 7 - weekday; i++){
	%>
	<td style="background-color: #F2F2F2">&nbsp;</td>
	<%
}
%>

</tr>

</table>

</div>



</body>
</html>







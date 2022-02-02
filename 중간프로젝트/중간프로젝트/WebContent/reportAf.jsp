<%@page import="dto.ReportBbsDto"%>
<%@page import="dao.ReportBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>    

<%

String pdsnumm = request.getParameter("pdsnum");
System.out.println("pdsnumm:"+ pdsnumm);
int pdsnum = Integer.parseInt( pdsnumm );

String title = request.getParameter("title");
String sbbsnum = request.getParameter("bbsnum");
String id = request.getParameter("id");
String reporter = request.getParameter("reporter");
String  reason = request.getParameter("reason");
String reportcontent = request.getParameter("reportcontent");

System.out.println("sbbsnum:"+ sbbsnum);
int bbsnum = Integer.parseInt( sbbsnum );

System.out.println("title:"+ title);
System.out.println("bbsnum:"+ bbsnum);
System.out.println("id:"+ id);
System.out.println("reporter:"+ reporter);
System.out.println("reason:"+ reason);
System.out.println("reportcontent:"+ reportcontent);
%>    
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
ReportBbsDao dao = ReportBbsDao.getInstance();
boolean isS = dao.writereport(new ReportBbsDto(title, id, bbsnum, pdsnum, reporter, reason, reportcontent));
												
if(isS){
%>
	<script type="text/javascript">
	alert('신고접수');
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert('error');
	</script>
<%
}
%>
</body>
</html>
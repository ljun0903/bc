<%@page import="dto.ReportBbsDto"%>
<%@page import="dao.ReportBbsDao"%>
<%@page import="pds.PdsDto"%>
<%@page import="pds.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	String sseq = request.getParameter("seq");
	int seq = Integer.parseInt(sseq);
	ReportBbsDao dao = ReportBbsDao.getInstance();
	ReportBbsDto dto = dao.getreport(seq);
	boolean isr = dao.deletereport(seq);

	if(isr){
		int bn = Integer.parseInt(request.getParameter("bbsnum"));
	
		PdsDao da = PdsDao.getInstance();
		PdsDto dt = da.getPds(bn);
		boolean isS = da.deletePds(bn);
	
	if(isS){
		%>
		<script type="text/javascript">
		alert("삭제 되었습니다");
		location.href='reportbbslist.jsp';
		</script>
		<%
	}else{	
		%>
		<script type="text/javascript">
		alert("삭제하지 못했습니다");
		location.href='reportbbslist.jsp';
		</script>
		<%
	}	
}else{	
	%>
	<script type="text/javascript">
	alert("삭제하지 못했습니다");
	location.href='reportbbslist.jsp';
	</script>
	<%
}
%>


</body>
</html>
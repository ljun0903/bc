<%@page import="dao.CrewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
String name = request.getParameter("name");
String id = request.getParameter("id");
CrewDao dao = CrewDao.getInstance();

boolean isS = dao.joinCrew(seq, id, name);
    if(isS){
    	//dao.curcount(seq);
    %>
<script>
alert('가입되었습니다.');
location.href = 'main.jsp'; // 크루 커뮤니티로 이동

</script>
<% 
} else {
%>
<script>
alert('실패했습니다.');
</script>  
<% 
}
%>  
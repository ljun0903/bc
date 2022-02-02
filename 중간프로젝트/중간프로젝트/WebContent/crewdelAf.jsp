<%@page import="dao.CrewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
request.setCharacterEncoding("utf-8");
//String newfilename = request.getParameter("newfilename");
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

CrewDao dao = CrewDao.getInstance();

boolean isS = dao.crewdelete(seq);
    if(isS){
    	dao.crewMemberdelete(seq); // 크루멤버테이블에서 해당 크루 멤버들 삭제
    %>
<script>
alert('삭제되었습니다.');
location.href = 'main.jsp';

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
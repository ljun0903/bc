<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	System.out.println("id : "+ id);
	
	MemberDao dao = MemberDao.getInstance();

	boolean idCheck = dao.getId(id);
	
	if(idCheck == true){	// 중복
		out.println("YES");
	} else{
		out.println("NO");
	}
%> 
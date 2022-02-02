<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = request.getParameter("name");
	System.out.println("name : "+ name);
	
	MemberDao dao = MemberDao.getInstance();

	boolean idCheck = dao.getName(name);
	
	if(idCheck == true){	// 중복
		out.println("YES");
	} else{
		out.println("NO");
	}
%> 
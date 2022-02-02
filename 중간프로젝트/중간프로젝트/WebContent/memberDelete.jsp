<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="mypageside.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원 탈퇴</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/basic.css">

<style type="text/css">

span{
	font-size: x-large;
}
h2{
	text-indent: 20px;

}
</style>
</head>
<body>
<!-- 로그인 확인 -->

<%
String name = request.getParameter("name");
MemberDao dao = MemberDao.getInstance();
MemberDto dto = dao.getMember(name);

%>

<h2>회원탈퇴</h2>
<!-- <hr> -->
<header class="py-5">
            <div class="container px-lg-5">
                <div class="p-4 p-lg-5 rounded-3 text-center">
						<form action="memberDeleteAf.jsp?name=<%=dto.getName() %>" method="post">
                        <p class="fs-4">
                        <input type="hidden" id="id" name="id" value="<%=dto.getId() %>">
                        <input type="hidden" id="name" name="name" value="<%=dto.getName() %>">
                        <span><%=dto.getName() %></span> 님의 가입된 회원정보가 모두 삭제됩니다.<br>
							작성하신 게시물은 삭제되지 않습니다.<br>
							정말로 탈퇴하시겠습니까?<br><br>
                        	탈퇴사유<br>
                        	<select>
								<option>타 사이트 유사서비스 이용</option>
								<option>임시 비활성화(새 계정 사용 예정)</option>
								<option>개인정보/사생활 침해를 경험함</option>
								<option>지나친 성희롱/욕설을 경험함</option>
								<option>임시 비활성화(새 계정 사용 예정)</option>
								<option>사용 방법을 모르겠음</option>
								<option>친구가 없음</option>
								<option>항목에 없음(직접 입력)</option>
							</select>
                        </p>
                        <input type="submit" class="btn btn-primary btn-lg" value="탈퇴하기">
                  		</form>
                    </div>
            </div>
        </header>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link href="css/style_infodel.css" rel="stylesheet" /> 
<c:set var="mem" value="${mem}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>






<div class="login">
<span>탈퇴하시려면 아이디 비밀번호를 입력해주세요.</span>  
  <div class="login-triangle"></div>
  

 

  <form class="login-container" action="info_delAf.do" name="frmForm" id="_frmForm" method="post">
    <p><input type="text" name="id" readonly="readonly" value='${login.id}'></p>
    <p><input type="password" name="pwd" placeholder="비밀번호"></p>
    <p><input type="submit"  value="탈퇴하기"></p>
    <p><input type="submit" id="_btn" value="돌아가기"></p>
  </form>
</div>




<script type="text/javascript">
$("#_btn").click(function () {
   location.href = "info.do";
});

</script>
</body>
</html>
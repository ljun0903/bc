<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<c:set var="mem" value="${mem}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>

<link href="css/style_info.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- CSS -->


<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
<br><br>
<h1 style="font-size: xx-large; font-weight: bold; text-align: left; margin-left: 300px";>회원정보조회</h1>
<br>
<form action="info.do" name="frmForm" id="_frmForm" method="POST"> 



                <label for="id">아이디</label>
                <input value="${mem.id }" readonly="readonly">

                <label for="pa">비밀번호</label>
                <input type="password" value="${mem.pwd }" readonly="readonly">


                <label for="name">이름</label>
                <input value="${mem.name }"readonly="readonly">

                <label for="nickname">닉네임</label>
               <input value="${mem.nickname }"readonly="readonly">

                <label for="gender">성별</label>
               <input value="${mem.gender }"readonly="readonly">

                <label for="birth">생년월일</label>
               <input value="${mem.birth }"readonly="readonly">

                <label for="phone">휴대폰번호</label>
               <input value="${mem.phone }"readonly="readonly">

                <label for="email">이메일</label>
               <input value="${mem.email }"readonly="readonly">

                <label for="address1">주소</label>
               <input type="text" id="addr1" readonly="readonly">
               <label for="address1"></label>
               <input type="text" id="addr2" readonly="readonly">
               <label for="address1"></label>
               <input type="text" id="addr3" readonly="readonly">


<label for="button"></label>
<button type="button" class="button-slide" id="_btnupdate" >회원정보수정</button>


    </form>





 <!-- 주소 나눠서 뿌려주기 -->
<script type="text/javascript">
$("#_btnupdate").click(function () {
	location.href = "info_update.do";
});

$("#_btndel").click(function () {
	location.href = "info_del.do";
});


$(document).ready(function() {
   let location = "${mem.address1}";
   let a = location.indexOf(",");
   let b = location.lastIndexOf(",");
   let addr1 = location.substring(0, a);
   let addr2 = location.substring(a+1, b);
   let addr3 = location.substring(b+1);
     
     $('#addr1').val(addr1);
     $('#addr2').val(addr2); 
     $('#addr3').val(addr3); 
});
</script>  

</body>
</html>
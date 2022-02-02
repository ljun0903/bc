<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ include file="header.jsp" %>
<%@ include file="mypageside.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>회원정보 수정</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/basic.css">

<style type="text/css">
h2{
	/* text-indent: 20px; */
	text-align: center;
	margin-bottom: 30px;

}
#delete, #modify{
	width: 130px;
}
#nameCheck{
	font-size: 5px;
}

#constraint1, #constraint2{
	font-size: 5px;
	color: #ff0000;
}

.main{
	

}

.form-group{
	margin-bottom: 20;

}

#email {
	width: 130px;
	display : inline;
}

#domain {
	display: inline-block;
	width: 150px;
}

#selectEmail {
	width: 150px;
	display: inline-block;
}
</style>
</head>
<body>

<!-- 로그인 확인 -->
<script type="text/javascript">
function lastCheck() {
	let newpw = document.getElementById("new_pwd").value;	// 새 비밀번호
	let pwChk = document.getElementById("pwdCheck").value;	// 비밀번호 확인
	let loc = document.getElementById("loc").value;			// 지역
	
/* 	let eng = pwChk.search(/[a-z]ig);	// 영문
	let num = pwChk.search(/[0-9]/g);   */
	
	if(newpw != pwChk) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	if(newpw.length < 6){
		alert('비밀번호는 6자리 이상 입력해주세요');
		return false;
	}
	/* if(eng < 0 || num < 0){
		alert('영문, 숫자를 포함하여 입력해주세요');
		return false;
	}  */
	if(loc == "선택"){
		alert('지역을 선택해주세요');
		return false;
	}
};
</script>

<%
String name = request.getParameter("name");
MemberDao dao = MemberDao.getInstance();
MemberDto dto = dao.getMember(name);
/* System.out.println("name:"+name); */

// 이메일 도메인 분리
String email = dto.getEmail();
/* System.out.println("Email:"+email); */

int s = email.indexOf("@");
String email_id = email.substring(0, s);			// 아이디만 가져오기
String email_domain = email.substring(s + 1);		// 도메인만 가져오기
%>
<!-- <h2 >회원정보 수정</h2> -->
<br><br>
<div class="main">
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<h2>회원정보 수정</h2>
			<form method="post" action="memberUpdateAf.jsp?name<%=dto.getName() %>" onsubmit="return lastCheck()">
				<div class="form-group">
					아이디<input type="text" class="form-control" id="id" name="id" value="<%=dto.getId() %>" readonly required>
				</div>
				<div class="form-group">
					닉네임<input type="text" class="form-control" id="name" name="name" maxlength="10" required autofocus value="<%=dto.getName() %>">
						<p id="nameCheck"></p>
						<input type="button" class="btn btn-primary btn-xs" id="btn" value="중복확인">
				</div>
				<div class="form-group">
					<input type="hidden" name="email" value="<%=dto.getEmail() %>">		<!-- DB로 전체 이메일을 넘겨주기 위해 hidden처리로 가려둠 -->
					이메일<input type="text" class="form-control" id="email" name="email1" maxlength="12" required value="<%=email_id %>">
						@<input type="text" class="form-control" id="domain" name="email2" required value="<%=email_domain %>">
						<select name="emailSelection" id="selectEmail" class="form-control">
							<option value="선택">선택</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="직접입력">직접입력</option>
						</select>
				</div>
				<div class="form-group">
					비밀번호<input type="password" class="form-control" placeholder="새 비밀번호" id="new_pwd" name="pwd" maxlength="12" required>
					<p id="constraint1"></p>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호 확인" id="pwdCheck" name="pwd" maxlength="12" required>
					<p id="constraint2"></p>
				</div>
				<div class="form-group">
					지역 <select id="loc" name="loc" class="form-control">
							<option value="선택">선택</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강서구">강서구</option>
							<option value="강북구">강북구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동대문구">동대문구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value=성북구>성북구</option>
							<option value=송파구>송파구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="중랑구">중랑구</option>
						</select>
				</div>
					<input type="button" class="btn btn-primary form-control" id="delete" value="탈퇴하기">
					<input type="submit" class="btn btn-primary form-control" id="modify" value="수정하기">
			</form>
		</div>
		<div class="col-lg-4"></div>
		</div>
	</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
/* jquery */
$(document).ready(function () {
	// 받아온 select값 default값으로 넣어주기	
	$("#loc").val("<%=dto.getLoc()%>").prop("selected",true);
	$("#selectEmail").val("<%=email_domain %>").prop("selected", true);
	
	$("#new_pwd").click(function () {
		//alert('hhh');
		$("#constraint1").html("영문, 숫자를 포함한 6~12자리를 입력해주세요.")
	});
	
	$("#pwdCheck").click(function () {
		//alert('qqq');
		$("#constraint2").html("영문, 숫자를 포함한 6~12자리를 입력해주세요.")
	});
	

	$("#selectEmail").change(function () {
		$("#selectEmail option:selected").each(function () {			// each : 반복함수
			if($("#selectEmail option:selected").val() == "직접입력"){		// 직접입력일 경우
				$("#domain").attr("disabled",false);	// input 비활성화
				$("#domain").val("");					// 초기화
			}else {
				$("#domain").val($(this).text());
				$("#domain").attr("disabled",true);	// input 활성화
			}
		});
	});
	
	$("#delete").click(function () {
		location.href="memberDelete.jsp?name=<%=dto.getName()%>";
	});
	/* ajax */
	$("#btn").click(function () {
		$.ajax({
			url:"nameCheck.jsp",
			type:"POST",
			data:{ "name":$("#name").val() },
			success:function(data){
			//	alert('success');
			//	alert(data.trim());
				
				if(data.trim() == "YES"){
					$("#nameCheck").css("color", "#ff0000");
					$("#nameCheck").text("이미 사용중인 닉네임입니다. 다시 입력해주세요");
					$("#name").val("");
				}else{
					$("#nameCheck").css("color", "#0000ff");
					$("#nameCheck").text("사용 가능한 닉네임입니다.");
				}
				
			},
			error:function(){
				alert('error');
			}
		});
	});
	
});

</script>
</body>
</html>
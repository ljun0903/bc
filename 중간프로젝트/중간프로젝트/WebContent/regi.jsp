<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.79.0">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<style>
/* .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
}
 */
/* @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
} */

input.w-100{
	width: 300px;
	/* background-color: #8878CD;
	border-color: white; */
}

div.userifm{
	text-align: left;
}

input#btn,input#btn2{
	font-size: 12px;
	margin-bottom: 10px;
	
}

input#email, #selectEmail, #domain{
	width: 31%;
}

input#email{
	display : inline;
}
h4{
	display : inline-block;
}

#domain{
	display : inline-block;
}

#selectEmail{
	display : inline-block;
}
select, #pwd {
	margin-top: 10px; 
}
#constraint{
	font-size: 5px;
	color: #ff0000;
}

main.form-group{
	text-align : center;
	width: 60%;
	border: 1px solid;
	padding: 50px;
}
</style>

    
    <!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
</head>
<body class="text-center">

<script type="text/javascript">
function lastCheck() {
	let pwd = document.getElementById("pwd").value;			// 비밀번호
	let pwChk = document.getElementById("pwdCheck").value;	// 비밀번호 확인
	let loc = document.getElementById("loc").value;			// 지역
/* 	let eng = pwChk.search(/[a-z]ig);	// 영문
	let num = pwChk.search(/[0-9]/g);   */
	
	if(pwd != pwChk) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	if(pwd.length < 6){
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
<div class="d-flex justify-content-center align-items-center container ">      
<main class="form-group">
  <form action="regiAf.jsp" method="post" onsubmit="return lastCheck()">
    <img class="mb-4" src="image/logo1.png" alt="" width="120" height="120">
    
    <h1 class="h3 mb-3 fw-normal"><b>회원가입</b></h1>
    
<!--     <h5 style="text-align: left;"><b>회원정보</b></h5> -->
    <br><br>
    
    <div class="userifm">
    아이디&nbsp;<input type="button" id="btn" value="중복확인"><br> 
    <input type="text" id="id" name="id" class="form-control" placeholder="User ID" required autofocus maxlength="10">
    <p id="idCheck" style="font-size: 8px"></p>
    
	닉네임&nbsp;<input type="button" id="btn2" value="중복확인"><br> 
    <input type="text" id="name" name="name" class="form-control" placeholder="User Name" required autofocus maxlength="10">
    <p id="nameCheck" style="font-size: 8px"></p>

  	비밀번호
    <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" required maxlength="12"> 
  	<p id="constraint"></p>
  	
  	이메일<br>
  	<input type="text" class="form-control" id="email" name="email" maxlength="12" placeholder="Email">
	&nbsp;<h4>@</h4>&nbsp;<input type="text" class="form-control" id="domain" name="email2">
	<select name="emailSelection" id="selectEmail" class="form-control">
		<option value="선택">선택</option>
		<option value="naver.com">naver.com</option>
		<option value="gmail.com">gmail.com</option>
		<option value="daum.net">daum.net</option>
		<option value="hotmail.com">hotmail.com</option>
		<option value="nate.com">nate.com</option>
		<option value="직접입력">직접입력</option>
	</select><br>
  	
  	지역
  	<select id="loc" name="loc" class="form-control">
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
	<br><br> 
    </div>
    
    <input type="submit" class="w-100 btn btn-lg btn-primary" value="가입하기">

  </form>
  
</main> 
</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>    
<script type="text/javascript">
$(document).ready(function() {
	
	$("#btn").click(function() {
	//	alert('click');
	
		$.ajax({
			url:"idCheck.jsp",
			type:"post",
			data:{ "id":$("#id").val() },
			success:function( data ){
			//	alert('success');
			//	alert(data.trim());
			
				if(data.trim() == "YES"){
					$("#idCheck").css("color", "#ff0000");
					$("#idCheck").text("이미 사용중인 닉네임입니다. 다시 입력해주세요");
					$("#id").val("");
				}else{
					$("#idCheck").css("color", "#0000ff");
					$("#idCheck").text("사용 가능한 닉네임입니다.");
				}
			},
			error:function(){
				alert('error');
			}			
		});
	});
	
	$("#btn2").click(function() {
		//	alert('click');
		
			$.ajax({
				url:"nameCheck.jsp",
				type:"post",
				data:{ "name":$("#name").val() },
				success:function( data ){
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
	
	// 비밀번호 입력란 클릭 시
	$("#pwd").click(function () {
		//alert('hhh');
		$("#constraint").html("영문, 숫자를 포함한 6~12자리를 입력해주세요.")
	});
	
	// 도메인 직접입력 시
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
	
});

</script>


</body>
</html>

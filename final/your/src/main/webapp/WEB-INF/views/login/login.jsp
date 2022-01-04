<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/회원가입</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<link href="css/style_login.css" rel="stylesheet" />
<link href="css/goTop2.css" rel="stylesheet" />
<link href="css/nomal.css" rel="stylesheet" />

<!-- 다음지도 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style type="text/css">
#email_num_false{
     background-color: #ebebe4;
}
#email_num_true{
     background-color: white; 
}

.correct{
    color : green;
}
.incorrect{
    color : red;
}
.button-slide-yellow-login{
  background: #008080;
  width : 110px;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size: 12px;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 12px;
}
.button-slide-yellow-login:hover{
  background:#fff;
  color: #008080;
  border-radius: 12px;
}
.button-slide-yellow-login:before,.button-slide-yellow:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #008080;
  transition:400ms ease all;
  border-radius: 12px;
}
.button-slide-yellow-login:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
  border-radius: 12px;
}
.button-slide-yellow-login:hover:before,.button-slide-yellow:hover:after{
  width:100%;
  transition:800ms ease all;
  border-radius: 12px;
}
.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
</style>

</head>
<body onkeydown="javascript:onEnterLogin();">

<section class="forms-section">
 <div> <h5 onclick="location.href='home.do'"><img src="image/icon2.png" alt="..." width="300" height="200" class="goTop2"/></h5></div>
  <div class="forms">
    <div class="form-wrapper is-active">
      <button type="button" class="switcher switcher-login">
        Login
        <span class="underline"></span>
      </button>
      <form action="loginAf.do" name="loginForm" id="_frmForm" method="POST" class="form form-login">
        <fieldset>
          <legend>Please, enter your email and password for login.</legend>
          <div class="input-block">
            <label for="id">ID</label>
            <input id="_id" type="text" name="id" > 
          </div>
          <div class="input-block">
            <label for="pwd">PASSWORD</label>
            <input id="_pwd" type="password" name="pwd" > 
          </div>
        </fieldset>
        
        <label>
           <input type="checkbox" id="chk_save_id">아이디저장
        </label>
        <br><br>
        <a href="findid.do">아이디/비밀번호 찾기</a>
        
        
        
        <button type="submit" id="_btnLogin" class="btn-login">로그인</button>
      </form>
    </div>
    
    <div class="form-wrapper">
      <button type="button" class="switcher switcher-signup">
        Sign Up
        <span class="underline"></span>
      </button>
      <form class="form form-signup" action="regiAf.do" name="frmForm" id="_frmForm" method="POST">
        <fieldset>
          <legend>Please, enter your email, password and password confirmation for sign up.</legend>
          <div class="input-block">
           <label for="id">ID</label><br>
					<input type="text" class="" id="regi_id" name="id" placeholder="아이디" required>
				<div id="id_check"></div>
          </div>
          <div class="input-block">
           <label for="pwd">PASSWORD</label><br>
					<input type="password" class="" id="regi_pwd" name="pwd" placeholder="비밀번호" required>
				<div class="" id="pwd_check"></div>
          </div>
          <div class="input-block">
            <label for="pwd2">Confirm Password</label><br>
					<input type="password" class="" id="regi_pwd2" name="regipwd2" placeholder="비밀번호 확인" required>
				<div class="" id="pwd2_check"></div>
          </div>
           <div class="input-block">
          <label for="name">NAME</label><br>
					<input type="text" class="" id="_name" name="name" placeholder="이름" required>
				<div class="" id="name_check"></div>
          </div>
           <div class="input-block">
          <label for="nickname">NICKNAME</label><br>
					<input type="text" class="" id="_nickname" name="nickname" placeholder="닉네임" required>
				<div class="" id="nickname_check"></div>
          </div>
          <div class="input-block">
          <label for="gender">GENDER</label><br>
          </div>
            	<input type="radio" id="_gender" name="gender" value="남자" checked="checked" required>&nbsp;남 
				<input type="radio" id="_gender" name="gender" value="여자" required>&nbsp;여
          <br><br>
           <div class="input-block">
           <label for="birth">BIRTHDAY</label><br>
					<input type="text" class="" id="_birth" name="birth" placeholder="ex) 19990415" required>
				<div class="" id="birth_check"></div>
          </div>
           <div class="input-block">
            	<label for="phone">PHONE NUMBER</label><br>
				<input type="text" class="" id="_phone" name="phone" placeholder="핸드폰번호 ('-' 없이 번호만 입력해주세요)" required>
				<div class="" id="phone_check"></div>
          </div>
           <div class="input-block">
              <label for="address">ADDRESS</label><br>                   
                 <input class="" placeholder="우편번호" name="address1" id="addr1" type="text" readonly="readonly" required>
                <br><button type="button" class="button-slide-yellow-login" onclick="execPostCode();">우편번호 찾기</button>                               
          </div>
           <div class="input-block">
                <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="address1" id="addr2" type="text" readonly="readonly" required />
          </div>
           <div class="input-block">
                <input class="form-control" placeholder="상세주소" name="address1" id="addr3" type="text" required />
          </div>
           <div class="input-block">
			<div class="mail_wrap">
				<label for="mail" class="mail_name">E-MAIL</label>&nbsp;&nbsp;<button type="button" class="button-slide-yellow-login" id="mail_check_button">인증번호 전송</button>
				<div class="mail_input_box">
				
				
					<input class="mail_input" name="email" id="_email">
					
					<div class="" id="email_check"></div>
				</div>
          </div>
          <div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" placeholder="인증번호를 입력해주세요" id="check_mail" disabled="disabled">
						<div id="mail_input_box_warn"></div>
					</div>
						
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
          
          
        </fieldset>
        <button type="submit" id="_btnRegi" class="btn-signup">Continue</button>
      </form>
    </div>
  </div>
</section>


<script type="text/javascript">
const switchers = [...document.querySelectorAll('.switcher')]

switchers.forEach(item => {
	item.addEventListener('click', function() {
		switchers.forEach(item => item.parentElement.classList.remove('is-active'))
		this.parentElement.classList.add('is-active')
	})
})

</script>



<script type="text/javascript">
let _id = $.cookie("_id");
if(_id != null){
	//alert("쿠키 있음");
	$("#_id").val( _id );
	$("#chk_save_id").attr("checked", "checked");	
}

$("#chk_save_id").click(function(){

	if( $("#chk_save_id").is(":checked") ){	// 첵크 되었을 때
		if( $("#_id").val().trim() == ""){
			alert("id를 입력해 주십시오");
			$("#chk_save_id").prop("checked", false);
		}
		else{
			$.cookie("_id", $("#_id").val(), { expires:356, path:'/' });
		}
	}
	else{
		//alert("쿠키 삭제");
		$.removeCookie("_id", {path:'/'});
	}	
});




$("#_btnLogin").click(function () {
	
	if($("#_id").val().trim() == ""){
		alert("id를 입력해 주십시오");
		$("#_id").focus();
	}else if($("#_pwd").val().trim() == ""){
		alert("패스워드를 입력해 주십시오");
		$("#_pwd").focus();
	}else{
		$("#_frmForm").submit();
	}

});


</script>


<script type="text/javascript">

		function onEnterLogin(){

			var keyCode = window.event.keyCode;

			

			if (keyCode == 13) { //엔테키 이면

				loginForm.submit();

			}

		} //onEnterLogin()
		
		

	</script>




<script type="text/javascript">

var code = "";                //이메일전송 인증번호 저장위한 코드

/* 주소 */
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', '+  data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("#addr1").val(data.zonecode);
           $("#addr2").val(fullRoadAddr);
           
           
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}


    
/* 정규식 */
 
//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{4})?([0-9]{4})$/;
	
	
	


	/* 아이디 유효성 검사 */
$("#regi_id").blur(function () {
	// id첵크	

	$.ajax({
		url: "getId.do",
		type:"post",
		data:{ id:$("#regi_id").val() },
		success:function( msg ){
			if(msg == 'YES'){
				$("#id_check").text("사용중인 아이디입니다");
				$("#id_check").css("color", "red");
				$("#regi_id").val("");
				
			    } else if ($("#regi_id").val().trim() == ""){
				   $('#id_check').text('아이디를 입력해주세요');
				   $('#id_check').css('color', 'red');
				   	  
			}else {	
				   if (idJ.test($("#regi_id").val())) {
				      $("#id_check").text("이 아이디는 사용할 수 있습니다 ");
				      $("#id_check").css("color", "blue");
				      $("#regi_id").val().trim();
				     
				 } else {
				      $('#id_check').text("4~12자 영문 소문자, 숫자를 사용하세요.");
				      $('#id_check').css('color', 'red');
				      		
			}
			}
		}, error:function(){
			alert('error');
		}
	});

});


//비밀번호 
	$("#regi_pwd").blur(function() {
		if (pwJ.test($(this).val())) {
				console.log(pwJ.test($(this).val()));
				$("#pwd_check").text('');
		} else {
			$('#pwd_check').text('4~12자 영문 대 소문자, 숫자를 사용하세요.');
			$('#pwd_check').css('color', 'red');
			
		}
	});
	
	$("#regi_pwd2").blur(function() {
		if ($('#regi_pwd').val() == $('#regi_pwd2').val()) {
				$("#pwd2_check").text('');
		} else {
			$('#pwd2_check').text('비밀번호가 일치하지 않습니다.');
			$('#pwd2_check').css('color', 'red');
			
		}
	});
	
	
	



/* 닉네임 유효성 검사 */
$("#_nickname").blur(function () {
	// 닉네임 첵크	

	$.ajax({
		url: "getnickname.do",
		type:"post",
		data:{ nickname:$("#_nickname").val() },
		success:function( msg ){
			if(msg == 'YES'){
				$("#nickname_check").text("사용중인 닉네임입니다");
				$("#nickname_check").css("color", "red");
				$("#_nickname").val("");
				
			       } else if ($("#_nickname").val().trim() == ""){
				      $('#nickname_check').text('닉네임을 입력해주세요');
				      $('#nickname_check').css('color', 'red');
				      	  
			}else {	
				   $("#nickname_check").text("이 닉네임은 사용할 수 있습니다 ");
				   $("#nickname_check").css("color", "blue");
				   $("#_nickname").val().trim();
				   
					
			}
		}, error:function(){
			alert('error');
		}
	});

});


	
	
	// 이름에 특수문자 들어가지 않도록 설정
	$("#_name").blur(function() {
		if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');

		    } else {
		    	 if ($("#_name").val().trim() == ""){
		            $('#name_check').text('이름을 입력해주세요');
		            $('#name_check').css('color', 'red');
		            	
		    	
		        } else {
			        $('#name_check').text('이름을 확인해주세요');
			        $('#name_check').css('color', 'red');
			        
		    }
		    }
	});
	
	// 휴대전화
	$('#_phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#phone_check").text('');
		} else {
			 if ($("#_phone").val().trim() == ""){
		            $('#phone_check').text('휴대폰번호를 입력해주세요');
		            $('#phone_check').css('color', 'red');
		            	
		    	
		        } else {
			        $('#phone_check').text('휴대폰번호를 확인해주세요');
			        $('#phone_check').css('color', 'red');
			        
		    }
		}
	});
	
	// 생일 유효성 검사
	var birthJ = false;
	
	// 생년월일	birthJ 유효성 검사
	$('#_birth').blur(function(){
		var dateStr = $(this).val();		
	    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	    var today = new Date(); // 날짜 변수 선언
	    var yearNow = today.getFullYear(); // 올해 연도 가져옴
		
	    if (dateStr.length <=8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
		    if (1900 > year || year > yearNow){
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red');
		    	
		    }else if (month < 1 || month > 12) {
		    		
		    	$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red'); 
		    
		    }else if (day < 1 || day > 31) {
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red'); 
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red'); 
		    	 
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birth_check').text('생년월일을 확인해주세요 ');
					$('#birth_check').css('color', 'red'); 
		    	
				}else{
					$('#birth_check').text('');
					birthJ = true;
				}//end of if (day>29 || (day==29 && !isleap))
		     	
		    }else{
		    	
		    	$('#birth_check').text(''); 
				birthJ = true;
			}//end of if
			
			}else {//1.입력된 생년월일이 8자 초과할때 :  auth:false
				        $('#birth_check').text('생년월일을 확인해주세요');
				        $('#birth_check').css('color', 'red');
				        
			    
			}
		}); //End of method 
		
	 // 이메일
		$("#_email").blur(function() {
			if (mailJ.test($(this).val())) {
					console.log(mailJ.test($(this).val()));
					$("#email_check").text('');

			    } else {
			    	 if ($("#_email").val().trim() == ""){
			            $('#email_check').text('이메일을 입력해주세요');
			            $('#email_check').css('color', 'red');
			            	
			    	
			        } else {
				        $('#email_check').text('이메일을 확인해주세요');
				        $('#email_check').css('color', 'red');
				        
			    }
			    }
		}); 
		

		 
		 /* 입력 이메일 형식 유효성 검사 */
		 function mailFormCheck(email){
		    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		    return form.test(email);
		}
		 

		 /* 인증번호 이메일 전송 */
		 $("#mail_check_button").click(function(){
		 	
		 	var email = $(".mail_input").val();			// 입력한 이메일
		 	var checkBox = $(".mail_check_input");		// 인증번호 입력란
		 	var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
		 	var warnMsg = $("#mail_input_box_warn");	// 이메일 입력 경고글
		 	
		 	  /* 이메일 형식 유효성 검사 */
		    if(mailFormCheck(email)){
		        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		        warnMsg.css("display", "inline-block");
		    } else {
		        warnMsg.html("올바르지 못한 이메일 형식입니다.");
		        warnMsg.css("display", "inline-block");
		        return false;
		    }  
		 	
		 	$.ajax({
		 		
		 		type:"GET",
		 		url:"mailCheck.do?email=" + email,
		 		success:function(data){
		 			
		 			//console.log("data : " + data);
		 			checkBox.attr("disabled",false);
		 			boxWrap.attr("id", "mail_check_input_box_true");
		 			code = data;
		 			
		 		}
		 				
		 	});
		 	
		 });
		 /* 인증번호 비교 */
		 $(".mail_check_input").blur(function(){
		 	
		 	var inputCode = $(".mail_check_input").val();		// 입력코드	
		 	var checkResult = $("#mail_check_input_box_warn");	// 비교 결과 	
		 	
		 	if(inputCode == code){							// 일치할 경우
		 		checkResult.html("인증번호가 일치합니다.");
		 		checkResult.attr("class", "correct");		
		 		mailnumCheck = true;
		 	} else {											// 일치하지 않을 경우
		 		checkResult.html("인증번호를 다시 확인해주세요.");
		 		checkResult.attr("class", "incorrect");
		 		mailnumCheck = false;
		 	}	
		 	
		 });
		
		
			
		// 가입하기 실행 버튼 유효성 검사!
		var inval_Arr = new Array(9).fill(false);
		
		var inputCode = $(".mail_check_input").val();		// 입력코드	
	 	var checkResult = $("#mail_check_input_box_warn");	// 비교 결과 	
	 	
	 	
		$('#_btnRegi').click(function(){
			// 비밀번호 정규식
			if (pwJ.test($('#regi_pwd').val())) {
				inval_Arr[0] = true;
				
			} else {
				inval_Arr[0] = false;
				return false;
			}
			
			// 이름 정규식
			if (nameJ.test($('#_name').val())) {
				inval_Arr[1] = true;	
			} else {
				inval_Arr[1] = false;
				return false;
			}
			// 생년월일 정규식
			if (birthJ) {
				console.log(birthJ);
				inval_Arr[2] = true;
			} else {
				inval_Arr[2] = false;
				return false;
			}
			// 이메일 정규식
			if (mailJ.test($('#_email').val())){
				inval_Arr[3] = true;
			} else {
				inval_Arr[3] = false;
				return false;
			} 
			// 휴대폰번호 정규식
			if (phoneJ.test($('#_phone').val())) {
				console.log(phoneJ.test($('#_phone').val()));
				inval_Arr[4] = true;
			} else {
				inval_Arr[4] = false;
				return false;
			}
			//주소
			 if ($("#addr1").val().trim() == ""){
				 inval_Arr[5] = false;
				 return false;
		        } else {
		         inval_Arr[5] = true;
		    }
			//닉네임
			 if ($("#_nickname").val().trim() == ""){
				 inval_Arr[6] = false;
				 return false;
		        } else {
		         inval_Arr[6] = true;
		    }
			//인증번호
			 if ($("#check_mail").val() == ""){
				 inval_Arr[7] = false;
				 return false;
		        } else {
		         inval_Arr[7] = true;
		    }
			//인증번호
	          if (inputCode != code){ 
	             inval_Arr[8] = false;
	             return false;   
	              } else {
	               inval_Arr[8] = true;
	          }
			
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				
				if(inval_Arr[i] == false){
					validAll = false;
					return false;
				}
			}
		
			
			if(validAll){ // 유효성 모두 통과

				alert('회원가입에 성공하셨습니다!');
				
			} else {
				alert('입력한 정보들을 다시 한번 확인해주세요')
				
			}
			
		});
		
		

</script>






</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script  src="https://code.jquery.com/jquery-3.1.1.min.js"  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="  crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="css/style_find.css" rel="stylesheet" />	


	<style type="text/css">
		.site-link{
      padding: 5px 15px;
			position: fixed;
			z-index: 99999;
			background: #fff;
			box-shadow: 0 0 4px rgba(0,0,0,.14), 0 4px 8px rgba(0,0,0,.28);
			right: 30px;
			bottom: 30px;
			border-radius: 10px;
		}
		.site-link img{
			width: 30px;
			height: 30px;
		}
	</style>
</head>
<body>


<div class="body">
		<div class="veen">
			<div class="login-btn splits">
				<button class="active">find ID</button>
			</div>
			<div class="rgstr-btn splits">
				<button>forget password?</button>
			</div>
			<div class="wrapper">
			<h5 onclick="location.href='home.do'"><img src="image/icon.png" alt="..." width="100" height="130"/></h5>
				<form id="login" tabindex="500" method="post" action="findidAf.do" name="frmForm" id="_frmForm">
					<h3>아이디 찾기</h3>
							<div class="name">
						  <input type="text" id="_name" name="name" placeholder="NAME" required="required"/>
                          <label></label>
					</div>
					<div class="phone">
						<input type="text" id="_phone" name="phone" placeholder="PHONE NUMBER" required="required"/>
                       <label></label>
					</div>
					<div class="email">
						<input type="text" id="_email" name="email" placeholder="EMAIL" required="required"/>
                      <label></label>
					</div>
					
  <!-- 이름과 전화번호가 일치하지 않을 때-->
      <c:if test="${check == 1}">
         <script>
             opener.document.frmForm.name.value = "";
             opener.document.frmForm.phone.value = "";
            opener.document.frmForm.email.value = "";
         </script>
         <h5>일치하는 정보가 존재하지 않습니다.</h5>

         </c:if>
         

      <!-- 이름과 비밀번호가 일치할 때 -->
      <c:if test="${check == 0 }">
      <h5> 찾으시는 아이디는 ' ${ id }' 입니다.</h5>   
      </c:if>
					
					<br>
					<div class="submit">
						<button class="dark">아이디 찾기</button>
				    </div>
				    <div class="submit">
						<button class="dark" type="button" id="_btnlogin" title="BACK">BACK</button>
					</div>

					
				</form>
				
				
				<form id="register" tabindex="502">
					<h3>임시 비밀번호 발급</h3>
					<div class="id">
						<input type="text" id="id" name="id" placeholder="ID" required="required"/>
			            <label for="id"></label>
					</div>
					<div class="name">
						<input type="text" id="name" name="name" placeholder="NAME" required="required"/>
			            <label for="name"></label>
					</div>
					<div class="mail">
						<input type="text" id="email" name="email" placeholder="EMAIL" required="required"/>
			            <label for="email"></label>
					</div>
					<br><br>
					<div class="submit" value="check" id="check" name="check">
						<button class="dark">비밀번호 발급</button>
					</div>
					<div class="submit">
						<button class="dark" type="button" id="_btnlogin2" title="BACK">BACK</button>
					</div>
				</form>
			</div>
		</div>	
	</div>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			$(".veen .rgstr-btn button").click(function(){
				$('.veen .wrapper').addClass('move');
				$('.body').css('background','#2bb673');
				$(".veen .login-btn button").removeClass('active');
				$(this).addClass('active');

			});
			$(".veen .login-btn button").click(function(){
				$('.veen .wrapper').removeClass('move');
				$('.body').css('background','#ffd700');
				$(".veen .rgstr-btn button").removeClass('active');
				$(this).addClass('active');
			});
		});
	
	$("#_btnlogin").click(function () {
		   location.href = "login.do";
		});
	$("#_btnlogin2").click(function () {
		   location.href = "login.do";
		});
	
	$(function(){
		$("#check").click(function(){
			$.ajax({
				url : "findpw.do",
				type : "POST",
				data : {
					id : $("#id").val(),
					name : $("#name").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
				error : function (error) {
					alert(error);
				}
			})
		});
	})

	</script>


</body>
</html>
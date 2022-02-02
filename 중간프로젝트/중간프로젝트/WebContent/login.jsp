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
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
}

@media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
}

button.w-100{
	width: 300px;
/* 	background-color: #8878CD;
	border-color: white; */
}

main.form-group{
	text-align : center;
	width: 50%;
	border: 1px solid;
	padding: 50px;
}

input#chk_save_id{
	margin-top: 20px;
}
</style>

    
    <!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
</head>
<body class="text-center">
<div class="d-flex justify-content-center align-items-center container ">          
<main class="form-group">
  <form action="loginAf.jsp" method="post">
    <img class="mb-4" src="image/logo1.png" alt="" width="120" height="120">
    
    <h1 class="h3 mb-3 fw-normal"><b>Running Mate</b></h1>
	  <label for="inputId" class="visually-hidden"></label>
      <input type="text" id="id" name="id" class="form-control" placeholder="User ID" required autofocus> 
    
      <label for="inputPassword" class="visually-hidden"></label> 
      <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" required> 
    
      <div class="checkbox mb-3"> 
      <label> 
      <input type="checkbox" id="chk_save_id" value="rememberID">아이디 저장</label> 
      </div> 
      
      <div class ="caption">
		<!-- <a href="">비밀번호 찾기</a>&nbsp;/&nbsp; --><a href="regi.jsp">회원 가입</a>
	  </div>
	  <br>
      <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>

  </form>
</main>
</div>
<script>
	let id = $('#id');
	let pw = $('#pwd');
	let btn = $('#btn');

	$(btn).on('click', fuction() {
	if($(id).val() == ""); {
		$(id).next('label').addClass('warning');
	setTimeout(function()){
		$('label').removeClass('warning');
	},1500);
	}
	else if($(pw).val() == ""); {
		$(pw).next('label').addClass('warning');
		setTimeout(function()){
			$('label').removeClass('warning');
		},1500);
	}
	});
	
	</script>
	

	<script type="text/javascript">
	let user_id = $.cookie("user_id");
	if(user_id != null){
		$("#id").val(user_id);
		$("#chk_save_id").prop("checked", true);
	}

	$("#chk_save_id").click(function () {


		if( $("#chk_save_id").is(":checked") ){	
			if( $("#id").val().trim() == "" ){
				alert('id를 입력해 주십시오');
				$("#chk_save_id").prop("checked", false);
			}else{
				
				$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'/' });
			}
		}
		else{
			$.removeCookie("user_id", { path:'/' });
		}	
	});

	function account() {
		location.href = "regi.jsp";
	}


	</script>



    
  </body>
</html>
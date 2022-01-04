<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="nows" class="java.util.Date" />
<!-- useBean : object 생성 -->

<%-- <div>
	<div id="top_menu">
		<ul class="navi">
			<li><a href="login.do" title="로그인">로그인</a></li>
			<li><a href="regi.do" title="회원가입">회원가입</a></li>	
			<li><a href="mypage_main.do" title="마이페이지">마이페이지</a></li>	
			<li><a href="logout.do" title="로그아웃">로그아웃</a></li>	
		</ul>		
	</div>
</div> 



<c:if test="${login.nickname != '' }">
      [${login.nickname}]님 환영합니다
</c:if> --%>

<style type="text/css"> 
a { text-decoration:none; } 

</style> 


 <head>
  	<title>Website menu 07</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body>
	
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"></h2>
				</div>
			</div>
		</div>
		
		<div class="container-fluid px-md-5">
			<div class="row justify-content-between">
				<div class="col-md-8 order-md-last">
					<div class="row">
						<div class="col-md-6 text-center">
							<a class="navbar-brand" href="home.do"><img src=image/yourlogo.png style="height: 50%; width: 50%;" class="yourlogo"><span></span></a>
							<h3 style="font-family: 'Old Standard TT', serif; color: #2BB673;"><!-- Your Own Unique Recipe --></h3>
						</div>
						<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
							<form action="#" class="searchform order-lg-last">
			          <div class="form-group d-flex">
			          
			          <!--  <a href="login.do" title="로그인" style="text-decoration:none; color: #2BB673;" class="d-flex align-items-center justify-content-center"> login</a> -->
			          <c:if test="${login.nickname == null }">
						     <a href="login.do" title="로그인" style="text-decoration:none; color: #2BB673;" class="d-flex align-items-center justify-content-center"> LOGIN</a>&nbsp;/&nbsp;
							   <a href="login.do" style="text-decoration:none; color: #FFE400;" class="d-flex align-items-center justify-content-center"> SIGN UP </a>
						</c:if>
			           <c:if test="${login.nickname != null }">
						        <a href="logout.do" title="로그인" style="text-decoration:none; color: #FFE400;" class="d-flex align-items-center justify-content-center"> LOGOUT</a> &nbsp;&nbsp;&nbsp;
							   <a href="order.do" style="text-decoration:none; color: #2BB673;" class="d-flex align-items-center justify-content-center">MYPAGE</a>
						</c:if>
						
			          </div>
			        </form>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex">
					<div class="social-media">
		    		<p class="mb-0 d-flex">
		    			<!-- <a href="regi.do" style="text-decoration:none; font-family: 'Old Standard TT', serif; color: #2BB673; font-size: 16px;" class="d-flex align-items-center justify-content-center">회원가입</a>
		    			<a href="mypage_main.do" style="text-decoration:none; font-family: 'Old Standard TT', serif; color: #2BB673; font-size: 16px;" class="d-flex align-items-center justify-content-center">마이페이지</a> -->
		    			<!-- <a href="#" class="d-flex align-items-center justify-content-center">고객센터</a> -->
		    			<!-- <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a> -->
		    		</p>
	        </div>
				</div>
			</div>
		</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
<link rel="stylesheet" type="text/css" href="./css/nav.css">

<body class="navmenu">
<div>
    <nav class="navmenu">
        <ul>
            <li style="margin-left: 535px;"><a href="recipe.do">유저 레시피</a>
            <ul>
                <li><a href="recipe.do?search=한식&choice=reccategory">🍲한식</a></li>
                <li><a href="recipe.do?search=양식&choice=reccategory">🍕양식</a></li>
                <li><a href=" =일식&choice=reccategory">🍣일식</a></li>
                <li><a href="recipe.do?search=중식&choice=reccategory">🍜중식</a></li>
                <li><a href="recipe.do?search=베이커리&choice=reccategory">🍰베이커리</a></li>
                
            </ul>        
            </li>
            <li><a href="cclist.do">쿠킹 클래스</a>
            <ul>
                <li><a href="ccwrite.do">클래스 생성</a></li>
                <li><a href="calist.do">수업일정</a></li>
               
            </ul>
            </li>
            <li><a href="marketmain.do">마켓 페이지</a></li>
			<li><a href="marketmain.do">고객센터</a></li>
        </ul>
    </nav></div>  
    </body>
-->
<head>
<style>
*{
font-family : 'Cafe24SsurroundAir';
}
</style>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
    <link rel="icon" href="mainimg/favicon.png">
    <!-- Bootstrap CSS -->    
    <link rel="stylesheet" href="main_css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="main_css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="main_css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="main_css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="main_css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="main_css/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="main_css/magnific-popup.css">
    <link rel="stylesheet" href="main_css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="main_css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="main_css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="main_css/style.css">
</head>
   <!--::header part start::-->
   <header class="main_menu">
<!--      <div class="sub_menu">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_right_content">
                            <span>Top destinations</span>
                            <a href="#">Asia</a>
                            <a href="#">Europe</a>
                            <a href="#">America</a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_social_icon">
                            <a href="#"><i class="flaticon-facebook"></i></a>
                            <a href="#"><i class="flaticon-twitter"></i></a>
                            <a href="#"><i class="flaticon-skype"></i></a>
                            <a href="#"><i class="flaticon-instagram"></i></a>
                            <span><i class="flaticon-phone-call"></i>+880 356 257 142</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>  -->
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="home.do"> <img src="image/your.png" alt="logo"> </a>
<!--                             <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button> -->

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                   
                                   <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="recipe.do" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Recipe
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                       	    <a class="dropdown-item" href="recipe.do">레시피</a>
											<a class="dropdown-item" href="recipewrite.do">레시피 작성</a>
                                        </div>
                                    </li>
                                    
                                    <li class="nav-item">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </li>
                                    
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="cclist.do" id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            쿠킹클래스
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="cclist.do">쿠킹클래스</a>
                                            <a class="dropdown-item" href="ccwrite.do">클래스 생성</a>
                                            <a class="dropdown-item" href="calist.do">일정보기</a>
                                        </div>
                                    </li>
                                    
                                    <li class="nav-item">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </li>
                                    
                                    <li class="nav-item">
                                        <a class="nav-link" href="marketmain.do">마켓페이지</a>
                                    </li>
                                    
                                    <li class="nav-item">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </li>
                                    
                                     <li class="nav-item">
                                        <a class="nav-link" href="cslist.do">고객센터</a>
                                    </li>
                                    
                                    
                                    <li class="nav-item">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </li>
                                    
                                     <li class="nav-item">
                                        <a class="nav-link" href="foodcup.do">푸드컵</a>
                                    </li>
                                </ul>
                            </div>
                         <!--  <a href="#" class="btn_1 d-none d-lg-block">book now</a>  --> 
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->
	  
	  
	  
	      <!-- jquery plugins here-->
    <script src="main_css/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="main_css/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="main_css/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="main_css/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="main_css/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="main_css/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="main_css/jquery.nice-select.min.js"></script>
    <script src="main_css/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="main_css/jquery.ajaxchimp.min.js"></script>
    <script src="main_css/jquery.form.js"></script>
    <script src="main_css/jquery.validate.min.js"></script>
    <script src="main_css/mail-script.js"></script>
    <script src="main_css/contact.js"></script>
    <!-- custom js -->
    <script src="main_css/custom.js"></script>
	  
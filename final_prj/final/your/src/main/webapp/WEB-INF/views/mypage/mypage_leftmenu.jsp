<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link href="css/style_sidebar.css" rel="stylesheet" />
</head>
<body>


<aside>
  <p> Menu </p>
  <a href="order.do">
    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
    주문목록
  </a>
  <a href="myrecipe.do">
    <i class="fa fa-smile-o" aria-hidden="true"></i>
    나의 레시피
  </a>
  <a href="like_recipe.do">
    <i class="fa fa-heart " aria-hidden="true"></i>
    찜한 레시피
  </a>
  <a href="mycc.do">
    <i class="fa fa-thumbs-up" aria-hidden="true"></i>
    나의 클래스
  </a>
  <a href="managing_cc.do">
    <i class="fa fa-users " aria-hidden="true"></i>
    운영중인 클래스
  </a>
    <a href="info.do">
    <i class="fa fa-address-card" aria-hidden="true"></i>
    회원정보조회
  </a>
    <a href="info_del.do">
    <i class="fa fa-sign-out" aria-hidden="true"></i>
    탈퇴하기
  </a>
  
</aside>

</body>
</html>
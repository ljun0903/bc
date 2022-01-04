<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./dist/css/index.css">
    <link rel="stylesheet" type="text/css" href="./dist/css/tree.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<div style=" width: 1400px; height: 800px; margin-left: auto; margin-right: auto; margin-bottom: 150px; margin-top: 50px;">
	<div id="header">
      <div id=title align="center"><img id="logo">푸드컵</div><br>
      <div id=inputArea>
        <button class="btn_rollover" id="history" >히스토리보기</button>
        <select id="roundSelect">
          <option value="" selected disabled>라운드 선택</option>
          </select>
          <button class="btn_rollover" id="start">시작</button>
          <button class="btn_rollover" id="back" >뒤로가기</button>
      </div>
    </div>

    <div id="roundInfo"></div>
      <div class="wrapper">
        <div class="content" id="left">
          <img id="leftImg" src="">
          <span class=c1 id="leftObj"></span>
        </div>
        <img id="centerImg" src=""> 
        <div class="content" id="right">
            <img id="rightImg" src="" >
            <span class=c1 id="rightObj"></span>
        </div>
      </div>
            
      <div id="openModal" class="modalDialog">
          <div>	<a title="Close" class="close">X</a>
            <div class="bracket">
                <div class="bracket-left"></div>
                <div class="bracket-center" id="winner"></div>
                <div class="bracket-right"></div>
              </div>
          </div>
      </div>
      </div>
    <div class="blockUI blockOverlay">
    </div>
    <script src="./dist/bundle.js"></script>
</body>
</html>

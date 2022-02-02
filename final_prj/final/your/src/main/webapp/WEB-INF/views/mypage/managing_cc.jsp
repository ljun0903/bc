<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<title>운영중인 쿠킹클래스</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <link href="css/style_card2.css" rel="stylesheet" />

</head>
<body>
<br><br>
<h1 style="font-size: xx-large; font-weight: bold; text-align: left; margin-left: 300px";>운영중인 클래스</h1>
  <c:if test="${empty mycclist}"><h3 style="margin-left: auto;margin-right: auto;">운영중인 레시피가 없습니다.<img alt="" src="image/swet.png" style="left: 50%"></h3>
               		</c:if>
<div class="support-grid"></div>
    
  <div class="band">
  
    
         
    <div class="item-1">
      
  <c:forEach items="${mycclist}" var="mycc" varStatus="i" >
         <div class="card mb-3" style="max-width: 1000px">
  <div class="row g-0">
    <div class="col-md-5">
      <a onclick="location.href='ccdetail.do?seq=${mycc.seq}'" ><img src="upload/${mycc.newfilename}" alt="..." width="400" height="200"  /></a>
    </div>
    <div class="col-md-6">
      <div class="card-body">
        
                
                   <h1>${mycc.title}</h1> 
                   <br><br>
        <p class="card-text">${mycc.location}</p>
        <p class="card-text">신청인원 : (${mycc.membercount}/${mycc.membernum})</p>
        <p class="card-text">강의기간 : ${mycc.cdate1.substring(5, 10)}~${mycc.cdate2.substring(5, 10)}</p>
        <p class="card-text">강의요일 : ${mycc.cday}</p>
      </div>
    </div>
  </div>
</div>
</c:forEach>
    </div>
     
</div>
  
      
	</body>	  
	                     
	</html>
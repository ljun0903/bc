<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠킹클래스</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link href="css/style_card.css" rel="stylesheet" />
</head>
<body>
        <br><br>
        <h1 style="font-size: xx-large; font-weight: bold; text-align: left; margin-left: 300px";>나의 클래스</h1>
  <c:if test="${empty myclass}"><h3 style="margin-left: auto;margin-right: auto;">참가하는 클래스가 없습니다.<img alt="" src="image/swet.png" style="left: 50%"></h3>
               		</c:if>
<div class="support-grid"></div>
    
  <div class="band">
  
      <c:forEach items="${myclass}" var="myclass" varStatus="i" >
         
    <div class="item-4">

          <a onclick="location.href='ccdetail.do?seq=${myclass.SEQ}'" class="card"><img class="card-img-top" src="upload/${myclass.NEWFILENAME}" alt="..." width="300" height="200"  />
           <div class="thumb" style="background-image: url(ccdetail.do?seq=${myclass.SEQ});"></div>
            <article>
            
   
            
                 <c:choose>
                  <c:when test="${myclass.TITLE.length() > 8}">
                   <h1>${myclass.TITLE.substring(0, 8)}...</h1>
                   </c:when> 
                   <c:otherwise>
                   <h1>${myclass.TITLE}</h1> 
                   </c:otherwise> 
               </c:choose>
                                   
              <span>클래스 선생님 : ${myclass.NICKNAME}</span>
              <span>장소 : ${myclass.LOCATION}</span>
           

             
            </article>
          </a>

    </div>
     </c:forEach>
</div>
         
		        




</body>
</html>
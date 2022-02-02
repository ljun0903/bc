<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html> 
<html>   
<head>  
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link href="css/style_card.css" rel="stylesheet" />
</head>
<body>
<br><br>
<h1 style="font-size: xx-large; font-weight: bold; text-align: left; margin-left: 300px";>나의 레시피</h1>
  <c:if test="${empty myrecipelist}"><h3 style="margin-left: auto;margin-right: auto;">작성한 레시피가 없습니다.<img alt="" src="image/swet.png" style="left: 50%"></h3>
               		</c:if>
<div class="support-grid"></div>
    
  <div class="band">
  
     <c:forEach var="myrecipe" items="${myrecipelist}" varStatus="i" >
         
    <div class="item-2">

          <a onclick="location.href='redetail.do?seq=${myrecipe.seq}'" class="card"><img class="card-img-top" src="upload/${myrecipe.newbestimg}" alt="..." width="300" height="200"  />
           <div class="thumb" style="background-image: url(redetail.do?seq=${myrecipe.seq});"></div>
            <article>
            
   
            
                 <c:choose>
                  <c:when test="${myrecipe.recipetitle.length() > 8}">
                   <h1>${myrecipe.recipetitle.substring(0, 8)}...</h1>
                   </c:when> 
                   <c:otherwise>
                   <h1>${myrecipe.recipetitle}</h1> 
                   </c:otherwise> 
               </c:choose>
                                   
              <span>카테고리🍳 : ${myrecipe.reccategory}</span>
              <span>조리시간⏳ : ${myrecipe.rectime}</span>
              <span>조리레벨🧐 : ${myrecipe.reclevel}</span>
              <span>몇인분?😋 : ${myrecipe.recperson}</span>
              <span>좋아요💚 : ${myrecipe.liked}</span>
             
            </article>
          </a>

    </div>
     </c:forEach>
</div>
         

	</body>	  
	                     
	</html>
		        

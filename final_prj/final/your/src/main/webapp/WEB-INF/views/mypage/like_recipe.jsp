<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 레시피</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link href="css/style_card.css" rel="stylesheet" />
</head>
<body>
<br><br>
<h1 style="font-size: xx-large; font-weight: bold; text-align: left; margin-left: 300px";>찜한 레시피</h1>
  <c:if test="${empty likerecipe}"><h3 style="margin-left: auto;margin-right: auto;">찜한레시피가 없습니다.<img alt="" src="image/swet.png" style="left: 50%"></h3>
               		</c:if>
<div class="support-grid"></div>
    
  <div class="band">

      <c:forEach items="${likerecipe}" var="like" varStatus="i" >
         
    <div class="item-2">

          <a  onclick="location.href='redetail.do?seq=${like.SEQ_RECIPE}'"><img class="card-img-top" src="upload/${like.NEWBESTIMG}" alt="..." width="300" height="200" />
           <div class="thumb" style="background-image: url(redetail.do?seq=${like.SEQ_RECIPE});"></div>
            <article>
            
<br>   
            
                 <c:choose>
                  <c:when test="${like.RECIPETITLE.length() > 8}">
                   <h1 style="font-size: 30px">${like.RECIPETITLE.substring(0, 8)}...</h1>
                   </c:when> 
                   <c:otherwise>
                   <h1 style="font-size: 30px">${like.RECIPETITLE}</h1> 
                   </c:otherwise> 
               </c:choose>
                           <br>        
              <span>카테고리🍳 : ${like.RECCATEGORY}</span><br>
              <span>조리시간⏳ : ${like.RECTIME}</span><br>
              <span>조리레벨🧐 : ${like.RECLEVEL}</span><br>
              <span>몇인분?😋 : ${like.RECPERSON}</span><br>

             
            </article>
          </a>

    </div>
     </c:forEach>
</div>
         
        
		        

</body>
</html>
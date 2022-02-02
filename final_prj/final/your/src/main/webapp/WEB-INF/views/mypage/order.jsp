<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>  
<c:set var="rv" value="${rvlist}"/>

<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderPage</title>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Cart</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="css/10-12.css" />
	<link href="css/styles_order.css" rel="stylesheet" /> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

 <br><br>
        <h1 style="font-size: xx-large; font-weight: bold; text-align: left; margin-left: 300px";>주문목록</h1>
  <c:if test="${empty orderList}"><h3 style="margin-left: auto;margin-right: auto;">주문하신 제품이 없습니다.<img alt="" src="image/swet.png" style="left: 50%"></h3>
               		</c:if>
<br><br>
    
<table class="table" style="margin-left: 300px; width: 1200px" >
  <thead>
    <tr>
      <th scope="col">주문번호</th>
      <th scope="col">상품 사진</th>
      <th scope="col">상품명</th>
      <th scope="col">수량</th>
      <th scope="col">가격</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="list" items="${orderList}" varStatus="i" >
    <tr>
      <th scope="row">${list.ordernum}</th>
      <td><img src="./marketimage/${list.mainpt}" width="60" onclick="location.href='marketdetail2.do?itemnum=${list.itemnum}'"></td>
      <td onclick="location.href='marketdetail2.do?itemnum=${list.itemnum}'">${list.title}</td>
      <td>${list.count}개</td>
      <td>
      	<fmt:formatNumber value="${list.price * list.count}" pattern="#,###,###" />원
      	<br><a style="color: gray;">개당가격 : <fmt:formatNumber value="${list.price}" pattern="#,###,###" />원</a>
      	<br><a style="color: gray;">구매일 : ${list.pdate.substring(0,10)}</a>
      </td>
      <c:choose>
      <%-- <c:when test="${fn:contains(cm, cclist.title) eq true and fn:contains(cm, cclist.content) eq true}"> --%>
      	<c:when test="${fn:contains(rv, list.itemnum) eq true and fn:contains(rv, list.ordernum)}">
      		<td><input type="button" class="button-slide" value="리뷰작성완료"></td>
      	</c:when>
      	<c:otherwise>
      		<td><input type="button" class="button-slide-yellow" value="리뷰작성" onclick="location.href='writeReview.do?itemnum=${list.itemnum}&ordernum=${list.ordernum}'"></td>
      	</c:otherwise>
      </c:choose>	
    </tr>
  </c:forEach>  
  </tbody>
</table>
</body>
</html>

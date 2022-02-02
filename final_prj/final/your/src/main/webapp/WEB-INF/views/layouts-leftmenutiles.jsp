<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <% request.setCharacterEncoding("utf-8"); %> --%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />	<!-- time, encoding -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/goTop.css">
<link rel="stylesheet" type="text/css" href="./css/banner.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">

</head>
<body>
<tiles:insertAttribute name="header" />	

 <div id="body_wrap">
	<div id="main_wrap">
		<tiles:insertAttribute name="top_info" />
		<tiles:insertAttribute name="top_menu"  />
	</div>

	
	<div id="middle_wrap">
		<div id="sidebar_wrap" >
			<tiles:insertAttribute name="left_menu" />
			
		</div>
		
	<!-- style="width: 80%;" -->
		<div id="content_wrap" >
			<tiles:insertAttribute name="main" />
			<a class="goTop" href="#" ><img src="./image/up2.png" style="width: 200px;height: 200px"></a>
		</div>		
	</div>

	
	<div id="footer_wrap">
		<tiles:insertAttribute name="footer" />
	</div>	 
	
</div>

<script type="text/javascript">
$(document).ready(function () {
	$("#content_title_wrap div.title").css("background-color", "url('./image/ico_sub_sb.gif')");	
});

$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($(".banner").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$(".banner").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

});
</script>
</body>
</html>


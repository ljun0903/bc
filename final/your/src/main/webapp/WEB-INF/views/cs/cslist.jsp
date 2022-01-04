<%@page import="bit.your.prj.util.CsArrow"%>
<%@page import="bit.your.prj.dto.CsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cslist.css"/>
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<link href="css/styles.css" rel="stylesheet" />


<jsp:useBean id="uc" class="bit.your.prj.util.CsArrow"/>


<!-- ////////////////////////////////////////////////////////////////////// -->
<div class="write" align="center" >
<h1>고객센터</h1>
<br>
<table class="writetable"  id="_list_table"><!-- style="width: 85%;" -->
 <colgroup>
	<col style="width: 50px">
	<col style="width: 300px">
	<col style="width: 50px">
	<col style="width: 50px">
	<col style="width: 50px">
</colgroup> 
<tr>
	<th colspan="2">글종류</th><th colspan="2">제목</th><th colspan="2">조회수</th><th colspan="2">작성자</th><th>작성일</th>
</tr>

<c:if test="${empty csbbslist}">
<tr>
	<td colspan="2">작성된 글이 없습니다</td>
</tr>
</c:if>


<c:forEach items="${csbbslist}" var="cs">
<c:if test="${cs.type == 1}">	
<tr>
	<td colspan="2" style="text-align: center;"><strong>⚠️공지사항️</strong></td>
	<td colspan="2" style="text-align: center;">
	<strong><a href="csdetail.do?seq=${cs.seq}">${cs.title}</a>️</strong>
	</td>
	<td colspan="2" style="text-align: center;">${cs.readcount}</td>
	<td colspan="2" style="text-align: center;">관리자</td>
	<td colspan="2" style="text-align: center;">${cs.rdate.substring(2,11)}</td>
</tr>
</c:if>
</c:forEach>

<c:forEach items="${csbbslist}" var="cs" varStatus="i">
<c:if test="${cs.type == 0}">	
<jsp:setProperty property="depth" name="uc" value="${cs.depth}"/>
<tr>
			<td colspan="2" style="text-align: center;">
			<c:choose>
				<c:when test="${cs.step == 0 }">
				질문글
				</c:when>
				<c:otherwise>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue">ㄴ답변</span>
				
				</c:otherwise>
				</c:choose>
			</td>
	
	<td style="text-align: center;" colspan="2">
		<c:if test="${cs.del eq 0}">
			<jsp:getProperty property="arrow" name="uc" />	<!-- arrow이미지 -->	
				
			<!-- <c:if test="${cs.id eq login.id}">		
			<a href="csdetail.do?seq=${cs.seq}">
				🔒${cs.title}
			</a>
			</c:if>
			
			
			<%-- <c:choose>
				<c:when test="${cs.id eq login.id}">
					<a href="csdetail.do?seq=${cs.seq}">🔒${cs.title}</a>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${login.auth eq 1 || cs.userid eq login.id}">
							<a href="csdetail.do?seq=${cs.seq}">🔒${cs.title}</a> 
						</c:when>
						<c:otherwise>
							<a href="javascript:secret();">🔒${cs.title}</a> 
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>		 --%>
			
			<!--  -->
			<c:choose>	
				<c:when test="${cs.id eq login.id }">
					<a href="csdetail.do?seq=${cs.seq}">🔒${cs.title}</a>
				</c:when>
				
				<c:when test="${login.auth eq 1}">
					<a href="csdetail.do?seq=${cs.seq}">🔒${cs.title}</a> 
				</c:when>
						
				<c:when test="${cs.userid eq login.id}">
					<a href="csdetail.do?seq=${cs.seq}">🔒${cs.title}</a> 
				</c:when>
						
				<c:otherwise>
					<a href="javascript:secret();">🔒${cs.title}</a> 
				</c:otherwise>
			</c:choose>
			
			
		</c:if>
		<c:if test="${cs.del == 1}">
			<font color="red">고객요청으로 글이 삭제되었습니다</font>
		</c:if>
	</td>
	<td colspan="2" style="text-align: center;">${cs.readcount}</td>
	<td colspan="2" style="text-align: center;">${cs.id}</td>
	<td colspan="2" style="text-align: center;">${cs.rdate.substring(2,11)}</td>
	
	
	
</tr>
</c:if>
</c:forEach>



<tr>
	<td colspan="10"  style="text-align: right;" >
		<c:choose>	
				<c:when test="${login.id != null }">
					<!-- <a href="cswrite.do" title="글쓰기">글쓰기</a>
					<button type="button" id="writecs" >글쓰기</button> -->
					<button class="button-slide" type="button" id="writecs" style="width: 6% ">글쓰기</button>
				</c:when>
		</c:choose>
	</td>
</tr>
</table> 
</div>


<br><br>
<!-- style="float:center" margin-left: auto; margin-right: auto;  --><!-- 
        	<div style="text-align:center; margin-left: auto; margin-right: auto" >
        		<select id="_choice" name="choice" class="justselect" >
					<option value="" selected="selected">선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="nickname">작성자</option>
				</select>
				<input type="text" id="_search" name="search" style="border-radius: 12px; size: 20;">
				<button class="button-slide" type="button" id="btnSearch" >Search</button>
			</div> -->
			
			
			<div class="box_border" style="margin-top: 5px;margin-bottom: 10px">
				<table style="margin-left: auto;margin-right: auto; margin-top: 3px; margin-bottom: 3px">
					<tr>
						<td></td>
						<td style="text-align: center;">
						<select id="_choice" name="choice" class="justselect" >
							<option value="" selected="selected">선택</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="nickname">작성자</option>
						</select>	
						</td>
						<td style="padding-left: 5px">
							<input type="text" id="_search" name="search" style="border-radius: 12px; size: 20;">
							<button class="button-slide" type="button" id="btnSearch" >Search</button>						
						</td>
					</tr>			
				</table>			
			</div>
<br><br>



<!-- pagination -->
<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination" style="justify-content:center; "></ul>
	</nav>
</div>




<script type="text/javascript">
var search = "${search}";
var choice = "${choice}";

$(document).ready(function () {
	if(search != ""){
		$("#_choice").val( choice );
		
		document.getElementById("_search").value = search;
	}	
});
</script>

<script>
let totalCount = ${totalCount};	// 서버로부터 총글의 수를 취득
// alert(count);
let nowPage = ${pageNumber};	// 서버로부터 현재 페이지를 취득
// alert(pageNum);

let pageSize = 20;

let _totalPages = totalCount / pageSize;
if(totalCount % pageSize > 0){
	_totalPages++;
}

//$("#pagination").twbsPagination('destroy');	// 페이지 갱신 : 페이징을 갱신해 줘야 번호가 재설정된다.

$("#pagination").twbsPagination({
	startPage: nowPage,
	totalPages: _totalPages,
	visiblePages: 10,
	first:'<span sria-hidden="true">«</span>',
	prev:"이전",
	next:"다음",
	last:'<span sria-hidden="true">»</span>',
	initiateStartPageClick:false,		// onPageClick 자동 실행되지 않도록 한다
	onPageClick:function(event, page){
		location.href = "cslist.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val() + "&pageNumber=" + (page - 1);	
	}
});	

$("#btnSearch").click(function () {
	location.href = "cslist.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val();	
});

$("#writecs").click(function () {
	location.href = "cswrite.do";	
});

function secret(){
	alert("작성자만 확인 가능합니다.");
}

$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();


</script>





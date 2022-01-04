<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<head>
<style>
td{
 padding: 100px;
},
th{
 padding:  100px;
}
</style>
</head>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cslist.css"/>

<form name="frmForm" id="_frmForm" method="get" action="csupdate.do">
<input type="hidden" name="seq" value="${cs.seq}"/>


<div class="write" align="center">
<table class="writeTable"  style="margin-left:auto; margin-right:auto;" >

<colgroup>
<col style="width:100px;" />
<col style="width:500px;" />
</colgroup>

	<tr class="id">
		<th colspan="1" style="text-align: center">작성자</th>
		<td align="left" style="background-color: #FFF; padding: 10px; border-radius: 100px;"  >
		${cs.id}
		</td>
	</tr>
	
	<tr>
	<td>
	</td>
	</tr>
	
	<tr>
		<th colspan="1" style="text-align: center">작성일</th>
		<td  align="left" style="background-color: #FFF; padding: 10px; border-radius: 1000px;"  >
		${cs.rdate.substring(0,11)}
		</td>
	</tr>
	
	<tr>
	<td>
	</td>
	</tr>
	
	<tr>
		<th colspan="1" style="text-align: center">조회수</th>
		<td  align="left" style="background-color: #FFF; padding: 10px; border-radius: 1000px;"  >
		${cs.readcount}
		</td>
	</tr>
	
	<tr>
	<td>
	</td>
	</tr>
	
	<tr>
		<th colspan="1" style="text-align: center">제목</th>
		<td  align="left" style="background-color: #FFF; padding: 10px; border-radius: 1000px;"  >
		${cs.title}
		</td>
	</tr>
	
	<tr>
	<td>
	</td>
	</tr>
	
	<tr>
		<th colspan="1" style="text-align: center">내용</th>		
		<td align="left" style="background-color: #FFF; padding: 10px; border-radius: 15px; height: auto;"   >
       		${cs.content}<br><br><br><br><br><br>
		</td>
	</tr>
	
	<tr>
	<td>
	</td>
	</tr>
	
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<c:if test="${cs.id eq login.id}">
			<button type="button" class="button-slide" onclick="location.href='cslist.do'" >글목록</button>
			<button type="button" class="button-slide-blue" id="_btnUpdate" title="글수정">글수정</button>
			<button type="button" class="button-slide-red" id="_btnDel" title="삭제">글삭제</button>
			</c:if>

			 <c:if test="${login.auth eq 1}">
			 <button type="button" class="button-slide" onclick="location.href='answer.do?id=${cs.id}&seq=${cs.seq}'" >답글달기</button>			 
			 </c:if>
		</span>
		</td>
	</tr>
</table>
</div>

</form>


<script type="text/javascript">

$("#_btnUpdate").click(function() {	
//	alert('글수정하기');		
	$("#_frmForm").attr({ "target":"_self", "action":"csupdate.do" }).submit();
});
$("#_btnReply").click(function() {	
//	alert('답글달기');	
	$("#_frmForm").attr({ "target":"_self", "action":"answer.do" }).submit();
});
$("#_btnDel").click(function() {			
	$("#_frmForm").attr({ "target":"_self", "action":"csdelete.do" }).submit();
});

</script>


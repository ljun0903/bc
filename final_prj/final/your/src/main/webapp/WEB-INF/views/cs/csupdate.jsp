<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cslist.css"/>

<script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css">



<div class="write" align="center">
<form name="frmForm" id="_frmForm" method="post" action="csupdateAf.do">
<input type="hidden" name="seq" value="${cs.seq}" />
<table class="writeTable" style="margin-left:auto; margin-right:auto;">



<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	
<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">${cs.id}</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left">
		<input size="60" type="text" name="title" value='${cs.title}' >
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td style="text-align: left">${cs.rdate.substring(0,11)}</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left; background-color : white; padding: 0px ">
	<textarea id="summernote" name="content">${cs.content} </textarea>
	</td>
</tr>
<tr>
	<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<button type="button" class="btn btn-primary btn-sm" id="_btnUpdate" title="수정하기">수정하기</button>
		</span>
	</td>
</tr>

</tbody>
</table>

</form>
</div>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
//	alert('글수정하기');	
	$("#_frmForm").attr({ "target":"_self", "action":"csupdateAf.do" }).submit();
});
</script>


<!-- 썸머노트 설정 -->
<script> 
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		 toolbar: [ //툴바 설정
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['link']],
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		  height: 300,                 // 에디터 높이
		  minHeight: 400,             // 최소 높이
		  maxHeight: 300,             // 최대 높이
		  focus : true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '내용을 입력해주세요' 	//placeholder 설정
	});
}); 
</script>

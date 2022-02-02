<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cslist.css"/>

<script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css">


<div class="write" align="center">
<form name="frmForm" id="_frmForm" method="post" action="cswriteAf.do">
<table class="writeTable" style="margin-left:auto; margin-right:auto;">
<%-- <col width="100"><col width="400" style="align: left; "> --%>

<tr>
	<td colspan="2"><h1 style="margin-left: 20px">문의글작성</h1></td>
</tr>

<tr>
	<th colspan="1">작성자</th>
	<td>
		<input type="text" name="id" readonly="readonly" value='${login.id}' size="100"/>
	</td>
</tr>

<tr>
	<th colspan="1">제목</th>
	<td>
		<input type="text" name="title" id="title" size="100" />
		<c:if test="${login.auth == 1}">
			<input type="checkbox" name="type" id="type" value="1"/>
			<label for="type"><b>공지글 설정</b></label>
		</c:if>
	</td>
</tr>

<tr>
	<th colspan="1">내용</th>
	<td style="text-align: left; background-color : white; padding: 0px ">
	<textarea id="summernote" name="content"></textarea>
	</td>
</tr>

<tr>
	<td colspan="2" style="text-align: right;">
		<button type="button" class="button-slide" onclick="location.href='cslist.do'" >목록으로</button>
		<button type="button" class="button-slide-blue" id="_btnWrite" title="글쓰기">글쓰기</button>
	</td>
</tr>

</table>


</form>
</div>

<script type="text/javascript">
$("#_btnWrite").click(function() {	
	//alert('글작성');	
	$("#_frmForm").attr({ "target":"_self", "action":"cswriteAf.do" }).submit();	
});


</script>


<script type="text/javascript">
	// 글쓰기 form 유효성 검사
	function writeform_check(){
		var title = document.getElementById("title");
		var content = document.getElementById("content");
		
		if(title.value.trim() == ""){
			alert("제목을 입력하세요");
			title.focus();
			return false;
		}
		
		if(content.value.trim() == ""){
			alert("내용을 입력하세요");
			content.focus();
			return false;
		}
		$("#write_form").attr({ "target":"_self", "action":"cswriteAf.do" }).submit();
	};
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

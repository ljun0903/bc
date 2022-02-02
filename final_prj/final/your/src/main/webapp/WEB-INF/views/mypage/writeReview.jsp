<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Review Write</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  <!--  -->


</head>
<body>


<form name="frmForm" id="_frmForm" method="post" action="writeReviewAf.do" enctype="multipart/form-data">

<table class="list_table" style="margin-left:auto;  margin-right:auto;">
<colgroup>
<col style="width:auto;" />
<col style="width:auto;" />
<col style="width:auto;" />
</colgroup>

<tbody>	
<tr>
	<td>
		닉네임 : 
		<input type="text" name="nickname" readonly="readonly" value='${nickname}' size="10" style="border: 0px;">
		<input type="hidden" name="itemnum"  value="${itemnum}">
		<input type="hidden" name="ordernum"  value="${ordernum}">
	</td>
</tr>

<tr>
	<td>
		제목 : 
		<input type="text" name="title" size="30" >
	</td>
</tr>

<tr>
	<td colspan="3" >
 	 <textarea class="summernote" name="content" id="summernote"></textarea>    
	</td>
</tr>
<tr>
		<td colspan="3" style="height:50px;" >
			<span>
					<button type="button" class="button-slide-blue" id="_btnreview" title="글쓰기">글쓰기</button>
				<!-- <a href="#none" id="_btnreview" title="리뷰등록">
				<br>
					<img alt="" src="image/bwrite.png">
				</a> -->
			</span>
		</td>
</tr>
</tbody>
</table>
</form>
<script type="text/javascript">

$(document).ready(function() {
    $('#summernote').summernote({
       placeholder: '리뷰 내용 (사진등록 가능)',
      tabsize: 2,
      width: 800,
      height: 300,
      fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
      fontNamesIgnoreCheck : [ '맑은고딕' ],
      focus : true,
      callbacks: {
      onImageUpload: function(files, editor, welEditable) {
             for (var i = files.length - 1; i >= 0; i--) {
                sendFile(files[i], this);
             }
         }
    }
    
 });

});



function sendFile(file, el) {
 var form_data = new FormData();
   form_data.append('file', file);
   $.ajax({
     data: form_data,
     type: "POST",
     url: 'contentImageSend2.do',
     cache: false,
     contentType: false,
     enctype: 'multipart/form-data',
     processData: false,
     success: function(img_name) {
          $(el).summernote('editor.insertImage', img_name);
     }
   });
}
 
</script>
<script type="text/javascript">
$("#_btnreview").click(function () {
	
	$("#_frmForm").submit();
});
</script>



</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Recipe Write</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  
  
<!--   <link rel="stylesheet" href="selectbox.min.css">
  <link rel="stylesheet" href="css/selectbox.min.css"> -->

  
<script type="text/javascript">

$(document).ready(function() {
	$("#input_img").on("change", handleImgFileSelect);


function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        
        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
        
    }); 
}


});   



</script>

<style type="text/css">
  .img_wrap {
            width: 200px;
            margin-top: 30px;
     	}
        .img_wrap img {
            width: 360px;
            height:255px;
            padding: 0;
            background-color: #F2F2F2;
            border-radius: 15px; 
            border-color: black;
        }
    th{
   		color: black;
   		padding-left: 0px;

   }
   td{
   		padding: 5px;

   }	

	table.writeTable{
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin : 20px 10px;
	  border-radius: 20px; 
	  box-shadow : 2px 2px 5px #999;
	  font-family: 'Nanum Gothic', sans-serif;
	  padding: 30px;
	  background-color: white;
	}
	table.writeTable input{
		border-radius: 10px;

	}
	textarea{
		border-radius: 10px;	 
		background-color: #F2F2F2;
	} 
	body{
		/* font-family: 'Farsan', cursive; */
	}
	
	
</style>

</head>
<body>

<form name="frmForm" id="_frmForm" method="post" action="upload.do"  enctype="multipart/form-data">
<!-- <h1 align="center" style="margin-top: 50px;"><img alt="" src="image/레시피_작성.png"></h1>	 -->
<table class="writeTable" style="margin-left:auto;  margin-right:auto;">

<colgroup>
<col style="width:108px;" />
<col style="width:435px;" />
<col style="width:385px;" />
</colgroup>

<tbody align="center">

	<tr class="id">

		<td>
			<input type="text" name="id" readonly="readonly" value='${login.id}' size="60" hidden=""/>
		</td>
	</tr>
<tr>

<th>요리제목</th>
	<td align="left">
				<!-- <input type="text" name="recipetitle" size="67"/> -->
				<textarea rows="1" cols="52" name="recipetitle" style="resize: none;"></textarea>
			</td>
 			<td rowspan="3" class="img_wrap" align="center">
		<img id="img" align="left">
		
	</td>
	</tr>
	<tr>
		<th>요리재료</th>
	<td align="left"  colspan="2">
		<textarea rows="4" cols="52" name="ingredient" style="resize: none;"></textarea>
	</td>
</tr>
	<tr>
		<th>대표사진</th>
		<td colspan="2" align="left">
	 	    <!-- <input type="file" name="fileload" id="input_img" style="border: none;"> -->
	 	    <div class="filebox">
			  <label for="input_img">업로드</label>
			  <input type="file" name="fileload" id="input_img">
			</div>
		</td>
	</tr>
</table>


<table class="writeTable" style="margin-left:auto;  margin-right:auto;">
<colgroup>
<col style="width:108px;" />
<col style="width:435px;" />
<col style="width:385px;" />
</colgroup>
<tr>
	<th>요리정보</th>
	<td colspan="2" style="padding: 0px; text-align: center;">
		
       <select id="reccategory" name="reccategory" class="justselect">
       <option value="">분류</option>
			<option value="한식">한식</option>
			<option value="양식">양식</option>
			<option value="일식">일식</option>	
			<option value="중식">중식</option>
			<option value="베이커리">베이커리</option>
		</select>
		
		<select id="recperson" name="recperson" class="justselect">
		<option value="">인원</option>
			<option value="1인분">1인분</option>
			<option value="2인분">2인분</option>
			<option value="3인분">3인분</option>	
			<option value="4인분">4인분</option>
			<option value="대량">대량</option>
		</select>
		
		<select id="rectime" name="rectime" class="justselect">
		<option value="">요리시간</option>
			<option value="10분미만">10분미만</option>
			<option value="30분">30분</option>
			<option value="한시간">한시간</option>	
			<option value="한시간반">한시간반</option>
			<option value="두시간이상">두시간이상</option>
		</select>
		
		<select id="reclevel" name="reclevel" class="justselect">
		<option value="">난이도</option>
			<option value="왕초보">왕초보</option>
			<option value="쉬움">쉬움</option>
			<option value="중간">중간</option>	
			<option value="어려움">어려움</option>
			<option value="헬">헬</option>
		</select>

<tr class="mar">
		<th align="left">요리소개</th>
	<td align="left" colspan="2">
		<textarea rows="6" cols="100" name="recintroduce" style="resize: none;"></textarea>
	</td>
</tr>

</table>
<table class="writeTable" style="margin-left:auto;  margin-right:auto;">

<colgroup>
<col style="width:108px;" />
<col style="width:455px;" />
<col style="width:387px;" />
</colgroup>
	<tr>
		<th>순서</th>
		<td colspan="2" align="left" style="background-color: #F2F2F2; padding: 0px">
	 	 <textarea class="summernote" name="reccontent" id="summernote"></textarea>    
		</td>
	</tr>

</tbody>
</table>

	<!-- <div align="center"><button class="button-slide" type="submit" id="btnupdate" title="레시피 작성">레시피 작성</button></div> -->
	<div align="center"><button type="submit" class="button-slide" id="btnupdate" onclick="btnwrite()">레시피 작성</button></div>
</form>
	
<script type="text/javascript">
function categoryrec() {
	alert(document.getElementById("orange").value);
}

function change() {
	var category = document.getElementByID("cate");
	var reccategory = document.getElementByID("reccategory");
	
	var idx = category.options.selectedIndex;
    var val = category.options[idx].value;
    
	reccategory.value = val;
	
}

</script>
<!-- <script>
function btnwrite() {
	 let recipetitle = document.frmForm.recipetitle;
	 let fileload = document.frmForm.fileload;
	 let reccategory = $("#reccategory option:selected").val();
	 let recperson = $("#recperson option:selected").val();
	 let rectime = $("#rectime option:selected").val();
	 let reclevel = $("#reclevel option:selected").val();
	 let recintroduce = document.frmForm.recintroduce;
	 let ingredient = document.frmForm.ingredient;
	 let reccontent = document.frmForm.reccontent;
	 
	 if(recintroduce.value == "" || recintroduce.value == null){
		   Swal.fire("요리소개를 작성해주세요");
	      recintroduce.focus();
	      return false;
	   }if(reccontent.value.trim() == ""){
		   Swal.fire("요리순서를 작성해주세요");
	      reccontent.focus();
	      return false;
	   }if(recipetitle.value.trim() == ""){
		  Swal.fire("제목을 입력하세요");
	      recipetitle.focus();
	      return false;
	   }if(fileload.value.trim() == ""){
		   Swal.fire("대표사진을 지정하세요");
	      fileload.focus();
	      return false;
	   }if(ingredient.value.trim() == ""){
		   Swal.fire("요리재료를 작성해주세요");
	      ingredient.focus();
	      return false;
	    }if(reccategory == ""){
	    	Swal.fire("카테고리를 지정하세요");
	      document.getElementsByName("reccategory")[0].focus();
	      return false; 
	    }if(rectime == ""){
	    	Swal.fire("요리시간을 지정하세요");
	        document.getElementsByName("rectime")[0].focus();
	        return false; 
	    }if(recperson == ""){
	    	Swal.fire("인원을 지정하세요");
	        document.getElementsByName("recperson")[0].focus();
	        return false; 
	    }if(reclevel == ""){
	    	Swal.fire("요리난이도를 지정하세요");
	        document.getElementsByName("reclevel")[0].focus();
	        return false; 
	   }
	
}

</script>	 -->
<script>

$("#btnupdate").click(function() {
   let recipetitle = document.frmForm.recipetitle;
   let fileload = document.frmForm.fileload;
   let reccategory = $("#reccategory option:selected").val();
   let recperson = $("#recperson option:selected").val();
   let rectime = $("#rectime option:selected").val();
   let reclevel = $("#reclevel option:selected").val();
   let recintroduce = document.frmForm.recintroduce;
   let ingredient = document.frmForm.ingredient;
   let reccontent = document.frmForm.reccontent;
   
   let v = confirm("레시피를 작성하시겠습니까?");
   
   
   if(recipetitle.value.trim() == ""){
      alert("제목을 입력하세요");
      recipetitle.focus();
      return false;
   }if(fileload.value.trim() == ""){
      alert("대표사진을 지정하세요");
      fileload.focus();
      return false;
    }if(reccategory == ""){
      alert("카테고리를 지정하세요");
      document.getElementsByName("reccategory")[0].focus();
      return false; 
    }if(rectime == ""){
        alert("요리시간을 지정하세요");
        document.getElementsByName("rectime")[0].focus();
        return false; 
    }if(recperson == ""){
        alert("인원을 지정하세요");
        document.getElementsByName("recperson")[0].focus();
        return false; 
    }if(reclevel == ""){
        alert("요리난이도를 지정하세요");
        document.getElementsByName("reclevel")[0].focus();
        return false; 
   }if(recintroduce.value.trim() == ""){
      alert("요리소개를 작성해주세요");
      recintroduce.focus();
      return false;
   }if(ingredient.value.trim() == ""){
      alert("요리재료를 작성해주세요");
      ingredient.focus();
      return false;
   }if(reccontent.value.trim() == ""){
      alert("요리순서를 작성해주세요");
      reccontent.focus();
      return false;
      
   }else if (v==true) {

	   
      $("#_frmForm").submit();
    }
});

 </script>
 <script>
$(document).ready(function() {
    $('#summernote').summernote({
		toolbar: [
			['fontsize', ['fontsize']],
			['font', ['bold', 'italic', 'underline', 'clear']],
			['fontname', ['fontname']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['height', ['height']],
			['insert', ['picture']],
		],
       placeholder: '<img src=image/요리사.png style="height: 20%; width: 20%;" class="yourlogo"> 레시피 요리순서를 입력해주세요 양식은 자유!<p><b>ex)</b></p><p style="text-align: center; "><b><i>1.&nbsp; 재료를 준비해요</i></b></p><p style="text-align: center; "><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/08/24/e080a079ff28dd4e3edf16f0b8fccf0c1.jpg" style="border: 0px; border-radius: 10px; max-width: 100%; height: auto; margin: 20px 0px 10px; color: rgb(51, 51, 51); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: start; background-color: rgb(241, 241, 242);"><b><i><br></i></b></p><p style="text-align: center; "><b><i><br></i></b></p><p style="text-align: center; "><b><i>2. 감자는 1cm 두께로 반달모양으로 썰고</i></b></p><p style="text-align: center; "><img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/08/24/5baa3b4c127a0f1acde9957ccd8a32c71.jpg" style="border: 0px; border-radius: 10px; max-width: 100%; height: auto; margin: 20px 0px 10px; color: rgb(51, 51, 51); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: start; background-color: rgb(241, 241, 242);"><b><i><br></i></b></p><p style="text-align: center; "><b><i><br></i></b></p>',
       tabsize: 2,
       width: '841px',
       height: 1300,
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
     url: 'contentImageSend.do',
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


</body>
</html>


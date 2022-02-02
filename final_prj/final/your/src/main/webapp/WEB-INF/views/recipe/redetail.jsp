<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="comtotalCount" value="${comtotalCount}"/>
<fmt:requestEncoding value="utf-8"/>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style type="text/css">
    	.img_wrap {
            width: 300px;
            margin-top: 50px;
        }
        .img_wrap img {
            width: 300px;
            height:200px;
        }
 		
 		tr.mar{
 		border-bottom: 20px solid #fff;
 		}
		
</style>

<style type="text/css">
  .img_wrap {
            width: 200px;
            margin-top: 30px;
     	}
        .img_wrap img {
            width: 365px;
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
<table class="writeTable" style="margin-left:auto;  margin-right:auto;" id="msgListTable" >
<colgroup>
	<col style="width:108px;" />
	<col style="width:400px;" />
	<col style="width:400px;" />
</colgroup>

<tbody align="center">
<tr>
<th>요리제목</th>
	<td align="left">
				<!-- <input type="text" name="recipetitle" size="67"/> -->
				<textarea rows="2" cols="59 name="recipetitle" style="resize: none;"  readonly="readonly">${recipe.recipetitle}</textarea>
			</td>
 			<td rowspan="3" class="img_wrap" align="center">
		<img id="img" align="right" src="upload/${recipe.newbestimg}">
	</td>
	</tr>
	<tr>
		<th>요리재료</th>
	<td align="left"  colspan="2">
		<textarea rows="7" cols="59" name="ingredient" style="resize: none;"  readonly="readonly">${recipe.ingredient }</textarea>
	</td>
</tr>
	<tr>
		<td colspan="2" align="left" class="img_wrap">
			<!-- 기존의 파일 -->
			<input type="hidden" name="newnamefile" value="${recipe.newbestimg}">
			<input type="hidden" name="namefile" value="${recipe.bestimg}" size="50" readonly="readonly">
		</td>	
	</tr>
</table>



<table class="writeTable" style="margin-left:auto;  margin-right:auto;">
<colgroup>
<col style="width:108px;" />
<col style="width:430px;" />
<col style="width:405px;" />
</colgroup>
	
	<tr hidden="">
		<th>아이디</th>
		<td style="text-align: center;">${recipe.id }</td>
	</tr>
	
	<tr>
		<th>요리정보</th>
		<td>👨‍🍳 ${recipe.recperson}&nbsp&nbsp&nbsp&nbsp&nbsp⏰ ${recipe.rectime }&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp🍳 ${recipe.reclevel }
	</tr>
	
	<tr class="mar">
			<th align="left">요리소개</th>
		<td align="left" colspan="2">
			<textarea rows="6" cols="113" name="recintroduce" style="resize: none;" readonly="readonly">${recipe.recintroduce }</textarea>
		</td>
	</tr>		
	<tr hidden="">	
		<td style="text-align: center;">${recipe.reccategory }<br><br></td>
	</tr>
</table>



<table class="writeTable" style="margin-left:auto;  margin-right:auto;">

<colgroup>
<col style="width:108px;" />
<col style="width:470px;" />
<col style="width:400px;" />
</colgroup>
	<tr>
		<th>순서</th>
		<td colspan="2" align="left" style="background-color: #F2F2F2; padding: 15px; border-radius: 15px;">
	 	 ${recipe.reccontent}
		</td>
	</tr>
	</tbody>
</table>

<table class="list_table" style="width: 100%;">
	<tr>
		<td style="height:50px; text-align: center">
		<span>
		<button class="button-slide" type="button" title="글보기" onclick="location.href='recipe.do'">목록</button>
			<c:if test="${recipe.id eq login.id || login.auth eq 1}">
			<button class="button-slide-blue"  type="button" id="_btnUpdate" title="레시피수정">수정</button>
<!--      		<button class="button-slide-red"  type="button" id="_btnDel" title="삭제">글삭제</button> -->
     		<button type="button" class="button-slide-red" id="_btnDel" onclick="deleteBoard()">삭제</button>
			</c:if>
		</span>
		</td>
	</tr>
	<tr>
	<td align="center">
	<br><br>
				<!-- 좋아요 -->
	<c:choose>
		<c:when test="${likecheck eq 'true' }">
			<button type="button" class="heartx" id="heartx" style="width: 10; border: none; background-color: white; font-size:25px;">👍+${likecount}</button>
		</c:when>
		<c:when test="${likecheck eq 'false' }">
			<button type="button" class="heart" id="heart" style="width:10; border: none; background-color: white; font-size:25px;" >👎+${likecount}</button>
		</c:when>
	</c:choose>	
	</td>
	</tr>
</tbody>
</table>
		
			
		<!-- Reply List {s}-->
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px; margin-left: auto; margin-right: auto;">
	<h6 class="border-bottom pb-2 mb-0" style="margin-left: 250px; margin-right: 250px;">Reply list</h6>
	<div id="replyList" style="margin-left: 250px; margin-right: 250px;"></div>
	</div>
	 
	 		<!-- 페이징-->
 	<div class="container">
		   <nav aria-label="Page navigation">
		       <ul class="pagination" id="pagination" style="justify-content:center;"></ul>
		   </nav>
	</div>

 
 <!-- 댓글  -->
	<div class="container"  style="width: 1200px;">
    <form name="form" id="form" role="form" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                        	<input class="form-control" id="id" value=${login.id } hidden=""></input>
                            <textarea style="width: 1100px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <button type="button" class="btn btn-sm btn-success" id="btnReplySave" style="width: 60;"> 등록 </button>
                                
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>      
    </form>
</div>
		<!-- Reply Form {e} -->

<!-- seq만 필요하므로 -->
<form name="frmForm" id="_frmForm" action="pdsupdate.do" method="post">
	<input type="hidden" name="seq" value="${recipe.seq }">
</form>



</body>
<script>

	$(document).ready(function(){

		showReplyList();

	});

</script>

<script type="text/javascript">
$(document).on('click', '#heartx', function(){

	var seq_recipe = "${recipe.seq}";
	//alert(seq_recipe);
	var id = "${login.id}";
	//alert(id);
	
	
	var allData = {"id":id, "seq_recipe":seq_recipe};
	
	$.ajax({
		url:"heartx.do",
		type:"GET",
		data:allData,
		success:function(data){
			//alert("안좋아요");
			location.reload(true);
            window.opener.location.reload();
		},
	 	error(error, obj){
			alert("실패");
		}	 
	});	
});

$(document).on('click', '#heart', function(){

	var seq_recipe = "${recipe.seq}";
	//alert(seq_recipe);
	var id = "${login.id}";
	//alert(id);
	
	
	var allData = {"id":id, "seq_recipe":seq_recipe};
	
	$.ajax({
		url:"heart.do",
		type:"GET",
		data:allData,
		success:function(data){
			//alert("좋아요");
			location.reload(true);
            window.opener.location.reload();
		},
	 	error(error, obj){
			//alert("실패");
		}	 
	});	
});
</script>

<script>

function showReplyList(){
	var paramData = {"bbsid" : ${recipe.seq}};
	//alert(${recipe.seq});
	
	$.ajax({
        type: 'POST',
        url: "getReqlyList.do",
        data: paramData,
        dataType: 'json',
        success: function(result) {
        	//paging();
           	var htmls = "";

		if(result.length < 1){

			htmls.push("등록된 댓글이 없습니다.");

		} else {
              $(result).each(function(){
            	  var orgNickNames = '${login.id}';
                    	if(this.step == 0){
                     htmls += '<div class="media text-muted pt-3" id="seq' + this.seq + '">';

                     // htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

                     htmls += '<title>Placeholder</title>';

                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

                     //htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

                     htmls += '</svg>';

                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

                     htmls += '<span class="d-block">';

                     htmls += '<strong class="text-gray-dark">' + this.id + '</strong>';

                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
					 
                     htmls += '<a href="javascript:void(0)" onclick="fn_reReply(' + this.seq + ', \'' + this.bbsid + '\' )" style="padding-right:5px; color:green;">답글</a>';
                     if(orgNickNames == this.id){
                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.seq + ', \'' + this.id + '\', \'' + this.content + '\' )" style="padding-right:5px; color:green;">수정</a>';

                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.seq + ')" style="padding-right:5px; color:green;" >삭제</a>';
                     }
                     htmls += '&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' + this.rdate.substring(2,16);
                     htmls += '</span>';

                     htmls += '</span>';
                   
                    	}else{
                              htmls += '<div class="media text-muted pt-3" id="seq' + this.seq + '">';
                             
                              // htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

                              htmls += '<title>Placeholder</title>';

                              htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

                              //htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

                              htmls += '</svg>';

                              htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

                              htmls += '<span class="d-block">';

                              htmls += '<img src="image/arrow.png" width="50px" height="35px" alt=""><strong class="text-gray-dark">&nbsp&nbsp&nbsp&nbsp&nbsp'+ this.id + '</strong>';

                              htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                              if(orgNickNames == this.id){
                              if(this.content == " "){
                              htmls += '<a href="javascript:void(0)" onclick="fn_reupdate(' + this.seq + ', \'' + this.id + '\' )" style="padding-right:5px; color:green;">저장</a>';
                              }else{
                            	  htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.seq + ', \'' + this.id + '\', \'' + this.content + '\' )" style="padding-right:5px;  color:green;">수정</a>';
                              }
                              htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.seq + ')" style="padding-right:5px;  color:green;" >삭제</a>';
                              }
                              htmls += '&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' + this.rdate.substring(2,16);
                              htmls += '</span>';

                              htmls += '</span>';
                              
                    }
					if(this.content == " "){
						if(this.step == 0){
						htmls += '<textarea style="width: 1100px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>'
						}else{
							htmls += '<textarea style="width: 1100px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>'	
						}
					}else{
						if(this.step == 0){
                     		htmls += this.content;
						}else{
							htmls += '&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+ this.content;
						}
					}
                  	 htmls += '</p>';
                     htmls += '</div>';
                });	//each end
		}	
		$("#replyList").html(htmls);
		
        }	   // Ajax success end
	});	// Ajax end
}

$(document).on('click', '#btnReplySave', function(){
	var content = $('#content').val();
	var id = $('#id').val();
	var paramData = JSON.stringify({"content": content
			, "id": id
			, "bbsid":'${recipe.seq}'

	});
	var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};
	
	$.ajax({

		url: "saveReqly.do"
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
			showReplyList();			
			$('#content').val('');
			//$('#id').val('');
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
});

function fn_editReply(seq, id, content){

	var htmls = "";
	htmls += '<div class="media text-muted pt-3" id="seq' + seq + '">';
	//htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	htmls += '<title>Placeholder</title>';
	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	//htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	htmls += '</svg>';
	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	htmls += '<span class="d-block">';
	htmls += '<strong class="text-gray-dark">' + id + '</strong>';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + seq + ', \'' + id + '\')" style="padding-right:5px;  color:green;">저장</a>';
	htmls += '<a href="javascript:void(0)" onClick="showReplyList()" style="padding-right:5px;  color:green;">취소<a>';
	htmls += '</span>';
	htmls += '</span>';		
	htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
	htmls += content;
	htmls += '</textarea>';
	htmls += '</p>';
	htmls += '</div>';
	$('#seq' + seq).replaceWith(htmls);
	$('#seq' + seq + ' #editContent').focus();

}

function fn_updateReply(seq, id){
	var replyEditContent = $('#editContent').val();
	var paramData = JSON.stringify({"content": replyEditContent
			, "seq": seq
	});

	var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};

	$.ajax({
		url: "updateReply.do"
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
                            console.log(result);
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}

 function fn_reupdate(seq, id){
	var replyEditContent = $('#content').val();
	var paramData = JSON.stringify({"content": replyEditContent
			, "seq": seq
	});

	var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};

	$.ajax({
		url: "updatere.do"
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
                            console.log(result);
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
} 

function fn_deleteReply(seq){		//seq로 바꿈
	var paramData = {"seq": seq};
	
	$.ajax({
		url: "deleteReply.do"
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);             
		}
	})
}


function fn_reReply(seq, bbsid){
	var paramData = JSON.stringify({"seq": seq
									, "bbsid":bbsid
									,"id":'${login.id}'});

	var headers = {"Content-Type" : "application/json"
			, "X-HTTP-Method-Override" : "POST"};

	$.ajax({
		url: "rereply.do"
		, headers : headers
		, data : paramData
		, type : 'POST'
		, dataType : 'text'
		, success: function(result){
			showReplyList();
			$('#content').val('');
		}
		, error: function(error){
			alert("ddddd");
			console.log("에러 : " + error);
		}
	});
} 




</script>
 
<script>
function _refrush() {
	location.reload();
	clearTimeout(myVar);
}



$("#_btnUpdate").click(function() {	
//	alert('글수정하기');		
	$("#_frmForm").attr({ "target":"_self", "action":"reupdate.do" }).submit();
});

$("#_btnDel").click(function() {	
	 let v = confirm('정말 삭제하시겠습니까?');
	   if(v == true) {
			$("#_frmForm").attr({ "target":"_self", "action":"recipedelete.do" }).submit();
	   }
});

$("#_btnrec").click(function(){
	$("#_frmForm").attr({ "target":"_self", "action":"recipe.do" }).submit();
});




/*  function deleteBoard(){
		Swal.fire({
		  title: '레시피를 삭제하시겠습니까???',
		  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
			  $("#_frmForm").attr({ "target":"_self", "action":"recipedelete.do" }).submit(); 
		  }
		})
	} */



</script> 

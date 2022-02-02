<%@ page contentType="text/html; charset=UTF-8 " 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>JSP AJAX</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	
	<script type="text/javascript">
		var searchrequest = new XMLHttpRequest();
		var registerrequest = new XMLHttpRequest();
		var listeRquest = new XMLHttpRequest();
		var addcomRequest = new XMLHttpRequest();
		
		
		
		function searchFunction() {
			searchrequest.open("Post","./ComSearchServlet?name=" + encodeURIComponent(document.getElementById("name").value), true);
			searchrequest.onreadystatechange = searchProcess;
			searchrequest.send(null);
		}
		function searchProcess() { // ElementById가 ajaxTable인 tbody에서 가져온다.
			var table = document.getElementById("ajaxTable")
			table.innerHTML = "";  //안에 공간을 빈공간으로 만들어준다.
			if(searchrequest.readyState == 4 && searchrequest.status == 200){ //성공적인 통신인지 확인
				var object = eval('(' + searchrequest.responseText + ')');
				var result = object.result; // 넘어온 JSON에서 result를 가져오겠다. result는 회원정보가 담긴 배열
				for(var i = 0; i < result.length; i++){
					var row = table.insertRow(0); //현재의 테이블에 하나의 행을 만들어준다
					for(var j = 0; j < result[i].length; j++){ // j는 컬럼(아이디,이름...)을 하나씩 탐색
						var cell = row.insertCell(j);
						cell.innerHTML = result[i][j].value;
					}
				}
			}
		}
		function registerFunction() {
			registerrequest.open("Post","./ComRegisterServlet?name=" + encodeURIComponent(document.getElementById("registerName").value) +
					 			"&id=" + encodeURIComponent(document.getElementById("registerId").value) +
					 			"&content=" + encodeURIComponent(document.getElementById("registerContent").value), true);
			registerrequest.onreadystatechange = registerProcess;
			registerrequest.send(null);
			
			searchFunction();
		}
		function registerProcess() {
			if(registerrequest.readyState == 4 && registerrequest.status == 200){
				var result = registerrequest.responseText;
				if(result != 1){
				//	alert('등록에 실패했습니다');
				}else{
					var name = document.getElementById("name");
					var registerName = document.getElementById("registerName");
					var registerId = document.getElementById("registerId");
					var registerContent = document.getElementById("registerContent");
					name.value = "";
					registerName.value = "";
					registerId.value = "";
					registerContent.value = "";
					searchFunction();
				}
			}
		}
		window.onload = function() {
			searchFunction();
		}
	
	</script>


</head>
<body>
	<br>
	<div class="container">
		<div class="form=group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="name" onkeyup="searchFunction()" type="text" size="20">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
			</div>
		</div>
		<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">닉네임</th>
					<th style="background-color: #fafafa; text-align: center;">내용</th>
					<th style="background-color: #fafafa; text-align: center;">작성일</th>
					<th style="background-color: #fafafa; text-align: center;">좋아요 갯수</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
			</tbody>
		</table>
	</div>
	<div class="container">
		<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #fafafa; text-align: center;">댓글</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="background-color: #fafafa; text-align: center;">닉네임</td>  <!-- 이 부분에 mem.getName을 받아옴 -->
					<td><input class="form-control" type="text" id="registerName" size="20"></td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;">아이디</td>  <!-- 이 부분에 mem.getName을 받아옴 -->
					<td><input class="form-control" type="text" id="registerId" size="20"></td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;">내용</td>
					<td><input class="form-control" type="text" id="registerContent" size="20"></td>
				</tr>				
				<tr>
					<td colspan="2"><button class="btn btn-primary pull-right" onclick="registerFunction();" type="button">등록</td>
				</tr>
			</tbody>
		</table>
	
	</div>



</body>
</html>
<%@page import="pds.PdsDto"%>
<%@page import="pds.PdsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

String Spdsnum = request.getParameter("pdsnum");
int pdsnum = Integer.parseInt(Spdsnum);
System.out.println("pdsnum : "+pdsnum);

int bbsid = pdsnum; // bbsid가 게시판번호
int comstep = seq; //comstep이 글번호

PdsDao dao = PdsDao.getInstance();
dao.pdsReadCount(seq);

PdsDto dto = dao.getPds(seq);

System.out.println("bbsid : "+ bbsid);
System.out.println("comstep : "+ comstep);
// System.out.println(dto.toString());
%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<style type="text/css">
th{
	background-color: #1E3269;
	color: white;
	padding-left: 10px;
}
h2{
	text-indent: 20px;
}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>

<!-- Left Side -->
<aside>
<div id="leftsideMenu" class="ui sidebar inverted vertiacal menu">
	<ul>
 	  <li class="hov"><a href="myPage.jsp?name=<%=mem.getName() %>" class="active" >마이페이지</a>
 	  	<ul>
 	  		<li><a href=" memberUpdate.jsp?name=<%=mem.getName()%>">회원정보수정</a></li>
 	  		<li><a href=" memberDelete.jsp?name=<%=mem.getName()%>">회원탈퇴</a></li>
 	  	</ul>
 	  </li>
      <li><a href="myCrew.jsp">참여중인 크루</a>
      	<!-- <ul>
      		<li><a>정기크루</a></li>
		    <li><a>일일크루</a></li>
      	</ul> -->
      </li>
      <li><a href="myCalendar.jsp<%-- ?name=<%=mem1.getName() %> --%>">나의 캘린더</a></li>
      <li><a href="#">나의 게시물</a>
      	<ul>
      		<li><a href="myFreeBbs.jsp?pdsnum=<%=1%>">자유게시판</a></li>
      		<li><a href="myReviewBbs.jsp?pdsnum=<%=2%>">인증게시판</a></li>
      		<li><a href="#;">그룹게시판</a></li>
      		<li><a href="#;">문의게시판</a></li>
      	</ul>
      </li>
	</ul> 
	
</div>
</aside>


<h2>상세 글 보기</h2>

<div align="center">

<table border="1">
<colgroup>
	<col style="width: 200px">
	<col style="width: 400px">
</colgroup>

<tr>
	<th>닉네임</th>
	<td>
		<%=dto.getName() %>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=dto.getReadcount() %></td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=dto.getRegdate() %></td>
</tr>
<tr>
	<td>
		<img id="image" src="upload/<%=dto.getNewFilename() %>">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
	<textarea rows="15" cols="90" readonly="readonly"><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>
<br>
<button type="button" onclick="location.href='myFreeBbs.jsp?pdsnum=<%= pdsnum%>'">글목록</button>
<button type="button" onclick="reportPds(<%=dto.getSeq() %> ,<%= pdsnum%>)">신고</button>

<%
if(dto.getId().equals(mem.getId())){
%>
<button type="button" onclick="updatePds(<%=dto.getSeq() %> ,<%= pdsnum%> )">수정</button>
<button type="button" onclick="deletePds(<%=dto.getSeq() %> ,<%= pdsnum%>)">삭제</button>
<%
}
%>

</div>

<script type="text/javascript">

function updatePds( seq , pdsnum) {
	location.href = "pdsupdate.jsp?seq=" + seq + "&pdsnum="+ pdsnum;
}
function deletePds( seq , pdsnum ) {
	location.href = "pdsdelete.jsp?seq=" + seq + "&pdsnum="+ pdsnum;
}
function reportPds( seq, pdsnum ) {
	openWin = window.open("pdsreport.jsp?seq=" +seq+ "&pdsnum=" +pdsnum,
			"childForm", "width=550, height=430, resizable = no, scrollbars = no");
}	

</script>


<script type="text/javascript">
		var listRquest = new XMLHttpRequest();
		var addcomRequest = new XMLHttpRequest();
		

		
		function addcomFunction() {
			
			addcomRequest.open("Post", "./ComAddServlet?bbsid="+ encodeURIComponent(document.getElementById("bbsid").value) + 
								"&comstep=" + encodeURIComponent(document.getElementById("comstep").value) +
								"&name=" + encodeURIComponent(document.getElementById("registerName").value) +
								"&id=" + encodeURIComponent(document.getElementById("registerId").value) +
					 			"&content=" + encodeURIComponent(document.getElementById("registerContent").value), true);/* {
				
				if(addcomRequest.readyState == 4 && addcomRequest.status == 200){
					let ajaxTable = document.getElementById("ajaxTable");
					
					alert('send end');
					
					
				}
				
			}	 */
			
			addcomRequest.onreadystatechange = addcomProcess;
			addcomRequest.send(null);
			
			//여기에 리스트 뿌려주는 Function호출해줘야함
			location.reload();
		}
		function addcomProcess() {
			if(addcomRequest.readyState == 4 && addcomRequest.status == 200){
				var result = addcomRequest.responseText;
				if(result != 1){
//					alert('등록에 실패했습니다');
				}else{
					var bbsid = document.getElementById("bbsid"); 
					var comstep = document.getElementById("comstep"); 
					var name = document.getElementById("registerName"); 
					var id = document.getElementById("registerId"); 
					var content = document.getElementById("registerContent"); 
					
					bbsid.value = "";
					comstep.value = "";
					registerName.value = "";
					registerId.value = "";
					registerContent.value = "";
				}
			}
		}

		
		
		function listFunction() {
		//	alert(document.getElementById("bbsid").value);
		//	alert(document.getElementById("comstep").value);
			
			listRquest.open("Post","./ComListServlet?bbsid=" + encodeURIComponent(document.getElementById("bbsid").value) +
							"&comstep=" + encodeURIComponent(document.getElementById("comstep").value), true);
			listRquest.onreadystatechange = listProcess;
			listRquest.send(null);
			
			
		}
		function listProcess() { //  ElementById가 ajaxTable인 tbody에서 가져온다.
			var table = document.getElementById("ajaxTable")
			table.innerHTML = "";  //안에 공간을 빈공간으로 만들어준다.
			if(listRquest.readyState == 4 && listRquest.status == 200){ //성공적인 통신인지 확인
				var object = eval('(' + listRquest.responseText + ')');
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


		window.onload = function() {
			listFunction();
		}
	
	</script>

<br>
	<div class="container">
		<div class="form=group row pull-right">
		</div>
		<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">닉네임</th>
					<th style="background-color: #fafafa; text-align: center;">내용</th>
					<th style="background-color: #fafafa; text-align: center;">작성일</th>
			   <!-- <th style="background-color: #fafafa; text-align: center;">좋아요 갯수</th>  -->	
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
					<td>
						<input class="form-control" type="text" id="registerName" size="20" value="<%=mem.getName()%>" readonly="readonly">
						<input class="form-control" type="hidden" id="registerId" size="20" value="<%=mem.getId()%>">
						<input class="form-control" type="hidden" id="bbsid" size="20" value="<%=bbsid%>">
						<input class="form-control" type="hidden" id="comstep" size="20" value="<%=comstep%>">
					</td> 
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;">내용</td>
					<td><input class="form-control" type="text" id="registerContent" size="20"></td>
				</tr>				
				<tr>
					<td colspan="2"><button class="btn btn-primary pull-right" onclick="addcomFunction();" type="button">등록</td>
				</tr>
			</tbody>
		</table>
	
	</div>

</body>
</html>
<%@page import="pds.PdsDto"%>
<%@page import="pds.PdsDao"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String choice = request.getParameter("choice");
String search = request.getParameter("search");

// 처음 들어왔을 때를 생각해서
if(choice == null){
	choice = "";
}

if(search == null){
	search = "";
}
%>
<%
String name = mem.getName();
System.out.println(name);

String Spdsnum = request.getParameter("pdsnum");
int pdsnum = Integer.parseInt(Spdsnum);
System.out.println(pdsnum);

PdsDao dao = PdsDao.getInstance();

// 현재 페이지 번호
String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")){
	pageNumber = Integer.parseInt(sPageNumber);
}

List<PdsDto> list = dao.getPdsPagingList( pdsnum, choice, search, pageNumber);

// 글의 총 수
int len = dao.getAllPds(pdsnum, choice, search);
System.out.println("총 글의 수" +len);

// 페이지 수
int PdsPage = len / 10; 	// 10 : 기준
if((len%10) > 0 ){			// ex) len(총 페이지 수)가 24면 필요한 페이지 수는 3
	PdsPage = PdsPage + 1;
//	System.out.println(PdsPage);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>자유게시판</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/basic.css">

<style type="text/css">
table{
	width: 100%;
	border: 1px solid;
}

tr{
	text-align: center;
}

th,td{
	border: 1px solid;
	padding-left: 10px;
}

h2{
	text-indent: 20px;
}

hr{
    border: 0;
    height: 5px;
  	
}

<script type="text/javascript">
$(document).ready(function () {
	let search = "<%=search %>";	// java -> JS
	if(search == "") return;

	let obj = document.getElementById('choice');
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
});

</script>

</style>
</head>
<body>

<h2>자유게시판</h2>
<hr>
<header class="py-5">
	<div class="container px-lg-5">
		<table>
			<col width="30"><col width="500"><col width="40"><col width="40"><col width="80">
			<tr>
            	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th><th>작성일</th>
			</tr>
<%
if(list == null || list.size() == 0){
%>
			<tr>
				<td colspan="5">작성된 글이 없습니다</td>
			</tr>
<%
}else{ 
	for(int i = 0;i < list.size(); i++){
		PdsDto pds = list.get(i);
		%>
	<tr align="center" height="5">
		<th><%=i + 1 %></th>
		<td align="left">
			<a href="pdsdetail.jsp?seq=<%=pds.getSeq() %>&pdsnum=<%= pdsnum%>">
				<%=pds.getTitle() %>
			</a>
		</td>
		<td>
			<%=pds.getReadcount() %>
		</td>
		<td>
			<%=pds.getName() %>
		</td>
		<td>
			<%=pds.getRegdate() %>
		</td>
	</tr>
	<%
	}
}%>

</table>
<%
for(int i =0; i< PdsPage; i++){
	if(pageNumber == i){	// 현재페이지	[1] 2 [3]
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">	<!-- div와 동일, CSS적용할때 많이 사용, 홀로는 의미X -->
			<%= i + 1 %> <!-- 0이 아닌 1부터 시작하게 -->
		</span>&nbsp;	
		<%
	}else{					// 그 밖에 페이지
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i%>)"
			style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none;">
			<%=i + 1 %> </a>&nbsp;	<!-- none: 아무조취 취하지X, title: 마우스 갖다대면 뜨게끔 -->
		<%
	}
}

%>
<br>
<a href="pdswrite.jsp?pdsnum=<%=pdsnum%>">글쓰기</a>
</div>
</header>


<script type="text/javascript">
function filedownload(newfilename, seq) {
	location.href = 'filedown?newfilename=' + newfilename + '&seq=' + seq;
}

</script>

<script type="text/javascript">
$(document).ready(function() {	
	let search = "<%=search %>";
	if(search == "") return;
	
	let obj = document.getElementById("choice"); 
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
});
</script>

<div align="center">

<select id="choice">
	<!-- <option value="number">번호</option> -->
	<option value="title">제목</option>
	<option value="content">내용</option>
</select>

<input type="text" id="search" size="20" value="<%=search %>">

<button type="button" onclick="searchBtn()">검색</button>
<br><br>

<!--  <a href="pdswrite.jsp">글쓰기</a> -->

</div>

<script type="text/javascript">
function searchBtn() {
//	alert('searchBtn');	
	let choice = document.getElementById('choice').value;	// title, content, 비어있을 수 X
	let search = document.getElementById("search").value;	// 입력받는 값, 비어있을 수 O
	
 	if(search.trim() == ''){	// 입력받는 값인데 안썼을 수도 있으니 양쪽 여백이 공백이면(입력을 하지 않았으면)
		alert('검색어를 입력해 주십시오');
		return;
	} 
 	// 자바스크립트 값 -> 자바로 이동(파라미터 위로)
	location.href = "myFreeBbs.jsp?pdsnum=<%=pdsnum%>&choice=" + choice + "&search=" + search;	// 자기자신으로(리스트)
}

function goPage( pageNum ) {
	let choice = document.getElementById('choice').value;	
	let search = document.getElementById("search").value;
	
	location.href = "myFreeBbs.jsp?pdsnum=<%=pdsnum%>&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

</script>

</body>
</html>
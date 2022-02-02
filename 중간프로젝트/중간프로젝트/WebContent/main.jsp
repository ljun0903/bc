<%@page import="dto.MemberDto"%>
<%@page import="dto.CrewDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CrewDao"%>
<%@ include file="header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String location = "";
if(mem == null){
} else {	

location = mem.getLoc();
System.out.println("location1: " + location);
}

%>    
    
<% 
CrewDao dao = CrewDao.getInstance();

//List<CrewDto> list = dao.getCrewList();

String choice = request.getParameter("choice");
String search = request.getParameter("search");
String period = request.getParameter("period");

if(request.getParameter("loc") == null){
	System.out.println("location널");

} else {
	System.out.println("location낫널");

	location = request.getParameter("loc");
}
System.out.println("location2: " + location);

System.out.println("period1: " + period);

if(period == null){
	period = "";
}

if(choice == null){
	choice = "";
}

if(search == null){
	search = "";
}

System.out.println("period2: " + period);

//현재 페이지 번호
String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")){
	pageNumber = Integer.parseInt(sPageNumber);
}
System.out.println("pageNumber: " + pageNumber);

List<CrewDto> list = dao.getCrewPagingList(location, period, choice, search, pageNumber);

//글의 총수
int len = dao.getAllCrew(location, period, choice, search);
System.out.println("총 글의 수: " + len);
//페이지수
int crewPage = len / 9; // 11 / 9 -> 2
if((len % 9) > 0){
	crewPage = crewPage + 1;
}
System.out.println("페이지 수: " + crewPage);

%>    
    
    
<%! 
String imageFile = "";

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="basic.css">
<style type="text/css">
#leftsideMenu {
    padding-left: 5%;
    width: 20%;
    height: 930px;
    display: inline;
    border-right: 1px solid #1E3269;
	float: left;        
}                
                
    #leftsideMenu ul {
  /*   border-right: 1px solid #1E3269;        */  
    list-style-type: none;
    margin: 0;
    /* padding-left: 150px;
    width: 200px; */
    background-color: #fff;
}
#leftsideMenu li a {
    display: block; 
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

 #leftsideMenu li a.active {
	font-weight: bold;
    background-color: #1E3269;
    color: white;
} 

 #leftsideMenu li a:hover:not(.active) {
   
    background-color: #fff;
    color: #1E3269;
}  

/* #leftsideMenu li a:visited{
	font-weight: bold;
    background-color: #1E3269;
    color: white;
} */


.card {
/* display: inline-block;
margin-top: 50px;
margin-left: 20px; */
width: 300px;
height: 400px;
margin-left: 20px;
margin-top: 20px;
}

a {
color: black;
}

#footer {
position: absolute;
left: 0;
bottom: 0;
width: 100%;
/* padding: 30px 0; */
text-align: center;
color: white;
border-top: 1px solid black;
background-color: #1E3269;

}

html {
    position: relative;
    min-height: 150%;
    /* margin: 0; */
    
} 

body {
font-family: 'Noto Sans KR', sans-serif;

}

.card-regular {
background-color: gray;
color: white;
width: 20px;
display: inline;
font-size: 15px;

}

.card-loc {
display: inline-block;
margin-left: 5px;
font-size: 15px;
font-weight: bold;
}

.card-count {
display: inline-block;
float: right;
margin-right: 5px;
font-size: 15px;
margin-top: 2px;
}
.card-date {


}
.card-leader{
float: right;
}

.card-img {
width: 300px;
height: 200px;
object-fit: fill;
}

.card-img-top {
width: 300px;
height: 200px;
object-fit: fill;

}


.card-body {
width: 300px;
height: 150px;
}

/* #addBtn {
margin-top: 20px;
margin-right: 100px;
float: right;
} */

.hr {
border: 0;
height: 1px;
background: #1E3269;
}

a:hover {
color: black;
text-decoration: none;
}

#bottom {
text-align: center;
}


#choice{
display: inline;
}

#search{
display: inline-block;
} 

#sortMenu{
margin-left: 20px;
float: left;
}

#wrapper{
display: block;
margin-top: 10px;
margin-left: 50px;
margin-bottom: 100px;
}

#bottomTable{ 
display: block;
margin-top: 70px;
}

#lefty{
width:200px;
}

#righty{
width:200px;
}

#botty{
margin-top: 100px;
height: 100px;
}


</style>
</head>
<body>
<input type="hidden" id="mem" value=<%=mem %>>
<input type="hidden" id="peri" value=<%=period %>>
<input type="hidden" id="loc" value=<%=location %>>

<script type="text/javascript">
$(document).ready(function() {
	let search = "<%=search %>";
	let choice = "<%=choice %>";
	let period = "<%=period %>";
	let loc = "<%=location %>";
	
	if(search == "") return;

	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
	
});
</script>

<script>
  $(function(){

   var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
   
   
    /* if(location == ""){
	   alert("null");
   } else {
	   alert(location);
	   alert("not null");
	   //alert(location);
	   $.each(loc, function (index, item) {
		   alert("들어왔dt");
		  
		   System.out.println("item" + item);
		    if(item.text() == location){ 
	    	
		   $(this).addClass("active"); 
	   //}  
		});  
   }  */
   
   
   sBtn.find("a").click(function(){ // 지역메뉴 선택시 컬러를 넣어 선택중이라는 표시를 해준다.
	   //alert('a태그 클릭');
	   //alert($(this).text());
	   if (sBtn.find("a").hasClass("active")) { // 이미 선택되어있는 경우
		    sBtn.find("a").removeClass("active"); 
		    $(this).addClass("active");
		    
	   } else {
		   $(this).addClass("active");
	   }
   //$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	   
  });
 });
 

  
function locfunc(ths){
	loc = $(ths).html();
	//alert(loc);
	
    choice = document.getElementById("choice").value;
	search = document.getElementById("search").value;
	period = document.getElementById("peri").value;
	//alert(period);
	if(loc == "전체"){
		loc = "";
	}
	
	<%-- let period = <%=period %>;
	System.out.println(period); --%>
 	location.href = "main.jsp?loc=" + loc + "&period=" + period + "&choice=" + choice + "&search=" + search;
 } 
</script>



<aside>
<div id="leftsideMenu">
 <!-- style="cursor:pointer" --> 
 <ul id="leftsideUl">
 	  <li><a href="#;" onclick="locfunc(this)">전체</a></li>
      <li><a href="#;" onclick="locfunc(this)">강남구</a></li>
      <li><a href="#;" onclick="locfunc(this)">강동구</a></li>
      <li><a href="#;" onclick="locfunc(this)">강서구</a></li>
      <li><a href="#;" onclick="locfunc(this)">강북구</a></li>
      <li><a href="#;" onclick="locfunc(this)">구로구</a></li>
      <li><a href="#;" onclick="locfunc(this)">금천구</a></li>
      <li><a href="#;" onclick="locfunc(this)">관악구</a></li>
      <li><a href="#;" onclick="locfunc(this)">광진구</a></li>
      <li><a href="#;" onclick="locfunc(this)">노원구</a></li>
      <li><a href="#;" onclick="locfunc(this)">도봉구</a></li>
      <li><a href="#;" onclick="locfunc(this)">동대문구</a></li>
      <li><a href="#;" onclick="locfunc(this)">동작구</a></li>
      <li><a href="#;" onclick="locfunc(this)">마포구</a></li>
      <li><a href="#;" onclick="locfunc(this)">서대문구</a></li>
      <li><a href="#;" onclick="locfunc(this)">서초구</a></li>
      <li><a href="#;" onclick="locfunc(this)">성동구</a></li>
      <li><a href="#;" onclick="locfunc(this)">성북구</a></li>
      <li><a href="#;" onclick="locfunc(this)">송파구</a></li>
      <li><a href="#;" onclick="locfunc(this)">양천구</a></li>
      <li><a href="#;" onclick="locfunc(this)">영등포구</a></li>
      <li><a href="#;" onclick="locfunc(this)">용산구</a></li>
      <li><a href="#;" onclick="locfunc(this)">은평구</a></li>
      <li><a href="#;" onclick="locfunc(this)">종로구</a></li>
      <li><a href="#;" onclick="locfunc(this)">중구</a></li>
      <li><a href="#;" onclick="locfunc(this)">중랑구</a></li>
       
    </ul>
    


</div>
</aside>

<div id="sortMenu">
<!-- <a id="sorttotal" href="main.jsp" onclick="sortfunc(this)">전체</a> |-->
<a id="sorttotal" href="#;" onclick="sortfunc(this)">전체</a> |
<a id="sortday" href="#;" onclick="sortfunc(this)">일일모임</a> |
<a id="sortregular" href="#;" onclick="sortfunc(this)">정기모임</a>
</div>
<br><br>

<div align="center">
<table>
<!-- <tr>

<div id="botty"></div>
</tr> -->
<tr>

<% 
for(int i=0; i<crewPage; i++){
	if(pageNumber == i){	// 현재페이지 [1]2[3]
		%>
		 <!-- font-weight: bold; -->
		<td align="center" width="1000px;">
		<span style="font-size: 13pt; color: #0000ff; margin: 20px;">
			<%=i + 1 %>
		</span>&nbsp;&nbsp;
		<%
	} else {	// 그 밖의 페이지
		%>
		<a href="#;" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
		style="font-size: 13pt; color: #000; text-decoration: none">
		[<%=i+1 %>]
		</a>&nbsp;
		</td>
		<%
	}
}

%>

</tr>
<tr align="center">
<td>
<div id="lefty"></div>
<select name="choice" id="choice" style=width:100px;>
	<option value="crewname">크루명</option>
	<option value="content">내용</option>
	<option value="leader">리더명</option>
</select>
<input type="text" size="30" id="search" value="<%=search %>">

<button type="button" id="searchBtn" style=width:80px; onclick="searchBtn()">검색</button>
<button id="addBtn" type="button" style=width:100px; onclick="func()">등록하기</button>
<div id="righty"></div>

<!-- <hr class="hr">
 -->
</td>
</tr>
</table>
</div>

 <!-- 각자 만들어야할 페이지(게시판 등) 넣는 부분 -->
<div id="wrapper">


 <% if(list == null || list.size() == 0){ %>
<h4>작성된 글이 없습니다.</h4>

<% } else { 
%>	 

<%	 
 for(int i = 0; i < list.size(); i++){
	 CrewDto clist = list.get(i);
	
	 /* imageFile = (clist.getFilename()).trim();
	 System.out.println("imageFile: " + imageFile);
	 if(clist.getFilename().equals("없음")){
		 imageFile = "러닝메이트.png";
		 System.out.println("imageFile2: " + imageFile);
	 } */%>

	 
 <div class="card" *ngFor="let item of cards" style="max-width: 300px; /* max-height:550px; */ float:left;" >
  <a href="crewdetail.jsp?seq=<%=clist.getSeq()%>">
  <div class="card-img">   
 <img class="card-img-top" src="upload/<%=clist.getNewfilename() %>">
  </div>
   <div class="card-body">
   	  <p class="card-regular"><%=clist.getPeriod() %></p>
   	  <p class="card-loc"><%=clist.getLoc() %></p>
   	  <p class="card-count"><%=clist.getCurcount() %>명 참여 / <% if(clist.getMaxcount() == 1000){ %>제한없음<% } else { %> <%=clist.getMaxcount() %>명 제한 <% } %></p>
      <h5 class="card-title"><%=clist.getGname() %></h5>
      <p class="card-date">
         
         <%
         String date = clist.getDate();
         String year = "";
         String month = "";
         String day = "";
         String hour = "";
         String min = "";
         // 2021-06-2109:00
         if(date.matches(".*[0-9].*")) { // 숫자 포함 여부 정규식
            year = date.substring(0, 4);
            month = date.substring(5, 7);
            day = date.substring(8, 10);
            hour = date.substring(10, 12);
            min = date.substring(13);
            date = year + "년 " + month + "월 " + day + "일 " + hour + "시 " + min + "분"; 
         }else {
            
         }
         %>
         <%=date %><br>
         <%
         if(clist.getMeetloc() != null){
         clist.getMeetloc(); 
         } %>
         
         
      </p>
      <p class="card-leader">크루리더 <b><%=clist.getLeaderName() %></b></p>
   </div>
  </a>
</div> <!-- end of card -->


<% 
 }
%>

<%
 } %>

</div> <!-- end of wrapper -->
<!-- </tr> -->
<br><br>


<div id="bottomTable">

</div> <!-- end of bottomTable -->



<script type="text/javascript">

function sortfunc(ths) {
    period = $(ths).html();
    choice = document.getElementById("choice").value;
	search = document.getElementById("search").value;
	loc = document.getElementById("loc").value;
	//alert(loc);
 	location.href = "main.jsp?loc=" + loc + "&period=" + period + "&choice=" + choice + "&search=" + search;
	//location.href = "main.jsp?period=" + period + "&choice=" + choice + "&search=" + search;
} 
<%-- function goDetail(seq){
	if(<%=mem %> == null){
		alert("로그인 해주세요");
		location.href = "login.jsp";
	} else {
	location.href = 'addcrew.jsp';
	}
} --%>

function func(){
	let mem = document.getElementById("mem").value;
	if(mem == null){
		alert("로그인 해주세요");
		location.href = "login.jsp";
	} else {
	location.href = 'addcrew.jsp';
	}
}

function searchBtn() {
	//alert('searchBtn');
	
    let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	period = document.getElementById("peri").value;
	loc = document.getElementById("loc").value;
	
	/* if(search.trim() == ""){
		alert('검색어를 입력해 주세요.');
		return;
	} 
	 */
	location.href = "main.jsp?loc=" + loc + "&period=" + period + "&choice=" + choice + "&search=" + search;
	//location.href = "main2.jsp?choice=" + choice + "&search=" + search; 
}

function goPage(pageNum){
	//alert('안녕');
	    let choice = document.getElementById("choice").value;
		let search = document.getElementById("search").value;
		period = document.getElementById("peri").value;
		loc = document.getElementById("loc").value;
		
	//alert(pageNum); 
    location.href = "main.jsp?loc=" + loc + "&period=" + period + "&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
	//location.href = "main.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

</script>

</body>

</html>
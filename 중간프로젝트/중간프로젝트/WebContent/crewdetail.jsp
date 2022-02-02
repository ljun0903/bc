<%@page import="dto.MemberDto"%>
<%@page import="dto.CrewDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CrewDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%// 로그인이 풀렸을 때 다시 로그인 하게끔
MemberDto mem = (MemberDto)session.getAttribute("login");

String id = "";
String name = "";
if(mem == null){
	
} else {
	id = mem.getId();
	name = mem.getName();
}
%> 
   
<%
String seq = request.getParameter("seq");

CrewDao dao = CrewDao.getInstance();

CrewDto dto = dao.getCrewDetail(seq);

boolean s = dao.checkCrewMember(seq, id);
System.out.println("s: "+s);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 


<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
                #topMenu {            
                        height: 30px;
                        width: 640px;
                }
                
                #topwrapper {
                height: 30px;
                width: 100%;
                background-color:#1E3269; 
                }
                
                #loginMenu ul li {
                list-style: none;
                margin-left: 15px;   
                float: right; 
                font-size: 13px;
                display: inline;
                }
                a { text-decoration:none }
                
                #loginMenu {
                margin-right: 230px;
                   margin-top: 20px;
                }
                
                #loginMenu a {
                 color: black;

                }
                
                #topMenu ul li {                      
                        list-style: none;         
                        color: white;              
                        background-color: #1E3269;  
                        float: left;                
                        line-height: 30px;          
                        vertical-align: middle;     
                        text-align: center;         
                }
                #topMenu .menuLink {                               
                        text-decoration:none;                      
                        color: white;                             
                        display: block;                            
                        width: 150px;                              
                        font-size: 12px;                           
                        font-family: "Trebuchet MS", Dotum, Arial; 
                }
                #topMenu .menuLink:hover {            
                        color: black;                  
                        background-color: #fff;   
                }
                
                #homeName {
                /* font-family:"Courier New"; */
                 font-weight: bold;                      
                 margin-top:155px;
                font-size: 40px;
                display: inline;
                margin-right: -350px;
                }
                
                #homeName a {
                text-decoration:none;  
                color: black;
                }
                
                #topNav {
                padding-top:50px;
                padding-bottom: 10px;
                }
                
                
                #wrapper { 
/*                 width: 
 */                }
                
                
#leftsideMenu {
    padding-left: 5%;
    width: 20%;
    height: 930px;
    border-right: 1px solid #1E3269;
    display: inline;
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

.loc_choice {
margin-bottom: 13px; 
margin-top: 10px;
}


/* #footer {
position: absolute;
left: 0;
bottom: 0;
width: 100%;
padding: 30px 0;
text-align: center;
color: white;
border-top: 1px solid black;


} */

html {
    position: relative;
    min-height: 150%;
    margin: 0;
    
}

body {
font-family: 'Noto Sans KR', sans-serif;
}

#repImage {
display: inline;
width: 500px;
height: 300px;
object-fit: fill;

}

#crewInfo {
display: inline-block;
margin-left: 10px;
height: 300px;
width: 300px;
}



#image {
object-fit: fill;
width: 500px;
height: 300px;
}

#period{
background-color: gray;
color: white;
width: 20px;
display: inline;
font-size: 15px;
}

#loc {
display: inline-block;
float: right;
font-weight: bold;
font-size: 17px;
}

hr {
background-color: light gray;
}

#date {
text-align: right;
}

#count {
text-align: right;
}

#wrapper{
margin-top: 30px;
}

.joinBtn{
width: 200px;
margin-top: 30px;
margin-left: 50px;
}

.leaderBtn{
margin-top: 30px;
margin-left: 50px;
width: 200px;
}
.Btn{
margin-top: 30px;
margin-left: 30px;
width: 120px;
}

.Btn2{
margin-top: 30px;
margin-left: 10px;
width: 120px;
}

#meetloc{
text-align: right;
}

#course{
text-align: right;
}

#crewContent {
margin-top: 30px;
}

#deleteBtn {
margin-left: 10px; 
}

#btns {
float: right;
}

table{
width: 1000px;
margin: auto;
}       

/* #division{
display: block;
} */

h2{
	text-indent: 20px;
}
</style>
</head>
<body>

<div id="wrapper">

<div id="topNav" align="center">
<header>
<div id="loginMenu">
	<ul>
	                    <% if(mem == null ) { %>
						<li><a class="menuLink" href="login.jsp">로그인</a></li>
                        <li><a class="menuLink" href="regi.jsp">회원가입</a></li>
                        <% } else { %>
                        <li><a class="menuLink" href="logout.jsp">로그아웃</a></li>
	                    <li><a class="menuLink" href="myPage.jsp?name=<%=mem.getName()%>">마이페이지</a></li>
	                    <li><a class="menuLink" href="#;"><%=mem.getName() %>님</a></li>
	                    
                        <% } %>
	
	</ul>
	</div>
		<div id="homeName">
	<span><a class="menuLink" href="main.jsp">RUNNING MATE</a></span>
	
	</div>
	
</header>	
<div id="topwrapper">
        <nav id="topMenu" >
        	
        
                <ul>
                		
                        <li><a class="menuLink" href="#">크루참여</a></li>
                        <li><a class="menuLink" href="#">자유게시판</a></li>
                        <li><a class="menuLink" href="#">인증게시판</a></li>
                        <li><a class="menuLink" href="#">1:1문의</a></li>
                        
                </ul>
        </nav>
        </div>
        
</div>

<script type="text/javascript">
function locfunc(ths){
	loc = $(ths).html();
	
	if(loc == "전체"){
		loc = "";
	}
	
 	location.href = "main.jsp?loc=" + loc;
 } 
 </script>

<aside>
<div id="leftsideMenu">
 <!-- style="cursor:pointer" --> 
 <ul id="leftsideUl">
 	  <li><a class="loc_choice" href="#;" onclick="locfunc(this)">전체</a></li>
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


<!-- <aside>
<div id="leftsideMenu">

 <ul>
 	  <li><a class="loc_choice">지역별</a></li>
      <li><a class="active" href="#home">강남구</a></li>
      <li><a href="#news">광진구</a></li>
      <li><a href="#contact">구로구</a></li>
      <li><a href="#about">강서구</a></li>
    </ul>

</div>
</aside>  -->

<section> <!-- 각자 만들어야할 페이지(게시판 등) 넣는 부분 -->
<!-- <span id="headline">크루정보</span> -->
<h2>크루정보</h2>
<div id="division">
<table>
<col width="300"><col width="400">
<% 
if(mem != null){
	if((mem.getName()).equals(dto.getLeaderName())){ %> <!-- 리더네임과 로그인네임이 같을 때만 수정,삭제버튼 생성 -->
	<tr>
		<th></th>
	<td>
		<div id="btns">
		<input type="button" id="modifyBtn" onclick="modify()" value="수정">
		<input type="button" id="deleteBtn" onclick="del('<%=dto.getNewfilename() %>', <%=dto.getSeq() %>)" value="삭제">
		</div>
	</td>
	</tr>
<% 
	}
}
%>

	<tr>
		<td>
			<img id="image" src="upload/<%=dto.getNewfilename() %>">
		</td>
		<td>
			<p id="loc"><%=dto.getLoc() %></p>
			<p id="period"><%=dto.getPeriod() %></p>
			<h3><%=dto.getGname() %></h3>
			<hr>
 <%
         String date = dto.getDate();
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
         
<p id="date"><%=date %></p>
  <%

   if(dto.getMeetloc() != null){ %>
   <p id="meetloc"><b>모임장소 - </b>&nbsp;&nbsp;<%=dto.getMeetloc() %></p>
   <p id="course"><b>코스 - </b><%=dto.getCourse() %></p>
  <% } %>
<p id="count"><%=dto.getCurcount() %>명 참여 / <% if(dto.getMaxcount() == 1000){ %>제한없음<% } else { %> <%=dto.getMaxcount() %>명 제한 <% } %></p>


<% if(s == true) { %>
<% if(mem.getName().equals(dto.getLeaderName())) { %>
<input type="button" class="leaderBtn" onclick="goCommunity(<%=dto.getSeq() %>, '<%=name %>', '<%=id %>')" value="커뮤니티">
<%
} else {%>
<input type="button" class="Btn" onclick="goCommunity(<%=dto.getSeq() %>, '<%=name %>', '<%=id %>')" value="커뮤니티">
<input type="button" class="Btn2" onclick="drop(<%=dto.getSeq() %>, '<%=name %>', '<%=id %>')" value="탈퇴하기">
<%
}
} else { %>
<p id="Btn"><input type="button" onclick="join(<%=dto.getSeq() %>, '<%=name %>', '<%=id %>')" class="joinBtn" value="참여하기"></p>
<% } %>

</td>

</tr>
<tr>
<td>
<br><br>
<% if(dto.getMeetloc() != null){ %>
<h5>모임장소</h5>
<div id="map" style="margin:auto 0;width:600px;height:350px;"></div>
<% } %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ca38279a4625985f230ca7162f4fbf2&libraries=services"></script>

<script type="text/javascript">
function modify() {
	location.href = "crewmodify.jsp?seq=<%=dto.getSeq() %>";
}

function del(newfilename, seq){
	location.href = 'crewdelAf.jsp?newfilename=' + newfilename + '&seq=' + seq;
}

function del2(newfilename, seq){
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		
		location.href = 'filedel?newfilename=' + newfilename + '&seq=' + seq;

	}else{   //취소

	    return;

	}
}

function goCommunity(seq, name, id){
	//alert(name + id);

	       location.href = "crewCommunity.jsp?seq=" + seq + "&name=" + name + "&id=" + id;
		
}



function join(seq, name, id){
	//alert(name + id);

	if(name == "") {
		   //alert("로그인 해주십시오");
		   location.href = "login.jsp";
		} else {
	       location.href = "crewjoin.jsp?seq=" + seq + "&name=" + name + "&id=" + id;
		}
}

function drop(seq, name, id){
	if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
		
	    location.href = "crewdrop.jsp?seq=" + seq + "&name=" + name + "&id=" + id;

	}else{   //취소
	    return;
	}
}

</script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('<%=dto.getMeetloc() %>', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:14px;">모임장소<p style="font-size:10px"><%=dto.getMeetloc() %></p></div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>
</td>
</tr>
<tr>
<td>
<div id="crewContent">
<h5>크루소개</h5>
<p><%=dto.getContent() %></p>
</div>
</td>
</tr>

</table>
</div>
</section>




<footer>
<div id="footer">



</div>
</footer>

</div>
</body>

</html>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CrewDao"%>
<%@page import="java.util.List"%>
<%@page import="dto.CrewDto"%>
<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
String id = mem.getId();
System.out.println("id : " + id);
CrewDao dao = CrewDao.getInstance();
List<Integer> li = dao.myCrewSeq(id);

List<CrewDto> list = new ArrayList<CrewDto>();


for(int i=0; i<li.size(); i++){
   int seq = li.get(i);
   //System.out.println("li.size()"+ li.size());
   //System.out.println("list.size()" + list.size());
   list.add(dao.myCrewList2(seq));
   
}


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.card {
/* display: inline-block;
margin-top: 50px;
margin-left: 20px; */
width: 300px;
height: 400px;
margin-left: 20px;
margin-top: 20px;
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

h2{
   text-indent: 20px;
}

</style>
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
      <li><a href="mymyCrew.jsp">참여중인 크루</a>
         <!-- <ul>
            <li><a>정기크루</a></li>
          <li><a>일일크루</a></li>
         </ul> -->
      </li>
      <li><a href="mymyCalendar.jsp<%-- ?name=<%=mem1.getName() %> --%>">나의 캘린더</a></li>
      <li><a href="#">나의 게시물</a>
         <ul>
            <li><a href="mymyFreeBbs.jsp?pdsnum=<%=1%>">자유게시판</a></li>
            <li><a href="mymyReviewBbs.jsp?pdsnum=<%=2%>">인증게시판</a></li>
            <li><a href="mymyGroupBbs.jsp?pdsnum=<%=3%>">그룹게시판</a></li>
            <li><a href="mymyQueryBbs.jsp?pdsnum=<%=4%>">문의게시판</a></li>
         </ul>
      </li>
   </ul> 
   
</div>
</aside>


<h2>참여중인 크루</h2>

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
  <a href="mymyCrewdetail.jsp?seq=<%=clist.getSeq()%>">
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

</body>
</html>
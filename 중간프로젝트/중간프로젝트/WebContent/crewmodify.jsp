<%@page import="dto.MemberDto"%>
<%@page import="dto.CrewDto"%>
<%@page import="dao.CrewDao"%>
<%@ include file="header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%// 로그인이 풀렸을 때 다시 로그인 하게끔
if(mem == null) {
%>
   <script>
   alert("로그인 해 주십시오");
   location.href = "login.jsp";
   </script>   
<%
}
%>
<% 

String seq = request.getParameter("seq");

CrewDao dao = CrewDao.getInstance();

CrewDto dto = dao.getCrewDetail(seq);

%>


<%
         String date = dto.getDate();
        
         String day = "";
         String time = "";
         // 2021-06-2109:00
         if(date.matches(".*[0-9].*")) { // 숫자 포함 여부 정규식
            
            day = date.substring(0, 10);
            time = date.substring(10);
         }
         %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#container {
padding-left: 150px;
width: 400px;
} 
.form-control {
width: 600px;
margin-left: 100px;
}

#repImage {
width: 300px;
height: 170px;
margin-left: 240px;
}



/* .contain {
width: 700px;
} */
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>


<form id="myfrm" action="crewmodiAf.jsp?seq=<%=dto.getSeq() %>" method="post" enctype="multipart/form-data">
   <input type="hidden" name="seq" value="<%=dto.getSeq() %>">
   <input type="hidden" name="id" value="<%=mem.getId() %>">
   <input type="hidden" name="name" value="<%=mem.getName() %>">
   <div id="container" class="form-group">
   <div class="col-lg-4"></div>
   
   <h2> 크루모집 </h2>
   <p></p>
                지역선택  &nbsp; &nbsp;<select id="loc" name="loc" class="form-control">
                     <option value="select">선택</option>
                     <option value="강남구">강남구</option>
                     <option value="강동구">강동구</option>
                     <option value="강서구">강서구</option>
                     <option value="강북구">강북구</option>
                     <option value="구로구">구로구</option>
                     <option value="금천구">금천구</option>
                     <option value="관악구">관악구</option>
                     <option value="광진구">광진구</option>
                     <option value="노원구">노원구</option>
                     <option value="도봉구">도봉구</option>
                     <option value="동대문구">동대문구</option>
                     <option value="동작구">동작구</option>
                     <option value="마포구">마포구</option>
                     <option value="서대문구">서대문구</option>
                     <option value="서초구">서초구</option>
                     <option value="성동구">성동구</option>
                     <option value=성북구>성북구</option>
                     <option value=송파구>송파구</option>
                     <option value="양천구">양천구</option>
                     <option value="영등포구">영등포구</option>
                     <option value="용산구">용산구</option>
                     <option value="은평구">은평구</option>
                     <option value="종로구">종로구</option>
                     <option value="중구">중구</option>
                     <option value="중랑구">중랑구</option>
                  </select>
                               
   
   <p>모임유형</p>
   <div id="radioBtn">
   <input type="radio" name="period" id="pregular" value="정기모임" class="form-control1">정기모임
   <input type="radio" name="period" id="pday" value="일일모임" class="form-control1">일일모임
   </div>
   <p>날짜선택</p>
   <div id="choiceDate1">
   <input type="radio" name="regular" value="매주 월요일" class="form-control1">월&nbsp;&nbsp;
   <input type="radio" name="regular" value="매주 화요일" class="form-control1">화&nbsp;&nbsp;
   <input type="radio" name="regular" value="매주 수요일" class="form-control1">수&nbsp;&nbsp;
   <input type="radio" name="regular" value="매주 목요일" class="form-control1">목&nbsp;&nbsp;
   <input type="radio" name="regular" value="매주 금요일" class="form-control1">금&nbsp;&nbsp;
   <input type="radio" name="regular" value="매주 토요일" class="form-control1">토&nbsp;&nbsp;
   <input type="radio" name="regular" value="매주 일요일" class="form-control1">일
   </div>
   <div id="choiceDate2">
   <input type="date" id="day" name="day" class="form-control">
   <input type="time" id="time" name="time" class="form-control">
   <p>모임장소</p>
   <input type="button" onclick="getPostcode()" value="주소 검색"><br>
   <input type="text" id="meetloc" name="meetloc" class="form-control">
   <div id="map" style="width:600px;height:350px;"></div>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ca38279a4625985f230ca7162f4fbf2&libraries=services"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
   <p>코스</p>
   <input type="text" id="course" name="course" class="form-control">
   </div>
   
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

    function getPostcode() {
    	//마커를 생성
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(37.537187, 127.005476),
            map: map
        });
    	
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("meetloc").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:14px;">모임장소<p style="font-size:10px">'+ addr +'</p></div>'
                        });
                        infowindow.open(map, marker);
                    }
                });
            }
        }).open();
    }
</script>
   
                  
   <p>그룹명</p>
   <input type="text" id="crewname" name="crewname" class="form-control" maxlength="20">
   <p>그룹인원</p>
                     <select id="maxcount" name="maxcount" class="form-control">
                     <option value="1000">제한없음</option>
                     <option value="10">10명</option>
                     <option value="20">20명</option>
                     <option value="30">30명</option>
                     <option value="40">40명</option>
                     <option value="50">50명</option>
                     <option value="60">60명</option>
                     <option value="70">70명</option>
                     <option value="80">80명</option>
                     <option value="90">90명</option>
                     <option value="100">100명</option>
                     </select>
                     
                     
      <p>대표이미지 등록</p>
      <input type="file" id="file" class="form-control" name="file">
      <img id="repImage" src="upload/<%=dto.getNewfilename() %>">    
      <input type="hidden" id="filename" name="filename" value="<%=dto.getFilename() %>">
      <input type="hidden" id="newfilename" name="newfilename" value="<%=dto.getNewfilename() %>">
      
      
      <script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#file").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#repImage").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>          
                     그룹소개<br>
      <textarea rows="10" cols="50" id="content" name="content" class="form-control" style="resize: none;"><%=dto.getContent() %></textarea>              
                     
                     
                     <button id="modiBtn" type="submit" class="form-control">수정하기</button>
   </div>  
   
         </form>
                  
<script type="text/javascript">
$(document).ready(function(){
	
	if($("#file").change(function() {
    	$("#filename").val("사진변경");
    }));

	
$('#loc').val('<%=dto.getLoc() %>').prop("selected", true);

$("input:radio[name='period']:radio[value='<%=dto.getPeriod() %>']").prop('checked', true);


// 정기모임 - 요일 선택만 나오게, 저장값에 따라 체크 || 일일모임 - 날짜,시간,장소,코스 나오게
if($("input:radio[name='period']:checked").val() == '일일모임')	{
	
	$("#choiceDate2").show();
	$("#choiceDate1").hide();

    $("#day").val("<%=day %>");
	$("#time").val("<%=time %>");
	
	$("#meetloc").val("<%=dto.getMeetloc() %>");
	$("#course").val("<%=dto.getCourse() %>");
} else {
	
	$("#choiceDate1").show();
	$("#choiceDate2").hide();
	
	$("input:radio[name='regular']:radio[value='<%=dto.getDate() %>']").prop('checked', true);

}



$("#crewname").val("<%=dto.getGname() %>");

var maxcount = <%=dto.getMaxcount() %>;

if(maxcount == 1000){
 $('#maxcount').val('제한없음').prop("selected", true);
} else {
 $('#maxcount').val(maxcount).prop("selected", true);
}

<%-- $('#content').val("<%=dto.getContent() %>"); --%>

 <%--
var content = <%=dto.getContent() %>; 
$("#content").val(content);
});  --%>

// 정기모임 선택시 요일만, 일일모임 선택시 날짜, 시간 나오게
	   //$("#day").attr("type","hidden");
	    $("#pregular").click(function() {
	    	$("#choiceDate2").hide();
	    	$("#choiceDate1").show();
		    //alert('정기모임');
	   		/* $("input:[name='day']").attr("type", "hidden");  */
	   }); 
	   
	    $("#pday").click(function() {
	    	$("#choiceDate1").hide();
	    	$("#choiceDate2").show();
		   //alert('일일모임');
		   //$("input:radio[name='regular']").attr("type","hidden"); 
	   });
});

</script>      
                  
                  
                   
</body>
</html>
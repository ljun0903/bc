<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ca38279a4625985f230ca7162f4fbf2&libraries=services"></script> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="basic.css">

<style type="text/css">
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
#container {
padding-left: 150px;
} 
.form-control {
width: 600px;
margin-left: 100px;
}

#repImage {
width: 300px;
height: 170px;
}


/* .contain {
width: 700px;
} */
</style>
</head>
<body>

<form id="myfrm" action="addcrewAf.jsp" method="post" enctype="multipart/form-data">
   <input type="hidden" name="id" value="<%=mem.getId() %>">
   <input type="hidden" name="name" value="<%=mem.getName() %>">
   
   <div id="container" class="form-group">
   <div class="col-lg-4"></div>
   
   <h2> 크루모집 </h2>
   
   <p></p>
                지역선택  &nbsp; &nbsp;<select name="loc" class="form-control">
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
   <input type="radio" name="period" id="pregular" value="정기모임" class="form-control1" checked>정기모임
   <input type="radio" name="period" id="pday" value="일일모임" class="form-control1">일일모임
   </div>
   <p>날짜선택</p>
   <div id="choiceDate1">
   <input type="radio" name="regular" value="매주 월요일" class="form-control1" checked>월&nbsp;&nbsp;
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
   <input type="text" class="form-control" id="meetloc" name="meetloc" placeholder="주소" size="50">
   
   <div id="map" style="width:600px;height:350px;margin-top:10px;display:none"></div>
   
   <p>코스등록</p>
<!--    <div id="map" style="width:100%;height:350px;"></div> -->   
   <input type="text" id="course" name="course" class="form-control">
   <!-- <input type="hidden" id="distance" name="distance"> -->
   </div>
<script>

	/* var path;
	var loc = document.getElementById('loc').value;
	if( loc == "마포구"){
		path = 37.566289611303745, 126.90164053396259
	} */
$(document).ready(function() {
	
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
});

    function getPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
               // alert(addr);
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
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }

</script>
   <script type="text/javascript">
 
   $(document).ready(function() {
	   $("#repImage").hide();
	   
	   //$("#day").attr("type","hidden");
	    $("#choiceDate2").hide();
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
  
   
                  
   <p>그룹명</p>
   <input type="text" name="crewname" class="form-control" maxlength="20">
   <p>그룹인원</p>
                     <select name="maxcount" class="form-control">
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
      <input type="file" id="file" class="form-control" name="file" required>
      <img id="repImage" src="">    
      
<script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#file").on("change", handleImgFileSelect);
        
        if($("#file").change(function() {
        	$("#repImage").show();
        }));
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
                     
                     <br>그룹소개<br>
      <textarea rows="10" cols="50" name="content" class="form-control" style="resize: none;"></textarea>              
                     
                     
                     <button type="submit" class="form-control">등록하기</button>
   </div>  
   
         </form>
                   
</body>
</html>
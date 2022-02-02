<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<title>쿠킹클래스 작성페이지</title>
</head>
<script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css">

<fmt:requestEncoding value="utf-8"/>
    
<form name="frmForm" id="_frmForm" action="ccupload.do" method="post" enctype="multipart/form-data">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	var nickname = '${login.nickname}';
	if(nickname == null || nickname == '') {
		alert('로그인이 필요합니다');
		location.href='login.do';
	}
</script>

<h1 style="text-align: center">클래스 생성</h1>
<br>
<table class="writeTable" style="margin-left:auto; margin-right:auto;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tr hidden="hidden">
	<th>닉네임</th>
	<td style="text-align: left">
		<input type="text" name="nickname" value='${login.nickname}' size="50" readonly="readonly">
	</td>
</tr>
<tr>
	<th>클래스명</th>
	<td style="text-align: left">
		<input type="text" name="title" style="width: 100%;">
	</td>
</tr>
<tr>
	<th>위치</th>
	<td class="input-group">
		<input type="text" name="sample2_address" id="sample2_address" placeholder="주소"><br>
		<input type="text" name="sample2_detailAddress" id="sample2_detailAddress" placeholder="상세주소">
		<input type="text" name="ample2_extraAddress" id="sample2_extraAddress" placeholder="참고항목">
		<input class="button-slide" type="button" onclick="sample2_execDaumPostcode()" value="주소검색"><br>
		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"  id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼"> 
	</td>   
</tr>
<tr>
	<th>대표사진지정</th>
	<td style="text-align: left">
		<input type="file" id="filelod" name="fileload" style="width: 100%">  
	</td>
</tr>
<tr>
    <th>카테고리</th>
	<td style="text-align: left">
	<select name="kinds" id="kinds">
		<option value="" selected="selected">선택</option>
        <option value="한식">🍲한식</option>
      	<option value="일식">🍣일식</option>
        <option value="중식">🍜중식</option>
        <option value="양식">🍕양식</option>
        <option value="베이커리">🍰베이커리</option>
        <option value="기타">기타</option>
    </select>
   	</td>
</tr>
<tr>
	<th>모집인원</th>
	<td style="text-align: left">
		<input type="text" id="membernum" name="membernum" placeholder="모집최소인원은 2명입니다" style="width: 50%">
		<select id="numchoice" onchange="change_membernum();">
	      <option value="">직접입력</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
	      <option value="5">5</option>
	      <option value="6">6</option>
	      <option value="7">7</option>
	      <option value="8">8</option>
	      <option value="9">9</option>
	      <option value="10">10</option>
	      <option value="15">15</option>
	      <option value="20">20</option>
	      <option value="25">25</option>
	      <option value="30">30</option>
	      <option value="35">35</option>
	      <option value="40">40</option>
	      <option value="45">45</option>
	      <option value="50">50</option>
	  </select>
	  </td>
</tr>
<tr>
	<th>모집마감날짜</th>
	<td style="text-align: left"><input type="date" id="edate" name="edate" class="form-control" min="today"></td>
</tr>
<tr>
	<th>클래스기간</th>
	<td>
		<input type="date" id="cdate1" name="cdate1" class="form-control" min="today">
		<input type="date" id="cdate2" name="cdate2" class="form-control" min="today">
	</td>
</tr>
<tr>
	<th>클래스요일</th>
	<td class="checks etrans" style="padding: 0px">
		<input type="checkbox" name="day" id="day1" value="월"><label for="day1">월</label>&nbsp;&nbsp;
		<input type="checkbox" name="day" id="day2" value="화"><label for="day2">화</label>&nbsp;&nbsp;
		<input type="checkbox" name="day" id="day3" value="수"><label for="day3">수</label>&nbsp;&nbsp;
		<input type="checkbox" name="day" id="day4" value="목"><label for="day4">목</label>&nbsp;&nbsp;
		<input type="checkbox" name="day" id="day5" value="금"><label for="day5">금</label>&nbsp;&nbsp; 
		<input type="checkbox" name="day" id="day6" value="토"><label for="day6">토</label>&nbsp;&nbsp;
		<input type="checkbox" name="day" id="day7" value="일"><label for="day7">일</label>&nbsp;&nbsp;
	</td>
</tr> 
<tr hidden="hidden"> 
	<th>클래스요일</th>
	<td>
		<input type="hidden" name="cday" id="hiddenValue" value=""/>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left; background-color : white; padding: 0px ">
  		<textarea id="summernote" name="content"></textarea>
	</td>
</tr>
<tr style="border-left-style: none; border-right-style: none; border-bottom-style: none;">
	<td colspan="2" style="height:50px; text-align:center;" >
		<span>	
			<br>
			<button class="button-slide" type="button" id="_ccwrite" title="모임생성하기" onclick="ccwrite();">생성하기</button>
			<button class="button-slide-red" type="button" title="글보기" onclick="location.href='cclist.do'">취소</button>
		</span>
	</td>
</tr>
</table>
</form>    

<!-- 선택요일값 가져오기  -->
<script type="text/javascript">
function cday(){
    var obj = $("[name=day]");
    var chkArray = new Array(); // 배열 선언

    $('input:checkbox[name=day]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        chkArray.push(this.value);
    });
    $('#hiddenValue').val(chkArray);
    
    //alert($('#hiddenValue').val()); // 아래 체크박스가 모두 체크되어 있다면 1,2,3,4 가 출력 된다.
    
}
</script>

<!-- 모집인원 선택한 value 값 text에 자동 넣기-->
<script type="text/javascript"> 
function change_membernum() { 
	 
	  var membernum = document.getElementById("membernum");
	  var numchoice = document.getElementById("numchoice");
	
	  var idx = numchoice.options.selectedIndex;
	  var val = numchoice.options[idx].value;
	  membernum.value = val;
	}
</script>

<!-- 오늘날짜 이후 선택가능 -->
<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("edate").setAttribute("min", today);
document.getElementById("cdate1").setAttribute("min", today);
document.getElementById("cdate2").setAttribute("min", today)
</script>

<!-- 썸머노트 설정 -->
<script> 
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		 toolbar: [ //툴바 설정
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['link']],
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		  height: 300,                 // 에디터 높이
		  minHeight: 400,             // 최소 높이
		  maxHeight: 300,             // 최대 높이
		  focus : true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '내용을 입력해주세요' 	//placeholder 설정
	});
}); 
</script>

<!-- 카카오주소api 설정 -->
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                /* document.getElementById('sample2_postcode').value = data.zonecode; */
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 400; //우편번호서비스가 들어갈 element의 width
        var height = 500; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 3; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/3 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/1.8 - borderWidth) + 'px';
    }
</script>

<!-- 유효성 검사 및 버튼 -->
<script type="text/javascript">
$("#_ccwrite").click(function() {
 	let title = document.frmForm.title;
	let location1 = document.frmForm.sample2_address;
	let location2 = document.frmForm.sample2_detailAddress
	let fileload = document.frmForm.fileload;
	let kinds = $("#kinds option:selected").val();
	let membernum = document.frmForm.membernum;
	let content = document.frmForm.content;
	let cdate1 = document.frmForm.cdate1;
	let cdate2 = document.frmForm.cdate2;
	let edate = document.frmForm.edate;
	let len = $('input:checkbox[name=day]').is(':checked');
	 
	let v = confirm("클래스를 생성하시겠습니까?");
	
	if(title.value.trim() == ""){
		alert("제목을 입력하세요");
		title.focus();
		return false;
	}if(location1.value.trim() == ""){
		alert("주소를 입력하세요");
		location1.focus();
		return false;
	}if(location2.value.trim() == ""){
		alert("상세주소를 입력하세요");
		location2.focus();
		return false;
	}if(fileload.value.trim() == ""){
		alert("대표사진을 지정하세요");
		fileload.focus();
		return false;
	}if(kinds == ""){
		alert("카테고리를 지정하세요");
		document.getElementsByName("kinds")[0].focus();
		return false;
	}if(membernum.value.trim() == ""){
		alert("모집인원을 지정하세요");
		membernum.focus();
		return false;
	}if(membernum.value.trim() < 2){
		alert("모집인원의 최소인원은 2명입니다");
		membernum.focus();
		return false;
	}if(cdate1.value.trim() == ""){
		alert("수업시작일을 지정해주세요");
		cdate1.focus();
		return false;
	}if(cdate2.value.trim() == ""){
		alert("수업마지막일을 지정해주세요");
		cdate2.focus();
		return false;
	}if(cdate2.value < cdate1.value){
		alert("수업일을 확인해주십시요");
		cdate2.focus();
		return false;
	}if(edate.value.trim() == ""){
		alert("모집마감날짜를 지정해주세요");
		edate.focus();
		return false;
	}if(len < 1){ 
		alert("수업요일을 지정해주세요");
		$('#day').focus();
		return false;
	}if(content.value.trim() == ""){
		alert("내용을 입력하세요");
		content.focus();
		return false;
	}else if (v==true) {
		cday();
		$("#_frmForm").submit();
	 }
});

</script> 
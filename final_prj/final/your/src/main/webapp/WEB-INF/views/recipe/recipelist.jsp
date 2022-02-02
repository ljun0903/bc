<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>

<html>


		<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>RecipeList</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
<!--        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    	<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">레시피 종류</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">전체</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="recipe.do?search=한식&choice=reccategory">한식</a></li>
                                <li><a class="dropdown-item" href="recipe.do?search=일식&choice=reccategory">일식</a></li>
                                <li><a class="dropdown-item" href="recipe.do?search=중식&choice=reccategory">중식</a></li>
                                <li><a class="dropdown-item" href="recipe.do?search=양식&choice=reccategory">양식</a></li>
                                <li><a class="dropdown-item" href="recipe.do?search=베이커리&choice=reccategory">베이커리</a></li>
                   			 </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!"></a></li>
                    </ul>
                    </div>
                    </div>
                    </nav> -->
<script type="text/javascript">
<%-- var search = "<%=search %>"; --%>
var search = "${search}";
var choice = "${choice}";

$(window).load(function () {
	if(search != ""){
		$("#_choice").val( choice );
		
		document.getElementById("_search").value = search;
		document.getElementById("_choice").value = choice;
	}	
});
</script>
				<!-- 검색 -->
				<div class="box_border" style="margin-top: 5px;margin-bottom: 10px">
				<table style="margin-left: auto;margin-right: auto; margin-top: 3px; margin-bottom: 3px">
				<tr>
					<td></td>
					<td style="padding-left: 5px">
						<select id="_choice" name="choice" class="justselect">
							<option value="" selected="selected">선택</option>
							<option value="recipetitle">제목</option>
							<option value="reccategory">종류</option>
							<option value="writer">작성자</option>
						</select>	
					</td>
					<td style="padding-left: 5px">
						<input type="text" id="_search" name="search">					
						<button class="button-slide" type="button" id="btnSearch" >Search</button>					
					</td>
				</tr>			
				</table>			
				</div>
				<!-- <a href="recipewrite.do">등록하기</a> -->
 
        <section class="py-5">
        <h3 align="center"></h3>
            <div class="container px-4 px-lg-5 mt-5">
               <c:if test="${empty recipelist}"><h3 style="margin-left: auto; margin-right: auto;">검색결과가 없습니다.<img alt="" src="image/swet.png" style="left: 50%"></h3>
               </c:if>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">
                    <c:forEach var="recipe" items="${recipelist}" varStatus="i" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <h5 class="fw-bolder" onclick="location.href='redetail.do?seq=${recipe.seq}'">
                          	  <img class="card-img-top" src="upload/${recipe.newbestimg }" alt="..." width="300" height="200" /></h5>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                   <!-- <h5 class="fw-bolder"  onclick="location.href='redetail.do?seq=${recipe.seq}'">${recipe.recipetitle}</h5>-->
                                    
                                    <c:choose>
									<c:when test="${recipe.recipetitle.length() > 8}">
									<h4 class="fw-bolder" onclick="location.href='redetail.do?seq=${recipe.seq}'">&nbsp;${recipe.recipetitle.substring(0,8)}...</h4>
									</c:when>
									<c:otherwise>
									<h4 class="fw-bolder" onclick="location.href='redetail.do?seq=${recipe.seq}'">&nbsp;${recipe.recipetitle}</h4>
									</c:otherwise>
									</c:choose>
                                    <!-- Product price-->
                                    작성자: ${recipe.id}<br>
                                    ${recipe.reccategory }<br>
                                    요리시간:${recipe.rectime} <br>
                                    조회수 ${recipe.readcount}&nbsp&nbsp&nbsp👍+${recipe.liked}
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
		        
		<!-- pagination -->
		
		<div class="container">
		    <nav aria-label="Page navigation">
		        <ul class="pagination" id="pagination" style="justify-content:center;"></ul>
		    </nav>
		</div>
        
<script>
let totalCount = ${totalCount};	// 서버로부터 총글의 수를 취득
// alert(count);
let nowPage = ${pageNumber};	// 서버로부터 현재 페이지를 취득
// alert(pageNum);

let pageSize = 12;

let _totalPages = totalCount / pageSize;
if(totalCount % pageSize > 0){
	_totalPages++;
}

$("#pagination").twbsPagination({
	startPage: nowPage,
	totalPages: _totalPages,
	visiblePages: 10,
	first:'<span sria-hidden="true">«</span>',
	prev:"이전",
	next:"다음",
	last:'<span sria-hidden="true">»</span>',
	initiateStartPageClick:false,		// onPageClick 자동 실행되지 않도록 한다
	onPageClick:function(event, page){
		location.href = "recipe.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val() + "&pageNumber=" + (page - 1);	
	}
});	

$("#btnSearch").click(function () {
	location.href = "recipe.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val();	
});

$("#writerec").click(function(){
	location.href ="recipewrite.do";
});
</script>
	    <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>


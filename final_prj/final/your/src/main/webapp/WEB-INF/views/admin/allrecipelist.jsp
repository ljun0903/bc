<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>YOUR - AdminPage</title>	
        <link href="css/chartcss.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>	
        <!--  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/jquery.twbsPagination.min.js"></script>
		<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
		
		<style type="text/css">
		a {
			color: black
		}
		</style>
		
    </head>
    
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="logout.do">YOUR</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
           <!--  <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form> -->
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <!-- <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li> -->
                        <li><a class="dropdown-item" href="logout.do">????????????</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Main</div>
                            <a class="nav-link" href="sellchart.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                HomeDashboard
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link" href="allmemlist.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                ??????????????????
                            </a>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                ????????? ??? ??????
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="allrecipelist.do">??????????????? ??????</a>
                                    <a class="nav-link" href="allclasslist.do">??????????????? ??????</a>
									<a class="nav-link" href="allmarketlist.do">?????????????????? ??????</a>
									<a class="nav-link" href="allincomelist.do">???????????? ??????</a>
                                </nav>
                            </div>
                            
							<!-- //////////////////////////////////////////////////////////////////////////////////////// -->
                           <!--  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                </nav>
                            </div> -->
                            
                            
                            <div class="sb-sidenav-menu-heading">????????????</div>
                            <a class="nav-link" href="recipe.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ???????????????
                            </a>
                            <a class="nav-link" href="cclist.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ???????????????
                            </a>
                            <a class="nav-link" href="marketmain.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ???????????????
                            </a>
                            <a class="nav-link" href="https://accounts.kakao.com/login/kakaobusiness?continue=https%3A%2F%2Fbusiness.kakao.com%2Fdashboard%2F" target="_blank">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ????????????????????????
                            </a>
                            <a class="nav-link" href="marketwrite.do" onclick="window.open(this.href, '_blank', 'width=500, height=300'); return false;">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ??????????????????
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">???????????????</div>
                        <c:if test="${login.nickname != '' }">
      					[${login.nickname}]????
						</c:if>      
			</div>
                </nav>
            </div>
<div id="layoutSidenav_content">
<main>
<div class="container-fluid px-4">
	<h1 class="mt-4">?????????????????????</h1>
		<div class="card mb-4">
			<div class="card-header">
			<i class="fas fa-table me-1"></i>???????????????
			 	<a style="float:right" href="<c:url value='recipeexcelDown.do'/>">
				<img src="https://img.icons8.com/color/35/000000/export-excel.png"/>
				</a>
			</div>
				<div class="card-body">
						<table id="datatablesSimple">
						<col width="50"><col width="150"><col width="400"><col width="200">
						<col width="200"><col width="150"><col width="100"><col width="100">
							<thead>
								<tr>
									<th style="text-align: center;">??????</th>
                                    <th style="text-align: center;">??????</th>
									<th style="text-align: center;">?????????</th>
                                    <th style="text-align: center;">?????????</th>
                                    <th style="text-align: center;">????????????</th>
                                    <th style="text-align: center;">???????????????</th>
                                    <th style="text-align: center;">?????????</th>
                                    <th style="text-align: center;">?????????</th>
                               </tr>
                            </thead>
							<c:forEach items="${allrecipelist}" var="re" varStatus="i">
                           	<tbody>
                            	<tr>
                                   <td style="text-align: center;">${i.count}</td>
                                   <td style="text-align: center;">${re.reccategory}</td>
                                   <td style="text-align: center;"><a style="text-decoration:none" href="redetail.do?seq=${re.seq}" onclick="window.open(this.href, '_blank', 'width=1400, height=600'); return false;">${re.recipetitle}</a></td>
                                   <td style="text-align: center;">${re.id}</td>
                                   <td style="text-align: center;">${re.rectime}</td>
                                   <td style="text-align: center;">${re.reclevel}</td>
                                   <td style="text-align: center;">${re.liked}</td>
                                   <td style="text-align: center;">${re.readcount}</td>
                               </tr>
                            </c:forEach>
                            </tbody>
                            
                            
				</table>
			</div>
		</div>
	</div>
<!-- ?????? -->
<div class="box_border" style="margin-top: 5px;margin-bottom: 10px">
	<table style="margin-left: auto;margin-right: auto; margin-top: 3px; margin-bottom: 3px">
		<tr>
<!-- 			<td>??????</td>
 -->			<td style="padding-left: 5px">
				<select id="_choice" name="choice">
					<option value="" selected="selected">??????</option>
					<option value="name">??????</option>
					<option value="nickname">?????????</option>
					<option value="id">?????????</option>
				</select>	
			</td>
			<td style="padding-left: 5px">
				<input type="text" id="_search" name="search">
			</td>
			<td style="padding-left: 5px">
				<span class="button blue">
					<button type="button" id="btnSearch">??????</button>
				</span>
			</td>
		</tr>
	</table>
</div>
<!-- pagination -->
<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination" style="justify-content:center;"></ul>
    </nav>
</div>
</div>
</body>



<script type="text/javascript">
var search = "${search}";
var choice = "${choice}";

$(document).ready(function () {
	if(search != ""){
		$("#_choice").val( choice );
		
		document.getElementById("_search").value = search;
	}	
});
</script>

<script>
let totalCount = ${totalCount};	// ??????????????? ????????? ?????? ??????
// alert(count);
let nowPage = ${pageNumber};	// ??????????????? ?????? ???????????? ??????
// alert(pageNum);

let pageSize = 20;

let _totalPages = totalCount / pageSize;
if(totalCount % pageSize > 0){
	_totalPages++;
}

//$("#pagination").twbsPagination('destroy');	// ????????? ?????? : ???????????? ????????? ?????? ????????? ???????????????.

$("#pagination").twbsPagination({
	startPage: nowPage,
	totalPages: _totalPages,
	visiblePages: 10,
	first:'<span sria-hidden="true">??</span>',
	prev:"??????",
	next:"??????",
	last:'<span sria-hidden="true">??</span>',
	initiateStartPageClick:false,		// onPageClick ?????? ???????????? ????????? ??????
	onPageClick:function(event, page){
		location.href = "allrecipelist.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val() + "&pageNumber=" + (page - 1);	
	}
});	


$("#btnSearch").click(function () {
	location.href = "allrecipelist.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val();	
});

</script>
<%@page import="bit.your.prj.dto.MarketDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<c:set var="dto" value="${dto}"/>
<c:set var="login" value="${login}"/>
<c:set var="cartCount" value="${cartCount}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MarketDetail</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/modal2.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <script type="text/javascript">
		$(document).ready(function() {
			basket.reCalc();
			basket.updateUI();
		});
		</script> 
        
        <script type="text/javascript">
        $(document).ready(function() {
        	$('#ca_manu .dropdown-menu').hide();
        	
        	$('.nav-link').mouseover(function () {
				$('.dropdown-menu').slideDown();
			});
        	$('.dropdown-menu').mouseleave(function () {
				$('.dropdown-menu').hide();
			});
        	
        });
        </script>
        
        <script type="text/javascript">
        	function viewContent(data) {
        		var num = data;
        		//alert(num);
				if($('#content'+num).css('display') == 'none'){
					$('#content'+num).css('display','block');
				} else{
					$('#content'+num).css('display','none');
				}
			}
        </script>
        
        
        
        <script type="text/javascript">
        $(document).ready(function() {
        $("#btnSearch").click(function () {
        	location.href = "getSearchList.do?search=" + $("#_search").val();	
        	});
        });
        </script>
        
        <script type="text/javascript">
		function addCart(item,num) {
			var count = $('#p_num'+num+'').val();
			var itemnum = item;
			//alert(count);
			var allData = {"itemnum": itemnum, "count":count};
	        
		    $.ajax({
		        url:"addcart2.do",
		        type: "GET",
		        data: allData,
		        success:function(data){
		        	alert("장바구니에 추가 됐습니다");
		        	//장바구니 카운트 증가
		        	var num = document.getElementById('CC').innerHTML;
		        	var num2 = parseInt(num) + 1;
		        	document.getElementById('CC').innerHTML = num2;
		        	$('.modal').hide();
		        },
		        error:function(){
		            alert("에러 발생");
		            self.close();
		     	}
		   }); 	
			
		}
		</script>
        
        <script type="text/javascript">
        $(document).ready(function () {
        	
			$('#btn_cart').click(function () {
				var id = $("#id").val();
				var itemnum = $("#itemnum").val();
				var count = $("#p_num1").val();
				var address = $("#address").val();
				
				var allData = {"id":id , "itemnum": itemnum, "count":count, "address":address};
			        
			    $.ajax({
			        url:"addcart.do",
			        type: "GET",
			        data: allData,
			        success:function(data){
			        	alert("장바구니에 추가 됐습니다");
			        	//장바구니 카운트 증가
			        	var num = document.getElementById('CC').innerHTML;
			        	var num2 = parseInt(num) + 1;
			        	document.getElementById('CC').innerHTML = num2;
			        	
			        },
			        error:function(jqXHR, textStatus, errorThrown){
			            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			            self.close();
			     	}
			   }); 	
				
		  }); 	
    });
        
        
      
        </script>
        
        
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5" style="font-size: 18px;">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    	<li class="nav-item dropdown" >
                            <a class="nav-link dropdown-toggle" id="ca_manu">전체 카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="marketlist.do?canum=1">
                                	<img src="./image/meat.png" alt="카테고리 아이콘" style="width: 24px; height: 24px;">
                                	정육</a>
                                </li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=2">
                                	<img src="./image/fish.png" alt="카테고리 아이콘" style="width: 24px; height: 24px;">
                                	수산</a></li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=3">
                                	<img src="./image/carrot.png" alt="카테고리 아이콘" style="width: 24px; height: 24px;">
                                	채소</a></li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=4">
	                                <img src="./image/fruit.png" alt="카테고리 아이콘" style="width: 24px; height: 24px;">
	                                과일</a>
                                </li>
                                <li><a class="dropdown-item" href="marketlist.do?canum=5">
                                	<img src="./image/kit.png" alt="카테고리 아이콘" style="width: 24px; height: 24px;">
                                	밀키트</a>
                                </li>
                            </ul>
                        </li>&nbsp;&nbsp;&nbsp;&nbsp;
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="newMarketList.do">신상품</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
                        <li class="nav-item"><a class="nav-link" href="best.do">베스트</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
                        <li class="nav-item"><a class="nav-link" href="#!">할인/특가</a></li>&nbsp;&nbsp;&nbsp;&nbsp;
                    </ul>
                    <form class="d-flex" action="getSearchList.do">
					    <input class="form-control me-2" placeholder="Search" aria-label="Search" id="_search">
					    <button class="btn btn-outline-success" type="button" id="btnSearch">Search</button>
				    </form>&nbsp;&nbsp;&nbsp;&nbsp;
                    <form class="d-flex" action="goCart.do">
                        <button class="btn btn-outline-success" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-warning text-white ms-1 rounded-pill" id="CC">${cartCount}</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="./marketimage/${dto.newmainpt}" alt="..." /></div>
                    <div class="col-md-6" id="abc">
                        <h1 class="display-5 fw-bolder">${dto.title}</h1>
                        <div class="small mb-1" >${dto.subtitle }</div><br>
                        <ul class="list-group list-group-flush">
						  <li class="list-group-item">
						  
						  	<a style="width: 150px;float: left;width: 150px;line-height: 20px;">가격</a><a><fmt:formatNumber value="${dto.price}" pattern="#,###,###"/>원</a>
						  	<input type="hidden" value="${login.id}" id="id">
						  	<input type="hidden" value="${dto.itemnum}" id="itemnum">
						  	<input type="hidden" value="${login.address1}" id="address">
						  	<input type="hidden" value="${dto.seq}" id="seq">
    					  </li>
						  <li class="list-group-item">
						  	<a style="width: 150px;float: left;width: 150px;line-height: 20px;">용량/중량</a><a>${dto.gram}</a>
    					  </li>
						  <li class="list-group-item">
						  	<a style="width: 150px;float: left;width: 150px;line-height: 20px;">원산지</a><a>${dto.country}</a>
						  </li>
						  <li class="list-group-item">
						  	<a style="width: 150px;float: left;width: 150px;line-height: 20px;">유통기한</a><a>${dto.expiration}</a>
						  </li>
						  <li class="list-group-item" >
						  	<a style="width: 150px;float: left;width: 150px;line-height: 20px;">수량</a>
						  	<div class="updown">
						  	<img alt="" src="./image/minus.png" style="width: 20px;" class="down">
						  	<input readonly="readonly" value="1" style="width: 35px; height:30px; text-align: center; border: 0px;" name="p_num1" id="p_num1" class="p_num">
						  	<img alt="" src="./image/plus.png" style="width: 20px;" class="up">
						  	</div>
						  </li>
						</ul>
						<br>
						<a style="float: left; width: 150px; margin-left: 300px;">총 상품 금액 :</a>
						<div class="sum" style="font-weight: bold; font-size: 20px; line-height: 20px;">${dto.price}원</div>
						<br>
                        <div class="d-flex">
                            <button class="btn btn-outline-success flex-shrink-0" type="button" style="margin-left: 400px;" id="btn_cart">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니 담기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        	<img alt="" src="./marketimage/${dto.content}" style="display:block; margin-left: auto; margin-right: auto;">
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
            	<h2 class="fw-bolder mb-4">유사한 상품</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="market" items="${marketlist}" varStatus="i" begin="0" end="3">
                    <c:if test="${dto.seq ne market.seq}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img style="min-height: 100px; max-height: 300px;" class="card-img-top" src="./marketimage/${market.newmainpt}" alt="..." onclick="location.href='marketdetail.do?seq=${market.seq}'" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" onclick="location.href='marketdetail.do?seq=${market.seq}'">${market.title}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${market.price}" pattern="#,###,###"/>원<br>
                                    <a style="font-size: 12px; color: gray;">${market.subtitle}</a>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><!-- <a class="btn btn-outline-success btntt">장바구니 담기</a> --></div>
					  			<%-- <div class="modal">
						    		<div class="modal__overlay">
							    		<div class="modal__content">
								    		<div style="float: left;">${market.title}</div><br>
								    		<div><span><fmt:formatNumber value="${market.price}" pattern="#,###,###"/>원</span>
								    		<span class="updown" style="float: right;">
											  	<img alt="" src="./image/minus.png" style="width: 20px;" class="down" onclick="javascript:basket.changePNum1('${i.count}');">
											  	<input type="text" readonly="readonly" value="1" style="width: 35px; height:30px; text-align: center; border: 0px;"
											  	 name="p_num${i.count}" id="best${i.count}" class="p_num" onkeyup="javascript:basket.changePNum1('${i.count}');">
											  	<img alt="" src="./image/plus.png" style="width: 20px;" class="up" onclick="javascript:basket.changePNum1('${i.count}');">
										  	</span>
										  	</div>
										  	<br>
										  	<br>
											<div class="sum" style="font-weight: bold; font-size: 20px; line-height: 20px;" >
												<a style="width: 150px; margin-left: 60px;">총 상품 금액 :</a>
												<input type="text" id="totalPriceA${i.count}" style="border: 0px; width: 100px; text-align: right; margin-left: 40px;" value="<fmt:formatNumber value="${market.price}" pattern="#,###,###" />" />원
											</div>
											<br>
											<a type="button" style="float: left; margin-left: 50px; size: 50px;" class="btn btn-outline-danger close">취소</a>
											<a type="button" style="float: right; margin-right: 30px;" class="btn btn-outline-success" onclick="addCart('${market.itemnum}','${i.count}');">장바구니 담기</a>
		    							</div>
	    							</div>
 			 					</div> --%>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
		<table class="table" style="width: 70%; margin-left: auto; margin-right: auto;">
			<colgroup>
				<col style="width:auto;">
				<col style="width:120px;">
				<col style="width:120px;">
			</colgroup>
		  	<tbody>
			    <tr>
			      <th style="padding-right: 100px; text-align: center; width:auto;">제목</th>
			      <th style="width:120px;">작성자</th>
			      <th style="width:130px;">작성일</th>
			    </tr>
			</tbody>
		</table>
		<c:forEach var="review" items="${reviewlist}" varStatus="i">
		<div>
			<table class="table table-hover" style="width: 70%; margin-left: auto; margin-right: auto;">
			<colgroup>
				<col style="width:auto;">
				<col style="width:120px;">
				<col style="width:130px;">
			</colgroup>
				<tbody onclick="viewContent(${i.count})" >
					<tr>
					 <th scope="col" style="padding-right: 100px;">${review.title}</th>
				     <th scope="col" style="">${review.nickname}</th>
				     <th scope="col" style="">${review.rdate.substring(0,10)}</th>
				    <tr>
				</tbody>
			</table>
				<div style="display:none; width: 70%; margin-left: auto; margin-right: auto; padding-top: 5px; font-weight: bold;" id="content${i.count}" >
					${review.content} 
				</div>
		</div>
		</c:forEach>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
        	document.querySelectorAll('.updown').forEach(

        	    function(item, idx){

        	          //수량 입력 필드 값 변경
        	        item.querySelector('input').addEventListener('keyup', function(){
        	           basket.changePNum(idx+1);
        	        });
        	          //수량 증가 화살표 클릭
        	        item.children[0].addEventListener('click', function(){
        	            basket.changePNum(idx+1);
        	        });
        	          //수량 감소 화살표 클릭
        	        item.children[2].addEventListener('click', function(){
        	            basket.changePNum(idx+1);
        	        });
        	    }
        	);
        	
	});
        
        
         let basket = {

        	    totalCount: 0, //전체 갯수 변수
        	    totalPrice: 0, //전체 합계액 변수

        	    //재계산

        	    reCalc: function(){

        	        this.totalCount = 0;
        	        this.totalPrice = 0;
        	        
        	        document.querySelectorAll(".p_num").forEach(function (item) {
        	            var count = parseInt(item.getAttribute('value'));
        	            this.totalCount += count;
        	            var price = ${dto.price};
        	            this.totalPrice += count * price;
        	        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg

        	    }, 
        	    
        	  	//화면 업데이트
        	     updateUI: function () {

        	        document.querySelector('.sum').textContent = this.totalPrice.formatNumber() + '원';
        	    },  
        	    
        	    //개별 수량 변경

        	    changePNum: function (pos) {
        	        var item = document.querySelector('input[name=p_num'+pos+']');
        	        var p_num = parseInt(item.getAttribute('value'));
        	        var newval = event.target.classList.contains('up') ? p_num+1 : 
        	        	event.target.classList.contains('down') ? p_num-1 : event.target.value;

        	        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }
        	        item.setAttribute('value', newval);
        	        item.value = newval;

        	        var price = ${dto.price};
        	        
        	         //item.parentElement.parentElement.nextElementSibling.textContent = (newval * price)+ '원'; 
        	        //AJAX 업데이트 전송
        	        
        	        this.reCalc();
        	        this.updateUI();
        	    },
        	    
        	    changePNum1: function (pos) {
    		        var item = document.querySelector('input[id=best'+pos+']');
    		        var p_num = parseInt(item.getAttribute('value'));
    		        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
    		        
    		        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

    		        item.setAttribute('value', newval);
    		        item.value = newval;

    		        var price = $('#bestPrice'+pos+'').val();
    		        var totalPrice = (newval * price);
    		        $('input[id=totalPriceA'+pos+']').attr('value',totalPrice.formatNumber());
    				//console.log("bestPrice>>>>"+price);
    		        
    		    }
        	}
         
         		Number.prototype.formatNumber = function(){
	        	    if(this==0) return 0;
	        	    let regex = /(^[+-]?\d+)(\d{3})/;
	        	    let nstr = (this + '');
	        	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	        	    return nstr;
        	};
        </script>
        
        <!-- 모달창 -->
		<!-- <script type="text/javascript">
			
			// Modal을 가져온다
			var modals = document.getElementsByClassName("modal");
			// Modal을 띄우는 클래스 이름을 가져온다.
			var btns = document.getElementsByClassName("btntt");
			// Modal을 닫는 close 클래스를 가져온다.
			var spanes = document.getElementsByClassName("close");
			var funcs = [];
			
			// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
			function Modal(num) {
				return function(){
					// 해당 클래스의 내용을 클릭하면 Modal을 띄운다.
					btns[num].onclick = function(){
						modals[num].style.display = "block";
						//console.log(num);
					};
					
					// 닫기 버튼 클릭하면 Modal이 닫힌다.
					spanes[num].onclick = function() {
						modals[num].style.display = "none";
					};
				};
			}
			// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의한다.
			for(var i = 0; i< btns.length; i++){
				funcs[i] = Modal(i);
			}
			// 원하는 Modal 수만큼 funcs 함수를 호출한다.
			for(var j = 0; j< btns.length; j++){
				funcs[j]();
			}
			// Modal 영역 밖을 클릭하면 Modal을 닫는다.
			window.onclick = function(event) {
				if(event.target.className == "modal"){
					event.target.style.display = "none";	
				}
			};
		
		</script> -->
    </body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>

    <!--top place start-->
    <section class="top_place section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>레시피 추천</h2>
                        <p>Aren't you bored with the same dish every day? Are you tired of menu selection and delivery food? Bring joy to your family and loved ones with new recipes. Cooking is always fun, this is YOUR.</p>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach var="recipe" items="${recipelist}" varStatus="i" >
                <div class="col-lg-6 col-md-6">
                    <div class="single_place"  onclick="location.href='redetail.do?seq=${recipe.seq}'">
                        <img src="upload/${recipe.newbestimg }" alt="" width="600px" height="350px">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">                               
                                <h3>${recipe.recipetitle}</h3>
                                <p>작성자: ${recipe.id}</p>
                                <p>조회수: ${recipe.readcount}&nbsp&nbsp 👍 +${recipe.liked}</p>
                                <div class="place_review">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>  
            </div>
         </div>
    </section>
    <!--top place end-->



    <!--::industries start::-->
    <section class="hotel_list section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>마감임박 쿠킹클래스</h2>
                        <p>This is a cooking class nearing the deadline. Choose the dish you want to learn. A place where you can meet new people! Choose Now!</p>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="cclist" items="${homecclist}" varStatus="i" > 
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list" onclick="location.href='ccdetail.do?seq=${cclist.seq}'">
                        <img src="upload/${cclist.newfilename}" alt="" width="360px" height="260px">                    
                        <div class="hotel_text_iner">
                        	
                            <c:choose>
                            	<c:when test="${cclist.title.length() > 13}">
                            		<h3>${cclist.title.substring(0, 13)}...</h3>
                            	</c:when> 
                            	<c:otherwise>
                            		<h3>${cclist.title}</h3> 
                            	</c:otherwise> 
                            </c:choose>
                            <span>마감일: ${cclist.edate.substring(2, 10)}</span>
                            <c:choose>
							<c:when test="${cclist.location.length() > 18}">
							<p>장소:${cclist.location.substring(0,18)}...</p>
							</c:when>
							<c:otherwise>
							<p>장소:${cclist.location}</p>
							</c:otherwise>
							</c:choose>
                            <h5>모집인원<span>(${cclist.membercount}/${cclist.membernum})</span></h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!--::industries end::-->



    <!--::industries start::-->
    <section class="best_services section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>최신 상품</h2>
                        <p>You have selected a recipe, but you have no ingredients? A market page prepared just for you. All categories of food ingredients are waiting.</p>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="mclist" items="${marketlist}" varStatus="i">
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list" onclick="location.href='marketdetail.do?seq=${mclist.seq}'">
                        <img src="./marketimage/${mclist.newmainpt}" alt="" width="260px" height="180px">
                        <h3> <a href="#">상품명: ${mclist.title}</a></h3>
                        <p>정보: ${mclist.subtitle}</p>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!--::industries end::-->



    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/contact.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>

</html>



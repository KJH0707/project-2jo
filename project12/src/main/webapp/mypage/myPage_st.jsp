<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Fork and Knife | My page</title>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>

<link rel="stylesheet" href="./assets/css/myPage_ceo.css">



 </head>
 <body>
        
<!-- 헤더 -->
	<div>
       <jsp:include page="../inc/top.jsp"/>
	</div>
<!-- 헤더 끝 -->


    <div class="page-head"> 
       <div class="container">
         <div class="row">
             <div class="page-head-content">
                 <h1 class="page-title">My page</h1>               
             </div>
         </div>
       </div>
    </div>
    <!-- End page header -->

    <!-- property area -->
 
 
   <div class="properties-area recent-property" style="background-color: #FFF;">
      <div class="container">  
          <div class="row">
               
          <div class="col-md-3 p0 padding-top-40">
              <div class="blog-asside-right pr0">

                  <div class="panel panel-default sidebar-menu wow fadeInRight animated">
                      <div class="panel-heading">
                          <h3 class="panel-title"><a href="./StMyPage_pro.us">마이페이지</a></h3>
                      </div>
                      <div class="panel-body recent-property-widget">
                           <ul>
                           <li>
                           	 <a href="./StMyPage.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                    <img src="mypage/weekly-calendar_icon-icons.com_56749.png" width="20" height="20">
                               </div>
                             </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry" width="">
                                   <h6><a href="./MemberReserve.us">예약내역</a></h6>
<!--                                 <span class="property-price">3000000$</span> -->
                               </div>
                             
                           </li>
                           <li>
                           	  <a href="./StMyPage_book.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/people.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./MemberReviewEdit.us">리뷰 관리</a></h6>
<!--                                <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                           <li>
                           	  <a href="./StMyPage_review.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="mypage/heart-icon_34407.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./MemberWish.us">찜한매장</a></h6>
<!--                                     <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                           <li>
                           	  <a href="./MemberCoupon.co">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/coupon.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./MemberCoupon.co">쿠폰 관리</a></h6>
<!--                                     <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                           <li>
                           	  <a href="./MemberInfoEdit.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/note.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./MemberInfoEdit.us">회원정보 수정</a></h6>
<!--                                      <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                       </ul>
                      </div>
                  </div>
              </div>
          </div>


 
 <!--  //////////////////// 목록  /////////////////////// -->      
<div class="col-md-9  pr0 padding-top-40 properties-page">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h3 class="tm-block-title d-inline-block">찜한 매장<img src="mypage/instagram_like_heart_love_icon_181629.png" style="height:30px;"alt="">
                               </h3>
                            </div>
                            <br>
                            
                        </div>
<!-- 	<hr style="border:dotted 2px gray"> -->
	<hr>

<div>
<!------ Include the above in your HEAD tag ---------->


<div style="margin-left: 0px">
<div class="container mb-4">
    <div class="row">
              <c:forEach var="dto" items="${wishList }">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4 mt-4" style="width:250px;">
            <div class="card shadow">
                <div class="card-body text-center" >
                
                        <img class="card-img-top" src="./upload/${dto.s_image.split(',')[0]}" >
                        
                        
                    <a href="./storeDetails.st?s_no=${dto.s_no }"><h3 class="text-warning" style="text-align:center;">${dto.s_name}</h3></a>
                    <h6 style="text-align:center; "><img src="mypage/star_77949.png" style="height:20px;"alt="">
                    <span style="color:orange;">평점 : ${dto.s_star} 점</span></h6>
                    <h6 style="text-align:center;">${dto.s_type } </h6>
                    
      
                </div>
            </div>
        </div>
			  	</c:forEach>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
<!-- ///////////////////////////////////////////////////// -->



 <!-- 푸터 -->
	<div >
	<jsp:include page="../inc/bottom.jsp" />
	</div>
<!-- 푸터 끝 -->
</body>
</html>
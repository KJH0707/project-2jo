<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Fork and Knife | Coupon</title>


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
                 <h1 class="page-title">MYPAGE</h1>               
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
              <h3 class="tm-block-title d-inline-block">쿠폰 관리</h3>
          </div>
          <br>
          
      </div>
<!-- 	<hr style="border:dotted 2px gray"> -->
	<hr>
<!-- <div class="col-md-9 pr0 padding-top-40 properties-page"> -->
        <!-- main area -->
<!--         <div class="content-area recent-property padding-top-40" style="background-color: #FFF;"> -->
<!--             <div class="container">   -->
		<%-- ${couponList } --%>
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h3 class="card-header">쿠폰현황</h3>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">쿠폰이름</th>
                                            <th scope="col">사용처</th>
                                            <th scope="col">사용기간</th>
                                            <th scope="col">관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="dto" items="${membercoupon}">
                                        <tr>
                                            <td>${dto.c_name }</td>
                                            <td>${dto.c_place }</td>
                                            <td>${dto.c_sdate } ~ ${dto.c_edate }</td>
                                            <td>
											 	<a href="./UseCoupon.co?c_code=${dto.c_code }">사용하기 </a>   
											 	&nbsp;&nbsp;
											</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                	</div>
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h3 class="card-header">만료된 쿠폰 <small>(사용 / 기간만료)</small></h3>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">번호</th>
                                            <th scope="col">쿠폰이름</th>
                                            <th scope="col">사용처</th>
                                            <th scope="col">배포기간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="Invaild" items="${InvaildCoupon }">                
                                        <tr>
                                            <th scope="row">${Invaild.c_code }</th>
                                            <td>${Invaild.c_name }</td>
                                            <td>${Invaild.c_place }</td>
                                            <td>${Invaild.c_sdate} ~ ${Invaild.c_edate}</td>
                                        </tr>
                                    </c:forEach>                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
            
                    
<!--              </div> -->
<!--        </div> -->
<!--     </div> -->
<div>
<!------ Include the above in your HEAD tag ---------->

<!-- 	/////// 목록//////////////// -->
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
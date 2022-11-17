<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Insert title here</title>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>

<link rel="stylesheet" href="./assets/css/myPage.css">

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
                 <h1 class="page-title">List Layout With Sidebar</h1>               
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
                          <h3 class="panel-title">마이페이지</h3>
                      </div>
                      <div class="panel-body recent-property-widget">
                           <ul>
                           <li>
                           	 <a href="링크">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/store.png" width="20" height="20">
                               </div>
                             </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry" width="">
                                   <h6><a href="링크">가게 관리</a></h6>
<!--                                 <span class="property-price">3000000$</span> -->
                               </div>
                             
                           </li>
                           <li>
                           	  <a href="링크">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/people.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="링크">예약 관리</a></h6>
<!--                                <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                           <li>
                           	  <a href="링크">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/review.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="링크">리뷰 관리</a></h6>
<!--                                     <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                           <li>
                           	  <a href="링크">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/note.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="링크">회원정보 관리</a></h6>
<!--                                      <span class="property-price">3000000$</span> -->
                               </div>
                           </li>
                       </ul>
                      </div>
                  </div>
              </div>
          </div>

       

<div class="col-md-9  pr0 padding-top-40 properties-page">
  <!-- 여기 밑으로 내용 넣어야 옆 공간에 들어감 -->
  안녕하세요
  
  
</div>
</div>
</div>
</div>


        
 <!-- 푸터 -->
	<div>
	<jsp:include page="../inc/bottom.jsp" />
	</div>
<!-- 푸터 끝 -->

</body>
</html>
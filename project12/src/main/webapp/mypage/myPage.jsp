<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Fork and Knife | My page</title>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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

       

<div class="col-md-9  pr0 padding-top-40 properties-page">
  <!-- 여기 밑으로 내용 넣어야 옆 공간에 들어감 -->
  
  
	<div class="row">
      <div class="col-md-8 col-sm-12">
          <h3 class="tm-block-title d-inline-block">마 이 페 이 지
         </h3>
      </div>
  </div>
  <hr>
  
  <div class="col-xs-12 col-sm-6 col-md-6" >
            <div class="well well-sm" style="background:white; width:600px; margin-bottom: 200px;">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
<!--                     /380x500 -->
                        <img src="./mypage/account_avatar_face_man_people_profile_user_icon_123197.png" alt="profile" width=200 height=200 style="border-radius:50%;  opacity: 0.5;" />
                    </div>
                    
                    
                    <div class="col-sm-6 col-md-8">
                        <h4>${dto.m_id} 님 </h4>
                        <hr>
                        <p style="font-size:14px">
<!--                         	<i class="glyphicon glyphicon-hand-right"></i> -->
                        	<b>아이디</b>&nbsp;&nbsp;&nbsp;${dto.m_id }
                            <span style="margin-left:48px">
<!--                             <i class="glyphicon glyphicon-envelope"></i> -->
                            <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;름</b>&nbsp;&nbsp;&nbsp;${dto.m_name }</span>
                            <br />
<!--                             <i class="glyphicon glyphicon-envelope"></i> -->
                            <b>연락처</b>&nbsp;&nbsp;&nbsp;${dto.m_tel }
                            <span style="margin-left:20px">
<!--                             <i class="glyphicon glyphicon-globe"></i> -->
                            <b>이메일</b>&nbsp;&nbsp;&nbsp;${dto.m_email }</span>
                            <br />
<!--                             <i class="glyphicon glyphicon-envelope"></i> -->
                        </p>
                        <!-- Split button -->
                        <div class="text-right">
                            <a href="./MemberInfoEdit.us">정보수정</a>
<!--                             <ul class="dropdown-menu" role="menu"> -->
<!--                                 <li><a href="#">Twitter</a></li> -->
<!--                                 <li><a href="https://plus.google.com/+Jquery2dotnet/posts">Google +</a></li> -->
<!--                                 <li><a href="https://www.facebook.com/jquery2dotnet">Facebook</a></li> -->
<!--                                 <li class="divider"></li> -->
<!--                                 <li><a href="#">Github</a></li> -->
<!--                             </ul> -->
                        </div>
                    </div>
                </div>
            </div>
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
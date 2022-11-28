<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Fork and Knife | My page</title>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
                                   <h6> <a href="./MemberReviewEdit.us">리뷰관리</a></h6>
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
  				<div class="row" style="margin-left: 0px;">
                            <div class="col-md-8 col-sm-12">
                                <h3 class="tm-block-title d-inline-block">나 의 리 뷰</h3>
                            </div>
						<br>
                     
                  </div>
                    
                    <hr>
                 
					<input type="hidden" value="${param.m_no }">

                    <div class="col-md-12 clear" style="line-height:20px">
                        <div id="list-type" class="proerty-th">
                                        <c:forEach var="dto" items="${reviewList }">
                            <div class="col-sm-6 col-md-4 p0" style="width:270px">
                                    <div class="box-two proerty-item">
                                        <div class="text-left">
                                            <img src="./upload/${dto.rev_file}"  style="width:100px; height:100px; padding:5px;">
                                            <p class="text-right" style="margin-bottom:-10px; margin-top:-70px; margin-right:20px; line-height:0;"><b> </b></p><br>
                                            <br>
                                            <p class="text-right" style="margin-bottom:10px; margin-top:-25px; line-height:0; margin-right:60px;">
                                            
                                            <div style="">
<!--                                             <h6 style="margin-bottom:-10px; line-height:0;">닉네임: 배고프다</h6><br> -->
<!--                                             <h6 style="margin-bottom:-10px; line-height:0; font-size:10px;">★★★★★&nbsp;2022-11-12</h6> -->
<!--                                             <h6 class="pull-right" style="margin-bottom:-10px; line-height:0; "><i class="glyphicon glyphicon-alert"></i></h6><br> -->
                                            </div>
                                        </div>
                                        
										
                                        <div style="margin-top: 30px;" class="item-entry overflow">
                                            <div>작성일 : ${dto.rev_date }</div>
                                            <div>제목 : ${dto.rev_subject }</div>
                                        	<div style="font-weight: bold;">평점 : ${dto.rev_star }점</div><br>
                                            <div>${dto.rev_content }</div><br>
                                          <small class="text-mute"><a href="./ReviewUpdate.rv?rev_no=${dto.rev_no }&pageNum=${pageNum }&rev_star=${dto.rev_star}">수정/</a></small>
                                                       <small class="text-mute"> <a href="./ReviewDelete.rv?rev_no=${dto.rev_no }&s_no=${dto.s_no }">삭제 </a></small> <br><br>
<!--                                             <div class="text-right">[답글]</div> -->
											
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



        
 <!-- 푸터 -->
	<div>
	<jsp:include page="../inc/bottom.jsp" />
	</div>
<!-- 푸터 끝 -->

</body>
</html>
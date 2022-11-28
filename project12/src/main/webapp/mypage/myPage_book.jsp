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
  <div class="row tm-content-row tm-mt-big" >
  	<i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100" style="width:1000px">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h3 class="tm-block-title d-inline-block">예 약 내 역 </h3>
                            </div>
                            <br>
                     
                        </div>
                        <hr>
                        <div class="table-responsive" style="margin-top:50px;margin-bottom: 50px;">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3" style="table-layout:fixed">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col" class="text-center" width="80px">예약번호</th>
                                        <th scope="col" class="text-center" width="100px">예약자 이름</th>
                                        <th scope="col" class="text-center" width="50px">인원</th>
                                        <th scope="col" class="text-center" width="100px">날짜 및 시간</th>
                                        <th scope="col" class="text-center" width="200px">메세지</th>
                                        <th scope="col" class="text-center" width="120px">연락처</th>
                                        <th scope="col" class="text-center" width="80px">가게보기</th>
                                        <th scope="col" class="text-center" width="100px">예약상태</th>
                                        <th scope="col" class="text-center" width="150px">리뷰쓰기</th>
                                        
                                        
                                     
                                    </tr>
                                </thead>
                                <tbody>
                               		<c:set var="status" value="이용예정" />
                                    <c:forEach var="dto" items="${reserveList }">
										<!-- status 상태 계산하기 -->
										<c:choose>
											<c:when test="${dto.res_status == 0 }">
											 	<c:set var="status" value="이용예정" />
											</c:when>
											<c:when test="${dto.res_status == 1 }">
											 	<c:set var="status" value="이용완료" />
											</c:when>
											<c:when test="${dto.res_status == 2 }">
											 	<c:set var="status" value="노쇼" />
											</c:when>
											<c:when test="${dto.res_status == 3 }">
											 	<c:set var="status" value="사업주거절" />
											</c:when>
										</c:choose>
                                    <tr>
                                      <td class="text-center">${dto.res_no }</td>
                                        <td class="text-center">
                                        ${dto.res_name }</td>
                                        <td class="text-center">${dto.res_num }</td>
                                        <td class="text-center">${dto.res_date }<br>${dto.res_time } 시</td>
                                        <!-- style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" -->
                                        <td class="text-center">
                                        ${dto.res_msg }</td>
                                        <td class="text-center">${dto.res_tel }</td>
                                        <td class="text-center"><small class="text-mute"><a href="./storeDetails.st?s_no=${dto.s_no }">보기</a></small></td>
                                        <td class="text-center">${status }</td>
										<td class="text-center">
										<c:if test="${dto.res_status == 1}">
											<input type="button" style="width:60px" value="쓰기" class="reviewWrite"
											onclick="location.href='./ReviewWrite.rv?s_no=${dto.s_no }&rev_category=1';">
										</c:if>
										&nbsp;
										</td>
									
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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
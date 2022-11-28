<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fork.user.db.CeoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Fork and Knife | My page</title>
      
     	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="./assets/css/myPage_ceo.css">

<style>

.cent {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 13px;
}

#memo { 
  width: 100%; 
  height: auto; 
  opacity: 0.5; 
}

</style>   



  <script>
    $(function(){
      // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
      $('#carousel-example-generic').carousel({
        // 슬리아딩 자동 순환 지연 시간
        // false면 자동 순환하지 않는다.
        interval: 5000,
        // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
        pause: "hover",
        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
        wrap: true,
        // 키보드 이벤트 설정 여부(?)
        keyboard : true
     });
   });
  </script>
<%
	Date d = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	String today = date.format(d);
%>

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
                        <h3 class="panel-title"><a href="./CeoMyPage.us">마이페이지</a></h3>
                      </div>
                      <div class="panel-body recent-property-widget">
                           <ul>
                           <li>
                           	 <a href="./CeoMyPage_st.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/store.png" width="20" height="20">
                               </div>
                             </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry" width="">
                                   <h6><a href="./CeoMyPage_st.us">가게 관리</a></h6>
                               </div>
                             
                           </li>
                           <li>
                           	  <a href="./CeoMyPage_reserv.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/people.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CeoMyPage_reserv.us">예약 관리</a></h6>
                               </div>
                           </li>
                           <li>
                           	  <a href="./CeoMyPage_re.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/review.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CeoMyPage_re.us">리뷰 관리</a></h6>
                               </div>
                           </li>
                            <li>
                           	  <a href="./CouponManage.co">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/coupon.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CouponManage.co">쿠폰 관리</a></h6>
                               </div>
                           </li>
                           <li>
                           	  <a href="./CeoMyPage_Info.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/note.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CeoMyPage_Info.us">회원정보 관리</a></h6>
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
            <div class="well well-sm" style="background:white; width:600px;">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
<!--                     /380x500 -->
                        <img src="assets/img/myPage/comingsoon.png" alt="profile" width=500 height=500 style="border-radius:50%" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>${cdto.c_nickName }</h4>
                        <hr>
                        <table style="font-size:14px; width:90%;">
                          <tr>
                        	<th >아이디</th>
                        	<td >${cdto.c_id }</td>
                            <th >이름</th>
                            <td >${cdto.c_name }</td>
                          </tr>
                          <tr>
                            <th>연락처</th>
                            <td>${cdto.c_tel }</td>
                            <th>이메일</th>
                            <td>${cdto.c_email }</td>
                          </tr>
                          <tr>
                            <th>가입일</th>
                            <td colspan="4">${cdto.c_regdate }</td>
                          <tr>
                        </table>
                        <!-- Split button -->
                        <div class="text-right">
                            <a href="./CeoMyPage_Info.us">수정</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
        
     	   <div class="row">
              <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                  <h4>최근 예약</h4> 
               </div>
            </div>
           

  
   <div class="row">
      <div class="span12"  >
           <div class="well" style="background:white; border:0; height:500px"> 
                <div id="carousel-example-generic" class="carousel slide">
                 
                <ol class="carousel-indicators" style="bottom:0px; margin-bottom:0px">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active" style="border-color:gray"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1" style="border-color:gray"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2" style="border-color:gray"></li>
                </ol>
                 
                <!-- Carousel items -->
                <div class="carousel-inner" >
                    
              <div class="item active" >
               <div class="row-fluid" style="display:flex; padding-left:50px" >
               <c:set var="info" value="${reservInfo}" />
                  <c:forEach var="i" begin="0" end="2" step="1">
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <c:choose>
                     	<c:when test="${info[i]==null}">
                     	 <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                     	 <b>최근 예약 내역이 없어요ㅠㅠ</b>
                     	 </p>
                     	</c:when>
                     	<c:otherwise>
                     <p class="cent" style="font-size:0.7vw; text-align:left; padding:0px 10px 0px 40px; width:100%; height:220px; line-height:170%">
                       <b style="font-size:0.9vw;" >[${info[i].s_name }] </b><br>
                       <b>예약번호 : ${info[i].res_no }</b> <br>
                       <b>성함 : ${info[i].res_name }</b> <br>
                       <b>인원 : ${info[i].res_num }명</b> <br>
                       <b>예약일 : ${info[i].res_date }(${info[i].res_time }시)</b>  <br>
                       <b>메세지 : ${info[i].res_msg }</b> <br>
                       <b>연락처 : ${info[i].res_tel }</b><br>
                       <b>상태 : 
                       <c:choose>
                         <c:when test="${info[i].res_status==0}">
                       	이용 예정
                         </c:when>
                         <c:when test="${info[i].res_status==1}">
                       	이용 완료
                         </c:when>
                         <c:when test="${info[i].res_status==2}">
                       	노쇼
                         </c:when>
                         <c:when test="${info[i].res_status==3}">
                       	거절
                         </c:when>
                      </c:choose></b>
                     </p>
                     	</c:otherwise>
                     </c:choose>
                     </div>
                    </c:forEach>
                   </div><!--/row-fluid-->
                </div><!--/item-->
                
               <div class="item" >
                   <div class="row-fluid" style="display:flex; padding-left:50px" >
               <c:set var="info" value="${reservInfo}" />
                  <c:forEach var="i" begin="3" end="5" step="1">
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <c:choose>
                     	<c:when test="${info[i]==null}">
                     	 <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                     	 <b>최근 예약 내역이 없어요ㅠㅠ</b>
                     	 </p>
                     	</c:when>
                     	<c:otherwise>
                    
                     <p class="cent" style="font-size:0.7vw; text-align:left; padding:0px 10px 0px 40px; width:100%; height:220px; line-height:170%">
                       <b style="font-size:0.9vw;" >[${info[i].s_name }] </b><br>
                       <b>예약번호 : ${info[i].res_no }</b> <br>
                       <b>성함 : ${info[i].res_name }</b> <br>
                       <b>인원 : ${info[i].res_num }명</b> <br>
                       <b>예약일 : ${info[i].res_date }(${info[i].res_time }시)</b>  <br>
                       <b>메세지 : ${info[i].res_msg }</b> <br>
                       <b>연락처 : ${info[i].res_tel }</b><br>
                       <b>상태 : 
                       <c:choose>
                         <c:when test="${info[i].res_status==0}">
                       	이용 예정
                         </c:when>
                         <c:when test="${info[i].res_status==1}">
                       	이용 완료
                         </c:when>
                         <c:when test="${info[i].res_status==2}">
                       	노쇼
                         </c:when>
                         <c:when test="${info[i].res_status==3}">
                       	거절
                         </c:when>
                      </c:choose></b>
                     </p>
                     	</c:otherwise>
                     </c:choose>
                     </div>
                    </c:forEach>
                   </div><!--/row-fluid-->
                </div><!--/item-->
                
                 <div class="item" >
                 <div class="row-fluid" style="display:flex; padding-left:50px" >
               <c:set var="info" value="${reservInfo}" />
                  <c:forEach var="i" begin="5" end="7" step="1">
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <c:choose>
                     	<c:when test="${info[i]==null}">
                     	 <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                     	 <b>최근 예약 내역이 없어요ㅠㅠ</b>
                     	 </p>
                     	</c:when>
                     	<c:otherwise>
                     <p class="cent" style="font-size:0.7vw; text-align:left; padding:0px 10px 0px 40px; width:100%; height:220px; line-height:170%">
                       <b style="font-size:0.9vw;" >[${info[i].s_name }] </b><br>
                       <b>예약번호 : ${info[i].res_no }</b> <br>
                       <b>성함 : ${info[i].res_name }</b> <br>
                       <b>인원 : ${info[i].res_num }명</b> <br>
                       <b>예약일 : ${info[i].res_date }(${info[i].res_time }시)</b>  <br>
                       <b>메세지 : ${info[i].res_msg }</b> <br>
                       <b>연락처 : ${info[i].res_tel }</b><br>
                       <b>상태 : 
                       <c:choose>
                         <c:when test="${info[i].res_status==0}">
                       	이용 예정
                         </c:when>
                         <c:when test="${info[i].res_status==1}">
                       	이용 완료
                         </c:when>
                         <c:when test="${info[i].res_status==2}">
                       	노쇼
                         </c:when>
                         <c:when test="${info[i].res_status==3}">
                       	거절
                         </c:when>
                      </c:choose></b>
                     </p>
                     	</c:otherwise>
                     </c:choose>
                     </div>
                    </c:forEach>
                   </div><!--/row-fluid-->
                </div><!--/item-->
               
                 
                </div><!--/carousel-inner-->
                 
                <div >
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev" style="background:white; height:10px; width:10px; size:20px">
                <span style="color:black; font-size:50px;">‹</span></a>
                </div>
                <div  >
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next" style="background:white; height:10px; width:10px; font-size:20px">
                <span style="color:black; font-size:40px;">></span></a>
                </div>
                </div><!--/myCarousel-->
                 
            </div><!--/well-->   
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
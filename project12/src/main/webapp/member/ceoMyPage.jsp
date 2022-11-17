<%@page import="com.fork.user.db.CeoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Insert title here</title>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="./assets/css/myPage_ceo.css">

<style>
/*    .carousel { */
/*        margin-bottom: 0; */
/*       padding: 0 40px 30px 40px; */
/*    } */
/*    /* Reposition the controls slightly */ */
/*    .carousel-control { */
/*       left: -12px; */
/*    } */
/*    .carousel-control.right { */
/*       right: -12px; */
/*    } */
/*    /* Changes the position of the indicators */ */
/*    .carousel-indicators { */
/*       right: 50%; */
/*       top: auto; */
/*       bottom: 0px; */
/*       margin-right: -19px; */
/*    } */
/*    /* Changes the colour of the indicators */ */
/*    .carousel-indicators li { */
/*       background: #c0c0c0; */
/*    } */
/*    .carousel-indicators .active { */
/*       background: #333333; */
/*    } */

.textbox {
/*   position: relative; */
}

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
<!--                                 <span class="property-price">3000000$</span> -->
                               </div>
                             
                           </li>
                           <li>
                           	  <a href="./CeoMyPage_book.us">
                               <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                   <img src="assets/img/myPage/people.png" width="20" height="20">
                               </div>
                              </a>
                               <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                   <h6> <a href="./CeoMyPage_book.us">예약 관리</a></h6>
<!--                                <span class="property-price">3000000$</span> -->
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
                        <img src="assets/img/myPage/cat.jpg" alt="profile" width=500 height=500 style="border-radius:50%" />
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
                            <a>수정</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
        
<!--                             <ul class="dropdown-menu" role="menu"> -->
<!--                                 <li><a href="#">Twitter</a></li> -->
<!--                                 <li><a href="https://plus.google.com/+Jquery2dotnet/posts">Google +</a></li> -->
<!--                                 <li><a href="https://www.facebook.com/jquery2dotnet">Facebook</a></li> -->
<!--                                 <li class="divider"></li> -->
<!--                                 <li><a href="#">Github</a></li> -->
<!--                             </ul> -->
        
        
        
     	   <div class="row">
              <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                  <h4>오늘 예약</h4> 
               </div>
            </div>
           

  
   <div class="row">
      <div class="span12"  >
           <div class="well" style="background:white; border:0; height:500px"> 
                <div id="carousel-example-generic" class="carousel slide">
                 
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                 
                <!-- Carousel items -->
                <div class="carousel-inner" >
                    
                <div class="item active" >
                   <div class="row-fluid" style="display:flex; padding-left:50px" >
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >BBQ 치킨 </b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >후라이드참잘하는집</b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >굽네 치킨 </b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
                   </div><!--/row-fluid-->
                </div><!--/item-->
                 
                <div class="item" >
                   <div class="row-fluid" style="display:flex; padding-left:50px" >
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >60계 치킨 </b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >네네치킨</b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >동근이두마리치킨 </b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
                   </div><!--/row-fluid-->
                </div><!--/item-->
                 
                <div class="item" >
                   <div class="row-fluid" style="display:flex; padding-left:50px" >
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >BBQ 치킨 </b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >후라이드참잘하는집</b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
                     <div class="shbox" style="width:30%; position: relative;">
                     <img src="assets/img/myPage/memo5.png" id="memo" style="width:100%; margin:10px;">
                     <p class="cent" style="text-align:left; padding:0px 10px 0px 40px; width:100%; line-height:170%">
                       <b style="font-size:15px;" >BBQ 치킨 </b><br>
                       <b>예약번호 : 123</b> <br>
                       <b>성함 : 홍길동</b> <br>
                       <b>인원 : 2명</b> <br>
                       <b>예약시간 :19:00</b>  <br>
                       <b>메뉴 : 황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L</b> <br>
                       <b>연락처 : 010-1111-1111</b><br>
                       <b>선호자리 : 창가</b>
                     </p>
                     </div>
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
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
                                   <img src="./assets/img/myPage/people.png" width="20" height="20">
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
  <div class="row tm-content-row tm-mt-big" >
  	<i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h3 class="tm-block-title d-inline-block">예 약 관 리
                                <select style="font-size:10px">
	                               <option>BBQ치킨</option>
	                               <option>네네치킨</option>
	                               <option>굽네치킨</option>
                               </select>
                               </h3>
                            </div>
                            <br>
                            <div class="text-right">
                            <select style="font-size:10px">
                            	<option>예약번호</option>
                            	<option>성함</option>
                            	<option>연락처</option>
                            </select>
                            <input type="search" style="width:10%;border:1px solid; padding:0px; font-size:10px;" placeholder="검색어를 입력해주세요">
                            <button type="button"><i class="glyphicon glyphicon-search"></i></button>
                            </div>
                        </div>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3" style="table-layout:fixed">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col" class="text-center" width="80px">예약번호</th>
                                        <th scope="col" class="text-center" width="100px">성함</th>
                                        <th scope="col" class="text-center" width="50px">인원</th>
                                        <th scope="col" class="text-center" width="100px">날짜 및 시간</th>
                                        <th scope="col" class="text-center" width="200px">메뉴</th>
                                        <th scope="col" class="text-center" width="120px">연락처</th>
                                        <th scope="col" class="text-center" width="80px">선호 자리</th>
                                        <th scope="col" class="text-center" width="50px">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">123</td>
                                        <td class="text-center">
                                        홍길동</td>
                                        <td class="text-center">2명</td>
                                        <td class="text-center">2022-11-12<br>19:00</td>
                                        <!-- style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" -->
                                        <td class="text-center">
                                        황금올리브치킨,자메이카 소떡만나치킨, 크런치 버터치킨,페퍼로니 시카고피자L </td>
                                        <td class="text-center">010-1234-1234</td>
                                        <td class="text-center">창가</td>
                                        <td align="center"><i class="glyphicon glyphicon-remove"></i></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">123</td>
                                        <td class="text-center">김철수</td>
                                        <td class="text-center">4명</td>
                                        <td class="text-center">2022-1-12<br>13:00</td>
                                        <td class="text-center">햄버거, 포테이토</td>
                                        <td class="text-center">010-1111-1111</td>
                                        <td class="text-center">야외</td>
                                        <td align="center"><i class="glyphicon glyphicon-remove"></i></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">123</td>
                                        <td class="text-center">이순신</td>
                                        <td class="text-center">4명</td>
                                        <td class="text-center">2022-1-12<br>13:00</td>
                                        <td class="text-center">햄버거, 포테이토</td>
                                        <td class="text-center">010-1111-1111</td>
                                        <td class="text-center">야외</td>
                                        <td align="center"><i class="glyphicon glyphicon-remove"></i></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">123</td>
                                        <td class="text-center">ㅇㅇㅇ</td>
                                        <td class="text-center">4명</td>
                                        <td class="text-center">2022-1-12<br>13:00</td>
                                        <td class="text-center">햄버거, 포테이토</td>
                                        <td class="text-center">010-1111-1111</td>
                                        <td class="text-center">야외</td>
                                        <td align="center"><i class="glyphicon glyphicon-remove"></i></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">123</td>
                                        <td class="text-center">ㅇㅇㅇ</td>
                                        <td class="text-center">4명</td>
                                        <td class="text-center">2022-1-12<br>13:00</td>
                                        <td class="text-center">햄버거, 포테이토</td>
                                        <td class="text-center">010-1111-1111</td>
                                        <td class="text-center">야외</td>
                                        <td align="center"><i class="glyphicon glyphicon-remove"></i></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">123</td>
                                        <td class="text-center">ㅇㅇㅇ</td>
                                        <td class="text-center">4명</td>
                                        <td class="text-center">2022-1-12<br>13:00</td>
                                        <td class="text-center">햄버거, 포테이토</td>
                                        <td class="text-center">010-1111-1111</td>
                                        <td class="text-center">야외</td>
                                        <td align="center"><i class="glyphicon glyphicon-remove"></i></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">123</td>
                                        <td class="text-center">ㅇㅇㅇ</td>
                                        <td class="text-center">4명</td>
                                        <td class="text-center">2022-1-12<br>13:00</td>
                                        <td class="text-center">햄버거, 포테이토</td>
                                        <td class="text-center">010-1111-1111</td>
                                        <td class="text-center">야외</td>
                                        <td align="center"><i class="glyphicon glyphicon-remove"></i></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">123</td>
                                        <td class="text-center">ㅇㅇㅇ</td>
                                        <td class="text-center">4명</td>
                                        <td class="text-center">2022-1-12<br>13:00</td>
                                        <td class="text-center">햄버거, 포테이토</td>
                                        <td class="text-center">010-1111-1111</td>
                                        <td class="text-center">야외</td>
                                        <td align="center"><i class="glyphicon glyphicon-remove"></i></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div align="center"> <h3>< 1 2 3 ></h3></div>
                        
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
   <head>
      <title>Insert title here</title>

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
                                <h3 class="tm-block-title d-inline-block">리 뷰 관 리
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
                            	<option>최신순</option>
                            	<option>별점 높은순</option>
                            	<option>별점 낮은순</option>
                            </select>
                        </div>
                  </div>
                    
                    <hr>

                    <div class="col-md-12 clear" style="line-height:20px">
                        <div id="list-type" class="proerty-th">
                            <div class="col-sm-6 col-md-4 p0" style="width:270px">
                                    <div class="box-two proerty-item">
                                        <div class="text-left">
                                            <img src="assets/img/demo/property-3.jpg" style="width:100px; height:100px; padding:5px;">
                                            <p class="text-right" style="margin-bottom:-10px; margin-top:-70px; margin-right:20px; line-height:0;"><b>닉네임: 배고프다</b></p><br>
                                            <p class="text-right" style="margin-bottom:30px; line-height:0; margin-right:30px; font-size:10px;">★★★★★&nbsp;2022-11-12</p>
                                            <p class="text-right" style="margin-bottom:10px; margin-top:-25px; line-height:0; margin-right:60px;">
                                            <i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;
                                            <i class="glyphicon glyphicon-alert"></i>
                                            </p>
                                            <div style="">
<!--                                             <h6 style="margin-bottom:-10px; line-height:0;">닉네임: 배고프다</h6><br> -->
<!--                                             <h6 style="margin-bottom:-10px; line-height:0; font-size:10px;">★★★★★&nbsp;2022-11-12</h6> -->
<!--                                             <h6 class="pull-right" style="margin-bottom:-10px; line-height:0; "><i class="glyphicon glyphicon-alert"></i></h6><br> -->
                                            </div>
                                        </div>
                                        <div class="item-entry overflow">
                                            <div>추천 받고 왔어요 직원분들 다 너무 친절하시고 맛도 미쳤습니다ㅠㅠ 다들 먹으러 오세요</div><br>
<!--                                             <div class="text-right">[답글]</div> -->
											<p>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b>사장님&nbsp;</b></span>
                                            <span style="font-size:10px">2022-11-12</span>
<!--                                             <span class="proerty-price pull-right"> $ 300,000</span> -->
                                            <textarea id="area" rows="5" cols="32" style="background:#F6F6F6; border-radius:10px;" >저희 매장을 이용해주셔서 감사합니다^^ 손님들이 맛있게 먹어주시는게 저의 보람이랍니다^^</textarea><br>
                                            </p>
                                        </div>
                                    </div>
                                </div> 
                         
                                
                            <div class="col-sm-6 col-md-4 p0" style="width:270px">
                                    <div class="box-two proerty-item">
                                        <div class="text-left">
                                            <img src="assets/img/demo/property-3.jpg" style="width:100px; height:100px; padding:5px;">
                                            <p class="text-right" style="margin-bottom:-10px; margin-top:-70px; margin-right:20px; line-height:0;"><b>닉네임: 배고프다</b></p><br>
                                            <p class="text-right" style="margin-bottom:30px; line-height:0; margin-right:30px; font-size:10px;">★★★★★&nbsp;2022-11-12</p>
                                            <p class="text-right" style="margin-bottom:10px; margin-top:-25px; line-height:0; margin-right:60px;">
                                            <i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;
                                            <i class="glyphicon glyphicon-alert"></i>
                                            </p>
                                            <div style="">
<!--                                             <h6 style="margin-bottom:-10px; line-height:0;">닉네임: 배고프다</h6><br> -->
<!--                                             <h6 style="margin-bottom:-10px; line-height:0; font-size:10px;">★★★★★&nbsp;2022-11-12</h6> -->
<!--                                             <h6 class="pull-right" style="margin-bottom:-10px; line-height:0; "><i class="glyphicon glyphicon-alert"></i></h6><br> -->
                                            </div>
                                        </div>
                                        <div class="item-entry overflow">
                                            <div>추천 받고 왔어요 직원분들 다 너무 친절하시고 맛도 미쳤습니다ㅠㅠ 다들 먹으러 오세요</div><br>
<!--                                             <div class="text-right">[답글]</div> -->
											<p>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b>사장님&nbsp;</b></span>
                                            <span style="font-size:10px">2022-11-12</span>
<!--                                             <span class="proerty-price pull-right"> $ 300,000</span> -->
                                            <textarea id="area" rows="5" cols="32" style="background:#F6F6F6; border-radius:10px;" >저희 매장을 이용해주셔서 감사합니다^^ 손님들이 맛있게 먹어주시는게 저의 보람이랍니다^^</textarea><br>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                
                                  <div class="col-sm-6 col-md-4 p0" style="width:270px">
                                    <div class="box-two proerty-item">
                                        <div class="text-left">
                                            <img src="assets/img/demo/property-3.jpg" style="width:100px; height:100px; padding:5px;">
                                            <p class="text-right" style="margin-bottom:-10px; margin-top:-70px; margin-right:20px; line-height:0;"><b>닉네임: 배고프다</b></p><br>
                                            <p class="text-right" style="margin-bottom:30px; line-height:0; margin-right:30px; font-size:10px;">★★★★★&nbsp;2022-11-12</p>
                                            <p class="text-right" style="margin-bottom:10px; margin-top:-25px; line-height:0; margin-right:60px;">
                                            <i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;
                                            <i class="glyphicon glyphicon-alert"></i>
                                            </p>
                                            <div style="">
<!--                                             <h6 style="margin-bottom:-10px; line-height:0;">닉네임: 배고프다</h6><br> -->
<!--                                             <h6 style="margin-bottom:-10px; line-height:0; font-size:10px;">★★★★★&nbsp;2022-11-12</h6> -->
<!--                                             <h6 class="pull-right" style="margin-bottom:-10px; line-height:0; "><i class="glyphicon glyphicon-alert"></i></h6><br> -->
                                            </div>
                                        </div>
                                        <div class="item-entry overflow">
                                            <div>추천 받고 왔어요 직원분들 다 너무 친절하시고 맛도 미쳤습니다ㅠㅠ 다들 먹으러 오세요</div><br>
<!--                                             <div class="text-right">[답글]</div> -->
											<p>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b>사장님&nbsp;</b></span>
                                            <span style="font-size:10px">2022-11-12</span>
<!--                                             <span class="proerty-price pull-right"> $ 300,000</span> -->
                                            <textarea id="area" rows="5" cols="32" style="background:#F6F6F6; border-radius:10px;" >저희 매장을 이용해주셔서 감사합니다^^ 손님들이 맛있게 먹어주시는게 저의 보람이랍니다^^</textarea><br>
                                            </p>
                                        </div>
                                    </div>
                                </div> 
                                
                                 <div class="col-sm-6 col-md-4 p0" style="width:270px">
                                    <div class="box-two proerty-item">
                                        <div class="text-left">
                                            <img src="assets/img/demo/property-3.jpg" style="width:100px; height:100px; padding:5px;">
                                            <p class="text-right" style="margin-bottom:-10px; margin-top:-70px; margin-right:20px; line-height:0;"><b>닉네임: 배고프다</b></p><br>
                                            <p class="text-right" style="margin-bottom:30px; line-height:0; margin-right:30px; font-size:10px;">★★★★★&nbsp;2022-11-12</p>
                                            <p class="text-right" style="margin-bottom:10px; margin-top:-25px; line-height:0; margin-right:60px;">
                                            <i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;
                                            <i class="glyphicon glyphicon-alert"></i>
                                            </p>
                                            <div style="">
<!--                                             <h6 style="margin-bottom:-10px; line-height:0;">닉네임: 배고프다</h6><br> -->
<!--                                             <h6 style="margin-bottom:-10px; line-height:0; font-size:10px;">★★★★★&nbsp;2022-11-12</h6> -->
<!--                                             <h6 class="pull-right" style="margin-bottom:-10px; line-height:0; "><i class="glyphicon glyphicon-alert"></i></h6><br> -->
                                            </div>
                                        </div>
                                        <div class="item-entry overflow">
                                            <div>추천 받고 왔어요 직원분들 다 너무 친절하시고 맛도 미쳤습니다ㅠㅠ 다들 먹으러 오세요</div><br>
<!--                                             <div class="text-right">[답글]</div> -->
											<p>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b>사장님&nbsp;</b></span>
                                            <span style="font-size:10px">2022-11-12</span>
<!--                                             <span class="proerty-price pull-right"> $ 300,000</span> -->
                                            <textarea id="area" rows="5" cols="32" style="background:#F6F6F6; border-radius:10px;" >저희 매장을 이용해주셔서 감사합니다^^ 손님들이 맛있게 먹어주시는게 저의 보람이랍니다^^</textarea><br>
                                            </p>
                                        </div>
                                    </div>
                                </div> 
                                
                                 <div class="col-sm-6 col-md-4 p0" style="width:270px">
                                    <div class="box-two proerty-item">
                                        <div class="text-left">
                                            <img src="assets/img/demo/property-3.jpg" style="width:100px; height:100px; padding:5px;">
                                            <p class="text-right" style="margin-bottom:-10px; margin-top:-70px; margin-right:20px; line-height:0;"><b>닉네임: 배고프다</b></p><br>
                                            <p class="text-right" style="margin-bottom:30px; line-height:0; margin-right:30px; font-size:10px;">★★★★★&nbsp;2022-11-12</p>
                                            <p class="text-right" style="margin-bottom:10px; margin-top:-25px; line-height:0; margin-right:60px;">
                                            <i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;
                                            <i class="glyphicon glyphicon-alert"></i>
                                            </p>
                                            <div style="">
<!--                                             <h6 style="margin-bottom:-10px; line-height:0;">닉네임: 배고프다</h6><br> -->
<!--                                             <h6 style="margin-bottom:-10px; line-height:0; font-size:10px;">★★★★★&nbsp;2022-11-12</h6> -->
<!--                                             <h6 class="pull-right" style="margin-bottom:-10px; line-height:0; "><i class="glyphicon glyphicon-alert"></i></h6><br> -->
                                            </div>
                                        </div>
                                        <div class="item-entry overflow">
                                            <div>추천 받고 왔어요 직원분들 다 너무 친절하시고 맛도 미쳤습니다ㅠㅠ 다들 먹으러 오세요</div><br>
<!--                                             <div class="text-right">[답글]</div> -->
											<p>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b>사장님&nbsp;</b></span>
                                            <span style="font-size:10px">2022-11-12</span>
<!--                                             <span class="proerty-price pull-right"> $ 300,000</span> -->
                                            <textarea id="area" rows="5" cols="32" style="background:#F6F6F6; border-radius:10px;" >저희 매장을 이용해주셔서 감사합니다^^ 손님들이 맛있게 먹어주시는게 저의 보람이랍니다^^</textarea><br>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                
                                 <div class="col-sm-6 col-md-4 p0" style="width:270px">
                                    <div class="box-two proerty-item">
                                        <div class="text-left">
                                            <img src="assets/img/demo/property-3.jpg" style="width:100px; height:100px; padding:5px;">
                                            <p class="text-right" style="margin-bottom:-10px; margin-top:-70px; margin-right:20px; line-height:0;"><b>닉네임: 배고프다</b></p><br>
                                            <p class="text-right" style="margin-bottom:30px; line-height:0; margin-right:30px; font-size:10px;">★★★★★&nbsp;2022-11-12</p>
                                            <p class="text-right" style="margin-bottom:10px; margin-top:-25px; line-height:0; margin-right:60px;">
                                            <i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;
                                            <i class="glyphicon glyphicon-alert"></i>
                                            </p>
                                            <div style="">
<!--                                             <h6 style="margin-bottom:-10px; line-height:0;">닉네임: 배고프다</h6><br> -->
<!--                                             <h6 style="margin-bottom:-10px; line-height:0; font-size:10px;">★★★★★&nbsp;2022-11-12</h6> -->
<!--                                             <h6 class="pull-right" style="margin-bottom:-10px; line-height:0; "><i class="glyphicon glyphicon-alert"></i></h6><br> -->
                                            </div>
                                        </div>
                                        <div class="item-entry overflow">
                                            <div>추천 받고 왔어요 직원분들 다 너무 친절하시고 맛도 미쳤습니다ㅠㅠ 다들 먹으러 오세요</div><br>
<!--                                             <div class="text-right">[답글]</div> -->
											<p>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b>사장님&nbsp;</b></span>
                                            <span style="font-size:10px">2022-11-12</span>
<!--                                             <span class="proerty-price pull-right"> $ 300,000</span> -->
                                            <textarea id="area" rows="5" cols="32" style="background:#F6F6F6; border-radius:10px;" >저희 매장을 이용해주셔서 감사합니다^^ 손님들이 맛있게 먹어주시는게 저의 보람이랍니다^^</textarea><br>
                                            </p>
                                        </div>
                                    </div>
                                </div> 
                                
                        </div>
                    </div>
                    
                    <div class="col-md-12"> 
                        <div class="pull-right">
                            <div class="pagination">
                                <ul>
                                    <li><a href="#">Prev</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">Next</a></li>
                                </ul>
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
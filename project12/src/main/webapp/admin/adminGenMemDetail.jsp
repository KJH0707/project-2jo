<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <title>Fork and Knife | Admin</title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
       <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <jsp:include page="../inc/adminTop.jsp"/>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <jsp:include page="../inc/adminSidebar.jsp"/>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="influence-profile">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h3 class="mb-2">회원 상세정보</h3>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">회원 상세 정보</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- content -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- profile -->
                        <!-- ============================================================== -->
                        <div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
                            <!-- ============================================================== -->
                            <!-- card profile -->
                            <!-- ============================================================== -->
                            <div class="card">
                                <div class="card-body">
                                    <div class="user-avatar text-center d-block">
                                        <img src="assets/images/avatar-1.jpg" alt="User Avatar" class="rounded-circle user-avatar-xxl">
                                    </div>
                                    <div class="text-center">
                                        <h2 class="font-24 mb-0">${dto.m_name }</h2>
                                        <p>@General</p>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Contact Information</h3>
                                    <div class="">
                                        <ul class="list-unstyled mb-0">
                                        <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${dto.m_email }</li>
                                        <li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i>${dto.m_tel }</li>
                                    </ul>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Rating</h3>
                                    <h1 class="mb-0">4.8</h1>
                                    <div class="rating-star">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <p class="d-inline-block text-dark">14 Reviews </p>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Social Channels</h3>
                                    <div class="">
                                        <ul class="mb-0 list-unstyled">
                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-facebook-square mr-1 facebook-color"></i>fb.me/michaelchristy</a></li>
                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-twitter-square mr-1 twitter-color"></i>twitter.com/michaelchristy</a></li>
                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-instagram mr-1 instagram-color"></i>instagram.com/michaelchristy</a></li>
                                        <li class="mb-1"><a href="#"><i class="fas fa-fw fa-rss-square mr-1 rss-color"></i>michaelchristy.com/blog</a></li>
                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-pinterest-square mr-1 pinterest-color"></i>pinterest.com/michaelchristy</a></li>
                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-youtube mr-1 youtube-color"></i>youtube/michaelchristy</a></li>
                                    </ul>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Category</h3>
                                    <div>
                                        <a href="#" class="badge badge-light mr-1">Fitness</a><a href="#" class="badge badge-light mr-1">Life Style</a><a href="#" class="badge badge-light mr-1">Gym</a>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end card profile -->
                            <!-- ============================================================== -->
                        </div>
                        <!-- ============================================================== -->
                        <!-- end profile -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- campaign data -->
                        <!-- ============================================================== -->
                        <div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
                            <!-- ============================================================== -->
                            <!-- campaign tab one -->
                            <!-- ============================================================== -->
                            <div class="influence-profile-content pills-regular">
                                <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-campaign-tab" href="#">이용 기록</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-packages-tab" href="./GenMemDetailReport.us?m=${param.m }">신고 목록</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-packages-tab" href="./adminGenMemDetailReview.us?m=${param.m }">리뷰 목록</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-campaign" role="tabpanel" aria-labelledby="pills-campaign-tab">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h3 class="section-title">얼마나 활동했노?</h3>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">${cnt["review"]}</h1>
                                                        <p>등록된 리뷰 갯수</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">${cnt["report"]}</h1>
                                                        <p>등록된 신고 갯수</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">${cnt["reservation"]}</h1>
                                                        <p>등록된 예약 갯수</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">${cnt["payment"] }</h1>
                                                        <p>등록된 결제 횟수</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="section-block">
                                            <h3 class="section-title">예약 내역</h3>
                                        </div>
<!--                                         card one -->
										<c:forEach var="res" items="${reservList }">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="media influencer-profile-data d-flex align-items-center p-2">
                                                            <div class="mr-4">
                                                                <img src="assets/images/slack.png" alt="User Avatar" class="user-avatar-lg">
                                                            </div>
                                                            <div class="media-body ">
                                                                <div class="influencer-profile-data">
                                                                    <h3 class="m-b-10"><a href="./storeDetails.st?s_no=${res.s_no }">${res.s_name }</a></h3>
                                                                    <p>
                                                                        <span class="m-r-20 d-inline-block">예약 일자
                                                                            <span class="m-l-10 text-primary">${res.res_date }</span>
                                                                        </span>
                                                                        <span class="m-r-20 d-inline-block"> 예약 시간
                                                                            <span class="m-l-10 text-secondary">${res.res_time }:00</span>
                                                                        </span>
                                                                            
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="border-top card-footer p-0">
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">${res.res_no }</h4>
                                                    <p>예약 번호</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">${res.res_num }</h4>
                                                    <p>예약 인원</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">${res.res_name }</h4>
                                                    <p>예약자 명</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <c:if test="${res.res_status==0 }">
                                                    <h4 class="mb-0">이용 예정</h4>
                                                    <p>상태</p>
                                                    </c:if>
                                                     <c:if test="${res.res_status==1 }">
                                                    <h4 class="mb-0">이용 완료</h4>
                                                    <p>상태</p>
                                                    </c:if>
                                                     <c:if test="${res.res_status==2 }">
                                                    <h4 class="mb-0">노쇼 하심</h4>
                                                    <p>상태</p>
                                                    </c:if>
                                                    <c:if test="${res.res_status==3 }">
                                                    <h4 class="mb-0">점장 거절</h4>
                                                    <p>상태</p>
                                                    </c:if>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0"><a href="#" onclick="window.open('./genMemReservMsg.us?msg=${res.res_msg}','예약 메세지','width=600, height=150, left=700, top=400')">
                                                    보기</a></h4>
                                                    <p>예약 메세지</p>
                                                </div>
                                                
                                            </div>
                                            
                                        </div>
                                        
                                        </c:forEach>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                            	<c:if test="${reqeustScope.totalCnt != 0 }">
                                            		<c:if test="${startPage > pageBlock }">
		                                                <li class="page-item"><a class="page-link" href="./adminGenMemDetail.us?pageNum=${startPage-pageBlock }&m=${param.m}">Previous</a></li>
		                                            </c:if>
		                                            <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		                                                <li class="page-item"><a class="page-link"  href="./adminGenMemDetail.us?pageNum=${i }&m=${param.m}">${i }</a></li>
		                                            </c:forEach>   
		                                            <c:if test="${endPage < pageCount }">
		                                                <li class="page-item"><a class="page-link"  href="./adminGenMemDetail.us?pageNum=${startPage+pageBlock }&m=${param.m}">[Next]]</a></li>
		                                            </c:if>
		                                        </c:if>
                                            </ul>
                                        </nav>
<!--                                         card one -->
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end campaign tab one -->
                            <!-- ============================================================== -->
                        </div>
                        <!-- ============================================================== -->
                        <!-- end campaign data -->
                        <!-- ============================================================== -->
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end content -->
            <!-- ============================================================== -->
<!--             <div class="footer"> -->
<!--                 <div class="container-fluid"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                             Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>. -->
<!--                         </div> -->
<!--                         <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                             <div class="text-md-right footer-links d-none d-sm-block"> -->
<!--                                 <a href="javascript: void(0);">About</a> -->
<!--                                 <a href="javascript: void(0);">Support</a> -->
<!--                                 <a href="javascript: void(0);">Contact Us</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1  -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
   
</body>
 
</html>
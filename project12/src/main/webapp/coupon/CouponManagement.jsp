<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
         <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fork and Knife | Coupon</title>
        <meta name="description" content="company is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
		
		 <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">

<script language="javascript">
	function showPopup() { window.open("./CouponIssue.co", "", "width=510, height=410, resizable=no, left=100, top=100"); }
</script>


    </head>
    <body>

     <jsp:include page="../inc/top.jsp" />
     <jsp:include page="../inc/categories.jsp" />

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">CEO MYPAGE</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

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
<!-- ////////////////////// 목록 //////////////////// -->
	<div class="col-md-9 p0 padding-top-40 properties-page">
        <!-- main area -->
        <div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
            <div class="container">  
		<%-- ${couponList } --%>
					<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h3 class="card-header">쿠폰현황
                            <button type="button" onclick="showPopup()" style="background:black; color:white; font-size:13px;">신규 쿠폰 발행</button>
                            </h3>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col" >번호</th>
                                            <th scope="col">쿠폰이름</th>
                                            <th scope="col">사용처</th>
                                            <th scope="col">잔여량</th>
                                            <th scope="col">사용기간</th>
                                            <th scope="col">관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="dto" items="${couponListAll }">                                        
                                        <tr>
                                            <th scope="row" id="c_code">${dto.c_code }</th>
                                            <td>${dto.c_name }</td>
                                            <td>${dto.c_place }</td>
                                            <td>${dto.c_quantity }</td>
                                            <td>${dto.c_sdate} ~ ${dto.c_edate}</td>
                                            <td>
								 	<a href="./CouponModify.co?c_code=${dto.c_code }" onclick="window.open(this.href, '_blank', 'width=510, height=410, resizable=no, left=100, top=100'); return false;">수정 </a>   
								 	&nbsp;&nbsp;/
								 	<a href="./CouponDeleteAction.co?c_code=${dto.c_code }" onclick="return confirm('삭제하면 복구할 수 없습니다. 정말 삭제하시겠습니까?')">삭제</a>
								</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <c:if test="${totalCnt != 0}" >  <!-- ${requestScope.totalCnt} -->

						<!-- 이전 -->
						<c:if test="${startPage > pageBlock}">
								<a href="./CouponManage.co?pageNum=${startPage-pageBlock }">[이전]</a> 
							</c:if>
							<!-- 페이지 번호(1,2,3,4 ...)  -->		
							<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
								<a href="./CouponManage.co?pageNum=${i }">${i }</a>
							</c:forEach>
							<!-- 다음 -->
							<c:if test="${endPage < pageCount}">
							<a href="./CouponManage.co?pageNum=${startPage+pageBlock }">[다음]</a>
							</c:if>
							
						</c:if>
                	</div>
					<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h3 class="card-header">만료된 쿠폰 <small>(삭제/재고없음/기간만료)</small></h3>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">번호</th>
                                            <th scope="col">쿠폰이름</th>
                                            <th scope="col">사용처</th>
                                            <th scope="col">잔여량</th>
                                            <th scope="col">배포기간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="Invaild" items="${InvaildCoupon }">                
                                        <tr>
                                            <th scope="row">${Invaild.c_code }</th>
                                            <td>${Invaild.c_name }</td>
                                            <td>${Invaild.c_place }</td>
                                            <td>${Invaild.c_quantity }</td>
                                            <td>${Invaild.c_sdate} ~ ${Invaild.c_edate}</td>
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
    <!-- ////////////////////// 목록 //////////////////// -->
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
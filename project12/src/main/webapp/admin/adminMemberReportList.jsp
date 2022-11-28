<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
    <title>Fork and Knife | Admin</title>
    <script type="text/javascript">
    function isDelete(x,y){
    
    var isMove = confirm("진짜 삭제하실?");
	
	if(isMove){
		// 장바구니 페이지 이동
		location.href="./adminDeleteReportAction.us?rep_no="+x+"&pageNum="+y;
	}
	
	}
    
    </script>
    
</head>

<body>
<!-- body content ~ End of nav bar 가 top.jsp -->
      <jsp:include page="../inc/adminTop.jsp" />
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- 왼쪽 사이드바(left sidebar) -->
        <!-- ============================================================== -->
        <jsp:include page="../inc/adminSidebar.jsp" />
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        
                            <div class="page-header">
                                <h2 class="pageheader-title">관리자 Dashboard</h2>
                                <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">신고 목록</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="ecommerce-widget">
                        <div class="row">
                            <!-- 가게 목록  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                            <div class="influence-profile-content pills-regular">
                                <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link" href="./adminReportList.us?s=1">가게 신고 목록</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">일반 회원 신고 목록</a>
                                    </li>
                                </ul>
                                </div>
                                <div class="card">
                                    <h5 class="card-header">General Member List</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">No.</th>
                                                        <th class="border-0">신고자 닉네임(ID)</th>
                                                        <th class="border-0">피신고자 닉네임(ID)</th>
                                                        <th class="border-0">신고 횟수</th>
                                                        <th class="border-0">신고 상세보기</th>
                                                        <th class="border-0">신고 일자</th>
                                                        <th class="border-0">관리</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <!-- 가게 정보입력 -->
                                                <tbody>
                                                    <c:forEach var="rep" items="${repList }">
                                                    <tr>
                                                    
                                                        <td>${rep.rep_no}</td>
<!--                                                         <td> -->
<!--                                                             <div class="m-r-10"><img src="assets/images/product-pic.jpg" alt="user" class="rounded" width="45"></div> -->
<!--                                                         </td> -->
                                                        <td>${rep.m_nickname }(<a href="./adminGenMemDetail.us?m=${rep.m_no}"><b>${rep.m_id }</b></a>)</td>
                                                        <td>${rep.rep_m_nickname }(<a href="./adminGenMemDetail.us?m=${rep.rep_m_no}"><b>${rep.rep_m_id }</b></a>)</td>
                                                        <td>${rep.rep_howmany }</td>
                                                        <td><a href="#" onclick="window.open('./reportDetail.bk?rep_no=${rep.rep_no}','예약 메세지','width=700, height=1000, left=700, top=400')"><b>상세 보기</b></a></td>
                                                        
                                                        <td>${rep.rep_date}</td>
                                                       
                                                        <td>
                                                        	<a href="#" onclick="window.open('./adminSanction.us?s=${rep.s_no}&m_email=${rep.m_email }&rep_m=${rep.rep_m_no }','예약 메세지','width=420, height=360, left=700, top=400')">
                                                    제재</a>
                                                        	
                                                        	<a href="javascript: isDelete(${rep.rep_no },${pageNum })">삭제</a>
                                                         </td>
                                                    </tr>
                                                   </c:forEach>
                                                    <tr>
                                                    	<td colspan="4"> <!-- 페이지 -->
                                                    	<nav aria-label="Page navigation example">
				                                            <ul class="pagination">
				                                            	<c:if test="${reqeustScope.totalCnt != 0 }">
				                                            		<c:if test="${startPage > pageBlock }">
						                                                <li class="page-item"><a class="page-link" href="./adminReportList.us?pageNum=${startPage-pageBlock }">Previous</a></li>
						                                            </c:if>
						                                            <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						                                                <li class="page-item"><a class="page-link"  href="./adminReportList.us?pageNum=${i }">${i }</a></li>
						                                            </c:forEach>   
						                                            <c:if test="${endPage < pageCount }">
						                                                <li class="page-item"><a class="page-link"  href="./adminReportList.us?pageNum=${startPage+pageBlock }">[Next]]</a></li>
						                                            </c:if>
						                                            
						                                        </c:if>
				                                            </ul>
				                                        </nav>
				                                        </td>
                                                    </tr>
                                                </tbody>
                                                <!-- 가게 정보입력 -->
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-9">
                    		<form action="./adminReportList.us?u=1" method="post">
                                <input class="form-controlkjh" type="text" placeholder="신고자 닉네임 검색" name="keyword" value="${keyword }">
                                <input type="submit" value="검색" class="btn btn-primary">
                                <a href="./adminReportList.us?u=1" class="btn btn-primary">전체보기</a>
                            </form>
                            	
                    		</div>
                            <!-- ============================================================== -->
                            <!-- end recent orders  -->

    
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- customer acquistion  -->
                            <!-- ============================================================== -->
                            
                        </div>
                            
                        
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <jsp:include page="../inc/adminBottom.jsp" />
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
    <!-- chart chartist js -->
    <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js -->
    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
    <!-- chart c3 js -->
    <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>
</body>
 
</html>
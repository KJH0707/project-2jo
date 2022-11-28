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
		location.href="./adminDeleteStoreAction.us?s_no="+x+"&pageNum="+y;
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
                                            <li class="breadcrumb-item active" aria-current="page">가게관리 (가게 이름이나 사업주 명 클릭시 상세 보기 가능)</li>
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
                                <div class="card">
                                    <h5 class="card-header">Store Lists</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">가게번호</th>
                                                        <th class="border-0">Image</th>
                                                        <th class="border-0">Store Name</th>
                                                        <th class="border-0">사업자번호</th>
                                                        <th class="border-0">식당종류</th>
                                                        <th class="border-0">위치</th>
                                                        <th class="border-0">등록일자</th>
                                                        <th class="border-0">사업주</th>
                                                        <th class="border-0">관리</th>
                                                    </tr>
                                                </thead>
                                                <!-- 가게 정보입력 -->
                                                <tbody>
                                                    <c:forEach var="st" items="${storeListAll }">
                                                    <tr>
                                                    
                                                        <td>${st.s_no }</td>
                                                        <td>
                                                            <div class="m-r-10"><img src="assets/images/product-pic.jpg" alt="user" class="rounded" width="45"></div>
                                                        </td>
                                                        <td><a href="./storeDetails.st?s_no=${st.s_no}">${st.s_name }</a></td>
                                                        <td>${st.s_number }</td>
                                                        <td>${st.s_type }</td>
                                                        <td>${st.s_addr }</td>
                                                        <td>${st.s_regdate }</td>
                                                        <td><a href="./adminCeoMemDetail.us?c=${st.c_no}">${st.c_name }</a></td>
                                                        <td>
                                                        	<a href="#">수정</a> 
                                                        	
                                                        	<a href="javascript: isDelete(${st.s_no },${pageNum })">삭제</a>
                                                         </td>
                                                    </tr>
                                                   </c:forEach>
                                                    
                                                    <tr>
                                                    	<td colspan="4"> <!-- 페이지 -->
                                                    	<nav aria-label="Page navigation example">
				                                            <ul class="pagination">
				                                            	<c:if test="${reqeustScope.totalCnt != 0 }">
				                                            		<c:if test="${startPage > pageBlock }">
						                                                <li class="page-item"><a class="page-link" href="./adminStoreList.us?pageNum=${startPage-pageBlock }">Previous</a></li>
						                                            </c:if>
						                                            <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						                                                <li class="page-item"><a class="page-link"  href="./adminStoreList.us?pageNum=${i }">${i }</a></li>
						                                            </c:forEach>   
						                                            <c:if test="${endPage < pageCount }">
						                                                <li class="page-item"><a class="page-link"  href="./adminStoreList.us?pageNum=${startPage+pageBlock }">[Next]]</a></li>
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
                    		<form action="./adminStoreList.us" method="post">
                                <input class="form-controlkjh" type="text" placeholder="가게 이름 검색" name="keyword" value="${keyword }">
                                <input type="submit" value="검색" class="btn btn-primary">
                                <a href="./adminStoreList.us" class="btn btn-primary">전체보기</a>
                            </form>
                            	
                    		</div>
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
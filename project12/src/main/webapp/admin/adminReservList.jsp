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
    <title>Admin Dashboard </title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    
    
    
    
    
    function isResDelete(x,y){
    
    var isMove = confirm("진짜 삭제하실?");
	
	if(isMove){
		// 장바구니 페이지 이동
		location.href="./adminDeleteReservAction.us?res_no="+x+"&pageNum="+y;
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
                                
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">예약 목록 (아이디 클릭시 상세 보기 가능)</li>
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
                                        <a class="nav-link active" href="#">예약 목록</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="./adminPaymentList.us" >결제 목록</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-general" role="tabpanel" aria-labelledby="pills-general-tab">
                                <div class="card">
                                    <h5 class="card-header">General Member List</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">No.</th>
                                                        <th class="border-0">가게 명</th>
                                                        <th class="border-0">예약자 명(id)</th>
                                                        <th class="border-0">예약 인원</th>
                                                        <th class="border-0">예약 일시</th>
                                                        <th class="border-0">예약 메세지</th>
                                                        <th class="border-0">예약 상태</th>
                                                        <th class="border-0">관리</th>
                                                    </tr>
                                                </thead>
                                                <!-- 가게 정보입력 -->
                                                <tbody>
                                                    <c:forEach var="res" items="${reservList }">
                                                    <tr>
                                                    
                                                        <td>${res.res_no}</td>
<!--                                                         <td> -->
<!--                                                             <div class="m-r-10"><img src="assets/images/product-pic.jpg" alt="user" class="rounded" width="45"></div> -->
<!--                                                         </td> -->
                                                        <td>${res.s_name }</td>
                                                        <td>${res.res_name}(<a href="./adminGenMemDetail.us?m=${res.m_no }">${res.m_id })</a></td>
                                                        
                                                        <td>${res.res_num}</td>
                                                        <td>${res.res_date }, ${res.res_time }:00</td>
                                                        <td><h4 class="mb-0"><a href="#" onclick="window.open('./genMemReservMsg.us?msg=${res.res_msg}','예약 메세지','width=600, height=150, left=700, top=400')">
                                                    보기</a></h4></td>
                                                    	<td>
	                                                    	<c:if test="${res.res_status==0 }">
		                                                    <h4 class="mb-0">이용 예정</h4>
		                                                    </c:if>
		                                                     <c:if test="${res.res_status==1 }">
		                                                    <h4 class="mb-0">이용 완료</h4>
		                                                    </c:if>
		                                                     <c:if test="${res.res_status==2 }">
		                                                    <h4 class="mb-0">노쇼 하심</h4>
		                                                    </c:if>
		                                                    <c:if test="${res.res_status==3 }">
		                                                    <h4 class="mb-0">점장 거절</h4>
		                                                    </c:if>
	                                                    </td>
                                                        <td>
                                                        	<a href="javascript: isResDelete(${res.res_no },${pageNum })">삭제</a>
                                                         </td>
                                                    </tr>
                                                   </c:forEach>
                                                    <tr>
                                                    	<td colspan="4"> <!-- 페이지 -->
                                                    	
                                                    		
										<nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                            	<c:if test="${reqeustScope.totalCnt != 0 }">
                                            		<c:if test="${startPage > pageBlock }">
		                                                <li class="page-item"><a class="page-link" href="./adminGenMemList.us?pageNum=${startPage-pageBlock }">Previous</a></li>
		                                            </c:if>
		                                            <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		                                                <li class="page-item"><a class="page-link"  href="./adminGenMemList.us?pageNum=${i }">${i }</a></li>
		                                            </c:forEach>   
		                                            <c:if test="${endPage < pageCount }">
		                                                <li class="page-item"><a class="page-link"  href="./adminGenMemList.us?pageNum=${startPage+pageBlock }">[Next]]</a></li>
		                                            </c:if>
		                                        </c:if>
                                            </ul>
                                        </nav>
														
														<!-- 페이지 위치 확인  -->
														
														<!-- 페이지 위치 확인  -->
														</td>
                                                        
                                                    </tr>
                                                </tbody>
                                                <!-- 가게 정보입력 -->
                                            	</table>
                                            		</div>
                                        		</div>
                                    
                            				</div>
                            
                            			</div>
                            		

            						</div>
                        		</div>
                    		</div>
                    		<div class="col-xl-9">
                    		<form action="./adminReservList.us" method="post">
                                <input class="form-controlkjh" type="text" placeholder="아이디 검색" name="keyword" value="${keyword }">
                                <input type="submit" value="검색" class="btn btn-primary">
                                <a href="./adminReservList.us" class="btn btn-primary">전체보기</a>
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
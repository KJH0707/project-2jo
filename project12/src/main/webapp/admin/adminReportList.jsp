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
                                            <li class="breadcrumb-item active" aria-current="page">일반 회원 관리</li>
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
                                    <h5 class="card-header">General Member List</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">No.</th>
                                                        <th class="border-0">가게 이름</th>
                                                        <th class="border-0">점주 이름</th>
                                                        <th class="border-0">신고자 ID</th>
                                                        <th class="border-0">신고자명</th>
                                                        <th class="border-0">신고 사유</th>
                                                        <th class="border-0">신고 횟수</th>
                                                        <th class="border-0">신고일자</th>
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
                                                        <td>${rep.s_name }</td>
                                                        <td>${rep.c_name }</td>
                                                        <td>${rep.m_id}</td>
                                                        
                                                        <td>${rep.m_name }</td>
                                                        <td>${rep.rep_reason }</td>
                                                        <td>${rep.rep_howmany }</td>
                                                      
                                                        <td>${rep.rep_date}</td>
                                                       
                                                        <td>
                                                        	<a href="#">수정</a> 
                                                        	
                                                        	<a href="javascript: isDelete(${rep.rep_no },${pageNum })">삭제</a>
                                                         </td>
                                                    </tr>
                                                   </c:forEach>
                                                    <tr>
                                                    	<td colspan="4"> <!-- 페이지 -->
                                                    	<div>
                                                    		<c:if test="${reqeustScope.totalCnt != 0 }">
	
																<!-- 이전 -->
																<c:if test="${startPage > pageBlock }">
																	<a href="./adminGenMemList.us?pageNum=${startPage-pageBlock }">Prev</a>
																</c:if>
																<!-- 페이지 번호(1,2,3....) -->
																<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
																	<a href="./adminGenMemList.us?pageNum=${i }">${i }&nbsp;&nbsp;</a>
																</c:forEach>
																<!-- 다음 -->
																<c:if test="${endPage < pageCount }">
																	<a href="./adminGenMemList.us?pageNum=${startPage+pageBlock }">[다음]</a>
																</c:if>
															</c:if>
														</div>
														<!-- 페이지 위치 확인  -->
														
														<!-- 페이지 위치 확인  -->
														<td>
                                                        <td colspan="5"><a href="#" class="btn btn-outline-light float-right">View Details</a></td>
                                                    </tr>
                                                </tbody>
                                                <!-- 가게 정보입력 -->
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end recent orders  -->

    
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- customer acquistion  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Customer Acquisition</h5>
                                    <div class="card-body">
                                        <div class="ct-chart ct-golden-section" style="height: 354px;"></div>
                                        <div class="text-center">
                                            <span class="legend-item mr-2">
                                                    <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                            <span class="legend-text">Returning</span>
                                            </span>
                                            <span class="legend-item mr-2">

                                                    <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                            <span class="legend-text">First Time</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end customer acquistion  -->
                            <!-- ============================================================== -->
                        </div>
                            <!-- ============================================================== -->
              				                        <!-- product category  -->
                            <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header"> 성비별 이용자 수 Category</h5>
                                    <div class="card-body">
                                        <div class="ct-chart-category ct-golden-section" style="height: 315px;"></div>
                                        <div class="text-center m-t-40">
                                            <span class="legend-item mr-3">
                                                    <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full "></i></span><span class="legend-text">Man</span>
                                            </span>
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                            <span class="legend-text">Woman</span>
                                            </span>
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-info mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                            <span class="legend-text">Accessories</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end product category  -->
                                   <!-- product sales  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <!-- <div class="float-right">
                                                <select class="custom-select">
                                                    <option selected>Today</option>
                                                    <option value="1">Weekly</option>
                                                    <option value="2">Monthly</option>
                                                    <option value="3">Yearly</option>
                                                </select>
                                            </div> -->
                                        <h5 class="mb-0"> Product Sales</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="ct-chart-product ct-golden-section"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end product sales  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12">
                                <!-- ============================================================== -->
                                <!-- top perfomimg  -->
                                <!-- ============================================================== -->
                                <div class="card">
                                    <h5 class="card-header">Top Store</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table no-wrap p-table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">Store</th>
                                                        <th class="border-0">Visits</th>
                                                        <th class="border-0">Revenue</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Campaign#1</td>
                                                        <td>98,789 </td>
                                                        <td>$4563</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Campaign#2</td>
                                                        <td>2,789 </td>
                                                        <td>$325</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Campaign#3</td>
                                                        <td>1,459 </td>
                                                        <td>$225</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Campaign#4</td>
                                                        <td>5,035 </td>
                                                        <td>$856</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Campaign#5</td>
                                                        <td>10,000 </td>
                                                        <td>$1000</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Campaign#5</td>
                                                        <td>10,000 </td>
                                                        <td>$1000</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <a href="#" class="btn btn-outline-light float-right">Details</a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end top perfomimg  -->
                                <!-- ============================================================== -->
                            </div>
                        </div>

<!--                         <div class="row"> -->
                            <!-- ============================================================== -->
                            <!-- sales  -->
                            <!-- ============================================================== -->
<!--                             <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12"> -->
<!--                                 <div class="card border-3 border-top border-top-primary"> -->
<!--                                     <div class="card-body"> -->
<!--                                         <h5 class="text-muted">Sales</h5> -->
<!--                                         <div class="metric-value d-inline-block"> -->
<!--                                             <h1 class="mb-1">$12099</h1> -->
<!--                                         </div> -->
<!--                                         <div class="metric-label d-inline-block float-right text-success font-weight-bold"> -->
<!--                                             <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">5.86%</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             ============================================================== -->
<!--                             end sales  -->
<!--                             ============================================================== -->
<!--                             ============================================================== -->
<!--                             new customer  -->
<!--                             ============================================================== -->
<!--                             <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12"> -->
<!--                                 <div class="card border-3 border-top border-top-primary"> -->
<!--                                     <div class="card-body"> -->
<!--                                         <h5 class="text-muted">New Customer</h5> -->
<!--                                         <div class="metric-value d-inline-block"> -->
<!--                                             <h1 class="mb-1">1245</h1> -->
<!--                                         </div> -->
<!--                                         <div class="metric-label d-inline-block float-right text-success font-weight-bold"> -->
<!--                                             <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">10%</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             ============================================================== -->
<!--                             end new customer  -->
<!--                             ============================================================== -->
<!--                             ============================================================== -->
<!--                             visitor  -->
<!--                             ============================================================== -->
<!--                             <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12"> -->
<!--                                 <div class="card border-3 border-top border-top-primary"> -->
<!--                                     <div class="card-body"> -->
<!--                                         <h5 class="text-muted">Visitor</h5> -->
<!--                                         <div class="metric-value d-inline-block"> -->
<!--                                             <h1 class="mb-1">13000</h1> -->
<!--                                         </div> -->
<!--                                         <div class="metric-label d-inline-block float-right text-success font-weight-bold"> -->
<!--                                             <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">5%</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             ============================================================== -->
<!--                             end visitor  -->
<!--                             ============================================================== -->
<!--                             ============================================================== -->
<!--                             total orders  -->
<!--                             ============================================================== -->
<!--                             <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12"> -->
<!--                                 <div class="card border-3 border-top border-top-primary"> -->
<!--                                     <div class="card-body"> -->
<!--                                         <h5 class="text-muted">Total Orders</h5> -->
<!--                                         <div class="metric-value d-inline-block"> -->
<!--                                             <h1 class="mb-1">1340</h1> -->
<!--                                         </div> -->
<!--                                         <div class="metric-label d-inline-block float-right text-danger font-weight-bold"> -->
<!--                                             <span class="icon-circle-small icon-box-xs text-danger bg-danger-light bg-danger-light "><i class="fa fa-fw fa-arrow-down"></i></span><span class="ml-1">4%</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             ============================================================== -->
<!--                             end total orders  -->
<!--                             ============================================================== -->
<!--                         </div> -->
<!--                         <div class="row"> -->
<!--                             ============================================================== -->
<!--                             total revenue  -->
<!--                             ============================================================== -->
  
                            
<!--                             ============================================================== -->
<!--                             ============================================================== -->
<!--                             category revenue  -->
<!--                             ============================================================== -->
<!--                             <div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12"> -->
<!--                                 <div class="card"> -->
<!--                                     <h5 class="card-header">Revenue by Category</h5> -->
<!--                                     <div class="card-body"> -->
<!--                                         <div id="c3chart_category" style="height: 420px;"></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             ============================================================== -->
<!--                             end category revenue  -->
<!--                             ============================================================== -->

<!--                             <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12"> -->
<!--                                 <div class="card"> -->
<!--                                     <h5 class="card-header"> Total Revenue</h5> -->
<!--                                     <div class="card-body"> -->
<!--                                         <div id="morris_totalrevenue"></div> -->
<!--                                     </div> -->
<!--                                     <div class="card-footer"> -->
<!--                                         <p class="display-7 font-weight-bold"><span class="text-primary d-inline-block">$26,000</span><span class="text-success float-right">+9.45%</span></p> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="row"> -->
<!--                             <div class="col-xl-5 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                                 ============================================================== -->
<!--                                 social source  -->
<!--                                 ============================================================== -->
<!--                                 <div class="card"> -->
<!--                                     <h5 class="card-header"> Sales By Social Source</h5> -->
<!--                                     <div class="card-body p-0"> -->
<!--                                         <ul class="social-sales list-group list-group-flush"> -->
<!--                                             <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle facebook-bgcolor mr-2"><i class="fab fa-facebook-f"></i></span><span class="social-sales-name">Facebook</span><span class="social-sales-count text-dark">120 Sales</span> -->
<!--                                             </li> -->
<!--                                             <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle twitter-bgcolor mr-2"><i class="fab fa-twitter"></i></span><span class="social-sales-name">Twitter</span><span class="social-sales-count text-dark">99 Sales</span> -->
<!--                                             </li> -->
<!--                                             <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle instagram-bgcolor mr-2"><i class="fab fa-instagram"></i></span><span class="social-sales-name">Instagram</span><span class="social-sales-count text-dark">76 Sales</span> -->
<!--                                             </li> -->
<!--                                             <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle pinterest-bgcolor mr-2"><i class="fab fa-pinterest-p"></i></span><span class="social-sales-name">Pinterest</span><span class="social-sales-count text-dark">56 Sales</span> -->
<!--                                             </li> -->
<!--                                             <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle googleplus-bgcolor mr-2"><i class="fab fa-google-plus-g"></i></span><span class="social-sales-name">Google Plus</span><span class="social-sales-count text-dark">36 Sales</span> -->
<!--                                             </li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                     <div class="card-footer text-center"> -->
<!--                                         <a href="#" class="btn-primary-link">View Details</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 ============================================================== -->
<!--                                 end social source  -->
<!--                                 ============================================================== -->
<!--                             </div> -->
<!--                             <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12"> -->
<!--                                 ============================================================== -->
<!--                                 sales traffice source  -->
<!--                                 ============================================================== -->
<!--                                 <div class="card"> -->
<!--                                     <h5 class="card-header"> Sales By Traffic Source</h5> -->
<!--                                     <div class="card-body p-0"> -->
<!--                                         <ul class="traffic-sales list-group list-group-flush"> -->
<!--                                             <li class="traffic-sales-content list-group-item "><span class="traffic-sales-name">Direct</span><span class="traffic-sales-amount">$4000.00  <span class="icon-circle-small icon-box-xs text-success ml-4 bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1 text-success">5.86%</span></span> -->
<!--                                             </li> -->
<!--                                             <li class="traffic-sales-content list-group-item"><span class="traffic-sales-name">Search<span class="traffic-sales-amount">$3123.00  <span class="icon-circle-small icon-box-xs text-success ml-4 bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1 text-success">5.86%</span></span> -->
<!--                                                 </span> -->
<!--                                             </li> -->
<!--                                             <li class="traffic-sales-content list-group-item"><span class="traffic-sales-name">Social<span class="traffic-sales-amount ">$3099.00  <span class="icon-circle-small icon-box-xs text-success ml-4 bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1 text-success">5.86%</span></span> -->
<!--                                                 </span> -->
<!--                                             </li> -->
<!--                                             <li class="traffic-sales-content list-group-item"><span class="traffic-sales-name">Referrals<span class="traffic-sales-amount ">$2220.00   <span class="icon-circle-small icon-box-xs text-danger ml-4 bg-danger-light"><i class="fa fa-fw fa-arrow-down"></i></span><span class="ml-1 text-danger">4.02%</span></span> -->
<!--                                                 </span> -->
<!--                                             </li> -->
<!--                                             <li class="traffic-sales-content list-group-item "><span class="traffic-sales-name">Email<span class="traffic-sales-amount">$1567.00   <span class="icon-circle-small icon-box-xs text-danger ml-4 bg-danger-light"><i class="fa fa-fw fa-arrow-down"></i></span><span class="ml-1 text-danger">3.86%</span></span> -->
<!--                                                 </span> -->
<!--                                             </li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                     <div class="card-footer text-center"> -->
<!--                                         <a href="#" class="btn-primary-link">View Details</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             ============================================================== -->
<!--                             end sales traffice source  -->
<!--                             ============================================================== -->
<!--                             ============================================================== -->
<!--                             sales traffic country source  -->
<!--                             ============================================================== -->
<!--                             <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12"> -->
<!--                                 <div class="card"> -->
<!--                                     <h5 class="card-header">Sales By Country Traffic Source</h5> -->
<!--                                     <div class="card-body p-0"> -->
<!--                                         <ul class="country-sales list-group list-group-flush"> -->
<!--                                             <li class="country-sales-content list-group-item"><span class="mr-2"><i class="flag-icon flag-icon-us" title="us" id="us"></i> </span> -->
<!--                                                 <span class="">United States</span><span class="float-right text-dark">78%</span> -->
<!--                                             </li> -->
<!--                                             <li class="list-group-item country-sales-content"><span class="mr-2"><i class="flag-icon flag-icon-ca" title="ca" id="ca"></i></span><span class="">Canada</span><span class="float-right text-dark">7%</span> -->
<!--                                             </li> -->
<!--                                             <li class="list-group-item country-sales-content"><span class="mr-2"><i class="flag-icon flag-icon-ru" title="ru" id="ru"></i></span><span class="">Russia</span><span class="float-right text-dark">4%</span> -->
<!--                                             </li> -->
<!--                                             <li class="list-group-item country-sales-content"><span class=" mr-2"><i class="flag-icon flag-icon-in" title="in" id="in"></i></span><span class="">India</span><span class="float-right text-dark">12%</span> -->
<!--                                             </li> -->
<!--                                             <li class="list-group-item country-sales-content"><span class=" mr-2"><i class="flag-icon flag-icon-fr" title="fr" id="fr"></i></span><span class="">France</span><span class="float-right text-dark">16%</span> -->
<!--                                             </li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                     <div class="card-footer text-center"> -->
<!--                                         <a href="#" class="btn-primary-link">View Details</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <!-- ============================================================== -->
                            <!-- end sales traffice country source  -->
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
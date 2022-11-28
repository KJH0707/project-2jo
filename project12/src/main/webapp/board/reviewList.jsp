<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>\
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
    <title>Fork & Knife | 리뷰 목록</title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
       <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="./main.st">  F K</a>fork&knife
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                            <div id="custom-search" class="top-search-bar">
                                <input class="form-control" type="text" placeholder="Search..">
                            </div>
                        </li>
                        <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                <li>
                                    <div class="notification-title"> Notification</div>
                                    <div class="notification-list">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action active">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-2.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-3.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">John Abraham </span>is now following you
                                                        <div class="notification-date">2 days ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-4.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-5.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jessica Caruso</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="list-footer"> <a href="#">View all notifications</a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown connection">
                            <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-fw fa-th"></i> </a>
                            <ul class="dropdown-menu dropdown-menu-right connection-dropdown">
                                <li class="connection-list">
                                    <div class="row">
                                       
                                    </div>
                                </li>
                                <li>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">
                                <c:if test="${id!=null }">
                            	<li>${id }님 어서오세요.</li>
                            	</c:if> </h5>
                                    <span class="status"></span><span class="ml-2">Available</span>
                                </div>
                                  <c:choose>
                                  <c:when test="${id==null }">
                                <a class="dropdown-item" href="./Login.us"><i class="fas fa-user mr-2"></i>Login</a>
                                <a class="dropdown-item" href="./Join.us"><i class="fas fa-power-off mr-2"></i>Join us</a>
                                </c:when>
                                
                                  <c:when test="${id.equals('admin') }">
                                 <a class="dropdown-item" href="./loginForm.st"><i class="fas fa-user mr-2"></i>(Admin)My Page</a>
                                <a class="dropdown-item" href="./LogoutAction.us"><i class="fas fa-power-off mr-2"></i>Logout</a>
                                </c:when>
                                
                                 <c:when test="${result==1 }">
                                 <a class="dropdown-item" href="./MemberMyPage.us"><i class="fas fa-user mr-2"></i>My Page</a>
                                <a class="dropdown-item" href="./LogoutAction.us"><i class="fas fa-power-off mr-2"></i>Logout</a>
                                </c:when>
                                
                                <c:otherwise>
                    			 <a class="dropdown-item" href="./CeoMyPage.us"><i class="fas fa-user mr-2"></i>My Page</a>
                                <a class="dropdown-item" href="./LogoutAction.us"><i class="fas fa-power-off mr-2"></i>Logout</a>
                  				  </c:otherwise>
                                
                                
                                	</c:choose>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                             
                            <li class="nav-item ">
                                <a class="nav-link active" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>${st.s_name }'s Board<span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-2" aria-controls="submenu-1-2">Review Board</a>
                                            <div id="submenu-1-2" class="collapse submenu" style="">
                                            
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="./ReviewList.rv?s_no=${st.s_no }&s_name=${st.s_name }">Review List</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="./ReviewWrite.rv?s_no=${st.s_no }&s_name=${st.s_name }">Review Write</a>
                                                    </li>
                                                    
                                                </ul>
                                            </div>
                                        </li>
                                       
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-1" aria-controls="submenu-1-1">Q & A Board</a>
                                            <div id="submenu-1-1" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="./QnaList.br">Q & A List</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="/QnaWrite.br">Q & A Write</a>
                                                    </li>
                                                   
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            
                            
                            
                            
                            <li class="nav-divider">
                                STORE
                            </li>
                             
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fas fa-fw fa-file"></i> Pages </a>
                                <div id="submenu-6" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="./storeDetails.st?s_no=${st.s_no }">Reservation</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="./storeList.st">Store List</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="./BookMarkList.bk">My BookMarkList</a>
                                        </li>
                                        
                                        
                                    </ul>
                                </div>
                            </li>
                            
                            
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-9" aria-controls="submenu-9"><i class="fas fa-fw fa-map-marker-alt"></i>Maps</a>
                                <div id="submenu-9" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="./storeDetails.st?s_no=${st.s_no }">KaKao Maps</a>
                                        </li>
                                      
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <!--끝끝끝끝끝끝 -->
        </div>
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
                                <h3 class="mb-2">Reivew Board </h3>
                                <p class="pageheader-text"></p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Board</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Review Board</li>
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
                                        <a class="nav-link active" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="true">R E V I E W S</a>
                                    </li>
<!--                                     <li class="nav-item"> -->
<!--                                         <a class="nav-link" id="pills-msg-tab" data-toggle="pill" href="#pills-msg" role="tab" aria-controls="pills-msg" aria-selected="false"> Q & A </a> -->
<!--                                     </li> -->
                                </ul>
                                <div class="tab-content" id="pills-tabContent">
                                  
                                    
                                    <div class="tab-pane fade show active" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                                   <div class="row">
                                         
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h3 class="section-title">${st.s_name }'s Review Board</h3>
                                                </div>
                                            </div>
                                           
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">${totalCnt }</h1>
                                                        <p>Total Reviews</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1"> 
                                                    
													
<%-- 													${param.s_star.substring(0,3) }  --%>
							<span style=color:indigo;"><fmt:formatNumber value="${st.s_star }" pattern=".0"/></span> 
							<span>/ 5</span> 
													 </h1>
                                                        <p>Ratings</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">${st.s_readcount } </h1>
                                                        <p>Views</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1"><a href="./main.st">Main</a></h1>
                                                        <p>메인으로 돌아가기</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" value="${param.s_no }" name="s_no">
                      					
                                        <div class="card">
                                        <h5 class="card-header">${st.s_name } Reviews </h5>
                                         <c:forEach var="dto" items="${reviewListAll }">
                                            <input type="hidden" value="${dto.rev_no }" name="rev_no">
                                             
                                           	<div class="card-body">
                                                <div class="review-block">
                                                
                                                
                                                <c:choose>
                                         	      <c:when test="${dto.rev_file != null }">
														 <img src="./upload/${dto.rev_file }" width="600" height="450">
											 	</c:when>
												<c:when test="${dto.rev_file == null}"></c:when>
													 
												</c:choose>
													 <br>
													 <c:if test="${dto.rev_seq > 0 }"><b>ㄴ</b></c:if>
                                               	 <span class="text-dark font-weight-bold font-italic m-0">${dto.rev_subject }</span>
                                                    <p class="review-text font-italic m-0">${dto.rev_content }</p>
                                                    
                                                    <!-- 관리자가 댓글달 땐 안보이게 하기  -->
                                                    
                                                  
                                                  <c:choose>
                                                    <c:when test="${dto.rev_star > 0}">
                                                    
                                                    <div class="rating-star mb-4">
                                                       <c:forEach begin="1" end="5" var='k'>  
														<c:if test="${k <= dto.rev_star}">
														    <i id="star${k}" class="fa fa-star" style= color:red;></i>	<!-- 채워진 별 -->
														</c:if>
														<c:if test="${k > dto.rev_star}">
														    <i id="star${k}" class="far fa-star" style= color:red;></i>	<!-- 채워진 별 -->
														</c:if>
														
													 </c:forEach>
													  ${dto.rev_star } 점
                                                    </div>
                                                    </c:when>
                                                    
                                                    <c:otherwise>
                                                    -
                                                    </c:otherwise>
                                                    </c:choose>
                                                  
                                                 
                                                    
<%--                                                     ${id } / --%>
<%-- 											${mine } --%>
                                                    <span class="text-dark font-weight-bold">${dto.m_nickname } </span>
                                                    <small class="text-mute"> <fmt:formatDate value="${dto.rev_date }"/></small>
                                                    
                                                    <c:if test="${id eq dto.m_id || id eq 'admin'}">
                                          <small class="text-mute"><a href="./ReviewUpdate.rv?rev_no=${dto.rev_no }&pageNum=${pageNum }&rev_star=${dto.rev_star}">수정/</a></small>
                                                       <small class="text-mute"> <a href="./ReviewDelete.rv?rev_no=${dto.rev_no }&s_no=${st.s_no }">삭제 </a></small> <br><br>
                                              		       </c:if> 
                                              		       
                                              		     
                                              		       <c:if test="${sessionScope.c eq c}">
                                          <small class="text-mute"><a href="./ReviewUpdate.rv?rev_no=${dto.rev_no }&pageNum=${pageNum }&rev_star=${dto.rev_star}">수정/</a></small>
                                                       <small class="text-mute"> <a href="./ReviewDelete.rv?rev_no=${dto.rev_no }&s_no=${st.s_no }">삭제 </a></small> <br><br>
                                              		       </c:if>                 
														♨ <b style="color:black;"><a href="./userReport.st?m_no=${dto.m_no }&s_no=${st.s_no }">신고</a></b>
<%-- 										${sessionScope.id } / ${dto.rev_seq } ${sessionScope.mine } --%>
									
                                          &nbsp;
                                          <!-- 관리자 아이디 제어  -->
                                           <c:if test="${dto.rev_seq == 0 }">
                                           <c:if test="${sessionScope.id == 'admin' || mine != null}">
                                         	
                                            <small class="text-mute"> 
                                            <input type="button" value="답글"onclick="location.href='./reviewReply.rv?rev_no=${dto.rev_no}&pageNum=${pageNum }&rev_ref=${dto.rev_ref }&rev_seq=${dto.rev_seq }&rev_subject=${dto.rev_subject }&s_no=${st.s_no }'" >
											</small>
											</c:if>
											 </c:if>
											 
											</div>
                                            </div>
											
                                            </c:forEach>
                                        </div>
                                      
                                      <!--페이지네이션 -->
                                      
                                      <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                            	<c:if test="${reqeustScope.totalCnt != 0 }">
                                            		<c:if test="${startPage > pageBlock }">
		                                                <li class="page-item"><a class="page-link" href="./ReviewList.rv?pageNum=${startPage-pageBlock }&s_no=${st.s_no }">Previous</a></li>
		                                            </c:if>
		                                            <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		                                                <li class="page-item"><a class="page-link" href="./ReviewList.rv?pageNum=${i }&s_no=${st.s_no }">${i }</a></li>
		                                            </c:forEach>   
		                                            <c:if test="${endPage < pageCount }">
		                                                <li class="page-item"><a class="page-link" href="./ReviewList.rv?pageNum=${startPage+pageBlock }&s_no=${st.s_no }">[Next]]</a></li>
		                                            </c:if>
		                                            
		                                        </c:if>
                                            </ul>
                                        </nav>
				                                        
				                                        
				                                        
                                    </div>
                                    <div class="tab-pane fade" id="pills-msg" role="tabpanel" aria-labelledby="pills-msg-tab">
                                        <div class="card">
<!--                                             <h5 class="card-header">Send Messages</h5> -->
<!--                                             <div class="card-body"> -->
<!--                                                 <form> -->
<!--                                                     <div class="row"> -->
<!--                                                         <div class="offset-xl-3 col-xl-6 offset-lg-3 col-lg-3 col-md-12 col-sm-12 col-12 p-4"> -->
<!--                                                             <div class="form-group"> -->
<!--                                                                 <label for="name">Your Name</label> -->
<!--                                                                 <input type="text" class="form-control form-control-lg" id="name" placeholder=""> -->
<!--                                                             </div> -->
<!--                                                             <div class="form-group"> -->
<!--                                                                 <label for="email">Your Email</label> -->
<!--                                                                 <input type="email" class="form-control form-control-lg" id="email" placeholder=""> -->
<!--                                                             </div> -->
<!--                                                             <div class="form-group"> -->
<!--                                                                 <label for="subject">Subject</label> -->
<!--                                                                 <input type="text" class="form-control form-control-lg" id="subject" placeholder=""> -->
<!--                                                             </div> -->
<!--                                                             <div class="form-group"> -->
<!--                                                                 <label for="messages">Messgaes</label> -->
<!--                                                                 <textarea class="form-control" id="messages" rows="3"></textarea> -->
<!--                                                             </div> -->
<!--                                                             <button type="submit" class="btn btn-primary float-right">Send Message</button> -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </form> -->
<!--                                             </div> -->

                                        </div>
                                    </div>
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
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            Copyright Â© 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
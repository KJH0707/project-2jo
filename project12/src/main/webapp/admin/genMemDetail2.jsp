<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
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
                                <h3 class="mb-2">Influencer Profile </h3>
                                <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Influencer Profile Template</li>
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
<!--                     
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
                                        <a class="nav-link" id="pills-campaign-tab" data-toggle="pill" href="#pills-campaign" role="tab" aria-controls="pills-campaign" aria-selected="false">Campaign</a>
                                    </li>
<!--                                     <li class="nav-item"> -->
<!--                                         <a class="nav-link" id="pills-packages-tab" data-toggle="pill" href="#pills-packages" role="tab" aria-controls="pills-packages" aria-selected="false">Packages</a> -->
<!--                                     </li> -->
                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="true">Reviews</a>
                                    </li>
<!--                                     <li class="nav-item"> -->
<!--                                         <a class="nav-link" id="pills-msg-tab" data-toggle="pill" href="#pills-msg" role="tab" aria-controls="pills-msg" aria-selected="false">Send Messages</a> -->
<!--                                     </li> -->
                                </ul>
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-campaign" role="tabpanel" aria-labelledby="pills-campaign-tab">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h3 class="section-title">My Campaign State</h3>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">9</h1>
                                                        <p>Campaign Invitations</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">35</h1>
                                                        <p>Finished Campaigns</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">8</h1>
                                                        <p>Accepted Campaigns</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h1 class="mb-1">1</h1>
                                                        <p>Declined Campaigns</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="section-block">
                                            <h3 class="section-title">Campaign List</h3>
                                        </div>
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
                                                                    <h3 class="m-b-10">Your Campaign Title Here</h3>
                                                                    <p>
                                                                        <span class="m-r-20 d-inline-block">Draft Due Date
                                                                            <span class="m-l-10 text-primary">24 Jan 2018</span>
                                                                        </span>
                                                                        <span class="m-r-20 d-inline-block"> Publish Date
                                                                            <span class="m-l-10 text-secondary">30 Feb 2018</span>
                                                                        </span>
                                                                            <span class="m-r-20 d-inline-block">Ends <span class="m-l-10  text-info">30 May, 2018</span>
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
                                                    <h4 class="mb-0">45k</h4>
                                                    <p>Total Reach</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">29k</h4>
                                                    <p>Total Views</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">5k</h4>
                                                    <p>Total Click</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">4k</h4>
                                                    <p>Engagement</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">2k</h4>
                                                    <p>Conversion</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="media influencer-profile-data d-flex align-items-center p-2">
                                                            <div class="mr-4">
                                                                <img src="assets/images/dribbble.png" alt="User Avatar" class="rounded-circle user-avatar-lg">
                                                            </div>
                                                            <div class="media-body">
                                                                 <h3 class="m-b-10">Your Campaign Title Here</h3>
                                                                <p><span class="m-r-20 d-inline-block">Draft Due Date<span class="m-l-10 d-inline-block text-primary">28 Jan 2018</span></span><span class="m-r-20 d-inline-block"> Publish Date<span class="m-l-10 text-secondary">20 March 2018</span></span><span class="m-r-20">Ends<span class="m-l-10 text-info">10 July, 2018</span></span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="border-top card-footer p-0">
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0 ">35k</h4>
                                                    <p>Total Reach</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0 ">45k</h4>
                                                    <p>Total Views</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">8k</h4>
                                                    <p>Total Click</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0 ">10k</h4>
                                                    <p>Engagement</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">3k</h4>
                                                    <p>Conversion</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="media influencer-profile-data d-flex align-items-center p-2">
                                                            <div class="mr-4">
                                                                <img src="assets/images/dropbox.png" alt="User Avatar" class="user-avatar-lg">
                                                            </div>
                                                            <div class="media-body">
                                                                  <h3 class="m-b-10">Your Campaign Title Here</h3>
                                                                <p><span class="m-r-20 d-inline-block">Draft Due Date
                                                                    <span class="m-l-10 text-primary">05 Feb 2018</span></span>
                                                                    <span class="m-r-20 d-inline-block"> Publish Date
                                                                        <span class="m-l-10 text-secondary">14 May 2018</span></span><span class="m-r-20 d-inline-block">Ends<span class="m-l-10 text-info">16 Aug, 2018</span></span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="border-top card-footer p-0">
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">40k</h4>
                                                    <p>Total Reach</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0 ">35k</h4>
                                                    <p>Total Views</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">5k</h4>
                                                    <p>Total Click</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">15k</h4>
                                                    <p>Engagement</p>
                                                </div>
                                                <div class="campaign-metrics d-xl-inline-block">
                                                    <h4 class="mb-0">14k</h4>
                                                    <p>Conversion</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-packages" role="tabpanel" aria-labelledby="pills-packages-tab">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="section-block">
                                                    <h2 class="section-title">My Packages</h2>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-header bg-primary text-center p-3 ">
                                                        <h4 class="mb-0 text-white"> Basic</h4>
                                                    </div>
                                                    <div class="card-body text-center">
                                                        <h1 class="mb-1">$150</h1>
                                                        <p>Per Month Plateform</p>
                                                    </div>
                                                    <div class="card-body border-top">
                                                        <ul class="list-unstyled bullet-check font-14">
                                                            <li>Facebook, Instagram, Pinterest,Snapchat.</li>
                                                            <li>Guaranteed follower growth for increas brand awareness.</li>
                                                            <li>Daily updates on choose platforms</li>
                                                            <li>Stronger customer service through daily interaction</li>
                                                            <li>Monthly progress report</li>
                                                            <li>1 Million Followers</li>
                                                        </ul>
                                                        <a href="#" class="btn btn-outline-secondary btn-block btn-lg">Get Started</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-header bg-info text-center p-3">
                                                        <h4 class="mb-0 text-white"> Standard</h4>
                                                    </div>
                                                    <div class="card-body text-center">
                                                        <h1 class="mb-1">$350</h1>
                                                        <p>Per Month Plateform</p>
                                                    </div>
                                                    <div class="card-body border-top">
                                                        <ul class="list-unstyled bullet-check font-14">
                                                            <li>Facebook, Instagram, Pinterest,Snapchat.</li>
                                                            <li>Guaranteed follower growth for increas brand awareness.</li>
                                                            <li>Daily updates on choose platforms</li>
                                                            <li>Stronger customer service through daily interaction</li>
                                                            <li>Monthly progress report</li>
                                                            <li>2 Blog Post & 3 Social Post</li>
                                                            <li>5 Millions Followers</li>
                                                            <li>Growth Result</li>
                                                        </ul>
                                                        <a href="#" class="btn btn-secondary btn-block btn-lg">Get Started</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                                <div class="card">
                                                    <div class="card-header bg-primary text-center p-3">
                                                        <h4 class="mb-0 text-white">Premium</h4>
                                                    </div>
                                                    <div class="card-body text-center">
                                                        <h1 class="mb-1">$550</h1>
                                                        <p>Per Month Plateform</p>
                                                    </div>
                                                    <div class="card-body border-top">
                                                        <ul class="list-unstyled bullet-check font-14">
                                                            <li>Facebook, Instagram, Pinterest,Snapchat.</li>
                                                            <li>Guaranteed follower growth for increas brand awareness.</li>
                                                            <li>Daily updates on choose platforms</li>
                                                            <li>Stronger customer service through daily interaction</li>
                                                            <li>Monthly progress report & Growth Result</li>
                                                            <li>4 Blog Post & 6 Social Post</li>
                                                        </ul>
                                                        <a href="#" class="btn btn-secondary btn-block btn-lg">Contact us</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                                        <div class="card">
                                    <h5 class="card-header">General Member List</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">No.</th>
                                                        <th class="border-0">아이디</th>
                                                        <th class="border-0">닉네임</th>
                                                        <th class="border-0">이름</th>
                                                        <th class="border-0">이메일</th>
                                                        <th class="border-0">성별</th>
                                                        <th class="border-0">전화번호</th>
                                                        <th class="border-0">생년월일</th>
                                                        <th class="border-0">생성일자</th>
                                                        <th class="border-0">관리</th>
                                                    </tr>
                                                </thead>
                                                <!-- 가게 정보입력 -->
                                                <tbody>
                                                    <c:forEach var="gml" items="${genMemList }">
                                                    <tr>
                                                    
                                                        <td>${gml.m_no}</td>
<!--                                                         <td> -->
<!--                                                             <div class="m-r-10"><img src="assets/images/product-pic.jpg" alt="user" class="rounded" width="45"></div> -->
<!--                                                         </td> -->
                                                        <td><a href="./genMemDetail.us?m_no=${gml.m_no }">${gml.m_id }</a></td>
                                                        <td>${gml.m_nickName }</td>
                                                        <td>${gml.m_name}</td>
                                                        
                                                        <td>${gml.m_email }</td>
                                                        <td>${gml.m_gender }</td>
                                                        <td>${gml.m_tel }</td>
                                                      
                                                        <td>${gml.m_birth }</td>
                                                        <td>${gml.m_regdate }
                                                        <td>
                                                        	<a href="#">수정</a> 
                                                        	
                                                        	<a href="javascript: isGenDelete(${gml.m_no },${pageNum })">삭제</a>
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
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item active"><a class="page-link " href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="tab-pane fade" id="pills-msg" role="tabpanel" aria-labelledby="pills-msg-tab">
                                        <div class="card">
                                            <h5 class="card-header">Send Messages</h5>
                                            <div class="card-body">
                                                <form>
                                                    <div class="row">
                                                        <div class="offset-xl-3 col-xl-6 offset-lg-3 col-lg-3 col-md-12 col-sm-12 col-12 p-4">
                                                            <div class="form-group">
                                                                <label for="name">Your Name</label>
                                                                <input type="text" class="form-control form-control-lg" id="name" placeholder="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="email">Your Email</label>
                                                                <input type="email" class="form-control form-control-lg" id="email" placeholder="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="subject">Subject</label>
                                                                <input type="text" class="form-control form-control-lg" id="subject" placeholder="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="messages">Messgaes</label>
                                                                <textarea class="form-control" id="messages" rows="3"></textarea>
                                                            </div>
                                                            <button type="submit" class="btn btn-primary float-right">Send Message</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
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
                            Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
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
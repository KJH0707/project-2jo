<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Dashboard</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="./assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="./assets/libs/css/style.css">
<link rel="stylesheet" href="./assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet" href="./assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
<link rel="stylesheet" href="./assets/vendor/inputmask/css/inputmask.css" />
<link rel="stylesheet" href="./assets/vendor/summernote/css/summernote-bs4.css" />


</head>

<body>
	<jsp:include page="../inc/adminTop.jsp" />
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- 왼쪽 사이드바(left sidebar) -->
		<!-- ============================================================== -->
		<jsp:include page="../inc/adminSidebar.jsp"/>
		<!-- ============================================================== -->
		<!-- end left sidebar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content">
				<div class="row">
					<div class="col-xl-10">
						<!-- ============================================================== -->
						<!-- pageheader  -->
						<!-- ============================================================== -->
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="page-header" id="top">
									<h2 class="pageheader-title">관리자 공지 수정</h2>
									
									<div class="page-breadcrumb">
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb">
												<li class="breadcrumb-item">
												<a href="#" class="breadcrumb-link">Dashboard</a></li>
												
												<li class="breadcrumb-item active" aria-current="page">관리자 공지 수정</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end pageheader  -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- basic form  -->
						<!-- ============================================================== -->
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="section-block" id="basicform">
									<h3 class="section-title">Form Elements</h3>
								</div>
								<div class="card">
											<c:set var="no" value="${notice}" />
									<h5 class="card-header">관리자 공지 수정</h5>
									<div class="card-body">
										<form action="./adminNoticeWriteAction.us" method="post" enctype="multipart/form-data">
											<div class="form-group">
												<select id="isEvent" type="text" class="form-control" name="isEvent">
													<option>게시판 선택</option>
													<option 
														<c:if test="${no.n_isevent==0}">
														selected
														</c:if>
														value="0"
													>공지</option>
													<option 
														<c:if test="${no.n_isevent==1}">
														selected
														</c:if>
													value="1"
													>이벤트</option>
												</select>
												<span id="eventTerm">
													이벤트 기간 :<br> 
													시작일자 <input type="datetime-local" name="eventS" value="${no.n_eventSdate}"><br>
													종료일자 <input type="datetime-local" name="eventE" value="${no.n_eventEdate}">
												
												</span>
											</div>
											
											<div class="form-group">
												<label for="inputText3" class="col--label" >제목</label> 
												<input id="inputText3" type="text" class="form-control" name="n_title" value="${no.n_title}">
											</div>
											<!---------------------------------------------------------------------------------------->
											<!-- 글쓰기 설정  -->
<!-- 											
											<!---------------------------------------------------------------------------------------->
											<br>
											<div class="form-group">
												<textarea class="form-control" id="exampleFormControlTextarea1" rows="25" name="content" >${no.n_content}</textarea>
											</div>
											<div class="form-group">
											<input type="file" name="file1" accept="image/*,.pdf" >&nbsp; 
											<c:if test="${no.n_img.split(',')[0]!='null'}"> 
												<a href="./upload/${no.n_img.split(',')[0]}">${no.n_img.split(',')[0]}</a>
											</c:if><br>
											<input type="file" name="file2" accept="image/*,.pdf" >&nbsp; 
											<c:if test="${no.n_img.split(',')[1]!='null'}"> 
												<a href="./upload/${no.n_img.split(',')[1]}">${no.n_img.split(',')[1]}</a>
											</c:if><br>
											<input type="file" name="file3" accept="image/*,.pdf">&nbsp; 
											<c:if test="${no.n_img.split(',')[2]!='null'}">
												<a href="./upload/${no.n_img.split(',')[2]}">${no.n_img.split(',')[2]}</a>
											</c:if><br>
											<input type="file" name="file4" accept="image/*,.pdf" >&nbsp; 
											<c:if test="${no.n_img.split(',')[3]!='null'}">
													<a href="./upload/${no.n_img.split(',')[3]}">${no.n_img.split(',')[3]}</a>
											</c:if><br><br>
			                                    <button class="btn btn-primary btn-space" type="submit" onclick="location.href='./NoticeModify.us?n_no=${no.n_no}';"><i class="icon s7-mail"></i> 수정</button>
			                                    <button class="btn btn-secondary btn-space" type="button"><i class="icon s7-close"></i> 취소</button>
			                                </div>
											
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end basic form  -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<div class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							Copyright © 2018 Concept. All rights reserved. Dashboard by <a
								href="https://colorlib.com/wp/">Colorlib</a>.
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="text-md-right footer-links d-none d-sm-block">
								<a href="javascript: void(0);">About</a> <a
									href="javascript: void(0);">Support</a> <a
									href="javascript: void(0);">Contact Us</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end footer -->
			<!-- ============================================================== -->
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script src="../assets/libs/js/main-js.js"></script>
	<script src="../assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
	<script type="text/javascript">
  	$(function(){
	  ${'#eventTerm'}.hide();
// 	  $('#isEvent').change(function(){
// 		  if($(this).val()=="이벤트") {
// 			 ${'#eventTerm'}.show();
// 		  }
// 	  });
  });
</script>
</body>

</html>
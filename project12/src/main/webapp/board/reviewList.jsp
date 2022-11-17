<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fork And Knife | QnA List</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

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
    </head>
    <body>

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title"> 리뷰 게시판</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

	${reviewListAll }

	<input type="hidden" value="${param.s_no }">

	<!-- property area -->
	<div class="content-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">

				<div
					class="col-md-9 pr-30 padding-top-40 properties-page user-properties">

					<div class="section">
						<div class="page-subheader sorting pl0 pr-10"></div>

					</div>

					<div class="section">
						<div id="list-type" class="proerty-th-list">
							<div class="col-md-4 p0">
								<div class="box-two proerty-item">

									<div class="item-entry overflow">
										<table border="1">
											<tr>
												<td> Rev No. </td>
												<td>[글번호] 제목</td>
												<td>작성자</td>
												<td>작성일</td>
											</tr>
											<c:forEach var="dto" items="${reviewListAll }">
												<tr>
													<td>${dto.rev_no }</td>
													<td>${dto.rev_subject }</td>
													<td>${dto.m_nickName }</td>
													<td>${dto.rev_date }</td>
												</tr>
											</c:forEach>
										</table>
										<div class="dot-hr"></div>
										<div class="dealer-action pull-right"></div>
									</div>






								</div>
							</div>
						</div>
						<br>

					</div>
				</div>
			</div>
		</div>
	</div>
		
	
	<button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 
                        <a href="/ReviewWrite.rv">	review 작성 하기</a> </button>

	<div class="section">
		<div class="pull-right">
			<div class="pagination">
				<ul>
					<c:if test="${totalCnt != 0}">

						<c:if test="${startPage > pageBlock }">
							<li><a
								href="./ReviewList.rv?pageNum=${startPage-pageBlock }">Prev</a></li>
						</c:if>
						<li><a href="./ReviewList.rv?pageNum=${i }">${i }</a></li>
						<c:if test="${endPage < pageCount }">
							<li><a
								href="./ReviewList.rv?pageNum=${startPage+pageBlock }">Next</a></li>
						</c:if>

					</c:if>
				</ul>
			</div>
		</div>
	</div>
	



	<script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="assets/js//jquery-1.10.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/bootstrap-hover-dropdown.js"></script>
        <script src="assets/js/easypiechart.min.js"></script>
        <script src="assets/js/jquery.easypiechart.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wow.js"></script>
        <script src="assets/js/icheck.min.js"></script>

        <script src="assets/js/price-range.js"></script> 
        <script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/wizard.js"></script>

        <script src="assets/js/main.js"></script>

    </body>
</html>
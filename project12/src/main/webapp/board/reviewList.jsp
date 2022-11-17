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
${totalCnt }
${param.s_no }
${dto.s_no }
${param.rev_no }
	<input type="hidden" value="${param.s_no }">

<div class="dot-hr">
				<h4> &nbsp; ${sdto.s_name } ${param.s_name }의 리뷰를 남겨주세요. </h4>						
		</div>
<div class="dealer-action pull-right">
<h5>전체 글 개수 : ${requestScope.totalCnt } 개&nbsp; </h5>
		</div>
	<!-- property area -->
	<div class="content-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">

				<div
					class="col-md-12 pr-30 padding-top-80 properties-page user-properties">

					<div class="section">
						<div class="page-subheader sorting pl0 pr-10"></div>

					</div>

					<div class="section">
						<div id="list-type" class="proerty-th-list">
							<div class="col-md-4 p0">
								<div class="box-two proerty-item">

									<div class="form-group">
										
								
										<table border="1" width="1110" >
											<span class="col-xs-6 col-sm-4 col-md-4 add-d-title">
											<tr> 
												<td align="center"><b> Rev No. </b></td>
												<td align="center"> <b>pic</b> </td>
												<td align="center"><b> starValue  </b></td>
												<td align="center"> <b>Subject </b></td>
												<td align="center"> <b>Content </b></td>
												<td align="center"> <b>Date</b> </td>
												<td align="center"> <b>ㅇㅅㅇ </b></td>
												
											</tr>
											</span>
											</div>
											<div class="form-group">
											<c:forEach var="dto" items="${reviewListAll }">
												<tr>
													<td align="center"><b>${dto.rev_no }</b></td>
													<td align="center">
													 <img src="./upload/${dto.rev_file }" width="50" height="50">
													</td>
													<td align="center">${dto.rev_star } / 5 점</td>
													<td align="center">${dto.rev_subject }</td>
													<td align="center">${dto.rev_content}</td>
													<td align="center"> <fmt:formatDate value="${dto.rev_date }"/></td>
													<td align="center">
												<a href="./ReviewUpdate.rv?rev_no=${dto.rev_no }&s_no=${dto.s_no }&pageNum=${pageNum }&${s_name }">수정</a>
												/
												<a href="./ReviewDelete.rv?rev_no=${dto.rev_no }">삭제</a>
												</td>
												</tr>
											</c:forEach>
											

						
										</table>
										
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
	<div class="form-group" align="center">
	<a href="./ReviewWrite.rv?s_no=${param.s_no }&s_name=${param.s_name}">
	<button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 
                       	review 작성 하기 </button></a></div>
                       	
                       	<form action="./storeDetails.st?s_no=${param.s_no }&s_name=${param.s_name }"> 
							<button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 
                               상세 페이지로~ </button></form>

	<div class="section">
		<div class="pull-right">
			<div class="pagination">
				<ul>
					
	  <c:if test="${totalCnt != 0}">
	    <!-- 이전 -->
	    <c:if test="${startPage > pageBlock }">
	    	<a href="./ReviewList.rv?pageNum=${startPage-pageBlock }">[이전]</a>
	    </c:if>
	    <!-- 페이지 번호(1,2,3....) -->	  
	    <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
	          <a href="./ReviewList.rv?pageNum=${i }">${i }</a> 
	    </c:forEach>  
	    
	    <!-- 다음 -->	
	    <c:if test="${endPage < pageCount }">
	        <a href="./ReviewList.rv?pageNum=${startPage+pageBlock }">[다음]</a>
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
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
<%--     <jsp:include page="../inc/top.jsp" /> --%>
<%
		HttpSession session1 = request.getSession();
		String id = (String) session1.getAttribute("id");
		System.out.println("id : "+id);
		
		if(id==null) {
			System.out.println("Let's go!!!!!!");
			response.sendRedirect("Login.us");
		}
		%>

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">QnA 게시판</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->
        &nbsp;  &nbsp;  &nbsp;  &nbsp;
        <input type="button" style="width:201px" class="nav-link" onclick="location.href='./storeDetails.st?s_no=${param.s_no }'" value="Reservation">
        <input type="button" style="width:201px" class="nav-link" onclick="location.href='./storeList.st'" value="Store List">
        <input type="button" style="width:201px" class="nav-link" onclick="location.href=''./BookMarkList.bk'" value="My BookMarkList">
        <input type="button" style="width:201px" onclick="location.href='./QnaWrite.br?s_no=${s_no}&rev_category=0'" value="write" class="button">
        <!-- property area -->
        <div class="content-area recent-property" style="background-color: #FFF;">
            <div class="container">   
                <div class="row">

                    <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">

                        <div class="section"> 
                            <div class="page-subheader sorting pl0 pr-10">

                            </div>

                        </div>

                        <div class="section"> 
<%--                         ${qnaList } --%>
<%--                         <c:set var="mdto" value="${mListAll }" /> --%>
<%-- 	${qnaList} --%>
                        <c:forEach var="dto" items="${qnaList }">
                            <div id="list-type" class="proerty-th-list">
                                <div class="col-md-4 p0">
                                    <div class="box-two proerty-item">
                                        <div class="item-entry overflow" style="width:830px;">
                                            <h5><a href="./QnaContent.br?rev_no=${dto.rev_no}&s_no=${dto.s_no}&pageNum=${pageNum}">${dto.rev_no} ${dto.rev_subject }</a></h5>
                                            <div class="dot-hr"></div>
                                                <div class="dealer-action pull-right">                                        
                                                    <a href="" class="button">${m_id } </a>
                                                    <a href="" class="button delete_user_car">${dto.rev_date}</a>
<!--                                                     <a href="" class="button">조회수</a>
 -->                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>  <br>                           
							</c:forEach>
<!--                                 <div id="list-type" class="proerty-th-list"> -->
<!--                                 <div class="col-md-4 p0"> -->
<!--                                     <div class="box-two proerty-item"> -->
<!--                                         <div class="item-entry overflow"> -->
<!--                                             <h5><a href="property-1.html">[글번호] 제목</a></h5> -->
<!--                                             <div class="dot-hr"></div> -->
<!--                                                 <div class="dealer-action pull-right">                                         -->
<!--                                                     <a href="" class="button">작성자 </a> -->
<!--                                                     <a href="" class="button delete_user_car">작성일</a> -->
<!--                                                     <a href="" class="button">조회수</a> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div>  <br>     -->

                                </div> 
                                        </div>
                                    </div>
                                </div>                                                        
                            </div>

<%-- ${s_no } --%>		<div class="col-md-9  pr0 padding-top-40 properties-page">
                        <div class="row"> 
                                <div class="pagination">
                                <c:if test="${requestScope.totalCnt !=0 }">
                                	
                                	
                                	<c:if test="${startPage > pageBlock }">
										<a href="./QnaList.br?pageNum=${startPage-pageBlock}&s_no=${s_no}&rev_category=0">
										[이전]
										</a>
									</c:if>
								
<!-- 								페이지 번호(1,2,3...) -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">	
										<a href="./QnaList.br?pageNum=${i}&s_no=${s_no}&rev_category=0">${i}</a>
									</c:forEach>
							
									<c:if test="${endPage < pageCount }">
										<a href="./QnaList.br?pageNum=${startPage+pageBlock}&s_no=${s_no}&rev_category=0">
										[다음]
										</a>
									</c:if>
							</c:if>
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
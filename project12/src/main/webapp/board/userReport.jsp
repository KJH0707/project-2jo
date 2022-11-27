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
        <title>Fork And Knife | Report Write</title>
        <meta name="description" content="company is a real-estate template">
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
        <jsp:include page="../inc/top.jsp"></jsp:include>
<script src="./board/jquery-3.6.1.js"></script>
<script type="text/javascript">

function sub() {
	
	if (document.frm.rev_subject.value=="") {
		alert('제목을 입력하세요.');
		return false;
	}
	if (document.frm.rev_content.value=="") {
		alert('내용을 입력하세요.');
		return false;
	}

}
</script>
    </head>
    
    
    
    <body>
<!--         <div id="preloader"> -->
<!--             <div id="status">&nbsp;</div> -->
<!--         </div> -->
        <!-- Body content -->


            
        <!--End top header -->

        <!-- End of nav bar -->

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">신고 페이지</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
            <div class="container">  

                <div class="col-md-9">

                    <div class="" id="contact1">                        
                  <div align="center">
                        <hr>
                        <h2>유저 신고</h2>
                        <form action="./storeReportPro.st" method="post" enctype="multipart/form-data" name="frm" onsubmit="return sub()">
                       <input type="hidden" value="${param.s_no }" name="s_no">
                       <input type="hidden" value="${param.m_no }" name="rep_m_no">
                                    <label for="subject">제목</label>
                                  	  <input type="text" class="form-control" id="subject" name="rep_subject" placeholder="제목을 적으세요">
                                    <label for="subject">첨부파일</label>
                                  	  <input type="file" class="form-control" id="file" name="rep_file">
                                    <label for="message">어떤 문제인가요?</label>
                                    <textarea id="message" class="form-control" name="rep_reason" rows="10" placeholder="신고 내용을 적어주세요"></textarea>
					<br>
							
                                <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 
                               신고 </button></form>
                        
                    </div>
                </div>
               
               <i class="fa-solid fa-arrow-rotate-left"></i><a href="javascript:window.history.back();">뒤로가기</a>          
            </div>
        </div>
        
         <!-- Footer area-->
        <script src="assets/js/modernizr-2.6.2.min.js"></script>
        <script src="assets/js/jquery-1.10.2.min.js"></script> 
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/bootstrap-hover-dropdown.js"></script>

        <script src="assets/js/easypiechart.min.js"></script>
        <script src="assets/js/jquery.easypiechart.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wow.js"></script>

        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/price-range.js"></script>
        
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
        <script src="assets/js/gmaps.js"></script>        
        <script src="assets/js/gmaps.init.js"></script>

        <script src="assets/js/main.js"></script>
	




<style type="text/css">
  #star a{
   text-decoration: none;
   color: gray;
  }
  #star a.on{
   color: red;
  } 

element.style {
    height: 350px;
}

.col-md-9 {
    width: 100%;
}
</style>



    </body>
</html>
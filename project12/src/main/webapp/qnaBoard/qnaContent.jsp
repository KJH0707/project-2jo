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
        <title>Fork And Knife | QnA Content </title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="./assets/css/normalize.css">
        <link rel="stylesheet" href="./assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="./assets/css/fontello.css">
        <link href="./assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="./assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="./assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="./assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="./assets/css/price-range.css">
        <link rel="stylesheet" href="./assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="./assets/css/owl.theme.css">
        <link rel="stylesheet" href="./assets/css/owl.transitions.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
    </head>
    <body>

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->
                       
        <!-- End page header -->

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
                <div id="list-type" class="proerty-th-list">
                    <div class="col-md-4 p0">
                        <div class="box-two proerty-item">
                            <div class="item-thumb">
                            <!-- 로고 or 첨부파일 -->
              <a href="property-1.html" ><img src="assets/img/demo/property-3.jpg"></a>
          </div>
          <div class="item-entry overflow">
          <%
          	String pageNum = request.getParameter("pageNum");
          	int s_no = Integer.parseInt(request.getParameter("s_no"));
          	int rev_no = Integer.parseInt(request.getParameter("rev_no"));
          %>
           <label for="firstname">문의분류</label>
          
          <input type="radio" name="qna_sort" value="예약문의" <c:if test="${qna_sort eq '예약문의'}">checked</c:if>>예약 문의
          <input type="radio" name="qna_sort" value="식당문의" <c:if test="${qna_sort eq '식당문의'}">checked</c:if>>식당 문의
          <input type="radio" name="qna_sort" value="기타문의" <c:if test="${qna_sort eq '기타문의'}">checked</c:if>>기타 문의
          
              <h5><a href="property-1.html">${dto.rev_subject}</a></h5>
              <div class="dot-hr"></div>
             <textarea> ${dto.rev_content } </textarea>
              <div class="property-icon">
                  <img src="">작성자 id|
                  <img src="">${dto.rev_date}

                  <div class="dealer-action pull-right">                                        
                      <input type="button" onclick="location.href='./QnaUpdate.br?rev_no=${param.rev_no}&pageNum=${param.pageNum}&s_no=${param.s_no}'" value="edit" class="button">
<!--                                                     <input type="button" onclick="location.href='submit-property.html'" value="edit" class="button">Edit </a> -->
                    <input type="button" onclick="location.href='./QnaDelete.br?rev_no=${dto.rev_no}&pageNum=${param.pageNum}&s_no=${dto.s_no}'" value="delete" class="button delete_user_car">
<!--                                                     <a href="#" class="button delete_user_car">Delete</a> -->
                      <input type="button" onclick="location.href='./QnaList.br?pageNum=${param.pageNum}&s_no=${dto.s_no}'" value="list" class="button">
                        </div>
                    </div>
                </div>
            </div>
        </div>                             
</div>
     </div>       
</div>
               
        </div>
    </div>
</div>

          <!-- Footer area-->

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
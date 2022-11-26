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
        <title>Fork And Knife | Review Write</title>
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
        
<script src="./board/jquery-3.6.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	
$('#star a').click(function(){ 
	 $(this).parent().children("a").removeClass("on");    
	 $(this).addClass("on").prevAll("a").addClass("on");
	 var starValue = $(this).attr("data-rate");
// 	$('.star p').append('<input type = "hidden" name="star" />');
	
	  alert(starValue +'점을 주셨네요');
	  $('input[name=rev_star]').attr('value',starValue);
	  return starValue;
	  
});
});

function sub() {
	if(document.frm.rev_star.value=="starValue"){
	alert('별점을 꼭 입력하세요');
	return false;
	}
	
	if (document.frm.rev_subject.value=="") {
		alert('제목 쓰셈 ㅋ');
		return false;
	}
	if (document.frm.rev_content.value=="") {
		alert('내용 쓰셈 ㅋ');
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
                        <h1 class="page-title">리뷰게시판</h1>               
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
                        <h2>리뷰 수정하기</h2>
                        <form action="./ReviewUpdateProAction.rv?pageNum=${pageNum }&s_no=${dto.s_no }&rev_sno=${dto.rev_no }" method="post" enctype="multipart/form-data" name="frm" onsubmit="return sub()">
                      
<!--                             <div class="row">
<!--                                 <div class="col-sm-6"> -->
<!--                                     <div class="form-group"> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <br>
<!--                                 <div class="col-sm-6"> -->
<!--                                     <div class="form-group"> -->
<c:if test="${!id.equals('admin') }">
별점을 입력해주세요.

<P id="star"> <!-- 부모 -->
<a href="#" id="starrate" data-rate="1">★</a> <!-- 자식들--> 
<a href="#" id="starrate" data-rate="2">★</a> 
<a href="#" id="starrate" data-rate="3">★</a>
<a href="#" id="starrate" data-rate="4">★</a>
<a href="#" id="starrate" data-rate="5">★</a>
 <p>
 
 

<input type="hidden" name="rev_star" value="starValue">
</c:if>
<c:if test="${id.equals('admin') }">
<input type="hidden" name="rev_star" value="${param.rev_star }">
</c:if>
 <input type="hidden" name="rev_no" value="${dto.rev_no }">

									
                                    <label for="subject">제목</label>
                                  	  <input type="text" class="form-control" id="subject" name="rev_subject" value="${dto.rev_subject }">
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-sm-6"> -->
<!--                                     <div class="form-group"> -->
                                    <label for="subject">첨부파일</label>
                                  	  <input type="file" class="form-control" id="file" name="rev_file">

                                    <label for="message">내용</label>
                  <textarea id="rev_content" class="form-control" name="rev_content" width="730px" placeholder="${dto.rev_content }">${dto.rev_content }</textarea>
<!--                                     </div> -->
<!--                                 </div> -->
					<br>
<!--                                 <div class="col-sm-12 text-center"> -->
                                <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 
                               review 수정 하기 </button></form>
							
							
                    </div>
                </div>
                <!-- /.col-md-9 -->    
                <a href="javascript:window.history.back();">뒤로가기</a>          
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



</style>
    </body>
</html>
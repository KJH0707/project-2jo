<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    
    <!--  eatigo -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css" 
crossorigin="anonymous"/><link data-chunk="desktop" rel="stylesheet" href="https://static-pwa.prod.eatigo.systems/8032/assets/css/desktop.c2cbb7f3e0741cb9a850.css" 
crossorigin="anonymous"/>

<!--  eatigo -->
<link rel="stylesheet" href="assets/css/lightslider.min.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="https://kit.fontawesome.com/36255ede0b.js" crossorigin="anonymous"></script>     
      
<script src="./board/jquery-3.6.1.js"></script>
<script type="text/javascript">

</script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- datepicker jQuery-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>   -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<!-- datepicker jQuery-->


     
     <title>Fork and Knife | EVENT</title>
     <meta name="description" content="project">
     <meta name="author" content="Kimarotec">
     <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
     <meta name="viewport" content="width=device-width, initial-scale=1">

     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

     <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

</head>
<body>
<jsp:include page="../inc/top.jsp" />


     <div class="page-head"> 
         <div class="container">
             <div class="row">
                 <div class="page-head-content">
                     <h1 class="page-title">E V E N T</h1>               
                 </div>
             </div>
         </div>
     </div>
     <!-- End page header -->
<div class="col-md-9 col-sm-offset-1  pr0 padding-top-40 properties-page">
      <div class="row">
          <div class="col-md-12 col-sm-12">
              <h3 class="tm-block-title d-inline-block">진행 중인 이벤트<hr style="border: thick 3px gray;"></h3>
	
          </div>
          <br>
      </div>
</div>
     <!-- property area -->
     
     <form action="" method="post" name="fr">
		<input type="hidden" name="s_no"value="${dto.s_no }" >
		
	<c:forEach var="e" items="${event }"> 
	<c:set var="img" value="${e.n_img.split(',')[1] }"/>
     <div class="content-area single-property" style="background-color: #FCFCFC;">
         <div class="container">
             <div class="clearfix padding-top-40">
                 <div class="col-md-8 col-sm-offset-2 single-property-content ">
                     <div class="row">
                         <div class="light-slide-item">            
                             <div class="clearfix">
                             <!-- 이벤트 이미지 -->
                             <c:if test="${n_no == e.n_no}"> <!-- 일치하는 항목에 대해서 수행  -->
                               <img src="assets/img/event/${img}" style="width: 100%">
                               <c:if test="${e.c_code!=null }" >
                               <a href="./getCouponAction.co?c_code=${c_code }" >
                               </c:if>
                             <!-- 이벤트 이미지 -->
                               </a>
                             </c:if>
                             <c:if test=""></c:if>
                             </div>
                         </div>
                     </div>

           	</div>
       	</div>
       </div>
       </div>
	</c:forEach>
	</form>
       
           <!-- disqus -->
<div id="disqus_thread"></div>
<script>
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = 'https://forknknife.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    })();
</script>
<!-- disqus -->

       <!-- Footer area-->
   <jsp:include page="../inc/bottom.jsp" />
   <!-- 지도 API javascript -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1900efb9ff28bb0a54c68c9b272a9b10&libraries=services"></script>
		<script src="ceo/mapAPIBoard.js"/>
	    <!-- 지도 API javascript -->


       <script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
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
       <script type="text/javascript" src="assets/js/lightslider.min.js"></script>
       <script src="assets/js/main.js"></script>

 <style type="text/css">
      /* 좋아요 버튼  */
      .body{
      font-family:monospace;
      }
      .like-content {
          display: inline-block;
          width: auto;
          margin: 2px auto;
          padding: 0;
          font-size: 12px;
          text-align: center;
      }
      .like-content .btn-secondary {
          display: block;
          margin: 0 auto;
          text-align: center;
          background: #ed2553;
          border-radius: 80px;
          box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
          padding: 5px 15px;
          font-size: 12px;
          font-weight: bold;
          cursor: pointer;
          border: none;
          outline: none;
          color: #000000;
          text-decoration: none;
          -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
      }
      .like-content .btn-secondary:hover {
        transform: translateY(-3px);
      }
      .like-content .btn-secondary .fa {
        margin-right: 5px;
      }
      
      .form-inline input[type=submit] {
     background: #aa9683;
    color: #2b2626;
    font-family: monospace;
    height: 40px;
    width: auto;
    border-radius: 1px;
    font-weight: bold;
    font-size: 16px;
    -webkit-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    -ms-transition: all 0.4s ease;
    transition: all 0.4s ease;
}

.add-d-title {
    font-weight: 600;
    text-transform: uppercase;
    background-color: #ffffff;
    margin: 0px;
    color: #564d4d;
    text-align-last: center;
    text-decoration-style: wavy;
}

p { 
     padding: 20px 20px 20px 20px; 
     margin: auto; 
 } 

 .hi { 
    width: 80%; 
 }
      </style>
      
      
 
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fork and Knife | Home page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico  the root directory -->
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
        <link rel="stylesheet" href="assets/css/wizard.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        
<!--         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->
<!--         <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> -->
<!--         <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->

<!-- 		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- 		<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- 		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

		<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<!-- 		<script> -->
<!-- $(function(){ -->
<!--     $('.datetimepicker').appendDtpicker({'locale':'ko'}); -->
<!-- }); -->
<!-- 		</script> -->
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    
  })();
  ChannelIO('boot', {
    "pluginKey": "11a959e9-32da-4bfa-baab-2259838a8261"
  });
</script>
<!-- End Channel Plugin -->
    </head>
    <body>
<!-- body content ~ End of nav bar 가 top.jsp -->
      <jsp:include page="../inc/top.jsp" />

        <div class="slider-area">
            <div class="slider">
                <div id="bg-slider" class="owl-carousel owl-theme">
 
					<div class="item"><img src="assets/img/banner9.jpeg" alt="banner9" style="background-attachment:fixed;"></div>
					<div class="item"><img src="assets/img/banner10.jpeg" alt="banner10" style="background-attachment:fixed;"></div>
					<div class="item"><img src="assets/img/banner8.jpeg" alt="banner8" style="background-attachment:fixed;"></div>
                    <div class="item"><img src="assets/img/chef.jpg" alt="banner" style="background-attachment:fixed;"></div>
                    <div class="item"><img src="assets/img/banner2.jpg" alt="banner2" style="background-attachment:fixed;"></div>
					<div class="item"><img src="assets/img/banner3.jpg" alt="banner3" style="background-attachment:fixed;"></div>
					<div class="item"><img src="assets/img/banner4.jpg" alt="banner4" style="background-attachment:fixed;"></div>
					<div class="item"><img src="assets/img/banner5.jpg" alt="banner5" style="background-attachment:fixed;"></div>
					<div class="item"><img src="assets/img/banner6.jpg" alt="banner6" style="background-attachment:fixed;"></div>
					<div class="item"><img src="assets/img/banner7.jpg" alt="banner7" style="background-attachment:fixed;"></div>
                </div>
            </div>
            <div class="container slider-content">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                        <h2>Welcome to Fork & Knife</h2>
                        <p>Keep your table and just eat!</p>

                    </div>
                </div>
            </div>
        </div>

        <div class="home-lager-shearch" style="background-color: rgb(252, 252, 252); padding-top: 25px; margin-top: -125px;">
            <div class="container">
                <div class="col-md-12 large-search"> 
                    <div class="search-form wow pulse">
                        <form action="./storeList.st" class="form-inline" method="get">
                        <input type="hidden" name="prnon" value="1">
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <input type="text" class="form-control" placeholder="가게 검색" name="kw" value="${kw2 }">
                                </div>
                                <div class="col-md-4">     
                                <select id="lunchBegins" class="show-tick form-control" name="city">
                                    <option value="busan" selected>부산</option>
                                </select>                              
                                
                                </div>
                                <div class="col-md-4">                                     
                                 <select id="basic12" class="show-tick form-control" name="gu" >
                                                    <option value="no">구</option>
                                                    <option value="강서구"
                                                    <c:if test="${gang!=null }">
                                                    selected="selected"
                                                    </c:if>>강서구</option>
                                                    <option value="금정구"
                                                    <c:if test="${gold!=null }">
                                                    selected="selected"
                                                    </c:if>>금정구</option>
                                                    <option value="남구"
                                                    <c:if test="${nam!=null }">
                                                    selected="selected"
                                                    </c:if>>남구</option>
                                                    <option value="동래구"
                                                    <c:if test="${dong!=null }">
                                                    selected="selected"
                                                    </c:if>>동래구</option>
                                                    <option value="부산진구"
                                                    <c:if test="${jin!=null }">
                                                    selected="selected"
                                                    </c:if>>부산진구</option>
                                                    <option value="북구"
                                                    <c:if test="${buk!=null }">
                                                    selected="selected"
                                                    </c:if>>북구</option>
                                                    <option value="사상구"
                                                    <c:if test="${sang!=null }">
                                                    selected="selected"
                                                    </c:if>>사상구</option>
                                                    <option value="사하구"
                                                    <c:if test="${saha!=null }">
                                                    selected="selected"
                                                    </c:if>>사하구</option>
                                                    <option value="서구"
                                                    <c:if test="${seo!=null }">
                                                    selected="selected"
                                                    </c:if>>서구</option>
                                                    <option value="수영구"
                                                    <c:if test="${swim!=null }">
                                                    selected="selected"
                                                    </c:if>>수영구</option>
                                                    <option value="연제구"
                                                    <c:if test="${yeon!=null }">
                                                    selected="selected"
                                                    </c:if>>연제구</option>
                                                    <option value="영도구"
                                                    <c:if test="${zero!=null }">
                                                    selected="selected"
                                                    </c:if>>영도구</option>
                                                    <option value="중구"
                                                    <c:if test="${middle!=null }">
                                                    selected="selected"
                                                    </c:if>>중구</option>
                                                    <option value="해운대구"
                                                    <c:if test="${sun!=null }">
                                                    selected="selected"
                                                    </c:if>>해운대구</option>
													
                                                </select>
                                </div>
                            </div>
               <div class="col-md-12 ">
                   <div class="search-row">   
                       <div class="col-sm-4">
                           <label for="property-geo">인원 :</label>
								<select id="" class="show-tick form-control" name="nums">
	                                 <option value="0" selected>명</option>
									<c:forEach var="i" begin="1" end="10" step="1">
									<option value="${i}"
	                                <c:if test="${nums==i}">
	                                selected="selected"
	                                </c:if>>${i}명</option>
									</c:forEach>
                   			</select>
                   			
                       </div>
                       <!-- End of  -->  

                       <div class="col-sm-4">
                           <label for="price-range">1인당 가격대 : </label>
                           <input type="text" class="span2 ddkjh" data-slider-min="0" 
                                  data-slider-max="100000" data-slider-step="5000" 
                                  <c:if test="${pr1==null }">
                                  data-slider-value="[0,50000]"
                                  </c:if>
                                  <c:if test="${pr1!=null }">
                                   data-slider-value="[${Integer.parseInt(pr1.split(",")[0]) },${Integer.parseInt(pr1.split(",")[1]) }]"
                                  </c:if>
                                   id="price-range" name="pr" value="0,50000">
                           <b class="pull-left color">0</b> 
                           <b class="pull-right color">100000</b>  
                       </div>
                       <!-- End of  --> 

                       <div class="col-sm-3">
                           <div class="checkbox">
                                                    <br><label> <input type="checkbox" name="prnon" value="1" 
                                                    <c:if test="${param.prnon!=null }">
                                                    checked
                                                    </c:if>
                                                    ><br>상관없음</label>
                                                </div>
                       </div>
                       <!-- End of  --> 

<!--                                     <div class="col-sm-3"> -->
<!--                                         <label for="property-geo">Min bed :</label> -->
<!--                                         <input type="text" class="span2" value="" data-slider-min="0"  -->
<!--                                                data-slider-max="600" data-slider-step="5"  -->
<!--                                                data-slider-value="[250,450]" id="min-bed" ><br /> -->
<!--                                         <b class="pull-left color">1</b>  -->
<!--                                         <b class="pull-right color">120</b> -->
<!--                                     </div> -->
                       <!-- End of  --> 
                   </div>

                   <div class="search-row">  
                       <div class="col-sm-2">
                           <div class="checkbox">
                           <label> <input type="checkbox" name="cg" value="한식"
                           <c:if test="${ko!=null }">
                           checked="checked"
                           </c:if>
                           >
                           한식</label>
                       </div>
                       </div>
                       <!-- End of  -->  

                       <div class="col-sm-2">
                           <div class="checkbox">
                               <div class="checkbox">
                               <label> <input type="checkbox" name="cg" value="중식"
                               <c:if test="${ch!=null }">
                               checked="checked"
                               </c:if>> 중식</label>
                           </div>
                           </div>
                       </div>
                       <!-- End of  --> 

                       <div class="col-sm-2">
							<div class="checkbox">
                            <label> <input type="checkbox" name="cg" value="일식"
                            <c:if test="${ja!=null }">
                            checked="checked"
                            </c:if>> 일식</label>
                        </div>
                       </div>
                       <!-- End of  -->  

                       <div class="col-sm-2">
                           <div class="checkbox">
	                           <label> <input type="checkbox" name="cg" value="양식"
	                           <c:if test="${am!=null }">
	                           checked="checked"
	                           </c:if>> 양식</label>
	                       </div>
                       </div>
                       <!-- End of  -->  

                       <div class="col-sm-2">
                           <div class="checkbox">
                               <label><input type="checkbox" name="cg" value="오마카세"
                               <c:if test="${om!=null }">
                               checked="checked"
                               </c:if>> 오마카세</label>
                           </div>
                       </div>
                       <!-- End of  --> 

<!--                                     <div class="col-sm-3"> -->
<!--                                         <div class="checkbox"> -->
<!--                                             <label> -->
<!--                                                 <input type="checkbox"> 26' Ceilings(1200) -->
<!--                                             </label> -->
<!--                                         </div> -->
<!--                                     </div> -->
                       <!-- End of  --> 
                        </div>   
                    </div>  
                    <div class="center">
                        <input type="submit" value="" class="btn btn-default btn-lg-sheach">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
            <!-- /.feature title -->
           <h2>이런 음식점 어떠세요?</h2>
       </div>
   </div>
   <div class="row">
   <div class="proerty-th">
         	 <c:forEach var="rec" items="${recStore}">
    		<div class="col-sm-6 col-md-3 p0">
    		<div class="box-two proerty-item">
    		<div class="item-thumb">
    		<a href="./storeDetails.st?s_no=${rec.s_no}"><img src="upload/${rec.s_image.split(',')[0]}"></a>
                  <span class="property-seeker">
                      <b class="b-1">${rec.s_no }</b>
                      <b class="b-2">${rec.s_type }</b>
                  </span>
              </div>
              <div class="item-entry overflow">
                  <h6> <a href="./storeDetails.st?s_no=${rec.s_no}">${rec.s_name } </a></h6>
                  <div class="dot-hr"></div>
                  <span class="pull-left"><span class="property-price">별점 : ${rec.s_star.toString().substring(0,3) }<c:forEach var="i" begin="1" end="5" step="1">
                                                       	 	<c:if test="${rec.s_star>=i }">
                                                        		<i id="star${k}" class="fa fa-star" style= color:red;></i>
                                                       		</c:if>
                                                       		<c:if test="${rec.s_star<i }">
                                                       			 <i id="star${k}" class="far fa-star" style= color:red;></i>
                                                       		</c:if>
                                                        </c:forEach></span> </span>
                   <span class="proerty-price pull-right">  </span>
                </div>
                </div>
            </div> 
            </c:forEach>
				
			</div>
		</div>
	</div>
</div>




<div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">

<div class="container">
	
    <div class="row">
    
        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
            <!-- /.feature title -->
                <h2>가격대별로 준비했어요!</h2>
                
            </div>
             <div class="wizard-container">
             <div class="wizard-card ct-wizard-orange" id="wizardProperty">
             
         <ul class="nav nav-pills">
          <li style="width: 25%;" class="active"><a href="#step1" data-toggle="tab">0-25000원</a></li>
 	<li style="width: 25%;"><a href="#step2" data-toggle="tab">25000-50000원</a></li>
	<li style="width: 25%;"><a href="#step3" data-toggle="tab">50000-75000원</a></li>
	<li style="width: 25%;"><a href="#step4" data-toggle="tab">75000-100000원</a></li>
      </ul>
        
        </div>
        </div>
        
         <div class="proerty-th">
         <div class="tab-content">

             <div class="tab-pane active" id="step1">
            <c:forEach var="cost" items="${costStore1}">
    		<div class="col-sm-6 col-md-3 p0">
    		<div class="box-two proerty-item">
    		<div class="item-thumb">
    		<a href="./storeDetails.st?s_no=${cost.s_no}"><img src="upload/${cost.s_image.split(',')[0]}"></a>
                  <span class="property-seeker">
                      <b class="b-1">${cost.s_price }원대</b>
                      <b class="b-2">${cost.s_type }</b>
                  </span>
              </div>
              <div class="item-entry overflow">
                  <h6> <a href="./storeDetails.st?s_no=${cost.s_no}">${cost.s_name } </a></h6>
                  <div class="dot-hr"></div>
                  <span class="pull-left"><span class="property-price">별점 : ${cost.s_star.toString().substring(0,3) } <c:forEach var="i" begin="1" end="5" step="1">
                                                       	 	<c:if test="${cost.s_star>=i }">
                                                        		<i id="star${k}" class="fa fa-star" style= color:red;></i>
                                                       		</c:if>
                                                       		<c:if test="${cost.s_star<i }">
                                                       			 <i id="star${k}" class="far fa-star" style= color:red;></i>
                                                       		</c:if>
                                                        </c:forEach></span>
                   <span class="proerty-price pull-right">  </span>
                </div>
                </div>
            </div> 
            </c:forEach>
				<div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5>못고르셨나요?</h5>
                            <h5 class="tree-sub-ttl">다른 가게들도 준비되어있어요!</h5>
                            <a href="./storeList.st?pr=0,25000" >
                             <button class="btn border-btn more-black" value="All properties">더보기</button></a>
                        </div>
                    </div>
                </div>
             </div>
             <!--  step 1  -->
         	<div class="tab-pane" id="step2">
            <c:forEach var="cost" items="${costStore2}">
    		<div class="col-sm-6 col-md-3 p0">
    		<div class="box-two proerty-item">
    		<div class="item-thumb">
    		<a href="./storeDetails.st?s_no=${cost.s_no}"><img src="upload/${cost.s_image.split(',')[0]}"></a>
                  <span class="property-seeker">
                      <b class="b-1">${cost.s_price }원대</b>
                      <b class="b-2">${cost.s_type }</b>
                  </span>
              </div>
              <div class="item-entry overflow">
                  <h6> <a href="./storeDetails.st?s_no=${cost.s_no}">${cost.s_name } </a></h6>
                  <div class="dot-hr"></div>
                  <span class="pull-left"><span class="property-price">별점 : ${cost.s_star.toString().substring(0,3) } <c:forEach var="i" begin="1" end="5" step="1">
                                                       	 	<c:if test="${cost.s_star>=i }">
                                                        		<i id="star${k}" class="fa fa-star" style= color:red;></i>
                                                       		</c:if>
                                                       		<c:if test="${cost.s_star<i }">
                                                       			 <i id="star${k}" class="far fa-star" style= color:red;></i>
                                                       		</c:if>
                                                        </c:forEach></span> </span>
                   <span class="proerty-price pull-right">  </span>
                </div>
                </div>
            </div> 
            </c:forEach>
				<div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5>못고르셨나요?</h5>
                            <h5 class="tree-sub-ttl">다른 가게들도 준비되어있어요!</h5>
                            <a href="./storeList.st?pr=25000,50000" >
                             <button class="btn border-btn more-black" value="All properties">더보기</button></a>
                        </div>
                    </div>
                </div>
             </div>
             <!--  step 2  -->
             
             <div class="tab-pane" id="step3">
            <c:forEach var="cost" items="${costStore3}">
    		<div class="col-sm-6 col-md-3 p0">
    		<div class="box-two proerty-item">
    		<div class="item-thumb">
    		<a href="./storeDetails.st?s_no=${cost.s_no}"><img src="upload/${cost.s_image.split(',')[0]}"></a>
                  <span class="property-seeker">
                      <b class="b-1">${cost.s_price }원대</b>
                      <b class="b-2">${cost.s_type }</b>
                  </span>
              </div>
              <div class="item-entry overflow">
                  <h6> <a href="./storeDetails.st?s_no=${cost.s_no}">${cost.s_name } </a></h6>
                  <div class="dot-hr"></div>
                  <span class="pull-left"><span class="property-price">별점 : ${cost.s_star.toString().substring(0,3) } <c:forEach var="i" begin="1" end="5" step="1">
                                                       	 	<c:if test="${cost.s_star>=i }">
                                                        		<i id="star${k}" class="fa fa-star" style= color:red;></i>
                                                       		</c:if>
                                                       		<c:if test="${cost.s_star<i }">
                                                       			 <i id="star${k}" class="far fa-star" style= color:red;></i>
                                                       		</c:if>
                                                        </c:forEach></span> </span>
                   <span class="proerty-price pull-right">  </span>
                </div>
                </div>
            </div> 
            </c:forEach>
				<div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5>못고르셨나요?</h5>
                            <h5 class="tree-sub-ttl">다른 가게들도 준비되어있어요!</h5>
                            <a href="./storeList.st?pr=50000,75000" >
                             <button class="btn border-btn more-black" value="All properties">더보기</button></a>
                        </div>
                    </div>
                </div>
             </div>
             <!--  step 3  -->
             
             <div class="tab-pane" id="step4">
            <c:forEach var="cost" items="${costStore4}">
    		<div class="col-sm-6 col-md-3 p0">
    		<div class="box-two proerty-item">
    		<div class="item-thumb">
    		<a href="./storeDetails.st?s_no=${cost.s_no}"><img src="upload/${cost.s_image.split(',')[0]}"></a>
                  <span class="property-seeker">
                      <b class="b-1">${cost.s_price }ㅇㅇ</b>
                      <b class="b-2">${cost.s_type }</b>
                  </span>
              </div>
              <div class="item-entry overflow">
                  <h6> <a href="./storeDetails.st?s_no=${cost.s_no}">${cost.s_name } </a></h6>
                  <div class="dot-hr"></div>
                  <span class="pull-left"><span class="property-price">별점 : ${cost.s_star.toString().substring(0,3) } <c:forEach var="i" begin="1" end="5" step="1">
                                                       	 	<c:if test="${cost.s_star>=i }">
                                                        		<i id="star${k}" class="fa fa-star" style= color:red;></i>
                                                       		</c:if>
                                                       		<c:if test="${cost.s_star<i }">
                                                       			 <i id="star${k}" class="far fa-star" style= color:red;></i>
                                                       		</c:if>
                                                        </c:forEach></span> </span>
                   <span class="proerty-price pull-right">  </span>
                </div>
                </div>
            </div> 
            </c:forEach>
				<div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5>못고르셨나요?</h5>
                            <h5 class="tree-sub-ttl">다른 가게들도 준비되어있어요!</h5>
                            <a href="./storeList.st?pr=75000,100000" >
                             <button class="btn border-btn more-black" value="All properties">더보기</button></a>
                        </div>
                    </div>
                </div>
             </div>
         	 <!--  step 4  -->
			</div>
		</div>
	</div>
</div>
<!-- 별점순 추천 -->
<div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
            <!-- /.feature title -->
                <h2>지금 별점 높은 가게들은?</h2>
            </div>
        </div>

        <div class="row">
   <div class="proerty-th">
         	 <c:forEach var="star" items="${starStore}">
    		<div class="col-sm-6 col-md-3 p0">
    		<div class="box-two proerty-item">
    		<div class="item-thumb">
    		<a href="./storeDetails.st?s_no=${star.s_no}"><img src="upload/${star.s_image.split(',')[0]}"></a>
                  <span class="property-seeker">
                      <b class="b-1">${star.s_no }</b>
                      <b class="b-2">${star.s_type }</b>
                  </span>
              </div>
              <div class="item-entry overflow">
                  <h6> <a href="./storeDetails.st?s_no=${star.s_no}">${star.s_name } </a></h6>
                  <div class="dot-hr"></div>
                  <span class="pull-left"><span class="property-price">별점 : ${star.s_star.toString().substring(0,3) } <c:forEach var="i" begin="1" end="5" step="1">
                                                       	 	<c:if test="${star.s_star>=i }">
                                                        		<i id="star${k}" class="fa fa-star" style= color:red;></i>
                                                       		</c:if>
                                                       		<c:if test="${star.s_star<i }">
                                                       			 <i id="star${k}" class="far fa-star" style= color:red;></i>
                                                       		</c:if>
                                                        </c:forEach></span> </span>
                   <span class="proerty-price pull-right">  </span>
                </div>
                </div>
            </div> 
            </c:forEach>
			</div>
		</div>
	</div>
</div>


 <!-- 가격대별 추천 -->

 <!-- 지역별 추천 -->
<div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
            <!-- /.feature title -->
                <h2>요즘 핫한 가게!</h2>
            </div>
        </div>

        <div class="row">
   <div class="proerty-th">
         	 <c:forEach var="read" items="${readStore}">
    		<div class="col-sm-6 col-md-3 p0">
    		<div class="box-two proerty-item">
    		<div class="item-thumb">
    		<a href="./storeDetails.st?s_no=${read.s_no}"><img src="upload/${read.s_image.split(',')[0]}"></a>
                  <span class="property-seeker">
                      <b class="b-1">${read.s_no }</b>
                      <b class="b-2">${read.s_type }</b>
                  </span>
              </div>
              <div class="item-entry overflow">
                  <h6> <a href="./storeDetails.st?s_no=${read.s_no}">${read.s_name } </a></h6>
                  <div class="dot-hr"></div>
                  <span class="pull-left"><span class="property-price">별점 : ${read.s_star.toString().substring(0,3) } <c:forEach var="i" begin="1" end="5" step="1">
                                                       	 	<c:if test="${read.s_star>=i }">
                                                        		<i id="star${k}" class="fa fa-star" style= color:red;></i>
                                                       		</c:if>
                                                       		<c:if test="${read.s_star<i }">
                                                       			 <i id="star${k}" class="far fa-star" style= color:red;></i>
                                                       		</c:if>
                                                        </c:forEach></span> </span>
                   <span class="proerty-price pull-right">  </span>
                </div>
                </div>
            </div> 
            </c:forEach>
				
			</div>
		</div>
	</div>
</div>



 <!-- 리뷰순 추천 -->
<div class="testimonial-area recent-property" style="background-color: #FCFCFC; padding-bottom: 15px;">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
            <!-- /.feature title -->
                <h2>리뷰순 추천 </h2> 
            </div>
        </div>

        <div class="row">
            <div class="row testimonial">
                <div class="col-md-12">
                    <div id="testimonial-slider">
            	 <c:forEach var="review" items="${reviewStore}">
                        <div class="item">
                            <div class="client-text" style="overflow: hidden;"> 
<!--                             	<div class="col-md-6">                              -->
                                <p>${review.rev_content}</p>
                                <h4><strong>${review.s_name}, </strong><i>별점 ${review.rev_star } <c:forEach var="i" begin="1" end="5" step="1">
                                                       	 	<c:if test="${review.rev_star>=i }">
                                                        		<i id="star${k}" class="fa fa-star" style= color:red;></i>
                                                       		</c:if>
                                                       		<c:if test="${review.rev_star<i }">
                                                       			 <i id="star${k}" class="far fa-star" style= color:red;></i>
                                                       		</c:if>
                                                        </c:forEach></i></h4>
<!--                                 </div>   -->
<!--                                 <div class="col-md-6"> -->
<!--                                 <div class="client-face wow fadeInRight" data-wow-delay=".9s">  -->
<%--                                 <img src="upload/${review.s_image.split(',')[0]}" alt="" style="background-attachment: local; height:100px; width:100px; border-radius:50%;"> --%>
<!--                             	</div> -->
<!--                             	</div> -->
                            	<div class="client-face wow fadeInRight animated animated" data-wow-delay=".9s" style="visibility: visible; animation-delay: 0.9s; background-attachment: local; width: 90px; height: 100px; border-radius:50%; z-index: 100; top:55px; right:30px;"> 
                                <img src="upload/jerry.gif" alt="">
                            	</div>
                            </div>
<!--                             <div class="client-face wow fadeInRight" data-wow-delay=".9s">  -->
<!--                             </div> -->
                        </div>
                        </c:forEach>
                         </div>
                        <div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page active"><span class=""></span></div><div class="owl-page"><span class=""></span></div></div></div>
					</div>
                        </div>
                </div>
            </div>

        </div>
   
<!--                         <div class="item"> -->
<!--                             <div class="client-text">                                 -->
<!--                                 <p>Nulla quis dapibus nisl. Suspendisse llam sed arcu ultried arcu ultricies !</p> -->
<!--                                 <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4> -->
<!--                             </div> -->
<!--                             <div class="client-face"> -->
<!--                                 <img src="assets/img/client-face2.png" alt=""> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="item"> -->
<!--                             <div class="client-text">                                 -->
<!--                                 <p>Nulla quis dapibus nisl. Suspendisse llam sed arcu ultried arcu ultricies !</p> -->
<!--                                 <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4> -->
<!--                             </div> -->
<!--                             <div class="client-face"> -->
<!--                                 <img src="assets/img/client-face1.png" alt=""> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="item"> -->
<!--                             <div class="client-text">                                 -->
<!--                                 <p>Nulla quis dapibus nisl. Suspendisse llam sed arcu ultried arcu ultricies !</p> -->
<!--                                 <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4> -->
<!--                             </div> -->
<!--                             <div class="client-face"> -->
<!--                                 <img src="assets/img/client-face2.png" alt=""> -->
<!--                             </div> -->
<!--                         </div> -->
                    

<!--Welcome area -->
<div class="Welcome-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12 Welcome-entry  col-sm-12">
                <div class="col-md-5 col-md-offset-2 col-sm-6 col-xs-12">
                    <div class="welcome_text wow fadeInLeft" data-wow-delay="0.3s" data-wow-offset="100">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                                <!-- /.feature title -->
                               <h2><img alt="" src="./assets/img/111.jpg"></h2> 
<!--                                 <h2>Fork & Knife </h2> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-sm-6 col-xs-12">
                    <div  class="welcome_services wow fadeInRight" data-wow-delay="0.3s" data-wow-offset="100">
                        <div class="row">
                            <div class="col-xs-6 m-padding">
                                <div class="welcome-estate">
                                    <div class="welcome-icon">
                                        <i class="pe-7s-home pe-4x"></i>
                                    </div>
                                    <h3>Any Restaurant</h3>
                                </div>
                            </div>
                            <div class="col-xs-6 m-padding">
                                <div class="welcome-estate">
                                    <div class="welcome-icon">
                                        <i class="pe-7s-users pe-4x"></i>
                                    </div>
                                    <h3>More Clients</h3>
                                </div>
                            </div>


                            <div class="col-xs-12 text-center">
                                <i class="welcome-circle"></i>
                            </div>

                            <div class="col-xs-6 m-padding">
                                <div class="welcome-estate">
                                    <div class="welcome-icon">
                                        <i class="pe-7s-notebook pe-4x"></i>
                                    </div>
                                    <h3>Easy to use</h3>
                                </div>
                            </div>
                            <div class="col-xs-6 m-padding">
                                <div class="welcome-estate">
                                    <div class="welcome-icon">
                                        <i class="pe-7s-help2 pe-4x"></i>
                                    </div>
                                    <h3>Any help </h3>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


      <!-- footer area ~ div 끝(=아래 script 시작 전) -->
	<br>
	<jsp:include page="../inc/bottom.jsp" />


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

        <script src="assets/js/main.js"></script>
      
    </body>
</html>

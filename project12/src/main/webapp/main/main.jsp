<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="assets/css/responsive.css">
        
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
    }
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
 
                    <div class="item"><img src="assets/img/main.jpg" alt="The Last of us"></div>
                    <div class="item"><img src="assets/img/main2.jpg" alt="GTA V"></div>

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
                        <form action="./storeList.st" class=" form-inline" method="post">
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <input type="text" class="form-control" placeholder="가게 이름">
                                </div>
                                <div class="col-md-4">                                   
                                    <select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="위치" name="place">
                                        <option>서울경기</option>
                                        <option>부산경남</option>
                                        <option>대구경북</option>
                                        <option>제주</option>
                                        <option>충청</option>
                                        <option>전북</option>
                                        <option>전남</option>
                                    </select>
                                </div>
                                <div class="col-md-4">                                     
<!--                                 <input type="text" name="test1" id="text1" value="" class="datetimepicker show-tick form-control"> -->
									 <input type="datetime-local" class="form-control" id="time" value="time" name="time">
<!--                                     <select id="basic" class="selectpicker show-tick form-control"> -->
<!--                                         <option> 날짜 및 시간 </option> -->
<!--                                         <option>Rent </option> -->
<!--                                         <option>Boy</option> -->
<!--                                         <option>used</option>   -->
<!--                                     </select> -->
<!-- 									<input type="text" id="testDatepicker"> -->
                                </div>
                            </div>
               <div class="col-md-12 ">
                   <div class="search-row">   
                       <div class="col-sm-3">
                           <label for="price-range">인원</label>
                           <input type="number" value="total" name="total" class='span2'>
<!--                            <input type="text" class="span2" value="people" data-slider-min="1" name="people"  -->
<!--                                   data-slider-max="20" data-slider-step="1"  -->
<!--                                   data-slider-value="[3,5]" id="price-range" ><br /> -->
<!--                            <b class="pull-left color">1</b>  -->
<!--                            <b class="pull-right color">20</b> -->
                       </div>
                       <!-- End of  -->  

                       <div class="col-sm-3">
                           <label for="property-geo">가격대</label>
                           <input type="text" class="span2" value="cost" data-slider-min="0" name="cost" 
                                  data-slider-max="300000" data-slider-step="10000" 
                                  data-slider-value="[10000,100000]" id="property-geo" ><br />
                           <b class="pull-left color">10,000</b> 
                           <b class="pull-right color">300,000</b>
                       </div>
                       <!-- End of  --> 

                       <div class="col-sm-3">
                           <label for="price-range">거리</label>
                           <input type="text" class="span2" value="distance" data-slider-min="0" name="distance"
                                  data-slider-max="1000" data-slider-step="500" 
                                  data-slider-value="[250,650]" id="min-baths" ><br />
                           <b class="pull-left color">0m</b> 
                           <b class="pull-right color">1km</b>
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
                       <div class="col-sm-3">
                           <div class="checkbox">
                               <label>
                                   <input type="checkbox" name="menu" value="korean"> 한식
                               </label>
                           </div>
                       </div>
                       <!-- End of  -->  

                       <div class="col-sm-3">
                           <div class="checkbox">
                               <label>
                                   <input type="checkbox" name="menu" value="western"> 양식
                               </label>
                           </div>
                       </div>
                       <!-- End of  --> 

                       <div class="col-sm-3">
                           <div class="checkbox">
                               <label>
                                   <input type="checkbox" name="menu" value="japanese"> 일식
                               </label>
                           </div>
                       </div>
                       <!-- End of  -->  

                       <div class="col-sm-3">
                           <div class="checkbox">
                               <label>
                                   <input type="checkbox" name="menu" value="chinese"> 중식
                               </label>
                           </div>
                       </div>
                       <!-- End of  -->  

                       <div class="col-sm-3">
                           <div class="checkbox">
                               <label>
                                   <input type="checkbox" name="menu" value="omakase"> 오마카세
                               </label>
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


<!-- 메뉴 랜덤 추천 -->
<div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
            <!-- /.feature title -->
           <h2>~~ 한식/양식/어쩌구 어떠세요? ~~</h2>
       </div>
   </div>

   <div class="row">
       <div class="proerty-th">
           <div class="col-sm-6 col-md-3 p0">
               <div class="box-two proerty-item">
                   <div class="item-thumb">
                       <a href="" ><img src="assets/img/demo/property-1.jpg"></a>
                   </div>
                   <div class="item-entry overflow">
                       <h5><a href="" >Super nice villa </a></h5>
                       <div class="dot-hr"></div>
                       <span class="pull-left"><b>Area :</b> 120m </span>
                       <span class="proerty-price pull-right">$ 300,000</span>
                   </div>
               </div>
           </div>

           <div class="col-sm-6 col-md-3 p0">
               <div class="box-two proerty-item">
                   <div class="item-thumb">
                       <a href="" ><img src="assets/img/demo/property-2.jpg"></a>
                   </div>
                   <div class="item-entry overflow">
                       <h5><a href="" >Super nice villa </a></h5>
                       <div class="dot-hr"></div>
                       <span class="pull-left"><b>Area :</b> 120m </span>
                       <span class="proerty-price pull-right">$ 300,000</span>
                   </div>
               </div>
           </div>

           <div class="col-sm-6 col-md-3 p0">
               <div class="box-two proerty-item">
                   <div class="item-thumb">
                       <a href="" ><img src="assets/img/demo/property-3.jpg"></a>

                   </div>
                   <div class="item-entry overflow">
                       <h5><a href="" >Super nice villa </a></h5>
                       <div class="dot-hr"></div>
                       <span class="pull-left"><b>Area :</b> 120m </span>
                       <span class="proerty-price pull-right">$ 300,000</span>
                   </div>
               </div>
           </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5><a href="./storeList.st" >CAN'T DECIDE ? </a></h5>
                            <h5 class="tree-sub-ttl">Show all restaurants</h5>
                            <button class="btn border-btn more-black" value="All properties">더보기</button>
                        </div>
                    </div>
                </div>
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
                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-1.html" ><img src="assets/img/demo/property-1.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-1.html" >Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-2.html" ><img src="assets/img/demo/property-2.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-2.html" >Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-3.html" ><img src="assets/img/demo/property-3.jpg"></a>

                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-3.html" >Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>
                
				 <div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5><a href="./storeList.st" >CAN'T DECIDE ? </a></h5>
                            <h5 class="tree-sub-ttl">Show all restaurants</h5>
                            <button class="btn border-btn more-black" value="All properties">더보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


 <!-- 가격대별 추천 -->
<div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
            <!-- /.feature title -->
                <h2>가격대별로 준비했어요!</h2>
            </div>
        </div>

        <div class="row">
            <div class="proerty-th">
                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-1.html" ><img src="assets/img/demo/property-1.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-1.html" >1만원대 </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-2.html" ><img src="assets/img/demo/property-2.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-2.html" >3만원대 </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-3.html" ><img src="assets/img/demo/property-3.jpg"></a>

                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-3.html" >5만원대 </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>
                
				 <div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5><a href="./storeList.st" >CAN'T DECIDE ? </a></h5>
                            <h5 class="tree-sub-ttl">Show all restaurants</h5>
                            <button class="btn border-btn more-black" value="All properties">더보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


 <!-- 지역별 추천 -->
<div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
            <!-- /.feature title -->
                <h2>이 지역에 핫한 가게!</h2>
            </div>
        </div>

        <div class="row">
            <div class="proerty-th">
                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-1.html" ><img src="assets/img/demo/property-1.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-1.html" >Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-2.html" ><img src="assets/img/demo/property-2.jpg"></a>
                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-2.html" >Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 p0">
                    <div class="box-two proerty-item">
                        <div class="item-thumb">
                            <a href="property-3.html" ><img src="assets/img/demo/property-3.jpg"></a>

                        </div>
                        <div class="item-entry overflow">
                            <h5><a href="property-3.html" >Super nice villa </a></h5>
                            <div class="dot-hr"></div>
                            <span class="pull-left"><b>Area :</b> 120m </span>
                            <span class="proerty-price pull-right">$ 300,000</span>
                        </div>
                    </div>
                </div>
                
				 <div class="col-sm-6 col-md-3 p0">
                    <div class="box-tree more-proerty text-center">
                        <div class="item-tree-icon">
                            <i class="fa fa-th"></i>
                        </div>
                        <div class="more-entry overflow">
                            <h5><a href="./storeList.st" >CAN'T DECIDE ? </a></h5>
                            <h5 class="tree-sub-ttl">Show all restaurants</h5>
                            <button class="btn border-btn more-black" value="All properties">더보기</button>
                        </div>
                    </div>
                </div>
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
                        <div class="item">
                            <div class="client-text">                                
                                <p>Nulla quis dapibus nisl. Suspendisse llam sed arcu ultried arcu ultricies !</p>
                                <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
                            </div>
                            <div class="client-face wow fadeInRight" data-wow-delay=".9s"> 
                                <img src="assets/img/client-face1.png" alt="">
                            </div>
                        </div>
                        <div class="item">
                            <div class="client-text">                                
                                <p>Nulla quis dapibus nisl. Suspendisse llam sed arcu ultried arcu ultricies !</p>
                                <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
                            </div>
                            <div class="client-face">
                                <img src="assets/img/client-face2.png" alt="">
                            </div>
                        </div>
                        <div class="item">
                            <div class="client-text">                                
                                <p>Nulla quis dapibus nisl. Suspendisse llam sed arcu ultried arcu ultricies !</p>
                                <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
                            </div>
                            <div class="client-face">
                                <img src="assets/img/client-face1.png" alt="">
                            </div>
                        </div>
                        <div class="item">
                            <div class="client-text">                                
                                <p>Nulla quis dapibus nisl. Suspendisse llam sed arcu ultried arcu ultricies !</p>
                                <h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
                            </div>
                            <div class="client-face">
                                <img src="assets/img/client-face2.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

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
                                <h2>Fork & Knife </h2>
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

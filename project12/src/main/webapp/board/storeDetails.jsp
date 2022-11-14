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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    
    <!--  eatigo -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css" 
crossorigin="anonymous"/><link data-chunk="desktop" rel="stylesheet" href="https://static-pwa.prod.eatigo.systems/8032/assets/css/desktop.c2cbb7f3e0741cb9a850.css" 
crossorigin="anonymous"/>

<!--  eatigo -->
<link rel="stylesheet" href="assets/css/lightslider.min.css">
<link rel="stylesheet" href="assets/css/responsive.css">
      
<script src="./board/jquery-3.6.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	alert('hi');
	
	function clip(){
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.");
	};
	
	
	    var $wrap = $('.totalFn'), 
	        $btnMinus = $wrap.find('.minus'),
	        $btnPlus = $wrap.find('.plus');
	        $cell = $wrap.find('.cell');
	         
	    $btnMinus.on('click', function(e){
	        var $this = $(this);
	        var num = $this.parent().find('.num').text();
	        num --;
	        if (num <= 0) {
	            num = 0;
	        }
	        $this.parent().find('.num').text(num);
	        totalFn();
	    });
	 
	    $btnPlus.on('click', function(){
	        var $this = $(this);
	        var num = $this.parent().find('.num').text();
	        num ++;
	        if (20 <= num) {
	            num = 20; // 최대 인원수 
	        }
	        $this.parent().find('.num').text(num);
	        totalFn();
	    });
	 
	    function totalFn(){
	        var $total = $(".totalFn .count-box")
	        var total = 0;
	        $total.find(".num").each(function(){ 
	            total += Number($(this).text());
	        });
	        $(".count-total").text(total);
	    };
	

	
// $.getJSON("foodmenu.json",function(data){
// 	console.log(data);
// 	$(data).each(function(idx,item){
// 		$('table').append("<tr> <td>"+item.name+"</td> <td>"+item.addr+"</td> <td>"+item.tel+"</td> </tr>");
		
// 		});
// 	});
	

    $('#image-gallery').lightSlider({
        gallery: true,
        item: 1,
        thumbItem: 9,
        slideMargin: 0,
        speed: 500,
        auto: true,
        loop: true,
        onSliderLoad: function () {
            $('#image-gallery').removeClass('cS-hidden');
        }
    });
	
});
</script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- datepicker jQuery-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>   -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<!-- datepicker jQuery-->


     
     <title>Fork & Knife | Itwill 2 team</title>
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
                     <h1 class="page-title">Store Details </h1>               
                 </div>
             </div>
         </div>
     </div>
     <!-- End page header -->

     <!-- property area -->
     
     <form action="" method="post" name="fr">
		<input type="hidden" name="s_no"value="${dto.s_no }" >
	</form> 
	
     <div class="content-area single-property" style="background-color: #FCFCFC;">
         <div class="container">

             <div class="clearfix padding-top-40">
                 <div class="col-md-8 single-property-content ">
                     <div class="row">
                         <div class="light-slide-item">            
                             <div class="clearfix">
                                
                                
								
								배너 사진
                                 <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                                     <li data-thumb="./upload/${dto.s_menuImg.split(',')[0] }"> 
                                         <img src="./upload/${dto.s_menuImg.split(',')[0] }" />
                                     </li>
                                     <li data-thumb="./upload/${dto.s_menuImg.split(',')[1] }"> 
                                         <img src="./upload/${dto.s_menuImg.split(',')[1] }" />
                                     </li>
                                     <li data-thumb="./upload/${dto.s_menuImg.split(',')[2] }"> 
                                         <img src="./upload/${dto.s_menuImg.split(',')[2] }" />
                                     </li>
                                     <li data-thumb="./upload/${dto.s_menuImg.split(',')[3] }"> 
                                         <img src="./upload/${dto.s_menuImg.split(',')[3] }" />
                                     </li>                                       
                                 </ul>
                             </div>
                         </div>
                     </div>

                     <div class="single-property-wrapper">
                         <div class="single-property-header">   
                          <h4 class="s-property-title">		 F A C I L I T I E S 	 </h4>   
                         </div>
						
						${dto.s_facility }
                         <div class="property-meta entry-meta clearfix ">   

                             <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                 <span class="property-info-icon icon-tag">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                     <path class="meta-icon" fill-rule="evenodd" clip-rule="evenodd" fill="#FFA500" d="M47.199 24.176l-23.552-23.392c-.504-.502-1.174-.778-1.897-.778l-19.087.09c-.236.003-.469.038-.696.1l-.251.1-.166.069c-.319.152-.564.321-.766.529-.497.502-.781 1.196-.778 1.907l.092 19.124c.003.711.283 1.385.795 1.901l23.549 23.389c.221.218.482.393.779.523l.224.092c.26.092.519.145.78.155l.121.009h.012c.239-.003.476-.037.693-.098l.195-.076.2-.084c.315-.145.573-.319.791-.539l18.976-19.214c.507-.511.785-1.188.781-1.908-.003-.72-.287-1.394-.795-1.899zm-35.198-9.17c-1.657 0-3-1.345-3-3 0-1.657 1.343-3 3-3 1.656 0 2.999 1.343 2.999 3 0 1.656-1.343 3-2.999 3z"></path>
                                     </svg>
                                 </span>
                                 <span class="property-info-entry">
                                     <span class="property-info-label">주차정보</span>
                                     <span class="property-info-value">For Sale</span>
                                 </span>
                             </div>

                             <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                 <span class="property-info icon-area">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                     <!-- 아이콘 path -->
                                     <path class="meta-icon" fill="#FFA500" d="M46 16v-12c0-1.104-.896-2.001-2-2.001h-12c0-1.103-.896-1.999-2.002-1.999h-11.997c-1.105 0-2.001.896-2.001 1.999h-12c-1.104 0-2 .897-2 2.001v12c-1.104 0-2 .896-2 2v11.999c0 1.104.896 2 2 2v12.001c0 1.104.896 2 2 2h12c0 1.104.896 2 2.001 2h11.997c1.106 0 2.002-.896 2.002-2h12c1.104 0 2-.896 2-2v-12.001c1.104 0 2-.896 2-2v-11.999c0-1.104-.896-2-2-2zm-4.002 23.998c0 1.105-.895 2.002-2 2.002h-31.998c-1.105 0-2-.896-2-2.002v-31.999c0-1.104.895-1.999 2-1.999h31.998c1.105 0 2 .895 2 1.999v31.999zm-5.623-28.908c-.123-.051-.256-.078-.387-.078h-11.39c-.563 0-1.019.453-1.019 1.016 0 .562.456 1.017 1.019 1.017h8.935l-20.5 20.473v-8.926c0-.562-.455-1.017-1.018-1.017-.564 0-1.02.455-1.02 1.017v11.381c0 .562.455 1.016 1.02 1.016h11.39c.562 0 1.017-.454 1.017-1.016 0-.563-.455-1.019-1.017-1.019h-8.933l20.499-20.471v8.924c0 .563.452 1.018 1.018 1.018.561 0 1.016-.455 1.016-1.018v-11.379c0-.132-.025-.264-.076-.387-.107-.249-.304-.448-.554-.551z"></path>
                                     </svg>
                                 </span>
                                 <span class="property-info-entry">
                                     <span class="property-info-label">반려동물</span>
                                     <span class="property-info-value">3500<b class="property-info-unit">Sq Ft</b></span>
                                 </span>
                             </div>

                             <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                 <span class="property-info-icon icon-bed">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                     <!-- 아이콘 path -->
                                     <path class="meta-icon" fill="#FFA500" d="M21 48.001h-19c-1.104 0-2-.896-2-2v-31c0-1.104.896-2 2-2h19c1.106 0 2 .896 2 2v31c0 1.104-.895 2-2 2zm0-37.001h-19c-1.104 0-2-.895-2-1.999v-7.001c0-1.104.896-2 2-2h19c1.106 0 2 .896 2 2v7.001c0 1.104-.895 1.999-2 1.999zm25 37.001h-19c-1.104 0-2-.896-2-2v-31c0-1.104.896-2 2-2h19c1.104 0 2 .896 2 2v31c0 1.104-.896 2-2 2zm0-37.001h-19c-1.104 0-2-.895-2-1.999v-7.001c0-1.104.896-2 2-2h19c1.104 0 2 .896 2 2v7.001c0 1.104-.896 1.999-2 1.999z"></path>
                                     </svg>
                                 </span>
                                 <span class="property-info-entry">
                                     <span class="property-info-label">키즈존/노키즈존</span>
                                     <span class="property-info-value">3</span>
                                 </span>
                             </div>

                             <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                 <span class="property-info-icon icon-bath">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                     <!-- 아이콘 path -->
                                     <path class="meta-icon" fill="#FFA500" d="M37.003 48.016h-4v-3.002h-18v3.002h-4.001v-3.699c-4.66-1.65-8.002-6.083-8.002-11.305v-4.003h-3v-3h48.006v3h-3.001v4.003c0 5.223-3.343 9.655-8.002 11.305v3.699zm-30.002-24.008h-4.001v-17.005s0-7.003 8.001-7.003h1.004c.236 0 7.995.061 7.995 8.003l5.001 4h-14l5-4-.001.01.001-.009s.938-4.001-3.999-4.001h-1s-4 0-4 3v17.005000000000003h-.001z"></path>
                                     </svg>
                                 </span>
                                 <span class="property-info-entry">
                                     <span class="property-info-label">대관</span>
                                     <span class="property-info-value">3.5</span>
                                 </span>
                             </div>

                             <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                 <span class="property-info-icon icon-garage">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                     <!-- 아이콘 path -->
                                     <path class="meta-icon" fill="#FFA500" d="M44 0h-40c-2.21 0-4 1.791-4 4v44h6v-40c0-1.106.895-2 2-2h31.999c1.106 0 2.001.895 2.001 2v40h6v-44c0-2.209-1.792-4-4-4zm-36 8.001h31.999v2.999h-31.999zm0 18h6v5.999h-2c-1.104 0-2 .896-2 2.001v6.001c0 1.103.896 1.998 2 1.998h2v2.001c0 1.104.896 2 2 2s2-.896 2-2v-2.001h11.999v2.001c0 1.104.896 2 2.001 2 1.104 0 2-.896 2-2v-2.001h2c1.104 0 2-.895 2-1.998v-6.001c0-1.105-.896-2.001-2-2.001h-2v-5.999h5.999v-3h-31.999v3zm8 12.999c-1.104 0-2-.895-2-1.999s.896-2 2-2 2 .896 2 2-.896 1.999-2 1.999zm10.5 2h-5c-.276 0-.5-.225-.5-.5 0-.273.224-.498.5-.498h5c.275 0 .5.225.5.498 0 .275-.225.5-.5.5zm1-2h-7c-.275 0-.5-.225-.5-.5s.226-.499.5-.499h7c.275 0 .5.224.5.499s-.225.5-.5.5zm-6.5-2.499c0-.276.224-.5.5-.5h5c.275 0 .5.224.5.5s-.225.5-.5.5h-5c-.277 0-.5-.224-.5-.5zm11 2.499c-1.104 0-2.001-.895-2.001-1.999s.896-2 2.001-2c1.104 0 2 .896 2 2s-.896 1.999-2 1.999zm0-12.999v5.999h-16v-5.999h16zm-24-13.001h31.999v3h-31.999zm0 5h31.999v3h-31.999z"></path>
                                     </svg>
                                 </span>
                                 <span class="property-info-entry">
                                     <span class="property-info-label">콜키지</span>
                                     <span class="property-info-value">2</span>
                                 </span>
                             </div>


                         </div>
                        
                         <!-- 가게 추가 정보 -->

                         <div class="section additional-details">

                             <h4 class="s-property-title">I N F O R M A T I O N</h4>

                             <ul class="additional-details-list clearfix">
                                 <li>
                                     <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">영업시간</span>
                                     <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${dto.s_hours }</span>
                                 </li>

                                 <li>
                                     <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">주차</span>
                                     <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">2 Or More Spaces,Covered Parking,Valet Parking</span>
                                 </li>

                                 <li>
                                     <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">대관</span>
                                     <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Yes</span>
                                 </li>

                                 <li>
                                     <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">콜키지</span>
                                     <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">콜키지 시 2만원 추가 금액</span>
                                 </li>

                             </ul>
                         </div>  
                         
                         <br>
                         <br>
                           <!-- 메뉴 리뷰/QnA 토글  -->
                 <div class="section additional-details">
                 <h4 class="s-property-title">M E N U / A B O U T / R E V I E W </h4>

						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a data-toggle="tab" href="#menu">		M E N U		</a></li>
							<li><a data-toggle="tab" href="#about">		A B O U T	 </a></li>
							<li><a data-toggle="tab" href="#review">	R E V I E W		</a></li>
						</ul>

						<div class="tab-content">
							<div id="menu" class="tab-pane fade in active">
								<h3>HOME</h3>
								<p>Some content.</p>

								
								
								<c:forEach var="i" begin="0" end="10" step="1">
										
										<tr>
										 <td>메뉴 : ${dto.s_menuname.split(',')[i]}</td>
										<td> 가격 : ${dto.s_menuprice.split(',')[i] }</td>
										</tr><br>
								</c:forEach>
								
							</div>
							<div id="about" class="tab-pane fade">
								<h3>About our restaurant</h3>
								<p>Some content in menu 1.</p>

										<p>${dto.s_content } </p>
										
							</div>
							<div id="review" class="tab-pane fade">
								<h3>review board</h3>
								<p>please write review for our restaurant.</p>
								
								<table border="1">
								<!-- jsp? 가상주소? -->
								<iframe 
									src="./review/reviewList.jsp" 
									width="730" height="400" >
								</iframe>
								
								
								</table>
								<input type="submit" value="리뷰쓰기" onclick="location.href='/ReviewWrite.rv';">
									

							</div>
						</div>

					</div> <br>
                         
                          <!-- 메뉴 리뷰/QnA 토글  -->
                         <!-- End additional-details area  -->

                        
                <!-- End features area  -->
                 <h4 class="s-property-title">M A P </h4>
                <p>위치 :  ${dto.s_addr }</p>
				<!--  지도 api -->
				 
				<div id="map" style="width: 730px; height: 400px;"></div>
				
			<br>
			${dto }
                       
                     </div>
                 </div>

                 <div class="col-md-4 p0">
                     <aside class="sidebar sidebar-property blog-asside-right">
                         <div class="dealer-widget">
                             <div class="dealer-content">
                                 <div class="inner-wrapper">
								<!-- 즐겨찾기 -->
								<div class="favorite-and-print">
                                     <a class="add-to-fav" href="#login-modal" data-toggle="modal">
                                         <i class="fa fa-heart-o"></i>
                                     </a>
                                     <a class="printer-icon " href="javascript:window.print()">
                                         <i class="fa fa-print"></i> 
                                     </a>
                                 </div> 


                                     <div class="clear">
                                         <div class="col-xs-12 col-sm-12 dealer-face">
                                             <a href="">
                                                 <img src="assets/img/octocat.png" class="img-circle">
                                                 <img src="./upload/${dto.s_image }" />
                                             </a>
                                         </div>
                                         <br>
                                         <div class="col-xs-8 col-sm-8 ">
                                             <h3 class="dealer-name">
                                             
										<b> ${dto.s_name } </b>
										 <p>Back end developer ${dto.s_type } 전문점</p>
                                             </h3>
                                            

                                         </div>
                                     </div>
									
                                     <div class="clear">
                                         <ul class="dealer-contacts">                                       
                                             <li><i class="pe-7s-map-marker strong pe-2x"> </i><a href="#" onclick="clip(); return false;"> MAP url ${dto.s_addr} </a></li>
                                             <li><i class="pe-7s-call strong pe-2x"> </i> <a href="">Store Tel : ${dto.s_tel } </a></li>
                                             <li><i class="pe-7s-star strong pe-2x"> </i>  ${dto.s_star }</li>
                                         </ul>
                                         <p> ${dto.s_content }</p>
                                     </div>

                                 </div>
                             </div>
                         </div>
                         
     <!--  가게 검색 기능-->
     
     
<div class="panel panel-default sidebar-menu wow fadeInRight animated" >
         <div class="panel-heading">
             <h3 class="panel-title">- R E S E R V A T I O N -</h3>
         </div>
         <div class="panel-body search-widget">
             <form action="./reservation.re" class="form-inline" method="post"> 
                
               <hr>
			<fieldset>
			
				How many? 
				<div class="totalFn">
    <div class="count-box"> 성인
        <button type="button" class="minus">-</button>
        <span class="num">0</span>
        <button type="button" class="plus">+</button>
    </div>
    <div class="count-box"> 아이
        <button type="button" class="minus">-</button>
        <span class="num">0</span>
        <button type="button" class="plus">+</button>
    </div>
   
    <!-- 합계 -->
    <div class="total-area">
        <span>Total =</span>
        <strong class="count-total">0</strong>
    </div>
    <!-- // 합계 -->
</div>
<!-- 				<div>성인<input type='number'  -->
<!-- 						id="adult" name="성인" -->
<!-- 						value="0" -->
<!-- 						step="1" -->
<!-- 						min="1" -->
<!-- 						max="7"></div> -->
<!-- 				<div>아이<input type='number'  -->
<!-- 						id="kids" name="아이" -->
<!-- 						value="0" -->
<!-- 						step="1" -->
<!-- 						min="1" -->
<!-- 						max="7"></div> -->
					
										<hr>

				<div class="col-xs-6" style="font-family: Consolas, sans-serif;">
					<label for="property-geo">날짜</label> 
						<input type="date"id="start" name="trip-start"
					       value="today"
					       min="2022-01-01" max="2030-12-31">
							
				</div>
				
				<div class="row">
                           <div class="col-xs-6">
								<label for="price-range"> 몇시에 오시나요? </label>
								<input type="time" value="now" min="11:00" max="21:00" step="900" required
					      >

                           </div>
                           </div>
     	<hr>
                           <input id="input1" type="submit" value="예 약 하 기!" class="submit"> 
			</fieldset>
			</form>
		
			   
           </div>
       </div>
	
<hr>
                          <div class="panel panel-default sidebar-menu wow fadeInRight animated"> 
                            <div class="panel-heading">
                                <h3 class="panel-title">F & K 의 추천</h3>
                            </div>
                            <div class="panel-body recent-property-widget">
                                        <ul>
                                        <c:forEach var="rec" items="${recStore}">
                                        <li>
                                            <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                                <a href="single.html"><img src="assets/img/demo/small-property-2.jpg"></a>
                                                <span class="property-seeker">
<!--                                                     <b class="b-1"></b> -->
                                                    <b class="b-2">${rec.s_type }</b>
                                                </span>
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                                <h6> <a href="single.htmlr">${rec.s_name } </a></h6>
                                                <span class="property-price">별점 : ${rec.s_star }</span>
                                            </div>
                                        </li>
                                        </c:forEach>

                                    </ul>
                            </div>
                        </div>



<!--                            <div class="panel panel-default sidebar-menu wow fadeInRight animated"> -->
<!--                                <div class="panel-heading"> -->
<!--                                    <h3 class="panel-title">Ads her  </h3> -->
<!--                                </div> -->
<!--                                <div class="panel-body recent-property-widget"> -->
<!--                                    <img src="assets/img/ads.jpg"> -->
<!--                                </div> -->
<!--                            </div> -->

                           
                       </aside>
                   </div>
               </div>

           </div>
       </div>
       
      

       <!-- Footer area-->
   <jsp:include page="../inc/bottom.jsp" />
   
<!-- 지도 api-->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d08d4bdd291cf5f6208d58b1b6ac74fc"></script>
<!-- 지도 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d08d4bdd291cf5f6208d58b1b6ac74fc&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d08d4bdd291cf5f6208d58b1b6ac74fc&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d08d4bdd291cf5f6208d58b1b6ac74fc&libraries=services,clusterer,drawing"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>


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

      
    </body>
</html>
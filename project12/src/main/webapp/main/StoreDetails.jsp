<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<script src="jquery-3.6.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 인원 체크 토탈
	<!-- jQuery 인원수  -->
	function countBtn(){
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
	}
	<!-- jQuery 인원수  -->
	
	<!-- datepicker jQuery-->
		
	 //input을 datepicker로 선언
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        ,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });                    
    
    //초기값을 오늘 날짜로 설정해줘야 합니다.
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    <!-- datepicker jQuery-->
    
    
   });

	
	/* 로고  */
	<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="assets/img/favicon.ico" type="image/x-icon">
	/* 로고  */
   	<!--  버튼 태그 -->
	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
	<!--  버튼 태그 -->
	
	<!-- datepicker jQuery-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- datepicker jQuery-->


     
     <title>Fork & Knife | Itwill 2 team</title>
     <meta name="description" content="project">
     <meta name="author" content="Kimarotec">
     <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
     <meta name="viewport" content="width=device-width, initial-scale=1">

     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

     <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
     <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
     <link rel="icon" href="favicon.ico" type="image/x-icon">
     
<!--  eatigo -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css" 
crossorigin="anonymous"/><link data-chunk="desktop" rel="stylesheet" href="https://static-pwa.prod.eatigo.systems/8032/assets/css/desktop.c2cbb7f3e0741cb9a850.css" 
crossorigin="anonymous"/>

<link rel="stylesheet" href="assets/css/eatigo.css">
<!--  eatigo -->


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
      <link rel="stylesheet" href="assets/css/lightslider.min.css">
      <link rel="stylesheet" href="assets/css/style.css">
      <link rel="stylesheet" href="assets/css/responsive.css">
      

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
     <div class="content-area single-property" style="background-color: #FCFCFC;">
         <div class="container">

             <div class="clearfix padding-top-40">
                 <div class="col-md-8 single-property-content ">
                     <div class="row">
                         <div class="light-slide-item">            
                             <div class="clearfix">
                                 <div class="favorite-and-print">
                                     <a class="add-to-fav" href="#login-modal" data-toggle="modal">
                                         <i class="fa fa-star-o"></i>
                                     </a>
                                     <a class="printer-icon " href="javascript:window.print()">
                                         <i class="fa fa-print"></i> 
                                     </a>
                                 </div> 
								<!-- 배너 사진 -->
                                 <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                                     <li data-thumb="assets/img/scallop.jpg"> 
                                         <img src="assets/img/scallop.jpg" />
                                     </li>
                                     <li data-thumb="assets/img/kimchi.jpg"> 
                                         <img src="assets/img/kimchi.jpg" />
                                     </li>
                                     <li data-thumb="assets/img/maki.jpg"> 
                                         <img src="assets/img/maki.jpg" />
                                     </li>
                                     <li data-thumb="assets/img/sushi.jpg"> 
                                         <img src="assets/img/sushi.jpg" />
                                     </li>                                         
                                 </ul>
                             </div>
                         </div>
                     </div>

                     <div class="single-property-wrapper">
                         <div class="single-property-header">                                          
                             <h1 class="property-title pull-left">Facilities</h1>
                         </div>

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
                                     <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">open all day from 11:00-22:00</span>
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
                         
                           <!-- 메뉴 리뷰/QnA 토글  -->
                 <div class="section additional-details">
                 <h4 class="s-property-title">M E N U / A B O U T / R E V I E W </h4>
                 
			<div class="restaurant-content--tabs">
				<div
					class="restaurant-content--tabs-wrap flex justify-center relative"
					style="min-height: 48px;">
					<div tabindex="0"
						class="w-100 flex-column justify-center items-center f16 bb b--grey-ec relative fw5 inline-flex"
						type="button" role="tab"
						style="cursor: pointer; vertical-align: middle; outline: none; -webkit-tap-highlight-color: transparent; min-height: 48px; opacity: 1;">
						<a href="#menu" data-toggle="tab">menu </a></div>
					
					<div tabindex="0"
						class="w-100 flex-column justify-center items-center f16 bb b--grey-ec relative fw5 inline-flex"
						type="button" role="tab"
						style="cursor: pointer; vertical-align: middle; outline: none; -webkit-tap-highlight-color: transparent; min-height: 48px; opacity: 0.7;">
						<a href="#about" data-toggle="tab">about</a></div>
					
					<div tabindex="0"
						class="w-100 flex-column justify-center items-center f16 bb b--grey-ec relative fw5 inline-flex"
						type="button" role="tab"
						style="cursor: pointer; vertical-align: middle; outline: none; -webkit-tap-highlight-color: transparent; min-height: 48px; opacity: 0.7;">
						<a href="#review" data-toggle="tab">reviews</a></div>
					
					<span class="absolute bg-black"
						style="width: 243px; left: 0px; height: 2px; bottom: 0px; will-change: left, width; transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></span>
				</div>
				<!-- 메뉴 시작 -->
				<div
					class="restaurant-content--tabs-wrap restaurant-content--tabs-menu" id="menu">
					<div class="restaurant-content--tabs-recommended">
						<h2 class="restaurant-content--tabs-recommended-title">recommended
							menu</h2>
						<div class="relative">
							<div
								class="bg-white br4 relative w-100 dt flex items-center ba b--grey-ec br2"
								style="height: 36px; outline: none;">
								<div class="f14 pl16 nowrap ellipsis pr8"
									style="line-height: 34px;">
									<span class="f16 fw5 pl8 c-eatigo-red">25%</span>
								</div>
								<svg width="24" height="24" fill="#F5831F"
									style="margin-left: auto; transform: rotate(180deg); transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms; flex-shrink: 0; display: inline-block;">
									<path d="M7 14l5-5 5 5z"></path>
									<path d="M0 0h24v24H0z" fill="none"></path></svg>
							</div>
						</div>
					</div>
					<div class="restaurant-content--tabs-menu-table">
						<div class="f14 c-grey-4a lh-title"
							style="margin-bottom: 25px;">Promotion cannot be applied with any other in-house promotions. 
							Please refer to the special conditions below for more details.</div>
						<div
							class="restaurant-content--tabs-menu-table-row restaurant-content--tabs-menu-table-row--head">
							<div class="restaurant-content--tabs-menu-table-cell">Menu
								item</div>
							<div class="restaurant-content--tabs-menu-table-cell">Before</div>
							<div class="restaurant-content--tabs-menu-table-cell">After</div>
						</div>
						<div class="restaurant-content--tabs-menu-table-row">
							<div class="restaurant-content--tabs-menu-table-cell">red
								velvet pastry</div>
							<div class="restaurant-content--tabs-menu-table-cell">225.00</div>
							<div class="restaurant-content--tabs-menu-table-cell">168.75</div>
						</div>
						<div class="restaurant-content--tabs-menu-table-row">
							<div class="restaurant-content--tabs-menu-table-cell">mango
								cheese cake</div>
							<div class="restaurant-content--tabs-menu-table-cell">225.00</div>
							<div class="restaurant-content--tabs-menu-table-cell">168.75</div>
						</div>
						<div class="restaurant-content--tabs-menu-table-row">
							<div class="restaurant-content--tabs-menu-table-cell">veg
								burger delight</div>
							<div class="restaurant-content--tabs-menu-table-cell">250.00</div>
							<div class="restaurant-content--tabs-menu-table-cell">187.50</div>
						</div>
						<div class="restaurant-content--tabs-menu-table-row">
							<div class="restaurant-content--tabs-menu-table-cell">fish
								n chips</div>
							<div class="restaurant-content--tabs-menu-table-cell">275.00</div>
							<div class="restaurant-content--tabs-menu-table-cell">206.25</div>
						</div>
						<div class="restaurant-content--tabs-menu-table-row">
							<div class="restaurant-content--tabs-menu-table-cell">assorted
								macarons</div>
							<div class="restaurant-content--tabs-menu-table-cell">200.00</div>
							<div class="restaurant-content--tabs-menu-table-cell">150.00</div>
						</div>
					</div>
					<div class="restaurant-content--tabs-text">
						<p>공지 & 예약 정보</p>
					</div>
					
					<div class="restaurant-content--tabs-border"></div>
					<div class="restaurant-content--tabs-share">
						<button class="restaurant-content--tabs-share_action">
							share this page
							<svg width="24" height="24" fill="#838383"
								style="margin-left: 12px;">
								<path d="M0 0h24v24H0z" fill="none"></path>
								<path
									d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z"></path></svg>
						</button>
						<div></div>
					</div>
				</div>
				<!-- 메뉴 끝 -->
				<!-- about 시작 -->
				<div
					class="restaurant-content--tabs-wrap restaurant-content--tabs-about hide" id="about">
					<div class="restaurant-content--tabs-text" >
						<p>ㅇㅅㅇ</p>
					</div>
					<div class="restaurant-content--tabs-operation">
						<h3 class="restaurant-content--tabs-recommended-title">영업 시간</h3>
						<div class="restaurant-content--tabs-border"></div>
						<div>
							<div class="restaurant-content--tabs-operation--hours-table">
								<div class="restaurant-content--tabs-operation--hours-row">
									<div class="restaurant-content--tabs-operation--hours-cell">&nbsp;</div>
									<div class="restaurant-content--tabs-operation--hours-cell">Breakfast</div>
									<div class="restaurant-content--tabs-operation--hours-cell">Lunch</div>
									<div class="restaurant-content--tabs-operation--hours-cell">Dinner</div>
								</div>
								<div class="restaurant-content--tabs-operation--hours-row">
									<div class="restaurant-content--tabs-operation--hours-cell">Monday</div>
									<div
										class="restaurant-content--tabs-operation--hours-cell collapsed inactive">open
										all day from 07:00-23:00</div>
								</div>
								<div class="restaurant-content--tabs-operation--hours-row">
									<div class="restaurant-content--tabs-operation--hours-cell">Tuesday</div>
									<div
										class="restaurant-content--tabs-operation--hours-cell collapsed inactive">open
										all day from 07:00-23:00</div>
								</div>
								<div class="restaurant-content--tabs-operation--hours-row">
									<div class="restaurant-content--tabs-operation--hours-cell">Wednesday</div>
									<div
										class="restaurant-content--tabs-operation--hours-cell collapsed inactive">open
										all day from 07:00-23:00</div>
								</div>
								<div class="restaurant-content--tabs-operation--hours-row">
									<div class="restaurant-content--tabs-operation--hours-cell">Thursday</div>
									<div
										class="restaurant-content--tabs-operation--hours-cell collapsed inactive">open
										all day from 07:00-23:00</div>
								</div>
								<div class="restaurant-content--tabs-operation--hours-row">
									<div class="restaurant-content--tabs-operation--hours-cell">Friday</div>
									<div
										class="restaurant-content--tabs-operation--hours-cell collapsed inactive">open
										all day from 07:00-23:00</div>
								</div>
								<div class="restaurant-content--tabs-operation--hours-row">
									<div class="restaurant-content--tabs-operation--hours-cell">Saturday</div>
									<div
										class="restaurant-content--tabs-operation--hours-cell collapsed inactive">open
										all day from 07:00-23:00</div>
								</div>
								<div class="restaurant-content--tabs-operation--hours-row">
									<div class="restaurant-content--tabs-operation--hours-cell">Sunday</div>
									<div
										class="restaurant-content--tabs-operation--hours-cell collapsed inactive">open
										all day from 07:00-23:00</div>
								</div>
							</div>
						</div>
					</div>
					<div class="restaurant-content--tabs-border"></div>
					<div class="restaurant-content--tabs-share">
						<button class="restaurant-content--tabs-share_action">
							share this page
							<svg width="24" height="24" fill="#838383"
								style="margin-left: 12px;">
								<path d="M0 0h24v24H0z" fill="none"></path>
								<path
									d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z"></path></svg>
						</button>
						<div></div>
					</div>
				</div>
				<!-- about 끝 -->
				<!-- review 시작-->
				<div
					class="restaurant-content--tabs-wrap restaurant-content--tabs-feedback hide" id="review">
					<div class="restaurant-content--tabs-feedback-rating">
						<div class="restaurant-content--tabs-feedback-rating-main">
							<span>4</span>
							<div class="star-ratings" title="4 Stars"
								style="position: relative; box-sizing: border-box; display: inline-block;">
								<svg class="star-grad"
									style="position: absolute; z-index: 0; width: 0px; height: 0px; visibility: hidden;">
									<defs>
									<linearGradient id="starGrad842824223951125" x1="0%" y1="0%"
										x2="100%" y2="0%">
									<stop offset="0%" class="stop-color-first"
										style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
									<stop offset="0%" class="stop-color-first"
										style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
									<stop offset="0%" class="stop-color-final"
										style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop>
									<stop offset="100%" class="stop-color-final"
										style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop></linearGradient></defs></svg>
								<div class="star-container"
									style="position: relative; display: inline-block; vertical-align: middle; padding-right: 0px;">
									<svg viewBox="0 0 51 48" class="widget-svg"
										style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
										<path class="star"
											d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
											style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
								</div>
								<div class="star-container"
									style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
									<svg viewBox="0 0 51 48" class="widget-svg"
										style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
										<path class="star"
											d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
											style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
								</div>
								<div class="star-container"
									style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
									<svg viewBox="0 0 51 48" class="widget-svg"
										style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
										<path class="star"
											d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
											style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
								</div>
								<div class="star-container"
									style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
									<svg viewBox="0 0 51 48" class="widget-svg"
										style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
										<path class="star"
											d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
											style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
								</div>
								<div class="star-container"
									style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px;">
									<svg viewBox="0 0 51 48" class="widget-svg"
										style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
										<path class="star"
											d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
											style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
								</div>
							</div>
						</div>
						<div class="restaurant-content--tabs-feedback-rating-count">
							<div
								class="restaurant-content--tabs-feedback-rating-count--item">
								<div
									class="restaurant-content--tabs-feedback-rating-count--stars">
									<div class="star-ratings" title="5 Stars"
										style="position: relative; box-sizing: border-box; display: inline-block;">
										<svg class="star-grad"
											style="position: absolute; z-index: 0; width: 0px; height: 0px; visibility: hidden;">
											<defs>
											<linearGradient id="starGrad500423329889619" x1="0%"
												y1="0%" x2="100%" y2="0%">
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop>
											<stop offset="100%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop></linearGradient></defs></svg>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--progress">
									<div class="relative w-100 bg-grey-bb overflow-hidden br4"
										style="height: 2px;">
										<div class="absolute bg-eatigo-orange"
											style="width: 0%; height: 2px;"></div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--number">0</div>
							</div>
							<div
								class="restaurant-content--tabs-feedback-rating-count--item">
								<div
									class="restaurant-content--tabs-feedback-rating-count--stars">
									<div class="star-ratings" title="4 Stars"
										style="position: relative; box-sizing: border-box; display: inline-block;">
										<svg class="star-grad"
											style="position: absolute; z-index: 0; width: 0px; height: 0px; visibility: hidden;">
											<defs>
											<linearGradient id="starGrad181569275278118" x1="0%"
												y1="0%" x2="100%" y2="0%">
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop>
											<stop offset="100%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop></linearGradient></defs></svg>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--progress">
									<div class="relative w-100 bg-grey-bb overflow-hidden br4"
										style="height: 2px;">
										<div class="absolute bg-eatigo-orange"
											style="width: 0%; height: 2px;"></div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--number">0</div>
							</div>
							<div
								class="restaurant-content--tabs-feedback-rating-count--item">
								<div
									class="restaurant-content--tabs-feedback-rating-count--stars">
									<div class="star-ratings" title="3 Stars"
										style="position: relative; box-sizing: border-box; display: inline-block;">
										<svg class="star-grad"
											style="position: absolute; z-index: 0; width: 0px; height: 0px; visibility: hidden;">
											<defs>
											<linearGradient id="starGrad046938018125010" x1="0%"
												y1="0%" x2="100%" y2="0%">
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop>
											<stop offset="100%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop></linearGradient></defs></svg>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--progress">
									<div class="relative w-100 bg-grey-bb overflow-hidden br4"
										style="height: 2px;">
										<div class="absolute bg-eatigo-orange"
											style="width: 0%; height: 2px;"></div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--number">0</div>
							</div>
							<div
								class="restaurant-content--tabs-feedback-rating-count--item">
								<div
									class="restaurant-content--tabs-feedback-rating-count--stars">
									<div class="star-ratings" title="2 Stars"
										style="position: relative; box-sizing: border-box; display: inline-block;">
										<svg class="star-grad"
											style="position: absolute; z-index: 0; width: 0px; height: 0px; visibility: hidden;">
											<defs>
											<linearGradient id="starGrad792050231591356" x1="0%"
												y1="0%" x2="100%" y2="0%">
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop>
											<stop offset="100%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop></linearGradient></defs></svg>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--progress">
									<div class="relative w-100 bg-grey-bb overflow-hidden br4"
										style="height: 2px;">
										<div class="absolute bg-eatigo-orange"
											style="width: 0%; height: 2px;"></div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--number">0</div>
							</div>
							<div
								class="restaurant-content--tabs-feedback-rating-count--item">
								<div
									class="restaurant-content--tabs-feedback-rating-count--stars">
									<div class="star-ratings" title="1 Star"
										style="position: relative; box-sizing: border-box; display: inline-block;">
										<svg class="star-grad"
											style="position: absolute; z-index: 0; width: 0px; height: 0px; visibility: hidden;">
											<defs>
											<linearGradient id="starGrad673308541347958" x1="0%"
												y1="0%" x2="100%" y2="0%">
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-first"
												style="stop-color: rgb(245, 131, 31); stop-opacity: 1;"></stop>
											<stop offset="0%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop>
											<stop offset="100%" class="stop-color-final"
												style="stop-color: rgb(203, 211, 227); stop-opacity: 1;"></stop></linearGradient></defs></svg>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(245, 131, 31); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px; padding-right: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
										<div class="star-container"
											style="position: relative; display: inline-block; vertical-align: middle; padding-left: 0px;">
											<svg viewBox="0 0 51 48" class="widget-svg"
												style="width: 14px; height: 14px; transition: transform 0.2s ease-in-out 0s;">
												<path class="star"
													d="m25,1 6,17h18l-14,11 5,17-15-10-15,10 5-17-14-11h18z"
													style="fill: rgb(203, 211, 227); transition: fill 0.2s ease-in-out 0s;"></path></svg>
										</div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--progress">
									<div class="relative w-100 bg-grey-bb overflow-hidden br4"
										style="height: 2px;">
										<div class="absolute bg-eatigo-orange"
											style="width: 100%; height: 2px;"></div>
									</div>
								</div>
								<div
									class="restaurant-content--tabs-feedback-rating-count--number">1</div>
							</div>
						</div>
					</div>
					<div class="restaurant-content--tabs-feedback-comment">
						<div>Restaurant has no customer reviews.</div>
					</div>
					<div class="restaurant-content--tabs-border"></div>
					<div class="restaurant-content--tabs-share">
						<button class="restaurant-content--tabs-share_action">
							share this page
							<svg width="24" height="24" fill="#838383"
								style="margin-left: 12px;">
								<path d="M0 0h24v24H0z" fill="none"></path>
								<path
									d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z"></path></svg>
						</button>
						<div></div>
					</div>
				</div>
				<!-- review 끝-->
			</div>
                            
                         </div> <br>
                         
                          <!-- 메뉴 리뷰/QnA 토글  -->
                         <!-- End additional-details area  -->

                        
                <!-- End features area  -->
                 <h4 class="s-property-title">M A P </h4>
				<!--  지도 api -->
				<div id="map" style="width: 730px; height: 400px;"></div>
				
			<br>
			
                       
			

			
                     </div>
                 </div>

                 <div class="col-md-4 p0">
                     <aside class="sidebar sidebar-property blog-asside-right">
                         <div class="dealer-widget">
                             <div class="dealer-content">
                                 <div class="inner-wrapper">

                                     <div class="clear">
                                         <div class="col-xs-4 col-sm-4 dealer-face">
                                             <a href="">
                                                 <img src="assets/img/octocat.png" class="img-circle">
                                             </a>
                                         </div>
                                         <br>
                                         <div class="col-xs-8 col-sm-8 ">
                                             <h3 class="dealer-name">
                                               <p style="font-size:30px;">
										 <b>지 원 스 시</b></p>
                                                     
                                             </h3>
                                            

                                         </div>
                                     </div>

                                     <div class="clear">
                                         <ul class="dealer-contacts">                                       
                                             <li><i class="pe-7s-map-marker strong"> </i> MAP url</li>
                                             <li><i class="pe-7s-mail strong"> </i>Store Email</li>
                                             <li><i class="pe-7s-call strong"> </i> Store Tel :  </li>
                                         </ul>
                                         <p> 가게 상세정보 db에 잇는거</p>
                                     </div>

                                 </div>
                             </div>
                         </div>
                         
     <!--  가게 검색 기능-->
<div class="panel panel-default sidebar-menu wow fadeInRight animated" >
         <div class="panel-heading">
             <h3 class="panel-title">- S T O R E  S E A R C H -</h3>
         </div>
         <div class="panel-body search-widget">
             <form action="" class=" form-inline"> 
                 <fieldset>
                     <div class="row">
                         <div class="col-xs-12">
                             <input type="text" class="form-control" placeholder="Key word">
                         </div>
                     </div>
                 </fieldset>

                 <fieldset>
                     <div class="row">
                         <div class="col-xs-6">

                             <select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select Your Menu">

                                 <option>한식</option>
                                 <option>일식</option>
                                 <option>중식</option>
                                 <option>양식</option>
                                 <option>디저트</option>
                                 <option>뷔페</option>
                             </select>
                         </div>
                         </div>
                         
                                                   
                               <hr>
                         
                 
                 </fieldset><br>
			<fieldset>
				몇 명이세요?
				<div class="totalFn">
					<div class="count-box">
						<button type="button" class="minus">-</button>
						<span class="num">0</span>
						<button type="button" class="plus">+</button>
					</div>
					<div class="count-box">
						<button type="button" class="minus">-</button>
						<span class="num">0</span>
						<button type="button" class="plus">+</button>
					</div>
					<div class="count-box">
						<button type="button" class="minus">-</button>
						<span class="num">0</span>
						<button type="button" class="plus">+</button>
					</div>
					<!-- 합계 -->
				<div class="total-area">
					<span>Total =</span> <strong class="count-total">0</strong>
		</div>
				<!-- // 합계 -->
				</div>

				<div class="col-xs-6">
					<label for="property-geo">날짜</label> 
						<input type="text"
						id="startDate" placeholder="date"> 
							
				</div>
				
				<div class="row">
                           <div class="col-xs-6">
								<label for="price-range"> 몇시에 오시나요? </label>
                               <select id="reservation" class="timepicker" data-live-search="true" data-live-search-style="begins" title="몇시에 오시나요?">

                                   <option>11:00 ~ 13:00</option>
                                   <option>13:00 ~ 15:00</option>
                                   <option>15:00 ~ 17:00</option>
                                   <option>18:00 ~ 20:00</option>
                                   <option>22:00 ~ 24:00</option>
                                   <option>00:00 ~ 13:00</option>
                               </select>
                           </div>
                           </div>
                           
			</fieldset>
			<hr>

			<fieldset class="padding-5">
				<div class="row">
					<div class="col-xs-6">
						<label for="price-range"> 가격대 </label> <input type="text"
							class="span2" value="" data-slider-min="10000"
							data-slider-max="3000000" data-slider-step="100"
							data-slider-value="[0,450]" id="price-range"><br />
						<b class="pull-left color">10,000원</b> <b
							class="pull-right color">3,000,000원</b>
					</div>
				</div>
				</fieldset>

				<fieldset class="padding-5">
					<div class="row">
						<div class="col-xs-6">
							<label for="price-range">거리 (km)</label> <input type="text"
								class="span2" value="" data-slider-min="0"
								data-slider-max="600" data-slider-step="5"
								data-slider-value="[250,450]" id="min-baths"><br />
							<b class="pull-left color">1</b> <b class="pull-right color">120</b>

						</div>
					</div>
				</fieldset>



									<div class="checkbox">
                                   <label> <input type="checkbox" checked> 상관없음 </label>
                               </div> 
                          
							
<hr>


                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label> <input type="checkbox" checked> 뭐넣지</label>
                               </div>
                           </div>  
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label> <input type="checkbox" checked> 흠 </label>
                               </div>
                           </div>  
                       </div>
                   </fieldset>

                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label><input type="checkbox"> ?? </label>
                               </div>
                           </div>  
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label> <input type="checkbox"> ?? </label>
                               </div>
                           </div>  
                       </div>
                   </fieldset>

                  

                   
                                  
               </form>
           </div>
       </div>
	<button class="navbar-btn nav-button wow fadeInRight" onclick="location.href='./검색하기!.re'" data-wow-delay="0.5s"> 예 약 하 기 ! </button>
<hr>
                           <div class="panel panel-default sidebar-menu similar-property-wdg wow fadeInRight animated">
                               <div class="panel-heading">
                                   <h3 class="panel-title">F & K가 추천하는 메뉴!</h3>
                               </div>
                               <div class="panel-body recent-property-widget">
                                   <ul>
                                       <li>
                                           <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                               <a href="single.html"><img src="assets/img/demo/small-property-2.jpg"></a>
                                               <span class="property-seeker">
                                                   <b class="b-1">A</b>
                                                   <b class="b-2">S</b>
                                               </span>
                                           </div>
                                           <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                               <h6> <a href="single.html">김치찌개</a></h6>
                                               <span class="property-price">3,000,000원</span>
                                           </div>
                                       </li>
                                       <li>
                                           <div class="col-md-3 col-sm-3  col-xs-3 blg-thumb p0">
                                               <a href="single.html"><img src="assets/img/demo/small-property-1.jpg"></a>
                                               <span class="property-seeker">
                                                   <b class="b-1">A</b>
                                                   <b class="b-2">S</b>
                                               </span>
                                           </div>
                                           <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                               <h6> <a href="single.html">Super nice villa </a></h6>
                                               <span class="property-price">3,000,000원</span>
                                           </div>
                                       </li>
                                       <li>
                                           <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                               <a href="single.html"><img src="assets/img/demo/small-property-3.jpg"></a>
                                               <span class="property-seeker">
                                                   <b class="b-1">A</b>
                                                   <b class="b-2">S</b>
                                               </span>
                                           </div>
                                           <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                               <h6> <a href="single.html">Super nice villa </a></h6>
                                               <span class="property-price">3,000,000원</span>
                                           </div>
                                       </li>

                                       <li>
                                           <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                               <a href="single.html"><img src="assets/img/demo/small-property-2.jpg"></a>
                                               <span class="property-seeker">
                                                   <b class="b-1">A</b>
                                                   <b class="b-2">S</b>
                                               </span>
                                           </div>
                                           <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                               <h6> <a href="single.html">Super nice villa </a></h6>
                                               <span class="property-price">3,000,000원</span>
                                           </div>
                                       </li>

                                   </ul>
                               </div>
                           </div>



                           <div class="panel panel-default sidebar-menu wow fadeInRight animated">
                               <div class="panel-heading">
                                   <h3 class="panel-title">Ads her  </h3>
                               </div>
                               <div class="panel-body recent-property-widget">
                                   <img src="assets/img/ads.jpg">
                               </div>
                           </div>

                           


                       </aside>
                   </div>
               </div>

           </div>
       </div>
       
      

       <!-- Footer area-->
   <jsp:include page="../inc/bottom.jsp" />
   
<!-- 지도 api-->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=460a67a3e3effe9faae64573339c5d3c"></script>
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

<!-- 지도 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=460a67a3e3effe9faae64573339c5d3c&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=460a67a3e3effe9faae64573339c5d3c&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=460a67a3e3effe9faae64573339c5d3c&libraries=services,clusterer,drawing"></script>

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

       <script>
       $(document).ready(function (){

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
    </body>
</html>
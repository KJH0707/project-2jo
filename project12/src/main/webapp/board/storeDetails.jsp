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
<script src="https://kit.fontawesome.com/36255ede0b.js" crossorigin="anonymous"></script>     
      
<script src="./board/jquery-3.6.1.js"></script>
<script type="text/javascript">
function bkgo() {
    document.bf.submit();
 }
$(document).ready(function(){
	
	
	alert('hi');
	
	//좋아
	$('.like-content').one('click','.like-review', function(e) {
		$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this');
		$(this).children('.fa-heart').addClass('animate-like');
		
		 var likeValue = $(this).attr("data-rate");
		/*  5 .like-content 클릭시 
		 *  6 .like-content 의 html를 변경 (간단하게 문구만 변경)
		 *  7 .like-content class의 자식인 .fa-heart에 class를 animate-like 추가
		 *  .one 제이쿼리 함수는 이벤트를 한번만 받아 수행( 다시 눌러도 상태 돌아오지 않음)
		 */
		});
	
	
	
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
                                
                                
								 <!-- 배너 이미지  -->
								<table> 
									<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
										<c:set var="img" value="${dto.s_image }"/>
										<c:forEach var="i" begin="0" end="2" step="1" >
											<c:if test="${img.split(',')[i]!='null'}">
												<li data-thumb="./upload/${img.split(',')[i] }"> 
												<img src="./upload/${img.split(',')[i] }" />
												</li>
											</c:if>
										</c:forEach>
									</ul>
									</table>
                                    <!-- 배너 이미지  -->
                             </div>
                         </div>
                     </div>

                     <div class="single-property-wrapper">
                         <div class="single-property-header">   
                          <h4 class="s-property-title">		 F A C I L I T I E S 	 </h4>   
                         </div>


						<div class="property-meta entry-meta clearfix ">

							<!-- 주차정보, 반려동물,키즈/노키즈/대관/콜키지
			 -->
<%-- 							<c:forEach var="i" begin="0" end="4" step="1"> --%>

								
									<div class="form-group">
<!-- 										<div class="glyphicon glyphicon-ok"></div> -->
<%-- 										${dto.s_facility.split(',')[i]} --%>
									</div>
						<!--  주차 -->
								<span>
								<c:if test="${dto.s_facility.split(',')[0]!='null'}">
												<i class="fa-solid fa-car-side"></i>
												${dto.s_facility.split(',')[0]}
												
								</c:if></span>
								
								<c:if test="${dto.s_facility.split(',')[1]!='null'}">
												<i class="fa-sharp fa-solid fa-paw"></i>
												${dto.s_facility.split(',')[1]}
												
								</c:if>
								<span>
								<c:if test="${dto.s_facility.split(',')[2]!='null'}">
												<i class="fa-solid fa-baby"></i>
												${dto.s_facility.split(',')[2]}
												
								</c:if></span>
								<span><c:if test="${dto.s_facility.split(',')[3]!='null'}">
												<i class="fa-solid fa-wine-glass"></i>
												${dto.s_facility.split(',')[3]}
												
								</c:if></span>
								<c:if test="${dto.s_facility.split(',')[4]!='null'}">
												<i class="fa-solid fa-hotel"></i>
												${dto.s_facility.split(',')[4]}
												
								</c:if>
<%-- 							</c:forEach> --%>


						</div>



						<!-- 가게 추가 정보 -->

                         <div class="section additional-details">

                             <h4 class="s-property-title">     I N F O R M A T I O N   </h4>

                             <ul class="additional-details-list clearfix">
                             <c:forEach var="i" begin="0" end="4" step="1">
                                 <li>
                                     <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">${dto.s_facility.split(',')[i]}</span>
                                     <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry"> 등록페이지에서 파라메터로 받기..?</span>
                                     
                                     <c:if test="${dto.s_facility.split(',')[i]=='null'}">
                                     <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">-</span>
                                     <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">-</span>
                                 
									</c:if>
										</li>	
                               
                              </c:forEach>

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
							<li><a data-toggle="tab" href="#qna">   Q & A      </a></li>
						</ul>

						<div class="tab-content">
							<div id="menu" class="tab-pane fade in active">
							<br><br>
								<h3 align="center">M E N U</h3>
								<p align="center">  Please select your menu.  </p><br>

								<hr>
								<%-- ${dto.s_menuname } --%>
					<c:forEach var="i" begin="0" end="${dto.s_menuname[i]+1 }" step="1">
							<span><img src="${dto.s_menuImg.split(',')[i]}" /> <br><br></span>
							 <span class="glyphicon glyphicon-ok"> 메뉴 - ${dto.s_menuname.split(',')[i]} </span> <br>
							<span class="glyphicon glyphicon-ok"> 가격 - ${dto.s_menuprice.split(',')[i] }원 </span> <br>
							<br>
							<hr>
					</c:forEach>
								
							</div>
							<!--  about-->
							<div id="about" class="tab-pane fade">
							<br><br>
								<h3 align="center"> About our restaurant </h3>
								<p align="center">refer to below</p> <br><hr>
								
								<span class="glyphicon glyphicon-pencil"> ${dto.s_content } </span>
										<br>
										<br><br><br>
							<span><b> - Operating hours - </b></span><br>
							
								everyday -	<p> ${dto.s_hours } </p>
								</div>		
							<!-- review-->
							<div id="review" class="tab-pane fade">
							<br><br>
								<h3 align="center">review board</h3>
								<p align="center">please write review for our restaurant.</p><br>
								
								
									<!-- jsp? 가상주소? -->
<%-- 							<jsp:include page="../board/reviewList.jsp" /> --%>
								
								<hr><!-- 상품 정보를 들고 가야함. 다시 디테일로 돌아와함 -->
							<input type="button" value="리뷰 쓰기" class="reviewWrite"
							onclick="location.href='./ReviewWrite.rv?s_no=${dto.s_no }&rev_category=1';">
								
								<input type="button" value="리뷰 목록" class="reviewList"
							onclick="location.href='./ReviewList.rv?s_no=${dto.s_no}';">
								
						<input type="hidden" value="${dto.s_name }">
								
							</div>
						<div id="qna" class="tab-pane fade">
						<br><br>
                        <h3 align="center">Q & A board</h3>
                        <p align="center">please write QnA for our restaurant.</p><br>
                        
                        
                           <!-- jsp? 가상주소? -->
<%--                      <jsp:include page="../board/reviewList.jsp" /> --%>
                        <hr><!-- 상품 정보를 들고 가야함. 다시 디테일로 돌아와함 -->
                     <input type="button" value="QnA 쓰기" class="qnaWrite"
                     onclick="location.href='./QnaWrite.br?s_no=${dto.s_no}&rev_category=0';">
                        
                        <input type="button" value="QnA 목록" class="qnaList"
                     onclick="location.href='./QnaList.br?s_no=${dto.s_no}&rev_category=0';">
						
						
						</div>

					</div> <br>
                         <br><br>
                          <!-- 메뉴 리뷰/QnA 토글  -->
                         <!-- End additional-details area  -->

                        
                <!-- End features area  -->
                 <h4 class="s-property-title">M A P </h4>
                <span>address</span> <br> <p> ${dto.s_addr }</p>
				<!--  지도 api -->
				   <input type="hidden" id="address223" value="${dto.s_addr }">
					<div id="map" style="width: 100%; height: 400px;"></div>
				<br>
                     </div>
                 </div> 
               </div>

				<div class="col-md-4 p0">
                     <aside class="sidebar sidebar-property blog-asside-right">
                         <div class="dealer-widget">
                             <div class="dealer-content">
                                 <div class="inner-wrapper">
								<!-- 즐겨찾기 -->
								
									<div class="favorite-and-print">
										<a class="printer-icon" href="javascript:window.print()">
											<i class="fa fa-print"></i>
										</a>
									</div>


									<div class="clear">
                                         <div class="col-xs-8 col-sm-8 dealer-face">
                                             <a href="">
                                                 
                                                 <img src="./upload/${dto.s_image.split(',')[0]}" class="img-circle">
                                             </a>
                                         </div>
                                         <br>
                                         <div class="col-xs-8 col-sm-8 ">
                                            
                                             <h3 class="dealer-name">  
										<b>${dto.s_name }</b>
										
										 <p> ${dto.s_type } 전문점 </p> </h3>
										 
										<!-- 로그인 안하면 안보이게 하기 -->
										 
                                <form action="./BookMark.bk" method="post" name="bf">
                                 <!-- 좋아요 기능 -->
                                 <input type="hidden" name="s_no" value="${dto.s_no}">
                                 <input type="hidden" name="result" value="${result}">
                                 <input type="hidden" name="result" value="${dto}">
                                 
                                  <c:choose>
                                    <c:when test="${result==1}">
                                    
                                 <div class="like-content">
                                    <button type="button" onclick="bkgo()" class="btn-secondary like-review">
                                       <i class="fa fa-heart" aria-hidden="true"></i> Like
                                    </button>
                                 </div>
                                 </c:when>
                                 <c:otherwise>
                                 <div class="like-content">
                                    <button type="button" onclick="bkgo()" class="btn-secondary like-review">
                                       <i class="far fa-heart" aria-hidden="true"></i> Like
                                    </button>
                                 </div>
                                 </c:otherwise>
                                 </c:choose>
                              </form>
										
										
										
										
										
										
                                         </div>
                                     </div>
									
                                     <div class="clear">
                                         <ul class="dealer-contacts">                                       
                                             <li><i class="pe-7s-map-marker strong"> </i><a href="#" onclick="clip(); return false;" data-value=" ${dto.s_addr}"> MAP url 
                                             </a></li>
                                             <li><i class="pe-7s-call strong"> </i> <a href="">Store Tel : ${dto.s_tel } </a></li>
                                             <li><i class="pe-7s-star strong "> </i>  <fmt:formatNumber value="${dto.s_star }"/></li>
                                         </ul>
                                         <p> ${dto.s_content }</p>
                                        
                                     </div>

                                 </div>
                             </div>
                         </div>
                        
                         
     <!--  가게 검색 기능-->
     <!-- 사람수, 인원을 hidden으로 폼태그안에 만들어서 제이쿼리로 submit되게 해야함  -->
   
    
     
<div class="panel panel-default sidebar-menu wow fadeInRight animated" >
         <div class="panel-heading">
             <h3 class="panel-title">- R E S E R V A T I O N -</h3>
         </div>
         <div class="panel-body search-widget">
         
             <form action="./reservation.st" class="form-inline" method="get"> 
               
               <hr>
			<fieldset>
			
				How many? <br>
				
			<label>	예약 인원 </label> <input type="number" value="total" name="total">

					
										<hr>

				<div class="col-xs-6" style=" font-family: monospace;">
					<label for="property-geo">날짜</label> 
						<input type="date"id="start" name="date"
					       value="today"
					       min="today" max="2030-12-31">
							
				</div>
				
				<div class="row">
                           <div class="col-xs-6">
								<label for="price-range"> 몇시에 오시나요? </label>
								<input type="time" value="now" min="11:00" max="21:00" step="3600000" name="time" required >

                           </div>
                           </div>
     	<hr>
     	
                           <input id="input1" type="submit" value="reservation" class="submit"> 
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
                                                    <b class="b-1"></b>
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



                           <div class="panel panel-default sidebar-menu wow fadeInRight animated">
                               <div class="panel-heading">
                                   <h3 class="panel-title">Ads her  </h3>
                               </div>
                               <div class="panel-body recent-property-widget">
                                  <c:set var="img" value="${dto.s_image }"/>
										<c:forEach var="i" begin="0" end="2" step="1" >
											<c:if test="${img.split(',')[i]!='null'}">
												<li data-thumb="./upload/${img.split(',')[i] }"> 
												<img src="./upload/${img.split(',')[i] }" />
												</li>
											</c:if>
										</c:forEach>
                               </div>
                           </div>

                           
                       </aside>
                   </div>



           </div>
       </div>
       
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
      </style>
      
      
 
    </body>
</html>
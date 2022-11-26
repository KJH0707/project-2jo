<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
    <head>
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GARO ESTATE | Contact page</title>
        <meta name="description" content="company is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>


        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <jsp:include page="../inc/top.jsp"/>
        <!-- End of nav bar -->
		
        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">예약 페이지</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->
	
        <!-- property area -->
        <div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
            <div class="container">  
                <div class="row">
                    <div class="col-md-10"> 
                        <div class="" id="contact1">                        
                            <div class="row">
                                <div class="col-sm-4">
                                    <h3><i class="fa fa-map-marker"></i> 가게 주소</h3>
                                    <p>${param.s_addr }<br>
                                    <strong>☞ ${param.s_name }</strong>
									
                                    </p>
                                </div>
                                <!-- /.col-sm-4 -->
                                <div class="col-sm-4">
                                    <h3><i class="fa fa-phone"></i> 가게 연락처</h3>
                                    <p class="text-muted">이 번호는 점주님들께서 등록 시 기입한 번호이며 실제 번호와
                                    다를 수 있음을 알려드립니다.
                                	
                                	</p>
                                    <p><strong>☎ ${param.s_tel }</strong></p>
                                </div>
                                <!-- /.col-sm-4 -->
                                <div class="col-sm-4">
                                    <h3><i class="fa fa-envelope"></i> 이용하기전 확인하시면 좋아요!</h3>
                                    <p class="text-muted">본 정보는 점주님들께서 등록 시 기입한 사항이며 현재 가게의 상황과
                                    다를 수 있음을 알려드립니다.</p>
                                    <ul>
                                    	<c:forEach var="fa" items="${param.s_facility.split(',') }">
                                        <li><strong>${fa }</strong>   </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <!-- /.col-sm-4 -->
                            </div>
                            <!-- /.row -->
                            <hr>
                            <div id="map"></div>
                            <hr>
                            <h2>예약 드가자</h2>
                            <form action="./reservation.st" method="post" name="fr">
                            <input type="hidden" value="${param.s_no }" name="s_no">
                            <input type="hidden" value="${param.m_no }" name="m_no">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="firstname">예약자 명</label>
                                            <input type="text" class="form-control" id="firstname" name="res_name" value="${udto.m_nickName }">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="lastname">예약자 전화번호</label>
                                            <input type="tel" class="form-control" id="lastname" name="res_tel" placeholder="유사시 연락할 전화번호 입력(ex)010-1234-5678)" >
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="lastname">예약자 인원</label>
                                            <input type="text" class="form-control" id="lastname" name="res_num" value="${param.total }" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="email">예약 날짜</label>
                                            <input type="text" class="form-control" id="email" name="res_date" value="${param.date }" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="subject">예약 시간</label>
                                            <input type="text" class="form-control" id="subject" name="res_time" value="${param.time }" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="message">예약 메세지(500자 이하)</label>
                                            <textarea id="message" class="form-control" name="res_msg"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                    <b>* fork & knife는 예약금을 결제한 후에 예약이 확정됩니다! (예약금 산정기준 = 해당 가게의 1인 식사가격)</b>
                                    <br>
                                    <div style="text-align: center;"><b>fork&knife 결제에 관한 
                                	<a href="#" onclick="window.open('./genMemReservMsg.us?msg=(대충 약관 내용)','예약 메세지','width=600, height=150, left=500, top=700')">약관</a> 
                                    동의</b> <input type="checkbox" id="agree">
                                    </div>
                                    <div class="col-sm-12 text-center">
                                        <button type="button" onclick="requestPay()" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 결제&예약하기!</button>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </form>
                        </div>
                    </div>    
                </div>
            </div>
        </div>

  <!-- Footer area-->
        <div class="footer-area">

            <div class=" footer">
                <div class="container">
                    <div class="row">

                        <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                            <div class="single-footer">
                                <h4>About us </h4>
                                <div class="footer-title-line"></div>

                                <img src="assets/img/footer-logo.png" alt="" class="wow pulse" data-wow-delay="1s">
                                <p>Lorem ipsum dolor cum necessitatibus su quisquam molestias. Vel unde, blanditiis.</p>
                                <ul class="footer-adress">
                                    <li><i class="pe-7s-map-marker strong"> </i> 9089 your adress her</li>
                                    <li><i class="pe-7s-mail strong"> </i> email@yourcompany.com</li>
                                    <li><i class="pe-7s-call strong"> </i> +1 908 967 5906</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                            <div class="single-footer">
                                <h4>Quick links </h4>
                                <div class="footer-title-line"></div>
                                <ul class="footer-menu">
                                    <li><a href="properties.html">Properties</a>  </li> 
                                    <li><a href="#">Services</a>  </li> 
                                    <li><a href="submit-property.html">Submit property </a></li> 
                                    <li><a href="contact.html">Contact us</a></li> 
                                    <li><a href="faq.html">fqa</a>  </li> 
                                    <li><a href="faq.html">Terms </a>  </li> 
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                            <div class="single-footer">
                                <h4>Last News</h4>
                                <div class="footer-title-line"></div>
                                <ul class="footer-blog">
                                    <li>
                                        <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                            <a href="single.html">
                                                <img src="assets/img/demo/small-proerty-2.jpg">
                                            </a>
                                            <span class="blg-date">12-12-2016</span>

                                        </div>
                                        <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                            <h6> <a href="single.html">Add news functions </a></h6> 
                                            <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla ...</p>
                                        </div>
                                    </li> 

                                    <li>
                                        <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                            <a href="single.html">
                                                <img src="assets/img/demo/small-proerty-2.jpg">
                                            </a>
                                            <span class="blg-date">12-12-2016</span>

                                        </div>
                                        <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                            <h6> <a href="single.html">Add news functions </a></h6> 
                                            <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla ...</p>
                                        </div>
                                    </li> 

                                    <li>
                                        <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                            <a href="single.html">
                                                <img src="assets/img/demo/small-proerty-2.jpg">
                                            </a>
                                            <span class="blg-date">12-12-2016</span>

                                        </div>
                                        <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                            <h6> <a href="single.html">Add news functions </a></h6> 
                                            <p style="line-height: 17px; padding: 8px 2px;">Lorem ipsum dolor sit amet, nulla ...</p>
                                        </div>
                                    </li> 


                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                            <div class="single-footer news-letter">
                                <h4>Stay in touch</h4>
                                <div class="footer-title-line"></div>
                                <p>Lorem ipsum dolor sit amet, nulla  suscipit similique quisquam molestias. Vel unde, blanditiis.</p>

                                <form>
                                    <div class="input-group">
                                        <input class="form-control" type="text" placeholder="E-mail ... ">
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary subscribe" type="button"><i class="pe-7s-paper-plane pe-2x"></i></button>
                                        </span>
                                    </div>
                                    <!-- /input-group -->
                                </form> 

                                <div class="social pull-right"> 
                                    <ul>
                                        <li><a class="wow fadeInUp animated" href="https://twitter.com/kimarotec"><i class="fa fa-twitter"></i></a></li>
                                        <li><a class="wow fadeInUp animated" href="https://www.facebook.com/kimarotec" data-wow-delay="0.2s"><i class="fa fa-facebook"></i></a></li>
                                        <li><a class="wow fadeInUp animated" href="https://plus.google.com/kimarotec" data-wow-delay="0.3s"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a class="wow fadeInUp animated" href="https://instagram.com/kimarotec" data-wow-delay="0.4s"><i class="fa fa-instagram"></i></a></li>
                                        <li><a class="wow fadeInUp animated" href="https://instagram.com/kimarotec" data-wow-delay="0.6s"><i class="fa fa-dribbble"></i></a></li>
                                    </ul> 
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="footer-copy text-center">
                <div class="container">
                    <div class="row">
                        <div class="pull-left">
                            <span> (C) <a href="http://www.KimaroTec.com">KimaroTheme</a> , All rights reserved 2016  </span> 
                        </div> 
                        <div class="bottom-menu pull-right"> 
                            <ul> 
                                <li><a class="wow fadeInUp animated" href="#" data-wow-delay="0.2s">Home</a></li>
                                <li><a class="wow fadeInUp animated" href="#" data-wow-delay="0.3s">Property</a></li>
                                <li><a class="wow fadeInUp animated" href="#" data-wow-delay="0.4s">Faq</a></li>
                                <li><a class="wow fadeInUp animated" href="#" data-wow-delay="0.6s">Contact</a></li>
                            </ul> 
                        </div>
                    </div>
                </div>
            </div>

        </div>

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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
        
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa2ed31d007cce419a977e2e07a834f5&libraries=services"></script>
	<script>
		var container = document.getElementById('map');
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 
			};
		
		var map = new kakao.maps.Map(container, mapOption);
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.addressSearch('${param.s_addr}', function(result, status) {
			 if (status === kakao.maps.services.Status.OK) {
				 var juso = new kakao.maps.LatLng(result[0].y, result[0].x);
				 
				 var marker = new kakao.maps.Marker({
					    map: map,
					    position: juso
				});
				marker.setTitle('${param.s_name}');
				var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${param.s_name}</div>'
		        });
				infowindow.open(map, marker);
				 map.setCenter(juso);
			 }
			 else {
				 map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
				 var marker = new kakao.maps.Marker({
					    map: map,
					    position: new kakao.maps.LatLng(33.450701, 126.570667)
				});
				 marker.setTitle('${param.s_name}');
				 var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${param.s_name}</div>'
			        });
					infowindow.open(map, marker);
			 }
			
			
		});
</script>
<script type="text/javascript">
		function requestPay() {
			if($('#agree')[0].checked) {
				var IMP = window.IMP;
				IMP.init("imp42747186");// 가맹점 식별코드
				
				IMP.request_pay({ 
		          pg: "html5_inicis",
		          pay_method: "card",
		          merchant_uid: "${udto.m_no}-"+new Date().getTime(),   //주문번호
		          name: "${param.s_name}",
		          amount: 100,                         // 숫자타입
		          buyer_email: "gildong@gmail.com",
		          buyer_name: "${udto.m_name}",
		          buyer_tel: "${param.s_tel }",
		          buyer_addr: "어떤 건물 7층 아이티윌",
		          buyer_postcode: "01181"
		      }, function (rsp) { // callback
		          if (rsp.success) {
		        	  $.ajax({
							url:"./paymentPro.br",
							type:"post",
							datatype:"json",
							data:{
							p_no:rsp.merchant_uid,
							s_no:${param.s_no},
							m_no:${udto.m_no},
							res_num:${param.total},
							res_time:${param.time.split(":")[0]},
							res_date2:"${param.date }",
		        	  		res_name:document.fr.res_name.value,
							res_msg:document.fr.res_msg.value,
							res_tel:document.fr.res_tel.value,
							s_name:"${param.s_name}",
							s_price:${param.s_price},
							m_id:"${udto.m_id}"
							}
		        	  });
			          location.href="./ReservationComplete.br";
         			} else {
	              // 결제 실패 시 로직,
				alert('결제 실패!');
//	 	           	return false;
	             
         		 }
      
		    	});
			}else {
				alert('약관에 동의하셔야합니다');
			}
				}
		</script>
    </body>
</html>
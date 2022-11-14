<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fork & Knife | 가게목록</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#lunchBegins').change(function() {
					$('#basic12').children("option").remove();
// 					
					var city = $(this).val();
					$.ajax({
						url:"gu.re",
						type:"get",
						datatype:"xml",
						success:function(data) {
						var v = $(data).find(city);
						v.find("gus").each(function() {
							var info = "<option>"+$(this).find("gu").text()+"</option>";
							$('#basic12').append(info);
							});
						},
						error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
						
					}); // end of ajax
				});
			});
		
		</script>
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <jsp:include page="../inc/top.jsp"/>
		
		
        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">가게 목록</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
<!--         검색 start -->
        <div class="properties-area recent-property" style="background-color: #FFF;">
            <div class="container">  
                <div class="row">
                  
                <div class="col-md-3 p0 padding-top-40">
                    <div class="blog-asside-right pr0">
                        <div class="panel panel-default sidebar-menu wow fadeInRight animated" >
                            <div class="panel-heading">
                                <h3 class="panel-title">가게 검색</h3>
                            </div>
                            <div class="panel-body search-widget">
                                <form action="" class=" form-inline"> 
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <input type="text" class="form-control" placeholder="가게 검색">
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset>
                                        <div class="row">
                                            <div class="col-xs-6">

                                                <select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="시">
													<option selected>시</option>
                                                    <option value="busan">부산</option>
                                                    <option value="seoul">서울</option>
                                                    <option value="daejeon">대전</option>
                                                    <option value="wakanda">와칸다</option>
                                                    <option value="forever">포에버</option>
                                                    <option value="black">블랙팬서</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-6">
                                                <select id="basic12" class="show-tick form-control" >
                                                     <option selected>구</option>

                                                </select>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="padding-5">
                                        <div class="row">
                                            <div class="col-xs-8">
                                                <label for="price-range">가격대 : </label>
                                                <input type="text" class="span2 ddkjh" value="" data-slider-min="0" 
                                                       data-slider-max="600" data-slider-step="5" 
                                                       data-slider-value="[0,450]" id="price-range" ><br />
                                                <b class="pull-left color">0</b> 
                                                <b class="pull-right color">100000</b>                                                
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="checkbox">
                                                    <br><label> <input type="checkbox" checked><br>상관없음</label>
                                                </div>
                                            </div>
                                            </div>
                                            
                                    </fieldset>    
                                    <hr>
                                    <fieldset class="padding-5">                            
										<div class="row">
                                            <div class="col-xs-8">
                                                <label for="property-geo">거리 :</label>
                                                <input type="text" class="span2" value="" data-slider-min="0" 
                                                       data-slider-max="600" data-slider-step="5" 
                                                       data-slider-value="[50,450]" id="property-geo" ><br />
                                                <b class="pull-left color">40m</b> 
                                                <b class="pull-right color">12000m</b>
                                                                                                
                                            </div>
                                           <div class="col-xs-4">
                                                <div class="checkbox">
                                                    <br><label> <input type="checkbox" checked><br>상관없음</label>
                                                </div>
                                            </div>
                                                
                                                                                      
                                        </div>
                                        
                                         </fieldset>   
                                         <hr>
                                         <fieldset class="padding-5">                            
										<div class="row">
                                            <div class="col-xs-6">
                                                <label for="property-geo">인원 :</label>
                								<select id="" class="show-tick form-control" >
                                                     <option selected>명</option>
													<c:forEach var="i" begin="1" end="10" step="1">
													<option value="${i}">${i}명</option>
													</c:forEach>
                                                </select>
                                               </div>
                                            <div class="col-xs-6">
                                                <div class="checkbox">
                                                    <br><label> <input type="checkbox" checked> 상관없음</label>
                                                </div>
                                            </div>
                                                                                    
                                        </div>
                                         </fieldset> 
                                   	<hr>
                                    <fieldset class="padding-5">
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <div class="checkbox">
                                                    <label> <input type="checkbox" checked> 한식</label>
                                                </div> 
                                            </div>

                                            <div class="col-xs-6">
                                                <div class="checkbox">
                                                    <label> <input type="checkbox"> 중식</label>
                                                </div>
                                            </div>                                            
                                        </div>
                                    </fieldset>

                                    <fieldset class="padding-5">
                                        <div class="row">
                                            <div class="col-xs-6"> 
                                                <div class="checkbox">
                                                    <label> <input type="checkbox" checked> 일식</label>
                                                </div>
                                            </div>  
                                            <div class="col-xs-6"> 
                                                <div class="checkbox">
                                                    <label> <input type="checkbox" checked> 양식</label>
                                                </div>
                                            </div>  
                                        </div>
                                    </fieldset>

                                     

                                    <fieldset class="padding-5">
                                        <div class="row">
                                            <div class="col-xs-6"> 
                                                <div class="checkbox">
                                                    <label>  <input type="checkbox" checked> 오마카세</label>
                                                </div>
                                            </div>  
                                           
                                        </div>
                                    </fieldset>

                                    

                                    <fieldset >
                                        <div class="row">
                                            <div class="col-xs-12">  
                                                <input class="button btn largesearch-btn" value="검 색" type="submit">
                                            </div>  
                                        </div>
                                    </fieldset>                                     
                                </form>
                            </div>
                        </div>
<!-- 						검색 end -->
<!-- 						추천가게 -->
                        <div class="panel panel-default sidebar-menu wow fadeInRight animated"> 
                            <div class="panel-heading">
                                <h3 class="panel-title">이런 가게는 어떠세요?</h3>
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
                                                <h6> <a href="single.html">${rec.s_name } </a></h6>
                                                <span class="property-price">별점 : ${rec.s_star }</span>
                                            </div>
                                        </li>
                                        </c:forEach>

                                    </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-9  pr0 padding-top-40 properties-page">
                    <div class="col-md-12 clear"> 
                        <div class="col-xs-10 page-subheader sorting pl0">
                            <ul class="sort-by-list">
                                <li class="active">
                                    <a href="javascript:void(0);" class="order_by_date" data-orderby="property_date" data-order="ASC">
                                        Property Date <i class="fa fa-sort-amount-asc"></i>					
                                    </a>
                                </li>
                                <li class="">
                                    <a href="javascript:void(0);" class="order_by_price" data-orderby="property_price" data-order="DESC">
                                        Property Price <i class="fa fa-sort-numeric-desc"></i>						
                                    </a>
                                </li>
                            </ul><!--/ .sort-by-list-->

                            <div class="items-per-page">
                                <label for="items_per_page"><b>Property per page :</b></label>
                                <div class="sel">
                                    <select id="items_per_page" name="per_page">
                                        <option value="3">3</option>
                                        <option value="6">6</option>
                                        <option value="9">9</option>
                                        <option selected="selected" value="12">12</option>
                                        <option value="15">15</option>
                                        <option value="30">30</option>
                                        <option value="45">45</option>
                                        <option value="60">60</option>
                                    </select>
                                </div><!--/ .sel-->
                            </div><!--/ .items-per-page-->
                        </div>

                        <div class="col-xs-2 layout-switcher">
                            <a class="layout-list" href="javascript:void(0);"> <i class="fa fa-th-list"></i>  </a>
                            <a class="layout-grid active" href="javascript:void(0);"> <i class="fa fa-th"></i> </a>                          
                        </div><!--/ .layout-switcher-->
                    </div>

                    <div class="col-md-12 clear"> 
                        <div id="list-type" class="proerty-th">
                            <c:forEach var="dto" items="${boardListAll }">
                           <!--  가게 1개 시작  -->
                            <div class="col-sm-6 col-md-4 p0">
                            		
                            		
                                    <div class="box-two proerty-item">
                                        <div class="item-thumb">
                                            <a href="storeDetails.st?s_no=${dto.s_no }" ><img src="assets/img/demo/property-3.jpg"></a>
                                        </div>

                                        <div class="item-entry overflow">
                                            <h5><a href="property-1.html">${dto.s_name }</a></h5>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b> 별점 :</b> ${dto.s_star} </span>
<!--                                             <span class="proerty-price pull-right"> $ 300,000</span> -->
                                            <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>

                                        </div>


                                    </div>
                                  </div> <!-- 가게 1개 끝 -->
                               </c:forEach>
                        </div>
                    </div> <!--  가게 목록 끝  -->
                    
                    <div class="col-md-12"> 
                        <div class="pull-right">
                            <div class="pagination">
                                <ul>
    <c:if test="${reqeustScope.totalCnt != 0 }">
	
	<!-- 이전 -->
	<c:if test="${startPage > pageBlock }">
		<li><a href="./storeList.re?pageNum=${startPage-pageBlock }">Prev</a></li>
	</c:if>
	<!-- 페이지 번호(1,2,3....) -->
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		<li><a href="./storeList.re?pageNum=${i }">${i }</a><li>
	</c:forEach>
	<!-- 다음 -->
	<c:if test="${endPage < pageCount }">
		<li><a href="./storeList.re?pageNum=${startPage+pageBlock }">[다음]</a><li>
	</c:if>
</c:if>
                                </ul>
                            </div>
                        </div>                
                    </div>
                </div>  
                </div>              
            </div>
        </div>
<c:if test="${reqeustScope.totalCnt != 0 }">
	
	<!-- 이전 -->
	<c:if test="${startPage > pageBlock }">
		<li><a href="./BoardList.bo?pageNum=${startPage-pageBlock }">Prev</a></li>
	</c:if>
	<!-- 페이지 번호(1,2,3....) -->
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		<li><a href="./BoardList.bo?pageNum=${i }">${i }</a><li>
	</c:forEach>
	<!-- 다음 -->
	<c:if test="${endPage < pageCount }">
		<li><a href="./BoardList.bo?pageNum=${startPage+pageBlock }">[다음]</a><li>
	</c:if>
</c:if>
          <jsp:include page="../inc/bottom.jsp"/>
    </body>
</html>
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
        <title>GARO ESTATE | User properties Page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
		
		
        <jsp:include page="../inc/top.jsp"/>
		
        

       

        <!-- property area -->
        <div class="content-area recent-property" style="background-color: #FFF;">
            <div class="container">   
                <div class="row">

                    <div class="col-md-12 pr-30 padding-top-40 properties-page user-properties">

                        
                            <div class="page-subheader sorting pl0 pr-10">
								<div class="wizard-container">
         						 <div class="wizard-card ct-wizard-orange" id="wizardProperty">

                                <ul class="nav nav-pills">
						            <li style="width: 50%;" class="active"><a href="#step1" data-toggle="tab">공지사항</a></li>
								 	<li style="width: 50%;"><a href="#step2" data-toggle="tab">이벤트</a></li>
                          
                                    
                                </ul><!--/ .sort-by-list-->
                        
						<div class="tab-content">

            				 <div class="tab-pane active" id="step1">
            				 <div class="section"> 
                            <div id="list-type" class="proerty-th-list">
                               	<c:forEach var="n" items="${noticeList }">
                                <div class="col-md-4 p0">
                                    <div class="box-two proerty-item">
                                        <div class="item-thumb">
                                            <a href="./noticeDetail.us?n=${n.n_no }" ><img src="assets/img/demo/property-3.jpg"></a>
                                        </div>
                                        <div class="item-entry overflow">
                                            <h5><a href="./noticeDetail.us?n=${n.n_no }">${n.n_title }</a></h5>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b> 작성일 :</b> ${n.n_date.toString().substring(0,10) } </span>
                                            <p style="display: none;">공지사항 입니다
                                            <c:if test="${id.equals('admin')}">
                                            <br><a href="#">수정하기</a>
                                            </c:if>
                                            </p>
											


                                        </div>
                                    </div>
                                </div>                             
								<!--  공지사항 1개 끝  -->
								</c:forEach>
								<div class="section"> 
                            <div class="pull-right">
                                
                                    <ul class="pagination">
                                       	<c:if test="${reqeustScope.totalCnt != 0 }">
                                   		
                                   		
                                   		<c:if test="${startPage > pageBlock }">
                                           <li class="page-item"><a class="page-link" href="./noticeList.us?pageNum=${startPage-pageBlock }">Previous</a></li>
                                          </c:if>
                                          <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
                                              <li class="page-item"><a class="page-link"  href="./noticeList.us?pageNum=${i }">${i }</a></li>
                                          </c:forEach>   
                                          <c:if test="${endPage < pageCount }">
                                              <li class="page-item"><a class="page-link"  href="./noticeList.us?pageNum=${startPage+pageBlock }">[Next]]</a></li>
                                          </c:if>
                                          
                                      </c:if>
                                        </ul>
                                
                            </div>                
                        </div>
							</div>
						</div>
            				 
            			</div>
            			
            			<div class="tab-pane" id="step2">
            				 <div class="section"> 
                            <div id="list-type" class="proerty-th-list">
                               	<c:forEach var="n" items="${noticeList2 }">
                                <div class="col-md-4 p0">
                                    <div class="box-two proerty-item">
                                        <div class="item-thumb">
                                            <a href="property-1.html" ><img src="assets/img/demo/property-3.jpg"></a>
                                        </div>
                                        <div class="item-entry overflow">
                                            <h5><a href="property-1.html">${n.n_title }</a></h5>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b> 작성일 :</b> ${n.n_date.toString().substring(0,10) } </span>
                                            <p style="display: none;">이벤트 입니다
                                            <c:if test="${id.equals('admin')}">
                                            <br><a href="#">수정하기</a>
                                            </c:if>
                                            </p>
											


                                        </div>
                                    </div>
                                </div>                             
								<!--  공지사항 1개 끝  -->
								</c:forEach>
								<div class="section"> 
                            <div class="pull-right">
                                
                                    <ul class="pagination">
                                       	<c:if test="${reqeustScope.totalCnt != 0 }">
                                   		
                                   		
                                   		<c:if test="${startPage > pageBlock }">
                                           <li class="page-item"><a class="page-link" href="./noticeList.us?pageNum=${startPage-pageBlock }">Previous</a></li>
                                          </c:if>
                                          <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
                                              <li class="page-item"><a class="page-link"  href="./noticeList.us?pageNum=${i }">${i }</a></li>
                                          </c:forEach>   
                                          <c:if test="${endPage < pageCount }">
                                              <li class="page-item"><a class="page-link"  href="./noticeList.us?pageNum=${startPage+pageBlock }">[Next]]</a></li>
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
                            </div>

                        </div>
						

                        

                    </div>       

                  
                </div>
            </div>
        </div>

        <jsp:include page="../inc/bottom.jsp"/>
        

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
        
        <script src="assets/js/jquery.validate.min.js"></script>
        

        <script src="assets/js/main.js"></script>

    </body>
</html>


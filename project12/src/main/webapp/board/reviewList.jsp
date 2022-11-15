<input type="submit" value="리뷰쓰기" onclick="location.href='/ReviewWrite.rv';"><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fork And Knife | QnA List</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        	<jsp:include page="../inc/top.jsp"/>
    </head>
    <body>

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">리뷰 게시판</h1>   
                                   
                    </div>
                   
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area recent-property" style="background-color: #FFF;">
         
            <div class="container">   
                <div class="row">
                
           
	<input class="form-control" type="text" value="전체 리뷰 : ${requestScope.totalCnt } 개">
                    <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">

                        <div class="section"> 
                            <div class="page-subheader sorting pl0 pr-10">

                            </div>

                        </div>

                        <div class="section"> 
<%--                         <c:forEach var="dto" items="${ReviewListAll }"> --%>
<%--                         	 <a href="./ReviewContent.rv?rev_no=${dto.rev_no }&pageNum=${pageNum}">${dto.rev_subject }</a>    </c:forEach>   --%>
                        
                           <div id="list-type" class="proerty-th-list">
                                <div class="col-md-4 p0">
                                    <div class="box-two proerty-item">
                                        <div class="item-entry overflow">
                                            <h5><a href="property-1.html">[글번호] 제목</a></h5>
                                            <div class="dot-hr"></div>
                                                <div class="dealer-action pull-right">                                        
                                                    <a href="" class="button">작성자  </a>
                                                    <a href="" class="button delete_user_car">작성일 </a>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>  <br>   
                              
       </div>

	
	
	
<%-- 	<c:if test="${totalCnt != 0}">
	  
	    <!-- 이전 -->
	    <c:if test="${startPage > pageBlock }">
	    	<a href="./ReviewList.rv?pageNum=${startPage-pageBlock }"> < </a>
	    </c:if>
	    <!-- 페이지 번호(1,2,3....) -->	  
	    <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
	          <a href="./ReviewList.rv?pageNum=${i }">${i }</a> 
	    </c:forEach>  
	    
	    <!-- 다음 -->	
	    <c:if test="${endPage < pageCount }">
	        <a href="./ReviewList.rv?pageNum=${startPage+pageBlock }"> > </a>
	    </c:if>
	
	</c:if>
	
        
        <script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/wizard.js"></script> --%>

        <jsp:include page="../inc/bottom.jsp"></jsp:include>
                       


          

       

    </body>
</html>
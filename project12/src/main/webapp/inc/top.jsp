<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       <link rel="stylesheet" href="assets/css/wizard.css">
    </head>
    <body>
    
    
        <!-- Body content -->
 	 <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>

        <div class="header-connect">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-8  col-xs-12">
                        <div class="header-half header-call">
                            <p>
                                <span><i class="pe-7s-call"></i> +1 234 567 7890</span>
                                <span><i class="pe-7s-mail"></i> your@company.com</span>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-12">
                        <div class="header-half header-social">
                            <ul class="list-inline">
                            	<c:if test="${id!=null }">
                            	<li>${id }<c:if test='${result==1 }'>[일반]</c:if><c:if test='${result==2 }'>[점주]</c:if>님 어서오세요.</li>
                            	</c:if>
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>         
        <!--End top header -->

        <nav class="navbar navbar-default ">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="./main.st"><img src="assets/img/forks.jpg" alt="" height="76" width="200"></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse yamm" id="navigation">
                    
                    <div class="button navbar-right">
                    <c:choose>
                    <c:when test="${id==null }">
                        <button class="navbar-btn nav-button wow bounceInRight login" onclick="location.href='./Login.us'" data-wow-delay="0.4s">로그인</button>
                        <button class="navbar-btn nav-button wow fadeInRight" onclick="location.href='./Join.us'" data-wow-delay="0.5s">회원가입</button>
                    </c:when>
                    <c:when test="${id.equals('admin') }">
                    <button class="navbar-btn nav-button wow bounceInRight login" onclick="location.href='./adminGenMemList.us'" data-wow-delay="0.4s">관리자페이지</button>
                        <button class="navbar-btn nav-button wow fadeInRight" onclick="location.href='./LogoutAction.us'" data-wow-delay="0.5s">로그아웃</button>
                    </c:when>
                    <c:when test="${result==1}">
                    	<button class="navbar-btn nav-button wow bounceInRight login" onclick="location.href='./MemberMypageMain.us'" data-wow-delay="0.4s">마이페이지</button>
                        <button class="navbar-btn nav-button wow fadeInRight" onclick="location.href='./LogoutAction.us'" data-wow-delay="0.5s">로그아웃</button>
                    </c:when>
                    <c:otherwise>
                    	<button class="navbar-btn nav-button wow bounceInRight login" onclick="location.href='./CeoMyPage.us'" data-wow-delay="0.4s">마이페이지</button>
                        <button class="navbar-btn nav-button wow fadeInRight" onclick="location.href='./LogoutAction.us'" data-wow-delay="0.5s">로그아웃</button>
                    </c:otherwise>
                    </c:choose>
                    </div>
                    
                    <ul class="main-nav nav navbar-nav navbar-right">
                         <li class="dropdown yamm-fw" data-wow-delay="0.1s">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200"><b>Home</b></a>
                            <jsp:include page="categories.jsp"/>
                        </li>
<!-- <b class="caret"></b> -->
                        <li class="dropdown yamm-fw" data-wow-delay="0.1s">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200"><b>Category</b> </a>
                            <jsp:include page="categories.jsp"/>
                        </li>
                        
                        <li class="dropdown yamm-fw" data-wow-delay="0.1s">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200"><b>Event</b> </a>
                            <jsp:include page="categories.jsp"/>
                        </li>
                        
                        <li class="dropdown yamm-fw" data-wow-delay="0.1s">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200"><b>Notice </b></a>
                            <jsp:include page="categories.jsp"/>
                            
                        </li>

<!--                         <li class="wow fadeInDown" data-wow-delay="0.4s"><a href="contact.html">Contact</a></li> -->
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- End of nav bar -->
        
        
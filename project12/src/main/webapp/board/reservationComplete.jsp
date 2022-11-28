<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js"> 
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fork and Knife | 예약 완료 페이지</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css"> 
        <link rel="stylesheet" href="assets/css/wizard.css"> 
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        
        <script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script type="text/javascript">
		function shareKakaotalk() {
	        Kakao.init("d2ff2f2f2e799ebcee3e62650e1d06cb");
	        Kakao.Link.sendCustom({
	            templateId: 86394
	        });
	    }
		
		function reserve() {
				window.location.href =
				'MemberReserve.us'
				}

	</script>

    
        
  
    </head>
    <body>

        <jsp:include page="../inc/top.jsp"/>

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">예약 완료</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">
                <div class="clearfix" > 
                    <div class="wizard-container"> 

                        <div class="wizard-card ct-wizard-orange" id="wizardProperty">
                            <form action="" method="">                        
                                <div class="wizard-header">
                                    <h3>
                                        <b>예약이 완료되었습니다!</b> 
                                    </h3>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                   
                                    
                                </div>
                                
                                <div class="wizard-footer">
                               	 <div class="pull-right">
                                    <input type="button" class="navbar-btn nav-button wow bounceInRight login" onclick="shareKakaotalk();" value="KAKOA Talk으로 공유하기">
                                    </button>
                                    </div>
                                    <div class="pull-left">
                                   
									<input type="button" class="navbar-btn nav-button wow bounceInRight login" onclick="reserve();" value="예약 내역 확인하기">
									
                                    </div>
                                    <div class="clearfix"></div>                                            
                                </div>	
                            </form>
                        </div>
                        <!-- End submit form -->
                    </div> 
                </div>
            </div>
        </div>
        <!-- 푸터 시작 -->
        <div>
		<jsp:include page="../inc/bottom.jsp" />
		</div>
		<!-- 푸터 끝 -->
    </body>
</html>
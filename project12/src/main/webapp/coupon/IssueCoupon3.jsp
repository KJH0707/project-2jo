<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IssueCoupon</title>
        <meta name="description" content="company is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
		
		 <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
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
        
<script type="text/javascript">
function closeTab() {
    window.close();
}

function issueTab(){
	 var coupon_name = document.getElementById('coupon_name').value;
	 var coupon_amount = document.getElementById('coupon_amount').value;
	 var cou_type = document.getElementById('cou_type').value;
	 var sto_type = document.getElementById('sto_type').value;
	 var issue_start_date = document.getElementById('issue_start_date').value;
	 var issue_end_date = document.getElementById('issue_end_date').value;
	 var cou_startDate = document.getElementById('cou_startDate').value;
	 var cou_endDate = document.getElementById('cou_endDate').value;
	 
	 
	 //alert(name);
	 //alert(coupon_name);
	 
	 location.href="./issueCouponAction.co";
}
 function infoPost(url, params){
	 var form = document.createElement('form');
	 form.setAttribute('method','post');
	 form.setAttribute('action', './issueCouponAction.co');
	 for(var key in params){
		 var sendvalue = document.createElement('input');
		 sendvalue.setAttribute('type','hidden');
		 sendvalue.setAttribute('coupon_name',document.getElementById('coupon_name').value);
		 //sendvalue.setAttribute('value','params[key]');
		 form.appendChild(sendvalue);
	 }
	 document.body.appendChild(form);
	 form.submit();
 }

</script>
</head>
<body>
        <div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
            <div class="container">  

                <div class="col-md-9">
				<form action="" method="post">
                    <div class="" id="contact1" style="background-color: #f7f7f7; padding: 2%;">                        
                        <h2>쿠폰 생성</h2>
                        <hr>
                        <form>
                            <div class="row" style="background-color: #f7f7f7;">
                                <div class="col-sm-10 ">
                                    <div class="form-group">
                                        <label for="coupon_name">쿠폰명</label>
                                        <input type="text" class="form-control" name="coupon_name" id="coupon_name" placeholder="20자이내로 입력하세요">
                                    </div>
                                </div>
                                <div class="col-sm-3" style="overflow: hidden;">
                                    <div class="form-group">
                                        <label for="coupon_amount">수량</label>
                                        <input type="number" class="form-control" name="coupon_amount" id="coupon_amount" min="0">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="cou_type">쿠폰 종류</label>
                                        <select name="cou_type" class="form-control" id="cou_type">
											<option>음료 제공</option>
											<option>사이드 제공</option>
											<option>콜키지 프리 </option>
											<option>무료 주차</option>
											<option>룸 예약</option>
										</select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="sto_type">사용처</label>
                                        <select name="sto_type" class="form-control" id="sto_type">
											<option>한식</option>
											<option>중식</option>
											<option>일식</option>
											<option>양식</option>
											<option>오마카세</option>
										</select>
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="issue_start_date">배포시작일</label>
                                        <input type="date" class="form-control" id="issue_start_date" name="issue_start_date">
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="issue_end_date">배포종료일</label>
                                        <input type="date" class="form-control" id="issue_end_date" name="issue_end_date">
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="cou_startDate">사용시작일</label>
                                        <input type="date" class="form-control" id="cou_startDate" name="cou_startDate">
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="cou_endDate">사용종료일</label>
                                        <input type="date" class="form-control" id="cou_endDate" name="cou_endDate">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="message">쿠폰 설명</label>
                                        <textarea id="message" class="form-control" name="message"></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-12 text-center">							
                                    <button type="submit" class="btn btn-primary" onclick="issueTab()"> 생성</button> 
                                    <button type="reset" class="btn btn-primary" onclick="closeTab()"> 취소 </button>
                                    </form>
                                </div>
                            </div>
                            <!-- /.row -->
                        </form>
                    </div>
                </div>
                <!-- /.col-md-9 -->   

          </div>
       </div>


</body>
</html>